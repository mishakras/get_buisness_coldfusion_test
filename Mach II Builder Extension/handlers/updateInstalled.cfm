<!--- 
/* 	Code from Brian Rinaldi's CF Builder Extension updater
 *	Acme Boomerang for ColdFusion Builder http://acmeboomerang.riaforge.org/
 *	http://www.adobe.com/devnet/coldfusion/articles/cfbuilder_selfupdating_extension.html?devcon=f2
 * 	License: Apache License, Version 2
 */
 --->
<cfheader name="Content-Type" value="text/xml">
<response status="success" showresponse="true">
	<ide>
		<dialog width="550" height="350" />
			<body>
<![CDATA[<p style="font-size:11px;">
Update downloaded and installed. Close this window and run the plugin again.
</p>]]>
			</body>
	</ide>
</response>
<cfabort>