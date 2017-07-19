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

package cc.danilo.eclipseShortcutsSkill.models;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;


@DatabaseTable(tableName="SHORTCUTS")
public class ShortcutRecord {

	@DatabaseField(generatedId=true)
	private int id;
	
	@DatabaseField
	private String command;
	
	@DatabaseField
	private String description;
	
	@DatabaseField(columnName="COMMAND_LITERAL")
	private String commandLiteral;
	
	@DatabaseField
	private String os;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCommand() {
		return command;
	}

	public void setCommand(String command) {
		this.command = command;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCommandLiteral() {
		return commandLiteral;
	}

	public void setCommandLiteral(String commandLiteral) {
		this.commandLiteral = commandLiteral;
	}
	
	
	
}
