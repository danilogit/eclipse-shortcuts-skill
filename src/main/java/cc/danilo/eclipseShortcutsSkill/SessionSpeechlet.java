/*
 * Copyright 2016-2017 Danilo lima (hello@danilo.cc). All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"). You may not use
 * this file except in compliance with the License. A copy of the License is located at
 *
 * https://www.apache.org/licenses/LICENSE-2.0
 *
 * or in the "license" file accompanying this file. This file is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and
 * limitations under the License.
 */

package cc.danilo.eclipseShortcutsSkill;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import com.amazon.speech.json.SpeechletRequestEnvelope;
import com.amazon.speech.speechlet.IntentRequest;
import com.amazon.speech.speechlet.LaunchRequest;
import com.amazon.speech.speechlet.SessionEndedRequest;
import com.amazon.speech.speechlet.SessionStartedRequest;
import com.amazon.speech.speechlet.SpeechletResponse;
import com.amazon.speech.speechlet.SpeechletV2;
import com.amazon.speech.ui.Card;
import com.amazon.speech.ui.PlainTextOutputSpeech;
import com.amazon.speech.ui.Reprompt;
import com.amazon.speech.ui.SimpleCard;
import com.amazon.speech.ui.SsmlOutputSpeech;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.DaoManager;
import com.j256.ormlite.jdbc.JdbcConnectionSource;
import com.j256.ormlite.support.ConnectionSource;
import cc.danilo.eclipseShortcutsSkill.models.ShortcutRecord;
import cc.danilo.eclipseShortcutsSkill.models.UserProfile;

public class SessionSpeechlet implements SpeechletV2 {

	
	
	private static final Logger LOG = Logger.getLogger(SessionSpeechlet.class);
	private static final String DATABASE_FILENAME = "eclipse-shortcuts.db";
	private Dao<ShortcutRecord, Integer> shortcutsDao;
	private String defaultOS = "windows";
	private String s3ProfilePrefixName = "profiles";
	String[] osNames = {"windows","linux","mac"};
	AmazonS3 s3Client = null;
	
	ConnectionSource connectionSource = null;
	
	public File getLocalDatabaseResource(){
		
		ClassLoader classLoader = getClass().getClassLoader();
		File dbFile = new File(classLoader.getResource(DATABASE_FILENAME).getFile());
		return dbFile;
		
	}
	
	
	public void downloadDatabase(){
		
		String key = "db/" + DATABASE_FILENAME;
		String bucketName = System.getenv("S3_BUCKET_NAME");
		
		GetObjectRequest request = new GetObjectRequest(bucketName, key);
		S3Object object = s3Client.getObject(request);
		
		InputStream stream = object.getObjectContent();
		
		File localDatabaseFile = new File("/tmp/" + DATABASE_FILENAME);
		
		try {
			
			FileUtils.copyInputStreamToFile(stream, localDatabaseFile);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public void uploadDatabase(){
		
		String key = "db/" + DATABASE_FILENAME;
		String bucketName = System.getenv("S3_BUCKET_NAME");
		
		File dbFile = getLocalDatabaseResource();
		
		PutObjectRequest request = new PutObjectRequest(bucketName, key, dbFile);
		s3Client.putObject(request);
	}
	
	
	public boolean doesDatabaseExist(){
		
		String key = "db/" + DATABASE_FILENAME;
		String bucketName = System.getenv("S3_BUCKET_NAME");
		
		return s3Client.doesObjectExist(bucketName, key);
		
	}
	
	
	private void connectDatabase(){

		LOG.warn("Connecting to the database...");
		try {
			Class.forName("org.sqlite.JDBC");
			connectionSource = new JdbcConnectionSource("jdbc:sqlite:/tmp/" + DATABASE_FILENAME);
			setupDatabase(connectionSource);
			LOG.warn("Connected");
		
		} catch (Exception e) {
			e.printStackTrace();
			LOG.warn("Error connecting to the database: " + e.getMessage());
		}
			
	}
		
	
	private void setupDatabase(ConnectionSource connectionSource) throws Exception {
		shortcutsDao = DaoManager.createDao(connectionSource, ShortcutRecord.class);
	}
	
	
	public String getUserIDHash(String userId){
		return DigestUtils.md5Hex(userId);
		
	}
	
	
	public UserProfile getProfileFromS3(String userID){
		
		UserProfile userProfile = null;
		ObjectMapper mapper = new ObjectMapper();
		
		String key = s3ProfilePrefixName + "/" + getUserIDHash(userID);
		String bucketName = System.getenv("S3_BUCKET_NAME");
		
		LOG.info("Checking profile: " + bucketName + "/" + key);
		
		if (!s3Client.doesObjectExist(bucketName, key)){
			
			userProfile = new UserProfile();
			userProfile.setUserId(userID);
			userProfile.setDefaultOS(defaultOS);
			
		} else {
			
			try {
				
				GetObjectRequest request = new GetObjectRequest(bucketName, key);
				S3Object object = s3Client.getObject(request);
				userProfile = mapper.readValue(object.getObjectContent(), UserProfile.class);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return userProfile;
			
	}
	
	
	
	public void storeProfileToS3(UserProfile userProfile){
		
		ObjectMapper mapper = new ObjectMapper();

		String key = s3ProfilePrefixName + "/" + getUserIDHash(userProfile.getUserId());
		String bucketName = System.getenv("S3_BUCKET_NAME");
		
		try {
			s3Client.putObject(bucketName, key, mapper.writeValueAsString(userProfile));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	
	public List<ShortcutRecord> search(SpeechletRequestEnvelope<IntentRequest> request){
		
		String query = request.getRequest().getIntent().getSlot("query").getValue();
		UserProfile userProfile = getProfileFromS3(request.getSession().getUser().getUserId());
		
		LOG.warn("Searching: " + query);
		
		try {
			connectDatabase();
			return shortcutsDao.queryBuilder().where().like("description", "%" + query + "%").and().like("os", "%" + userProfile.getDefaultOS() + "%").query();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			LOG.warn(e.getMessage());
			
		}
		
		return null;
		
	}
	
	
	public SpeechletResponse getHelpResponse(){
		
		String speechText = "Sure, just ask alexa to search for eclipse shortcuts. For example, say Alexa, ask eclipse shortcuts to search for duplicate.\n" +
						    "The default operating system is Windows, but you can change it any time saying: Alexa, ask eclipse shortcuts to change my default operating system." +
							"You can choose between Windows, Linux or Mac.";
		
		SimpleCard card = new SimpleCard();
		card.setTitle("Help!");
		card.setContent(speechText);
		
		return newPlainTextOutputResponse(speechText, true, card);
	}
	
	
	public SpeechletResponse getShortcutsFoundResponse(SpeechletRequestEnvelope<IntentRequest> request, List<ShortcutRecord> shortcuts){
		
		int matchesCount = shortcuts.size();
		String query = request.getRequest().getIntent().getSlot("query").getValue();
		String speechText = "";
		UserProfile userProfile = getProfileFromS3(request.getSession().getUser().getUserId());
		
		if(matchesCount > 1){
			speechText += "<p>" + matchesCount + " shortcuts have been found for your " + userProfile.getDefaultOS() + " operating system:</p>";	
		} else {
			speechText += "<p> Only one shortcut have been found for your " + userProfile.getDefaultOS() + " operating system:</p>";
		}
		
		
		for (ShortcutRecord s: shortcuts){
			speechText += "<p>" + s.getDescription() + ", the shortcut is <break strength='x-strong'/> <emphasis level='moderate'>" + s.getCommandLiteral() + "</emphasis></p>";
		}
		
		SimpleCard card = new SimpleCard();
		
		if(matchesCount > 1){
			card.setTitle(matchesCount  + " shortcuts have been found containing '" + query + "'");
		} else {
			card.setTitle("Only one shortcut have been found containing '" + query + "'");
		}
		
		String cardContent = "";
		
		for (ShortcutRecord s: shortcuts){
			cardContent +=  "\t" + s.getCommand() + " = " + s.getDescription() + "\n";
		}
		
		card.setContent(cardContent);
		
		
		return newSsmlOutputResponse(speechText, true, card);
	}
	
	
	public SpeechletResponse getShortcutsNotFoundResponse(SpeechletRequestEnvelope<IntentRequest> request){
		
		UserProfile userProfile = getProfileFromS3(request.getSession().getUser().getUserId());
		
		String speechText = "Sorry, I could not find any shortcut for your " + userProfile.getDefaultOS() + " operating system containing '" + request.getRequest().getIntent().getSlot("query").getValue() + "'";
		
		SimpleCard card = new SimpleCard();
		card.setTitle("Oops!");
		card.setContent(speechText);
		
		return newPlainTextOutputResponse(speechText, true, card);
	}
	
	
	
	public SpeechletResponse newPlainTextOutputResponse(String str, boolean endSession, Card card){
		
		SpeechletResponse response = new SpeechletResponse();
		response.setShouldEndSession(endSession);
		PlainTextOutputSpeech outputSpeech = new PlainTextOutputSpeech();
		
		outputSpeech.setText(str);
		
		response.setOutputSpeech(outputSpeech);
		
		if(card != null)
			response.setCard(card);
		
		return response;
		
	}
	
	
	
	
	public SpeechletResponse newSsmlOutputResponse(String str, boolean endSession, Card card){
		
		SpeechletResponse response = new SpeechletResponse();
		response.setShouldEndSession(endSession);
		SsmlOutputSpeech outputSpeech = new SsmlOutputSpeech();
		
		outputSpeech.setSsml("<speak>" + str + "</speak>");
		
		response.setOutputSpeech(outputSpeech);
		
		if(card != null)
			response.setCard(card);
		
		return response;
		
	}
	
	
	public SpeechletResponse getSetDefaultOSResponse(SpeechletRequestEnvelope<IntentRequest> request){
		
		
		String osName = request.getRequest().getIntent().getSlot("osName").getValue();
		String userId = request.getSession().getUser().getUserId();
		UserProfile userProfile = getProfileFromS3(userId);

		LOG.info(osName);
		
		if(osName == null){
		
			String speechText = "Your current operating system is " + userProfile.getDefaultOS() + ". What operating system do you like to make default? The options are Windows, Linux or Mac.";
			
			Reprompt reprompt = new Reprompt();
			
			PlainTextOutputSpeech repromptOutputSpeech = new PlainTextOutputSpeech();
			repromptOutputSpeech.setText(speechText);
			reprompt.setOutputSpeech(repromptOutputSpeech);
			
			return SpeechletResponse.newAskResponse(repromptOutputSpeech, reprompt);
		
		}  else if (!Arrays.asList(osNames).contains(osName.toLowerCase())) {
			
			return newPlainTextOutputResponse(osName + " is not an option. Please, choose Windows, Linux or Mac", false, null);
			
		}
	
		
		userProfile.setDefaultOS(osName.toLowerCase());
		userProfile.setUserId(userId);
		
		storeProfileToS3(userProfile);
		
		return newPlainTextOutputResponse("Great, " + osName + " is your default operating system now.", true, null);
		
	}
	
	
	public SpeechletResponse getNoIntentResponse(SpeechletRequestEnvelope<IntentRequest> request){
		
		String speechText = "I could not understand what you want, please try to say for example: Alexa, ask eclipse shortcuts to search delete.";
		
		SimpleCard card = new SimpleCard();
		card.setTitle("Need help?");
		card.setContent(speechText);
		
		return newPlainTextOutputResponse(speechText, true, card);
	}
	
	
	public SpeechletResponse getStopIntentResponse(){
		
		return newPlainTextOutputResponse("OK, Bye!", true, null);
	}
	
	
	public SpeechletResponse getWelcomeResponse(SpeechletRequestEnvelope<LaunchRequest> request){
		
		String speechText = "Hello, welcome to eclipse shortcuts. This is an open-source skill. Go to the link showed in your alexa app to have access to the source code.";
		SimpleCard card = new SimpleCard();
		card.setTitle("Welcome to Eclipse Shortcuts!");
		card.setContent("Hello, welcome to Eclipse Shortcuts. This is an open-source skill for Alexa.\n\n Check the source code on GitHub: https://github.com/danilogit/eclipse-shortcuts-skill");
		
		return newPlainTextOutputResponse(speechText, true, card);
	}
	
	
	@Override
	public SpeechletResponse onIntent(SpeechletRequestEnvelope<IntentRequest> request) {
		
		String intentName = request.getRequest().getIntent().getName();
		LOG.warn("Intent: " + intentName);
		
		switch (intentName) {
		
			case "SearchShortcut":
				List<ShortcutRecord> shortcuts = search(request);
				
				if (shortcuts.size() > 0) {
					return getShortcutsFoundResponse(request, shortcuts);
				} else {
					return getShortcutsNotFoundResponse(request);
				}
				
			case "SetDefaultOS":
				return getSetDefaultOSResponse(request);
				
			case "AMAZON.StopIntent":
			case "AMAZON.CancelIntent":
				return getStopIntentResponse();
				
			case "AMAZON.HelpIntent":
				return getHelpResponse();
				
			default:
				return getNoIntentResponse(request);
				
		}
		
	}

	@Override
	public SpeechletResponse onLaunch(SpeechletRequestEnvelope<LaunchRequest> request) {
		return getWelcomeResponse(request);
	}

	@Override
	public void onSessionEnded(SpeechletRequestEnvelope<SessionEndedRequest> request) {

	}

	@Override
	public void onSessionStarted(SpeechletRequestEnvelope<SessionStartedRequest> request) {
		
		s3Client = AmazonS3ClientBuilder.standard().withRegion(System.getenv("AWS_REGION")).build();
	
		if(!doesDatabaseExist()){
			uploadDatabase();
		}
		
		downloadDatabase();
		
	}

}
