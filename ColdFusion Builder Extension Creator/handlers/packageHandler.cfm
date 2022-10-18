<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfheader name="Content-Type" value="text/xml">

<cfset message = "">

<cfparam name="ideeventinfo">

<cfset requestProcessor = createObject("component","framework.RequestProcessor") >
	
<cfset requestInfo = requestProcessor.parseRequest(#ideeventinfo#)>

<!--- Add your handler logic here --->
<cfset projectInfo =  requestInfo.getProjectInfo()>
<cfif isSimplevalue(projectInfo) >
	<cfset sendResponse("Selected resource is not a project")>
	<cfabort>
</cfif>

<cfset resources = projectInfo.getProjectResources()>

<cfif ArrayLen(resources) eq 0>
	<cfset sendResponse("No resource selected")>
	<cfabort>
</cfif>

<cfset resource = resources[1]>

<cfset sourcePath = resource.getResourcePath()>

<cfset userInfo = requestInfo.getUserDefinedFileds()>

<cfif userInfo[1].getName() neq "outputFile">
	<cfset sendResponse("Invalid input. Expected outputfile")>
	<cfabort >
</cfif>

<cfset outputFile = userInfo[1].getValue()>

<cfzip file="#outputFile#" action="zip" recurse="yes" source="#sourcePath#">

<cfset sendResponse("Extension packaged successfully")>


<cffunction name="sendResponse">
	<cfargument name="message">
	<cfoutput >
		<response status="success" showResponse="true" >
			<ide message="#message#" >
			</ide>
		</response>
	</cfoutput>
</cffunction>
