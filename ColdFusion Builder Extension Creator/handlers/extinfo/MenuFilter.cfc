<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="MenuFilter" output="false">

	<cfset this.type = "">
	<cfset this.pattern = "">
	
	<cffunction name="setType" output="false" >
		<cfargument name="type" required="false" >
		<cfset this.type = arguments.type>
	</cffunction>
	
	<cffunction name="getType" output="false" >
		<cfreturn this.type>
	</cffunction>

	<cffunction name="setPattern" output="false" >
		<cfargument name="pattern" required="false" >
		<cfset this.pattern = arguments.pattern>
	</cffunction>
	
	<cffunction name="getPattern" output="false" >
		<cfreturn this.pattern>
	</cffunction>

	<cffunction name="validate">
		<cfset var errMsg = "">
		
		<cfif this.type eq "">
			<cfset errMsg = errMsg & "Filter type must be specified." & Chr(10) & Chr(13)>
		</cfif>

		<cfif errMsg neq "">
			<cfthrow message="#errMsg#" type="Application" >
		</cfif>
		
	</cffunction>
		
</cfcomponent>