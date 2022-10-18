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


<cfset event.setValue("title", "Project Edit")>
<cfset errors = event.getValue("errors")>
<cfset root = event.getValue("myself")>
<cfset project = event.getValue("project")>
<cfset projectAreas = event.getValue("projectareas")>
<cfset users = event.getValue("users")>

<cfset name = event.getValue("name", project.getName())>
<cfset mailserver = event.getValue("mailserver", project.getMailServer())>
<cfset mailusername = event.getValue("mailusername", project.getMailUsername())>
<cfset mailpassword = event.getValue("mailpassword", project.getMailPassword())>
<cfset mailemailaddress = event.getValue("mailemailaddress", project.getMailEmailAddress())>

<cfset selProjectAreas = event.getValue("selprojectareas", project.getProjectAreas())>
<cfset selUsers = event.getValue("selusers", project.getUsers())>
	
<h2 class="red">Project Edit</h2>
<p>
Use the form below to edit your project. Project Areas refer to the areas of your project where issues
may be located. Typical examples include "Database, Front End, Administrator, Components." Only
selected users will be able to work with issues.
</p>

<cf_renderErrors errors="#errors#">

<cfoutput>
<form action="#root#action.projectsave" method="post">
<input type="hidden" name="id" value="#project.getId()#">
<table id="formTable" cellspacing="4" cellpadding="4">
	<tr>
		<td align="right" width="120"><label>Name:</label></td>
		<td><input type="text" name="name" value="#name#" class="bigInput" maxlength="50"></td>
	</tr>
	<tr>
		<td align="right"><label>Project Area:</label></td>
		<td>
		<select name="selprojectareas" multiple size="5" class="input">
		<cfloop query="projectAreas">
			<cfoutput><option value="#id#" <cfif listFind(selProjectAreas, id)>selected</cfif>>#name#</option></cfoutput>
		</cfloop>
		</select>
		</td>
	</tr>
	<tr>
		<td align="right"><label>Users:</label></td>
		<td>
		<select name="selusers" multiple size="5" class="input">
		<cfloop query="users">
			<cfoutput><option value="#id#" <cfif listFind(selUsers, id)>selected</cfif>>#username# (#name#)</option></cfoutput>
		</cfloop>
		</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<p>
		Lighthouse Pro projects can be configured to check an email account for new issues. To enable this support, please complete
		all the fields below. Your mail username may be the same as your email address.
		</p>
		</td>
	</tr>
	<tr>
		<td align="right"><label>Mail Server:</label></td>
		<td><input type="text" name="mailserver" value="#mailserver#" class="input"></td>
	</tr>
	<tr>
		<td align="right"><label>Username:</label></td>
		<td><input type="text" name="mailusername" value="#mailusername#" class="input"></td>
	</tr>
	<tr>
		<td align="right"><label>Password:</label></td>
		<td><input type="text" name="mailpassword" value="#mailpassword#" class="input"></td>
	</tr>
	<tr>
		<td align="right"><label>Email Address:</label></td>
		<td><input type="text" name="mailemailaddress" value="#mailemailaddress#" class="input"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" name="Cancel" value="Cancel" class="button" /><input type="submit" name="save" value="Save" class="button blue"></td>
	</tr>
</table>
</form>
</cfoutput>

	
