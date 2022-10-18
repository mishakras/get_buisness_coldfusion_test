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

<cfparam name="ideeventinfo">

<cfset requestProcessor = createObject("component","framework.RequestProcessor") >

<cfset requestInfo = requestProcessor.parseRequest(#ideeventinfo#)>

<cfset projectInfo = requestInfo.getProjectInfo()>

<cfset defaultPath = "">

<cfif not isSimpleValue(projectInfo) and arraylen(projectInfo.getProjectResources()) gt 0>
	<cfset resources = projectInfo.getProjectResources()>
	<cfset firstResource = resources[1]>
	<cfset resourceType = firstResource.getResourceType()>
	<cfif resourceType eq "folder">
		<cfset defaultPath = firstResource.getResourcePath()>
	<cfelseif resourceType eq "project">
		<cfset defaultPath = requestInfo.getProjectInfo().getProjectLocation()>
	</cfif>
</cfif>

<cfoutput >
	<response status="success" showResponse="true" >
		<ide handlerfile="processInstallLocation.cfm">
		
    		<dialog title="Extension Generator" width="550" height="250">
    		
    			<input name="Location" label="Enter Location" tooltip="Location where new extension files will be saved"
					default="#defaultPath#"  
					type="dir" required="true" helpMessage="Location where new extension files will be saved" />
				
    			<input name="createFolder" label="Create Folder With Extension Name"
					tooltip="Select this option to create a folder with extension name under install folder" 
					helpMessage="Select this option to create a folder with extension name under install folder" 
					type="boolean" checked="true"/>
				
    		</dialog>
		</ide>
	</response>
</cfoutput>
