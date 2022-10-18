<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="InstallWizard" output="false" >
	<cfset this.height = 0>
	<cfset this.width = 0>
	<cfset this.handlerId = "">
	<cfset this.pages = ArrayNew(1)>
	
	<cffunction name="getHeight">
		<cfreturn this.height>
	</cffunction>
	
	<cffunction name="setHeight" output="false">
		<cfargument name="height" required="true">
		<cfset this.height = arguments.height>
	</cffunction>
	
	<cffunction name="getWidth" output="false">
		<cfreturn this.width>
	</cffunction>
	
	<cffunction name="setWidth" output="false">
		<cfargument name="width" required="true">
		<cfset this.width = arguments.width>
	</cffunction>
	
	<cffunction name="getHandlerId" output="false">
		<cfreturn this.handlerId>
	</cffunction>
	
	<cffunction name="setHandlerId" output="false">
		<cfargument name="handlerId" required="true">
		<cfset this.handlerId = arguments.handlerId>
	</cffunction>

	<cffunction name="addPage" output="false" >
		<cfargument name="page" required="true" type="WizardPage">
		<cfset ArrayAppend(this.pages,arguments.page)>
	</cffunction>
	
	<cffunction name="getPages" output="false" returntype="Array" >
		<cfreturn this.pages>
	</cffunction>

	<cffunction name="getPageAt" output="false" returntype="WizardPage" >
		<cfargument name="index" required="true" type="numeric" >
		<cfreturn this.pages[index]>
	</cffunction>

	<cffunction name="deletePageAt" output="false" >
		<cfargument name="index" required="true" type="numeric" >
		<cfreturn ArrayDeleteat(this.pages,index)>
	</cffunction>
	
	<cffunction name="validate" output="false">
		<cfset var errMsg = "">
		
		<cfif this.height eq "" || this.height eq 0>
			<cfset errMsg = errMsg & "Height of installation wizard must be specified." & Chr(10) & Chr(13)>
		</cfif>

		<cfif this.width eq "" || this.width eq 0>
			<cfset errMsg = errMsg & "Width of installation wizard must be specified." & Chr(10) & Chr(13)>
		</cfif>

		<cfif this.handlerId eq "">
			<cfset errMsg = errMsg & "No handler specified for an installation wizard." & Chr(10) & Chr(13)>
		</cfif>

		<cfif ArrayLen(this.pages) eq 0>
			<cfset errMsg = errMsg & "Installation wizard must have at least one page." &  Chr(10) & Chr(13)>
		</cfif>
		
		<cfif errMsg neq "">
			<cfthrow message="#errMsg#" type="Application" >
		</cfif>
		
		<cfset validatePages()>
	</cffunction>	
	
	<cffunction name="validatePages" output="false">
		<cfloop index="i" from="1" to="#ArrayLen(this.pages)#">
			<cfset this.pages[i].validate()>
        </cfloop>
	</cffunction>
		
</cfcomponent>