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

DROP TABLE SHORTCUTS;

CREATE TABLE SHORTCUTS (
		ID INTEGER PRIMARY KEY AUTOINCREMENT,
		COMMAND TEXT(2000000000) NOT NULL,
		DESCRIPTION TEXT(2000000000) NOT NULL,
		COMMAND_LITERAL TEXT(2000000000) NOT NULL,
		OS TEXT(2000000000) NOT NULL
	);

INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Alt+N','Ctrl Alt N','Create new project, file, class, etc.', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+F, then .','Alt F, then dot','Open project, file, etc.', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+R','Ctrl Shift R','Open Resource (file, folder or project)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Enter','Alt Enter','Show and access file properties', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+S','Ctrl S','Save current file', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+S','Ctrl Shift S','Save all files', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+W','Ctrl W','Close current file', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+W','Ctrl Shift W','Close all files', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F5','F5','Refresh content of selected element with local file system', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F12','F12','Jump to Editor Window', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Page Dow','Ctrl Page Down','Switch to next editor', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Page Up','Ctrl Page Up','switch to previous editor', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+M','Ctrl M','Maximize or un-maximize current Editor Window', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+E','Ctrl E','Show list of open Editors.', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+F6 / Ctrl+Shift+F6','Ctrl F6 or Ctrl Shift F6','Show list of open Editors.', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Arrow Right','Alt Arrow Right','go to next Editor Window', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Arrow Left','Alt Arrow Left','Go to previous Editor Window', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+-','Alt minus','Open Editor Window Option menu', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+F10','Ctrl F10','Show view menu', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+F10, then n','Ctrl F10, then n','Show or hide line numbers', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+Q','Ctrl Shift Q','Show or hide the diff column on the left', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift++','Ctrl Shift  plus','Zoom text in', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+-','Ctrl Shift  minus','Zoom text  out', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Home','Home','Jump to beginning. Press home twice to jump to beginning of line', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('End','End','Jump to end of indention.', 'windows,linux');

INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Home/End','Ctrl Home/End','Jump to beginning / jump to end of source', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Arrow Right/Arrow Left','Ctrl Arrow Right/Arrow Left','Jump one word to the left / one word to the right', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+Arrow Down/Arrow Up','Ctrl Shift Arrow Down/Arrow Up','Jump to previous / jump to next method', 'windows,linux');

INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+L','Ctrl L','Jump to Line Number. To hide/show line numbers, press ctrl+F10 and select ''Show Line Numbers''', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Q','Ctrl Q','Jump to last location edited', 'windows,linux');

INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+./Ctrl+,','Ctrl dot/Ctrl ,','Jump to next / jump to previous compiler syntax warning or error', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+P','Ctrl Shift P','With a bracket selected: jump to the matching closing or opening bracket', 'windows,linux');

INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+[+]/Ctrl+- on numeric keyboard','Ctrl [ ]/Ctrl - on numeric keyboard','Collapse / Expand current method or class', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+[/]/Ctrl+* on numeric keyboard','Ctrl [/]/Ctrl * on numeric keyboard','Collapse / Expand all methods or classes', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Arrow Down/Ctrl+Arrow Up','Ctrl Arrow Down/Ctrl Arrow Up','Scroll Editor without changing cursor position', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Page Up/Alt+Page Down','Alt Page Up/Alt Page Down','Next Sub-Tab / Previous Sub-Tab', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Shift+Arrow Right/Arrow Left','Shift Arrow Right/Arrow Left','Expand selection by one character to the left / to the right', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+Arrow Right/Arrow Left','Ctrl Shift Arrow Right/Arrow Left','Expand selection to next / previous word', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Shift+Arrow Down/Arrow Up','Shift Arrow Down/Arrow Up','Expand selection by one line down / one line up', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Shift+End/Home','Shift End/Home','Expand selection to end / to beginning of line', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+A','Ctrl A','Select all', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Shift+Arrow Up','Alt Shift Arrow Up','Expand selection to current element (e.g. current one-line expression or content within brackets)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Shift+Arrow Left/Arrow Right','Alt Shift Arrow Left/Arrow Right','Expand selection to next / previous element', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Shift+Arrow Down','Alt Shift Arrow Down','Reduce previously expanded selection by one step', 'windows,linux');

INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+C','Ctrl C','Copy', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+X','Ctrl X','Cut', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+V','Ctrl V','Paste', 'windows,linux');

INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Z','Ctrl Z','Undo last action', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Y','Ctrl Y','Redo last (undone) action', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+D','Ctrl D','Delete Line', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Arrow Up/Arrow Down','Alt Arrow Up/Arrow Down','Move current line or selection up or down', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Alt+Arrow Up/Ctrl+Alt+Arrow Down/','Ctrl Alt Arrow Up/Ctrl Alt Arrow Down/','Duplicate current line or selection up or down', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Delete','Ctrl Delete','Delete next word', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Backspace','Ctrl Backspace','Delete previous word', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Shift+Enter','Shift Enter','Enter line below current line', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Shift+Ctrl+Enter','Shift Ctrl Enter','Enter line above current line', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Insert','Insert','Switch between insert and overwrite mode', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Shift+Ctrl+Y','Shift Ctrl Y','Change selection to all lower case', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Shift+Ctrl+X','Shift Ctrl X','Change selection to all upper case', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+F','Ctrl F','Open find and replace dialog', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+K/Ctrl+Shift+K','Ctrl K/Ctrl Shift K','Find previous / find next occurrence of search term (close find window first)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+H','Ctrl H','Search Workspace (Java Search, Task Search, and File Search)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+J/Ctrl+Shift+J','Ctrl J/Ctrl Shift J','Incremental search forward / backwards. Type search term after pressing ctrl+j, there is now search window', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+O','Ctrl Shift O','Open a resource search dialog to find any class', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Tab/Shift+Tab','Tab/Shift Tab','Increase / decrease indent of selected text', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+I','Ctrl I','Correct indention of selected text or of current line', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+F','Ctrl Shift F','Autoformat all code in Editor using code formatter', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+/','Ctrl /','Comment / uncomment line or selection ( adds ''//'' )', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+/','Ctrl Shift /','Add Block Comment around selection ( adds ''/... */'' )', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+\','Ctrl Shift \','Remove Block Comment', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Shift+J','Alt Shift J','Add Element Comment ( adds ''/** ... */'')', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Space','Ctrl Space','Opens Content Assist (e.g. show available methods or field names)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+1','Ctrl 1','Open Quick Fix and Quick Assist', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+/','Alt /','Propose word completion (after typing at least one letter). Repeatedly press alt+/ until reaching correct name', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+Insert','Ctrl Shift Insert','Deactivate or activate Smart Insert Mode (automatic indention, automatic brackets, etc.)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+O','Ctrl O','Show code outline / structure', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F2','F2','Open class, method, or variable information (tooltip text)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F3','F3','Open Declaration: Jump to Declaration of selected class, method, or parameter', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F4','F4','Open Type Hierarchy window for selected item', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+T','Ctrl T','Show / open Quick Type Hierarchy for selected item', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+T','Ctrl Shift T','Open Type in Hierarchy', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Alt+H','Ctrl Alt H','Open Call Hierarchy', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Shift+U','Ctrl Shift U','Find occurrences of expression in current file', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+move over method','Ctrl move over method','Open Declaration or Implementation', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Shift+R','Alt Shift R','Rename selected element and all references', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Shift+V','Alt Shift V','Move selected element to other class or file (With complete method or class selected)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Shift+C','Alt Shift C','Change method signature (with method name selected)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Shift+M','Alt Shift M','Extract selection to method', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Shift+L','Alt Shift L','Extract local variable: Create and assigns a variable from a selected expression', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Alt+Shift+I','Alt Shift I','Inline selected local variables, methods, or constants if possible (replaces variable with its declarations/ assignment and puts it directly into the statements)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+F11','Ctrl F11','Save and launch application (run)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F11','F11','Debug', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F5','F5','Step Into function', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F6','F6','Next step (line by line)', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F7','F7','Step out', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F8','F8','Skip to next Breakpoint', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+F7/Ctrl+Shift+F7','Ctrl F7/Ctrl Shift F7','Switch forward / backward between views (panels). Useful for switching back and forth between Package Explorer and Editor.', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+F8/Ctrl+Shift+F8','Ctrl F8/Ctrl Shift F8','Switch forward / backward between perspectives', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+P','Ctrl P','Print', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('F1','F1','Open Eclipse Help', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Shift+F10','Shift F10','Show Context Menu right click with mouse', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Alt+S','Ctrl Alt S','Synchronize with Repository', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Alt+C','Ctrl Alt C','Commit', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Alt+U','Ctrl Alt U','Update', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Alt+D','Ctrl Alt D','Update to Revision', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Alt+E','Ctrl Alt E','Merge', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Alt+T','Ctrl Alt T','Show Properties', 'windows,linux');
INSERT INTO SHORTCUTS (command, command_literal, description, os) VALUES ('Ctrl+Alt+I','Ctrl Alt I','Add to svn:ignore', 'windows,linux');
