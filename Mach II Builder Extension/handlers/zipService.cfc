<!--- 
/* 	Code from Brian Rinaldi's CF Builder Extension updater
 *	Acme Boomerang for ColdFusion Builder http://acmeboomerang.riaforge.org/
 *	http://www.adobe.com/devnet/coldfusion/articles/cfbuilder_selfupdating_extension.html?devcon=f2
 * 	License: Apache License, Version 2
 */
 --->
<cfcomponent output="false">
	<cffunction name="doUnzip" access="public" output="false" returntype="void">
		<cfargument name="file" type="string" required="true" />
		<cfargument name="destination" type="string" required="true" />
		
		<cfzip file="#arguments.file#" action="unzip" destination="#arguments.destination#" storepath="yes" overwrite="yes" />
	</cffunction>
</cfcomponent>