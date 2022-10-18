<cfparam name="attributes.location" default="view" />

<cfif attributes.location is "ide">
	<cfset updateLocation = "update.cfm" />
<cfelse>
	<cfset updateLocation = "updatePanel.cfm" />
</cfif>		

<cfif thisTag.executionMode IS "start">
	<cfoutput>
    	<cfif application.update.isOnline()>
			<cfset shouldUpdate = application.update.shouldUpdate() />
			
			<cfif shouldUpdate>
	            	<p>
						A newer version of the Model Glue Extension is available.  <a href="#application.rootURl#pages/#updateLocation#?formatPage=1">Click here to download!</a>
					</p>
			</cfif>	
		</cfif>	
    </cfoutput>
</cfif>