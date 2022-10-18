<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="MenuAction" output="false">

	<cfset this.name = "">
	<cfset this.inputDialogWidth = 0>
	<cfset this.inputDialogHeight = 0>
	<cfset this.handlerId = "">
	<cfset this.dialogTitle = "">
	<cfset this.showResponse = true>
	<cfset this.inputs = ArrayNew(1)>
	<cfset this.dialgCloseHandlerFile = "">


	<cffunction name="getName" output="false" >
		<cfreturn this.name>
	</cffunction>
	
	<cffunction name="setName" output="false" >
		<cfargument name="name" required="true" >
		<cfset this.name = arguments.name>
	</cffunction>
	
	<cffunction name="addInput" output="false" >
		<cfargument name="input" type="MenuInput" required="true" >
		<cfset ArrayAppend(this.inputs,arguments.input)>
	</cffunction>
	
	<cffunction name="getInputs" output="false" returntype="array" >
		<cfreturn this.inputs>
	</cffunction>
	
	<cffunction name="getInput" output="false" returntype="MenuInput">
		<cfargument name="index" required="true" >
		<cfreturn this.inputs[index]>
	</cffunction>
	
	<cffunction name="deleteInput" output="false">
		<cfargument name="index" required="true" >
		<cfset ArrayDeleteat(this.inputs, index)>
	</cffunction>
		
	<cffunction name="getInputDialogWidth" output="false" returntype="numeric" >
		<cfreturn this.inputDialogWidth>
	</cffunction>
	
	<cffunction name="setInputDialogWidth" output="false" >
		<cfargument name="inputDialogWidth" required="true" type="numeric" >
		<cfset this.inputDialogWidth = arguments.inputDialogWidth>
	</cffunction>
	
	<cffunction name="getInputDialogHeight" output="false" returntype="numeric" >
		<cfreturn this.inputDialogHeight>
	</cffunction>
	
	<cffunction name="setInputDialogHeight" output="false" >
		<cfargument name="inputDialogHeight" required="true" type="numeric" >
		<cfset this.inputDialogHeight = arguments.inputDialogHeight>
	</cffunction>
	

	<cffunction name="getHandlerId" output="false" >
		<cfreturn this.handlerId>
	</cffunction>
	
	<cffunction name="setHandlerId" output="false" >
		<cfargument name="handlerId" required="true" >
		<cfset this.handlerId = arguments.handlerId>
	</cffunction>
	
	<cffunction name="isShowResponse" output="false">
		<cfreturn this.showResponse>
	</cffunction>
	
	<cffunction name="setShowResponse" output="false">
		<cfargument name="showResponse" required="true" >
		<cfset this.showResponse = arguments.showResponse>
	</cffunction>
	
	<cffunction name="getDialogTitle" output="false" >
		<cfreturn this.dialogTitle>
	</cffunction>
	
	<cffunction name="setDialogTitle" output="false">
		<cfargument name="title" required="true">
		<cfset this.dialogTitle = arguments.title>
	</cffunction>
	
	<cffunction name="validate">
		<cfset var errMsg = "">
		
		<cfif this.name eq "">
			<cfset errMsg = errMsg & "Action name must be specified." & Chr(10) & Chr(13)>
		</cfif>

		<cfif this.handlerId eq "">
			<cfset errMsg = errMsg & "No handler specified for action " & this.name & Chr(10) & Chr(13)>
		</cfif>

		<cfif errMsg neq "">
			<cfthrow message="#errMsg#" type="Application" >
		</cfif>
		
		<cfset validateInputs()>
		
	</cffunction>
	
	<cffunction name="validateInputs" output="false">
		<cfloop index="i" from="1" to="#ArrayLen(this.inputs)#">
			<cfset this.inputs[i].validate()>
        </cfloop>
	</cffunction>

	<cffunction name="getDialgCloseHandlerFile" output="false" >
		<cfreturn this.dialgCloseHandlerFile>
	</cffunction>
	
	<cffunction name="setDialgCloseHandlerFile" output="false" >
		<cfargument name="dialgCloseHandlerFile" required="true" >
		<cfset this.dialgCloseHandlerFile = arguments.dialgCloseHandlerFile>
	</cffunction>
	
</cfcomponent>