<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="Handler "output="false">
	
	<cfset this.id = "">
	<cfset this.type = "cfm">
	<cfset this.fileName = "">
	<cfset this.generatesResponse = true>
	<cfset this.dialogTitle = "">
	<cfset this.dialogwidth = "">
	<cfset this.dialogHeight = "">
	<cfset this.notifyOnProjectCreation = false>
	<cfset this.dialgCloseHandlerFile = "">
	
	<cffunction name="setId" output="false" >
		<cfargument name="id" required="false" >
		<cfset this.id = arguments.id>
	</cffunction>
	
	<cffunction name="getId" output="false" >
		<cfreturn this.id>
	</cffunction>

	<cffunction name="setType" output="false" >
		<cfargument name="type" required="false" >
		<cfset this.type = arguments.type>
	</cffunction>
	
	<cffunction name="getType" output="false" >
		<cfreturn this.type>
	</cffunction>

	<cffunction name="setFileName" output="false" >
		<cfargument name="fileName" required="false" >
		<cfset this.fileName = arguments.fileName>
	</cffunction>
	
	<cffunction name="getFileName" output="false" >
		<cfreturn this.fileName>
	</cffunction>

	<cffunction name="validate" output="false">
		<cfset var errMsg = "">
		
		<cfif this.id eq "">
			<cfset errMsg = errMsg & "Handler id must be specified." & Chr(10) & Chr(13)>
		</cfif>

		<cfif this.fileName eq "">
			<cfset errMsg = errMsg & "No file name specified for handler " & this.id & Chr(10) & Chr(13)>
		</cfif>
		
		<cfif errMsg neq "">
			<cfthrow message="#errMsg#" type="Application" >
		</cfif>
		
	</cffunction>
	
	<cffunction name="isGenerateResponse" returntype="boolean" output="false">
		<cfreturn this.generatesResponse>
	</cffunction>
	
	<cffunction name="setGenerateResponse" output="false">
		<cfargument name="generate" required="true" >
		<cfset this.generatesResponse = arguments.generate>
	</cffunction>
	
	<cffunction name="getDialogTitle" output="false">
		<cfreturn this.dialogTitle>
	</cffunction>
	
	<cffunction name="setdialogTitle" output="false">
		<cfargument name="title" required="true" >
		<cfset this.dialogTitle = arguments.title>
	</cffunction>
	
	<cffunction name="getDialogWidth" output="false">
		<cfreturn this.dialogwidth>
	</cffunction>
	
	<cffunction name="setDialogWidth" output="false">
		<cfargument name="width" required="true" >
		<cfset this.dialogwidth = arguments.width>
	</cffunction>
	
	<cffunction name="getDialogHeight" output="false">
		<cfreturn this.dialogHeight>
	</cffunction>
	
	<cffunction name="setDialogHeight" output="false">
		<cfargument name="height" required="true">
		<cfset this.dialogHeight = arguments.height>
	</cffunction>
	
	<cffunction name="isNotifyOnProjectCreation" output="false">
		<cfreturn this.notifyOnProjectCreation>
	</cffunction>
	
	<cffunction name="setNotifyOnProjectCreation" output="false">
		<cfargument name="notify" required="true" type="boolean" >
		<cfset this.notifyOnProjectCreation = arguments.notify>
	</cffunction>

	<cffunction name="getDialgCloseHandlerFile" output="false" >
		<cfreturn this.dialgCloseHandlerFile>
	</cffunction>
	
	<cffunction name="setDialgCloseHandlerFile" output="false" >
		<cfargument name="dialgCloseHandlerFile" required="true" >
		<cfset this.dialgCloseHandlerFile = arguments.dialgCloseHandlerFile>
	</cffunction>

</cfcomponent>