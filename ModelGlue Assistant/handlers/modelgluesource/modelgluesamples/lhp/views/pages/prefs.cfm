<!---
LICENSE INFORMATION:

Copyright 2010, Joe Rinehart, Dan Wilson

Licensed under the Apache License, Version 2.0 (the "License"); you may not 
use this file except in compliance with the License. 

You may obtain a copy of the License at 

	http://www.apache.org/licenses/LICENSE-2.0 
	
Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
CONDITIONS OF ANY KIND, either express or implied. See the License for the 
specific language governing permissions and limitations under the License.

VERSION INFORMATION:

This file is part of Model-Glue 'Gesture' 3.1 Maintenance Release Candidate (3.1.299).

The version number in parentheses is in the format versionNumber.subversion.revisionNumber.
--->

<cfset event.setValue("title", "Edit Preferences")>
<cfset root = event.getValue("myself")>
<cfset me = event.getValue("currentuser")>
<cfset myprojects = event.getValue("myprojects")>
<cfset name = event.getValue("name", me.getName())>
<cfset emailaddress = event.getValue("emailaddress", me.getEmailAddress())>
<cfset selprojects = me.getEmailProjects()>
<cfset errors = event.getValue("errors")>
<cfset message = event.getValue("message")>

<h2 class="red">Preferences</h2>
<p>
Use the form below to update your preferences. Every project selected in the "Email Projects" field will subscribe
you to that project. You will then get an email every time an issue is created or updated.
</p>

<cf_renderErrors errors="#errors#">
<cfif len(message)>
	<cfoutput>
		<div id="msg" class="success">
		#message#
		</div>
	</cfoutput>
</cfif>

<cfoutput>
<form action="#root#action.prefssave" method="post">
<table id="formTable" cellspacing="4" cellpadding="4">
	<tr>
		<td align="right" width="120"><label>Name:</label></td>
		<td><input type="text" name="name" value="#name#" class="input"></td>
	</tr>
	<tr>
		<td align="right"><label>Email:</label></td>
		<td><input type="text" name="emailaddress" value="#emailaddress#" class="input"></td>
	</tr>
	<tr>
		<td align="right"><label>New Password:</label></td>
		<td><input type="password" name="password" value="" class="input"></td>
	</tr>
	<tr>
		<td align="right"><label>Confirm Password:</label></td>
		<td><input type="password" name="password2" value="" class="input"></td>
	</tr>
	<tr>
		<td align="right"><label>Email Projects:</label></td>
		<td>
		<select name="selemailProjects" multiple size="4" class="input">
		<cfloop query="myProjects">
			<cfoutput><option value="#id#" <cfif listFind(selprojects, id)>selected</cfif>>#name#</option></cfoutput>
		</cfloop>
		</select>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" name="Cancel" value="Cancel" class="button" /><input type="submit" name="save" value="Save" class="button blue"></td>
	</tr>
</table>
</form>
</cfoutput>
	
