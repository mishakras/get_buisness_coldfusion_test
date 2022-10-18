<cfheader name="Content-Type" value="text/xml">

<cfoutput >
	<response status="success" showResponse="false" >
	<ide>
		<cfif isDefined("application.extInfo")>
			<commands>
				#Session.utilComp.createRefreshFolderCommand(application.extInfo.getInstallLocation())#
			</commands>
		</cfif> 
	</ide>	
	</response>
</cfoutput>

<cfset structDelete(Application, "extInfo", false)>

