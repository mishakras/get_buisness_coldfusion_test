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

<cfcomponent output="false" displayName="Announcement Service">

	<cfset variables.dsn = "">
	<cfset variables.username = "">
	<cfset variables.password = "">
	
	<cffunction name="init" access="public" returnType="AnnouncementService" output="false">
		<cfargument name="settings" type="any" required="true">
		<cfargument name="announcementGateway" type="any" required="true">
		<cfset var config = arguments.settings.getConfig()>
		
		<cfset variables.dsn = config.dsn>
		<cfset variables.username = config.username /> 
		<cfset variables.password = config.password />
		
		<cfset variables.gateway = arguments.announcementGateway>
		<cfreturn this>
	</cffunction>	

	<cffunction name="deleteAnnouncements" access="public" returnType="void" output="false">
		<cfargument name="list" type="any" required="true">
		<cfset var id = "">
		
		<cfloop index="id" list="#arguments.list#">
			<cfset variables.gateway.deleteAnnouncement(id)>
		</cfloop>
		
	</cffunction>
	
	<cffunction name="getAnnouncement" access="public" returnType="any" output="false">
		<cfargument name="id" type="any" required="true">
		<cfif isValid("uuid",arguments.id)>
			<cfreturn variables.gateway.getAnnouncement(arguments.id)>
		<cfelse>
			<cfreturn createObject("component", "AnnouncementBean")>
		</cfif>
	</cffunction>
	
	<cffunction name="getAnnouncements" access="public" returnType="query" output="false">
		<cfargument name="projectfilter" type="any" required="false">
		<cfreturn variables.gateway.getAnnouncements(argumentCollection=arguments)>
	</cffunction>

	<cffunction name="saveAnnouncement" access="public" returnType="void" output="false">
		<cfargument name="announcement" type="any" required="true">
		<cfset variables.gateway.saveAnnouncement(arguments.announcement)>
	</cffunction>
		
</cfcomponent>
