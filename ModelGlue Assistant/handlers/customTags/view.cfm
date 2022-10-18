<cfheader name="Content-Type" value="text/xml">
<cfparam name="attribute.id" default="" />
<cfparam name="attributes.title" default="" />
<cfparam name="attributes.checkupdate" default="false" />

<cfoutput>
	<cfif thisTag.executionMode is "start">
		<response status="success" showresponse="true" >
			<ide >
				<view id="#attributes.id#" title="#attributes.title#" icon="handlers/images/icon.png" /> 
				<body>
					<![CDATA[
						<cf_page exMode="start" title="#attributes.title#">
	<cfelse>
						<cf_page exMode="end" checkUpdate="#attributes.checkupdate#">			
					]]>
				</body>
			</ide>
		</response>
	</cfif>	
</cfoutput>