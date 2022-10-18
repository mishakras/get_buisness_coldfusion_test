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

<cfset event.setValue("title", "Severity Edit")>
<cfset root = event.getValue("myself")>
<cfset severity = event.getValue("severity")>

<cfset name = event.getValue("name", severity.getName())>
<cfset rank = event.getValue("rank", severity.getRank())>

<cfset errors = event.getValue("errors")>

<h2 class="red">Severity Edit</h2>
<p>
Use the form below to edit this severity.
</p>

<cf_renderErrors errors="#errors#">

<cfoutput>
<form action="#root#action.severitysave" method="post">
<input type="hidden" name="id" value="#severity.getId()#">
<table id="formTable" cellspacing="4" cellpadding="4">
	<tr>
		<td align="right" width="120"><label>Name:</label></td>
		<td><input type="text" name="name" value="#name#" class="bigInput" maxlength="50"></td>
	</tr>
	<tr>
		<td align="right"><label>Rank:</label></td>
		<td><input type="text" name="rank" value="#rank#" class="smallInput"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" name="Cancel" value="Cancel" class="button" /><input type="submit" name="save" value="Save" class="button blue"></td>
	</tr>
</table>
</form>
</cfoutput>

