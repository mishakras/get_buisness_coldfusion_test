<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfapplication name="ColdFusion Builder Extension Generator" 
	sessionmanagement="true" >

<cfif isDefined("Session.utilComp") eq false>
	<cfset Session.utilComp = createObject("component", "framework/Util")>
</cfif>

<cflock name="ExtGenAppIdLock" timeout="2">
	<cfif not isDefined("application.appId")>
		<cfset application.appId = 0>
	</cfif>
</cflock>


<cfif isDefined("Session.optionManager") eq false>
	<cfset Session.optionManager = 
		createObject("component","extinfo.ExtOptionsManager")>
</cfif>

<cfif isDefined("session.extInfo")>
	<cfset extInfo = Session.extInfo>
</cfif>
