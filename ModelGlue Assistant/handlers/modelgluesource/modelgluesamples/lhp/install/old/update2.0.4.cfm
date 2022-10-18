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

<!---
	The purpose of this script is to update the issues
	table with publicid values. It will NOT add the columns.
	You are going to have to add the columns themselves, please
	check the readme.txt file for information on what columns you must
	add. 
--->

<!--- set this to your LHP dsn --->
<cfset dsn = "lighthousepro">

<cfquery name="issues" datasource="#dsn#">
select		id, projectidfk, name
from		issues
order by 	projectidfk, created asc
</cfquery>

<cfoutput group="projectidfk" query="issues">
	<b>projectidfk=#projectidfk#</b><br>
	<cfset counter = 0>

		<cfoutput>
			<cfset counter = counter + 1>
			issue: #name#, publicid will be #counter#<br>
			<cfquery datasource="#dsn#">
			update	issues
			set		publicid = <cfqueryparam cfsqltype="cf_sql_integer" value="#counter#">
			where	id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#id#">	
			</cfquery>
		</cfoutput>
</cfoutput>
