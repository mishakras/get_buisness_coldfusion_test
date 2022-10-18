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

<cfset groups = event.getValue("groups") />

<cfoutput><form action="#event.linkTo("userManagement.group.delete")#" method="post"></cfoutput>

<cfoutput>
	<div class="recordSetControls">
		<a href="#event.linkTo("userManagement.group.edit")#" class="add">Add New Group</a>
		<input type="submit" value="Delete Selected Groups" />
	</div>
</cfoutput>

<table class="recordSet">
<thead>
	<tr>
		<th>&nbsp;</th>
		<th>Group</th>
	</tr>
</thead>
<tbody>
	<cfoutput query="groups">
		<tr <cfif groups.currentRow mod 2 eq 0>class="odd"<cfelse>class="even"</cfif>>
			<td class="skinny"><input type="checkbox" name="groupId" value="#groups.groupId#" /></td>		
			<td><a href="#event.linkTo("userManagement.group.edit")##event.formatUrlParameter("groupId", groups.groupId)#">#htmlEditFormat(groups.name)#</a></td>
		</td>
	</cfoutput>
</tbody>
</table>

</form>
