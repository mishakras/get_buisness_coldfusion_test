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

<cflock name="ExtGenAppIdLock" timeout="2">
	<cfset application.appId = application.appId + 1>
	<cfset appUid = application.appId>
</cflock>

<cfset application[#appUid#] = ideeventinfo>

<cfset nextUrl = Session.utilComp.generateURL("main.cfm")>
<cfset nextUrl = nextUrl & "?genId=" & #appUid#>

<cfoutput >
	<response status="success" showResponse="true" >
		<ide url="#nextUrl#" >
    		<dialog width="650" height="700" title="Extension Generator" 
			dialogclosehandler="dialogCloseHandler.cfm" />
		</ide>
	</response>
</cfoutput>
