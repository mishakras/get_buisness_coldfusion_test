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

<cfset event.setValue("title", "Announcement Edit")>
<cfset root = event.getValue("myself")>
<cfset announcement = event.getValue("announcement")>

<cfset atitle = event.getValue("atitle", announcement.getTitle())>
<cfset body = event.getValue("body", announcement.getBody())>
<cfset projectidfk = event.getValue("projectidfk", announcement.getProjectIDFK())>
<cfset useridfk = event.getValue("useridfk", announcement.getUserIDFK())>

<cfset allProjects = event.getValue("projects")>
<cfset errors = event.getValue("errors")>

<h2 class="red">Announcement Edit</h2>
<p>
Use the form below to edit your announcement.
</p>

<cf_renderErrors errors="#errors#">

<cfoutput>
<form action="#root#action.announcementsave" method="post">
<input type="hidden" name="id" value="#announcement.getId()#">
<table id="formTable" cellspacing="4" cellpadding="4">
	<tr>
		<td align="right" width="120"><label>Title:</label></td>
		<td><input type="text" name="atitle" value="#atitle#" class="bigInput"></td>
	</tr>
	<tr>
		<td align="right"><label>Body:</label></td>
		<td><textarea name="body" class="input">#htmlEditFormat(body)#</textarea></td>
	</tr>

	<tr>
		<td align="right"><label>Project:</label></td>
		<td>
		<select name="projectidfk" class="input">
		<option value="" <cfif projectidfk is "">selected</cfif>>None</option>
		<cfloop query="allProjects">
			<cfoutput><option value="#id#" <cfif projectidfk is id>selected</cfif>>#name#</option></cfoutput>
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

