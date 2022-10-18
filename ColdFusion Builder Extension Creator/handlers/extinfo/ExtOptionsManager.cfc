<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="ExtOptionsManager" output="false">
	
	<cffunction name="getInputDataTypes" returntype="Array" >
		<cfset result = arraynew(1)>
		<cfset ArrayAppend(result,"dir")>
		<cfset ArrayAppend(result,"file")>
		<cfset ArrayAppend(result,"projectdir")>
		<cfset ArrayAppend(result,"projectfile")>
		<cfset ArrayAppend(result,"string")>
		<cfset ArrayAppend(result,"boolean")>
		<cfset ArrayAppend(result,"password")>
		<cfset ArrayAppend(result,"list")>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="getDefaultKeywords" returntype="Array">
		<cfset result = arraynew(1)>
		<cfset ArrayAppend(result,"{$projectname}")>
		<cfset ArrayAppend(result,"{$projectlocation}")>
		<cfset ArrayAppend(result,"{$serverhome}")>
		<cfset ArrayAppend(result,"{$wwwroot}")>
		<cfreturn result>
	</cffunction> 
	
	<cffunction name="getMenuTargets" returnType="Array" >
		<cfset result = ArrayNew(1)>
		<cfset ArrayAppend(result,"rdsview")>
		<cfset ArrayAppend(result,"projectview")>
		<cfset ArrayAppend(result,"outlineview")>
		<cfset ArrayAppend(result,"editor")>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="getFilterTypes" returnType="Array" >
		<cfset result = ArrayNew(1)>
		<cfset ArrayAppend(result,"folder")>
		<cfset ArrayAppend(result,"project")>
		<cfset ArrayAppend(result,"file")>
		<cfreturn result>
	</cffunction>
	
</cfcomponent>