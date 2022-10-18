<cfheader name="Content-Type" value="text/xml">
<cfparam name="attributes.width" default="400" />
<cfparam name="attributes.height" default="400" />
<cfparam name="attributes.checkupdate" default="false" />

<cfoutput>
	<cfif thisTag.executionMode IS "start">
		<response status="success" showresponse="true" >
			<ide >
				<dialog width="#attributes.width#" height="#attributes.height#" image="handlers/images/header_title.png"/> 
				<body>
					<![CDATA[
	<cfelse>
					]]>
				</body>
			</ide>
		</response>
	</cfif>	
</cfoutput>