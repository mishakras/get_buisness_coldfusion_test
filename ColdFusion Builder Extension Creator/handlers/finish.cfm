<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->



<cfif isdefined("Form.cancelBtn")>
	<cfinclude template="cancel.cfm" >
	<cfabort >
<cfelseif isDefined("Form.generateBtn")>
	<cfif extInfo.generateExtension()>
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
					<tr>
						<td><b>Extension generated successfully!</b></td>
					</tr>
		</table>
		<hr style="margin-left:5px;margin-right:15px">
		<cfset logContent =  extInfo.getLogContent()>
		<cfif logContent neq "">
			<cfoutput >#logContent#</cfoutput>
		</cfif>
		<!--- save extinfo in case close handler is called--->
		<cfset application.extInfo = extInfo> 
	</cfif>
<cfelse>
	<cfset summary = extInfo.generateHTMLSummary()>
	
	<cfoutput >
		#summary#
		<br>
			#createButtons()#
	</cfoutput>
</cfif>

<cffunction name="createButtons" returntype="String" >
	<cfsavecontent variable="jsCode">
		<cfform name="generateExtForm" method="POST">
			<input type="button" value="Home" name="home" onclick="location.href='main.cfm';">
			<input type="submit" name="cancelBtn" value="Cancel">
			<cfif extInfo.isValidExtension()>
				<input type="submit" name="generateBtn" value="Generate Extension" >	
			</cfif>
		</cfform>
    </cfsavecontent>
	<cfreturn jsCode>
</cffunction>