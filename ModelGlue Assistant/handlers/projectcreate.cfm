<cfinclude template="misc.cfm" />

<cfparam name="ideeventinfo">

<cfset xmldoc = XMLParse(ideeventinfo)>

<!--- detect project creation versus folder run --->
<cfif structKeyExists(xmldoc.event.ide, "projectview") and structKeyExists(xmldoc.event.ide.projectview,"resource")>

	<cfset reloadmode = "folder">
	<cfset projectloc = xmldoc.event.ide.projectview.resource.xmlattributes.path>
	<cfset project = listLast(projectloc, "\/")>
	
<cfelse>

	<cfset reloadmode = "project">
	<cfset project=xmldoc.event.ide.eventinfo.xmlattributes["projectname"]>
	<cfset projectloc=xmldoc.event.ide.eventinfo.xmlattributes["projectlocation"]>

</cfif>

<cfset sampleloc = expandPath("./modelgluesource/modelglueapplicationtemplate")>

<!----- Copy sample app files ----->
<cfdirectory  action="list" directory="#sampleloc#" name="samplefiles" recurse="true">

<cfloop query="samplefiles">
	<cfif samplefiles.type EQ "file">
      <!--- Skip build.properties, build.xml, readme.txt --->
		<cfif not listFindNoCase("build.properties,build.xml,readme.txt", name)>
		 <cfset filename="#samplefiles.directory#/#samplefiles.name#">
		 <cfset dest=replace(filename,sampleloc,projectloc)>

		 <cffile action="copy" source="#filename#" destination="#dest#">
      </cfif>	
	<cfelse>
		<cfset dirname=replace("#samplefiles.directory#/#samplefiles.name#",sampleloc,projectloc)>
		<cfdirectory directory="#dirname#" action="create">
	</cfif>
</cfloop>


<!----Change the coldspringxml entry------->
<cfset coldspringxmlfile="#projectloc#/config/ColdSpring.xml">

<cffile action="read" file="#coldspringxmlfile#" variable="coldspringxml">

<cfset coldspringxml=replace(coldspringxml,"modelglueapplicationtemplate",project,"all")>

<cffile action="write" file="#coldspringxmlfile#" output="#coldspringxml#" nameconflict="overwrite">	
		
<!----Change the modelgluexml entry------->
<cfset modelgluexmlfile="#projectloc#/config/ModelGlue.xml">
<cffile action="read" file="#modelgluexmlfile#" variable="modelgluexml">
<cfset modelgluexml=replace(modelgluexml,"modelglueapplicationtemplate",project,"All")>
<cffile action="write" file="#modelgluexmlfile#" output="#modelgluexml#" nameconflict="overwrite">	
	
<!----Change the Application cfm entry------->
<cfset appcfmfile="#projectloc#/Application.cfm">
<cffile action="read" file="#appcfmfile#" variable="appcfm">
<cfset appcfm=replace(appcfm,"modelglueapplicationtemplate",project,"All")>
<cffile action="write" file="#appcfmfile#" output="#appcfm#" nameconflict="overwrite">	

<!----Change the Application cfc entry------->
<cfset appcfcfile="#projectloc#/Application.cfc">
<cffile action="read" file="#appcfcfile#" variable="appcfc">
<cfset appcfc=replace(appcfc,"modelglueapplicationtemplate",project,"All")>
<cffile action="write" file="#appcfcfile#" output="#appcfc#" nameconflict="overwrite"> 
		    
<cfheader name="Content-Type" value="text/xml">
<cfoutput>
<response showresponse="false">
<ide message="Model-Glue Application created.">
<dialog />
<commands>
	<cfif reloadmode is "project">
	<command type="refreshproject">
	<params>
	<cfoutput>
	<param key="projectname" value="#project#" />
	</cfoutput>
	</params>
	</command>
	<cfelse>
	<command type="refreshfolder">
	<params>
	<cfoutput>
	<param key="foldername" value="#projectloc#" />
	</cfoutput>
	</params>
	</command>
	</cfif>
</commands>
</ide>
</response></cfoutput>			