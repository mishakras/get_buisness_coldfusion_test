<cfcomponent output="false">
	<cfset variables.data = "">
	
	<cffunction name="init" access="public" returnType="any" output="false">
		<cfargument name="xml" type="string" required="true">
		<cfset variables.data = xmlParse(arguments.xml)>
		<cfif getCFBuilderVersion() gte 2>
			<cfset variables.cfurl = getCallbackURL()>
		</cfif>
		<cfreturn this>
	</cffunction>

	<cffunction name="getCallbackURL" access="public" returnType="any" output="false">
		<cfif getCFBuilderVersion() eq 1>
			<cfthrow message="This command only allowed under CFBuilder 2.0 and higher.">
		</cfif>
		<cfreturn variables.data.event.ide.callbackurl.xmlText>
	</cffunction>

	<cffunction name="getCFBuilderVersion" access="public" returnType="any" output="false">
		<cfif not structKeyExists(variables.data.event.ide.xmlAttributes, "version")>
			<cfreturn 1>
		<cfelse>
			<cfreturn variables.data.event.ide.xmlAttributes.version>
		</cfif>
	</cffunction>

	<!--- credit: Topper (topper@cftopper.com) ---> 
	<cffunction name="getCurrentURL" access="public" returnType="string" output="false">
		<cfset var theURL = getPageContext().getRequest().GetRequestUrl().toString()>
		<cfif len( CGI.query_string )>
			<cfset theURL = theURL & "?" & CGI.query_string>
		</cfif>
		<cfset theUrl = reReplaceNoCase(theUrl, "[&?]*cfid=[0-9]+", "")>
		<cfset theUrl = reReplaceNoCase(theUrl, "[&?]*cftoken=[^&]+", "")>
		<cfreturn  theURL>
	</cffunction>
	
	<cffunction name="getRootURL" access="public" returnType="string" output="false">
		<cfset var theURL = getCurrentURL()>
		<cfset theURL = listDeleteAt(theURL, listLen(theURL,"/"), "/") & "/">
		<cfreturn theURL>
	</cffunction>

	<cffunction name="getRunType" access="public" returnType="string" output="false">
		<cfif structKeyExists(variables.data.event.ide, "editor")>
			<cfreturn "editor">
		<cfelseif structKeyExists(variables.data.event.ide, "projectview")>
			<cfreturn "projectview">
		<cfelseif structKeyExists(variables.data.event.ide, "outlineview")>
			<cfreturn "outlineview">
		<cfelseif structKeyExists(variables.data.event.ide, "rdsview")>
			<cfreturn "rdsview">
		<cfelse>
			<cfreturn "unknown">
		</cfif>
	</cffunction>

	<cffunction name="getSelectedResource" access="public" returnTYpe="struct" output="false">
		<cfset var r = structNew()>
		<cfif getRunType() eq "projectview">
			<cfreturn variables.data.event.ide.projectview.resource.xmlAttributes>
		</cfif>
		<cfif getRunType() eq "editor">
			<cfset r.path = variables.data.event.ide.editor.file.xmlAttributes.location>
			<cfif directoryExists(r.path)>
				<cfset r.type = "folder">
			<cfelse>
				<cfset r.type = "file">
			</cfif>
			<cfreturn r>
		</cfif>
		<cfthrow message="Invalid run type">
	</cffunction>
	
</cfcomponent>


<!---
TODO: Remove all of this...
component {


	/*
	* Wrapper for callback associated commands - CFB2 only
	*/
	private function execute(string command) {
		if(getCFBuilderVersion() == 1) throw("This command only allowed under CFBuilder 2.0 and higher.");
		var http = new com.adobe.coldfusion.http();
		http.setURL(variables.cburl);
		http.setMethod("post");
		http.addParam(type="body", value="#arguments.command#");
		var result = http.send().getPrefix();
		return xmlParse(result.filecontent);
	}
}
--->