<cfsetting showdebugoutput="false" />
<cfheader name="Content-Type" value="text/xml">
<cfparam name="ideeventinfo" default="">


<cfset xmlDoc = xmlParse(ideeventinfo) />
<cfset resource = xmlSearch(xmlDoc,"//resource") />
<cfset folder = resource[1].XMLAttributes.path />

<!---
	This is a vague idea and I don't know if I want to keep it or not.
	<cfset issueStruct = structNew() />
	<cfset issueStruct.viewState = arrayNew(1) />	
	<cfset issueStruct.noUseOfEventTypes = arrayNew(1) />	
	<cfset issueStruct.noUseOfBeansAttribute = arrayNew(1) />	
	<cfset issueStruct.noUseOfModelGlueSchema = arrayNew(1) />	
--->

<!--- We need some CFCs --->
<cfset UserMessageContainer = createobject("component", "modelglueExtension.handlers.components.containers.UserMessageContainer").init() />
<cfset FileFilter = createobject("component", "modelglueExtension.handlers.components.filters.FileFilter").init() />
<cfset ColdSpringXMLRuleset = createobject("component", "modelglueExtension.handlers.components.rulesets.ColdSpringXMLRuleset").init( UserMessageContainer ) />
<cfset MGControllerRuleset = createobject("component", "modelglueExtension.handlers.components.rulesets.MGControllerRuleset").init( UserMessageContainer ) />
<cfset MGViewRuleset = createobject("component", "modelglueExtension.handlers.components.rulesets.MGViewRuleset").init( UserMessageContainer ) />
<cfset MGXMLRuleset = createobject("component", "modelglueExtension.handlers.components.rulesets.MGXMLRuleset").init( UserMessageContainer ) />


<!---get files in folder--->
<cfdirectory action="list" directory="#folder#" recurse="true" name="FileQuery" />
<cfset FileQuery = FileFilter.stripFilesOutWeDoNotCareAbout( FileQuery ) /> <!--- .cfm, .xml, .cfc --->

<cfloop query="FileQuery">
	<cffile action="read" file="#FileQuery.directory & "/" & FileQuery.name#" variable="thisFile" />
	<cfset thisFileClass = FileFilter.figureOutTheKindOfFileThisIs( FileQuery.name, thisFile) />
	
	<cfswitch expression="#thisFileClass#">
		<cfcase value="CFM">
			<cfset MGViewRuleset.recommendNewFeatures(FileQuery.name, thisFile ) /> 
		</cfcase>
		<cfcase value="MGXML">
			<cfset MGXMLRuleset.recommendNewFeatures(FileQuery.name, thisFile ) /> 
		</cfcase>
		<cfcase value="MGController">
			<cfset MGControllerRuleset.recommendNewFeatures(FileQuery.name, thisFile ) /> 
			<!---
				On hold for now. See comments in function for detail
				<cfset MGControllerRuleset.recommendBetterPractices(FileQuery.name, thisFile ) /> 
			--->
		</cfcase>
		<cfcase value="ColdSpringXMLWithMGConfigurationBean">
			<cfset ColdSpringXMLRuleset.recommendNewFeatures(FileQuery.name, thisFile ) /> 
		</cfcase>
	</cfswitch>
</cfloop>

<cfset UserMessageQuery = UserMessageContainer.getAllMessages() />

<cfsavecontent variable="RenderedContent">
<cftable query="UserMessageQuery" colspacing="3" HTMLTable>
<!--- Each cfcol tag sets width of a column in table, and specifies header
    information and text/CFML with which to fill cell. --->
    <cfcol header="" align="left" text="<img src='http://datacurl.com/clients/mg/#Type#.png' />">
    <cfcol header="<b>Type</b>" align="left" text="#Type#">
    <cfcol header="<b>Message</b>" align="left" text="#Message#">
</cftable>
</cfsavecontent>

<cfoutput>
	
				
				<cfif UserMessageQuery.recordcount>
					<table width="100%" cellpadding="6" class="tableDisplay" cellspacing="1" border="0">
						<tr class="tableHeader">
							<td  class="tableHeader">&nbsp;</td>
							<td  class="tableHeader">Type</td>
							<td  class="tableHeader">Message</td>
						</tr>
						
						<cfset count = 1 />
						<cfloop query="UserMessageQuery">
							<cfif count mod 2>
								<cfset class="tableRow1" />
							<cfelse>
								<cfset class="tableRow0" />
							</cfif>	
							<tr class="#class#">
								<td><img src="#application.rootURL#/images/#UserMessageQuery.type#.png" border="0" /></td>
								<td>#userMessageQuery.type#</td>
								<td>#userMessageQuery.message#</td>
							</tr>
							<cfset count++ />
						</cfloop>
					</table>	
				<cfelse>
					<p>
						We have no recomendations at this time
					</p>
				</cfif>
			
</cfoutput>