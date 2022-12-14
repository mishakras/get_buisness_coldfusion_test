<cfcomponent output="false">
	<cfset this.name = 'get_buisness_test' />
	<cfset this.applicationTimeout = createtimespan(14,0,0,0) />
	<cfset this.datasource = 'get_buissness' />
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createTimespan(0,2,0,0) />
	
	<cffunction name="onApplicationStart" returntype="boolean" >
		<cfset application.userService = createObject("component",'services.userService') /> 
		<cfset application.errorService = createObject("component",'services.errorService') />
		<cfreturn true />
	</cffunction>
	<cffunction name="onRequestStart" returntype="boolean" >
		<cfargument name="targetPage" type="string" required="true" />
		<cfreturn true />
	</cffunction>
	<cffunction name="onError" returnType="void">
		<cfargument name="Exception" required=true/>
		<cfargument name="EventName" type="String" required=true/>
		<cfoutput>
			#Exception.message#
		</cfoutput>
	</cffunction>
</cfcomponent>