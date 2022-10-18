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


<cfset start = event.getValue("start",1)>
<cfset perpage = event.getValue("perpage",10)>
<cfset issues = event.getValue("issues")>

<!--- build a struct to hold metadata --->
<cfset s = structNew()>
<cfset s.total = issues.recordCount>

<!--- make the array to hold our data - pagination here kinda sucks --->
<cfset s.data = arrayNew(1)>
<cfif start gt s.total>
	<cfset start = 1>
</cfif>

<cfif s.total gt 0>
	<cfloop index="x" from="#start#" to="#min(s.total,start+perpage-1)#">
		<cfset i = structNew()>
		<cfset i.description = issues.description[x]>
		<cfset i.id = issues.id[x]>
		<cfset i.issuetype = issues.issuetype[x]>
		<cfset i.locusname = issues.locusname[x]>
		<cfset i.name = issues.name[x]>
		<cfset i.publicid = issues.publicid[x]>	
		<cfset i.severityname = issues.severityname[x]>
		<cfset i.severityrank = issues.severityrank[x]>		
		<cfset i.statusname = issues.statusname[x]>
		<cfset i.statusrank = issues.statusrank[x]>
		<cfset i.username = issues.username[x]>
		<cfif len(issues.updated[x])>
			<cfset i.prettydate = dateFormat(issues.updated[x], "m/d/yy")>
		<cfelse>
			<cfset i.prettydate = "">
		</cfif>
		<cfif len(issues.duedate[x])>
			<cfset i.prettyduedate = dateFormat(issues.duedate[x], "m/d/yy")>
		<cfelse>
			<cfset i.prettyduedate = "">
		</cfif>
		<cfset arrayAppend(s.data, i)>
	</cfloop>
</cfif>

<cfset issuesJSON = helpers.json.encode(s)>
<cfcontent type="application/json;charset=iso-8859-1" reset="true"><cfoutput>#issuesJSON#</cfoutput>
