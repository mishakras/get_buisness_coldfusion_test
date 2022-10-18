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

<cfcomponent output="false">

	<cfset variables.instance = StructNew()/>

	<cffunction name="init" access="public" output="false" returntype="Users">
		<cfreturn this/>
	</cffunction>

	<cffunction name="getUsers" access="remote" output="false" returntype="any">
		<cfset var local = StructNew()/>
		<cfset local.myQuery = QueryNew("name","varchar")>
		<cfloop from="1" to="12" index="local.j">
			<cfset QueryAddRow(local.myQuery, 1)>
			<cfset QuerySetCell(local.myQuery, "name", "Person-#local.j#", local.j)>
		</cfloop>
		<cfreturn local.myQuery/>
	</cffunction>

</cfcomponent>
