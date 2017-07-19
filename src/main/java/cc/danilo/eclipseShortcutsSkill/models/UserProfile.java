package cc.danilo.eclipseShortcutsSkill.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class UserProfile {

	private String userId;
	private String defaultOS;
	
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getDefaultOS() {
		return defaultOS;
	}
	
	public void setDefaultOS(String defaultOS) {
		this.defaultOS = defaultOS;
	}
	
}
