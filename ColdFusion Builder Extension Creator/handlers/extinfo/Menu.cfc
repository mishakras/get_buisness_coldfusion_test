<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="Menu" output="false">
	
	<cfset this.target = "">
	<cfset this.name = "">
	<cfset this.actions = ArrayNew(1)>
	<cfset this.filters = ArrayNew(1)>
	
	<cffunction name="getTarget" output="false" >
		<cfreturn this.target>
    </cffunction>
	
	<cffunction name="setTarget" output="false">
		<cfargument name="target" required="true" >
		<cfset this.target = arguments.target>
	</cffunction> 
	
	<cffunction name="setName" output="false" >
		<cfargument name="name" required="false" >
		<cfset this.name = arguments.name>
	</cffunction>
	
	<cffunction name="getName" output="false" >
		<cfreturn this.name>
	</cffunction>
	
	<cffunction name="addAction" output="false" >
		<cfargument name="action" required="true" type="MenuAction">
		<cfset ArrayAppend(this.actions,arguments.action)>
	</cffunction>
	
	<cffunction name="getActions" output="false" returntype="Array" >
		<cfreturn this.actions>
	</cffunction>

	<cffunction name="getActionAt" output="false" returntype="MenuAction" >
		<cfargument name="index" required="true">
		<cfreturn this.actions[index]>
	</cffunction>

	<cffunction name="deleteAction" output="false" >
		<cfargument name="index" required="true">
		<cfreturn ArrayDeleteat(this.actions, index)>
	</cffunction>

	<cffunction name="addFilter" output="false" >
		<cfargument name="filter" required="true" type="MenuFilter">
		<cfset ArrayAppend(this.filters,arguments.filter)>
	</cffunction>
	
	<cffunction name="getFilters" output="false" returntype="Array" >
		<cfreturn this.filters>
	</cffunction>

	<cffunction name="getFilterAt" output="false" returntype="MenuFilter" >
		<cfargument name="index" required="true" type="numeric" >
		<cfreturn this.filters[index]>
	</cffunction>

	<cffunction name="deleteFilter" output="false" >
		<cfargument name="index" required="true">
		<cfreturn ArrayDeleteat(this.filters, index)>
	</cffunction>
	
	<cffunction name="validate" output="false">
		<cfset var errMsg = "">
		
		<cfif this.name eq "">
			<cfset errMsg = errMsg & "Menu name must be specified." & Chr(10) & Chr(13)>
		</cfif>

		<cfif this.target eq "">
			<cfset errMsg = errMsg & "No target specified for menu " & this.name & Chr(10) & Chr(13)>
		</cfif>
		
		<cfif ArrayLen(this.actions) eq 0>
			<cfset errMsg = errMsg & "No actions specified for menu " & this.name & Chr(10) & Chr(13)>
		</cfif>

		<cfif errMsg neq "">
			<cfthrow message="#errMsg#" type="Application" >
		</cfif>
		
		<cfset validateActions()>
		<cfset validateFilters()>
	</cffunction>
	
	<cffunction name="validateActions" output="false">
		<cfloop index="i" from="1" to="#ArrayLen(this.actions)#">
			<cfset this.actions[i].validate()>
        </cfloop>
	</cffunction>

	<cffunction name="validateFilters" output="false">
		<cfloop index="i" from="1" to="#ArrayLen(this.filters)#">
			<cfset this.filters[i].validate()>
        </cfloop>
	</cffunction>
	

</cfcomponent>