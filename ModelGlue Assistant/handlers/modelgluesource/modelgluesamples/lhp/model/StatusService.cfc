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

<cfcomponent output="false" displayName="Status Service">

	<cfset variables.dsn = "">
	<cfset variables.username = "">
	<cfset variables.password = "">
	
	<cffunction name="init" access="public" returnType="StatusService" output="false">
		<cfargument name="settings" type="any" required="true">
		<cfargument name="statusGateway" type="any" required="true">
		<cfset var config = arguments.settings.getConfig()>
		
		<cfset variables.dsn = config.dsn>
		<cfset variables.username = config.username /> 
		<cfset variables.password = config.password />
		
		<cfset variables.gateway = arguments.statusGateway>
		<cfreturn this>
	</cffunction>	

	<cffunction name="deleteStatuses" access="public" returnType="void" output="false">
		<cfargument name="list" type="any" required="true">
		<cfset var id = "">
		
		<cfloop index="id" list="#arguments.list#">
			<cfset variables.gateway.deleteStatus(id)>
		</cfloop>
		
	</cffunction>
	
	<cffunction name="getStatus" access="public" returnType="any" output="false">
		<cfargument name="id" type="any" required="true">
		<cfif isValid("uuid",arguments.id)>
			<cfreturn variables.gateway.getStatus(arguments.id)>
		<cfelse>
			<cfreturn createObject("component", "StatusBean")>
		</cfif>
	</cffunction>
	
	<cffunction name="getStatuses" access="public" returnType="query" output="false">
		<cfreturn variables.gateway.getStatuses()>
	</cffunction>

	<cffunction name="saveStatus" access="public" returnType="void" output="false">
		<cfargument name="status" type="any" required="true">
		<cfset variables.gateway.saveStatus(arguments.status)>
	</cffunction>
		
	
</cfcomponent>
