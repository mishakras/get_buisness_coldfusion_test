<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="WizardPage" output="false">
	
	<cfset this.title = "">
	<cfset this.inputs = ArrayNew(1)>
	
	<cffunction name="setTitle" output="false" >
    		<cfargument name="title" required="true" >
    		<cfset this.title = arguments.title>
    </cffunction>
    	
	<cffunction name="getTitle" output="false" >
		<cfreturn this.title>
	</cffunction>
	
	<cffunction name="addInput" output="false" >
		<cfargument name="input" required="true" type="MenuInput">
		<cfset ArrayAppend(this.inputs,arguments.input)>
	</cffunction>
	
	<cffunction name="getInputs" output="false" returntype="Array" >
		<cfreturn this.inputs>
	</cffunction>

	<cffunction name="getInputAt" output="false" returntype="MenuInput" >
		<cfargument name="index" required="true" type="numeric" >
		<cfreturn this.inputs[index]>
	</cffunction>

	<cffunction name="deleteInputAt" output="false" >
		<cfargument name="index" required="true" type="numeric" >
		<cfreturn ArrayDeleteat(this.inputs,index)>
	</cffunction>
	
	<cffunction name="validate">
		<cfset var errMsg = "">
		
		<cfif this.title eq "">
			<cfset errMsg = errMsg & "Title for the install wizard page must be specified." & Chr(10) & Chr(13)>
		</cfif>

		<cfif ArrayLen(this.inputs) eq 0>
			<cfset errMsg = errMsg & "Install wizard page " & this.title & "does not contain any page." & Chr(10) & Chr(13)>
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
	
	
</cfcomponent>