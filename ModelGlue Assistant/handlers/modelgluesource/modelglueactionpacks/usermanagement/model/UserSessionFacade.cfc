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

<cfcomponent output="false" hint="Hides interacting with session for user management purposes.">

<cffunction name="init" output="false">
	<cfargument name="userDAO" hint="Used to look up anonymous user account." />
	
	<cfset variables.anonymousUser = userDAO.readAnonymousUser() />
</cffunction>

<cffunction name="storeUser" output="false">
	<cfargument name="user" />
	
	<cfset session.user = arguments.user />
</cffunction>

<cffunction name="purgeUser" output="false">
	<cfset structDelete(session, "user") />
</cffunction>

<cffunction name="getCurrentUser" output="false">
	<cfif structKeyExists(session, "user")>
		<cfreturn session.user />
	<cfelse>
		<cfreturn variables.anonymousUser />
	</cfif>
</cffunction>

</cfcomponent>
