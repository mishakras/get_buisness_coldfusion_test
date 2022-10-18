<!----------------------
Description: FileFilter
Author: Dan Wilson (dan@nodans.com)
Date: 12/29/2010
CHANGE LOG:
------------------------>
<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="FileFilter">
		<cfreturn this />
	</cffunction>
	
	<!--- 	Date: 12/23/2010  Usage: I strip out files we do not care about --->
	<cffunction name="stripFilesOutWeDoNotCareAbout" output="false" access="public" returntype="query" hint="I strip out files we do not care about">
		<cfargument name="SourceDirectoryQuery" type="query" required="true"/>
		<cfset var CleanedDirectoryQuery = "" />
		
		<cfquery name="CleanedDirectoryQuery" dbtype="query">
			SELECT * 
			FROM arguments.sourceDirectoryQuery
			WHERE lower(NAME) LIKE '%.cfm'
				OR lower(NAME) LIKE '%.cfc'
				OR lower(NAME) LIKE '%.xml'
		</cfquery>
		
		<cfreturn CleanedDirectoryQuery />
	</cffunction>
	
	<cffunction name="figureOutTheKindOfFileThisIs" output="false" access="public" returntype="string" hint="I figure out what sort of file this is">
		<cfargument name="FileName" type="string" default="" />
		<cfargument name="FileText" type="string" default="" />
		<cfset var FileType = "" />
		<cfif listLast(arguments.FileName, ".") IS "xml" OR arguments.FileName CONTAINS "xml.cfm" >	
			
			<cfif refindNoCase( "<modelglue>", arguments.FileText ) GT 0>
				<cfset FileType = "MGXML" />
			<cfelseif refindNoCase( "<beans>", arguments.FileText ) GT 0 AND refindNoCase( 'bean[\s]+id=[\"'']modelglue.modelglueConfiguration[\"'']', arguments.FileText ) GT 0>
				<cfset FileType = "ColdSpringXMLWithMGConfigurationBean" />
			</cfif>
			
		<cfelseif listLast(arguments.FileName, ".") IS "cfm">
		
			<cfset FileType = "CFM" />
		
		<cfelseif listLast(arguments.FileName, ".") IS "cfc" AND refindNoCase( 'extends=[\"'']ModelGlue.*[^controller]controller[\"'']', arguments.FileText ) GT 0>
		
			<cfset FileType = "MGController" />
		
		</cfif>
		
		<cfreturn FileType />	
	</cffunction>
	
</cfcomponent>
