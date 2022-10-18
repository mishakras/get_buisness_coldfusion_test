<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="MenuInput" output="false">
	
	<cfset this.name = "">
	<cfset this.label = "">
	<cfset this.tooltip = "">
	<cfset this.type = "">
	<cfset this.required = false>
	<cfset this.pattern = "">
	<cfset this.errorMessage = "">
	<cfset this.helpMessage = "">
	<cfset this.default = "">
	<cfset this.checked = false>
	
	<cffunction name="getName" output="false" >
		<cfreturn this.name>
	</cffunction>
	
	<cffunction name="setName" output="false" >
		<cfargument name="name" required="true" >
		<cfset this.name = arguments.name>
	</cffunction>
	
	<cffunction name="getLabel" output="false" >
		<cfreturn this.label>
	</cffunction>
	
	<cffunction name="setLabel" output="false" >
		<cfargument name="label" required="true" >
		<cfset this.label = arguments.label>
	</cffunction>
	
	<cffunction name="getType" output="false" >
		<cfreturn this.type>
	</cffunction>
	
	<cffunction name="setType" output="false" >
		<cfargument name="type" required="true" >
		<cfset this.type = arguments.type>
	</cffunction>
	
	<cffunction name="getTooltip" output="false" >
		<cfreturn this.tooltip>
	</cffunction>
	
	<cffunction name="setTooltip" output="false" >
		<cfargument name="tooltip" required="true" >
		<cfset this.tooltip = arguments.tooltip>
	</cffunction>
	
	<cffunction name="isRequired" output="false" returntype="boolean" >
		<cfreturn this.required>
	</cffunction>
	
	<cffunction name="setRequired" output="false" >
		<cfargument name="required" required="true" type="boolean" >
		<cfset this.required = arguments.required>
	</cffunction>
	
	<cffunction name="getPattern" output="false" >
		<cfreturn this.pattern>
	</cffunction>
	
	<cffunction name="setPattern" output="false" >
		<cfargument name="pattern" required="true" >
		<cfset this.pattern = arguments.pattern>
	</cffunction>
	
	<cffunction name="getErrorMessage" output="false" >
		<cfreturn this.errorMessage>
	</cffunction>
	
	<cffunction name="setErrorMessage" output="false" >
		<cfargument name="errorMessage" required="true" >
		<cfset this.errorMessage = arguments.errorMessage>
	</cffunction>
	
	<cffunction name="getHelpMessage" output="false" >
		<cfreturn this.helpMessage>
	</cffunction>
	
	<cffunction name="setHelpMessage" output="false" >
		<cfargument name="helpMessage" required="true" >
		<cfset this.helpMessage = arguments.helpMessage>
	</cffunction>
	
	<cffunction name="getDefault" output="false" >
		<cfreturn this.default>
	</cffunction>
	
	<cffunction name="setDefault" output="false" >
		<cfargument name="default" required="true" >
		<cfset this.default = arguments.default>
	</cffunction>
	
	<cffunction name="isChecked" output="false" returntype="boolean" >
		<cfreturn this.checked>
	</cffunction>
	
	<cffunction name="setChecked" output="false" >
		<cfargument name="checked" required="true" >
		<cfset this.checked = arguments.checked>
	</cffunction>
	
	<cffunction name="validate">
		<cfset var errMsg = "">
		
		<cfif this.name eq "">
			<cfset errMsg = errMsg & "Input name must be specified." & Chr(10) & Chr(13)>
		</cfif>

		<cfif this.type eq "">
			<cfset errMsg = errMsg & "No type specified for input " & this.name & Chr(10) & Chr(13)>
		</cfif>
		
		<cfif errMsg neq "">
			<cfthrow message="#errMsg#" type="Application" >
		</cfif>
		
	</cffunction>	
	
</cfcomponent>