<cfcomponent>
	<cffunction name="init" output="false" access="public">
		<cfargument name="currentVersion" type="string" required="true">	
		<cfargument name="buildURL" type="string" required="true">
		<cfargument name="appURL" type="string" required="true">
		
		<cfscript>
			variables.currentVersion = arguments.currentVersion;
			variables.buildURL = arguments.buildURL;
			variables.appURL = arguments.appURL;
		</cfscript>
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getLatestVersion" output="false" access="public" returntype="string">
		<cfscript>
			var stDetails = getLatestDetails();
		</cfscript>	
		
		<cfreturn stDetails['version'] />
    </cffunction>	
    
    <cffunction name="getLatestDetails" output="false" access="public" returntype="Struct">
    	<cfset var stResult = StructNew() />
    	<cfset var trans = "" />
    	
    	<cfif !val(application.proxyPort)>
    		<cfhttp 
    			url="#application.buildURL#" 
				method="get" 
				result="remoteFile" 
				/>
    	<cfelse>
    		<cfhttp 
    			url="#application.buildURL#" 
				method="get" 
				result="remoteFile" 
				proxyport="#application.proxyport#"
				proxyserver="#application.proxyserver#"
				proxyuser="#application.proxyusername#"
				proxypassword="#application.proxyPassword#"	
				/>
    	</cfif>
    	
    	<cfscript>
    		trans = remoteFile.filecontent;
			stResult.version = listgetat(trans,1,'|');
			stResult.details = listgetat(trans,2,'|');
    	</cfscript>	
    	
    	<cfreturn stResult />
    </cffunction>	
    
    <cffunction name="isOnline" output="false" access="public" returntype="boolean">
    	
    	<cfif !val(application.proxyPort)>
    		<cfhttp 
    			url="#application.buildURL#" 
				method="get" 
				result="remoteFile" 
				/>
    	<cfelse>
    		<cfhttp 
    			url="#application.buildURL#" 
				method="get" 
				result="remoteFile" 
				proxyport="#application.proxyport#"
				proxyserver="#application.proxyserver#"
				proxyuser="#application.proxyusername#"
				proxypassword="#application.proxyPassword#"	
				/>
    	</cfif>
    	
    	<cfreturn findnocase("200", remoteFile.statusCode) />
    </cffunction>	
    
    <cffunction name="shouldUpdate" output="false" access="public" returntype="boolean">
		<cfset var ok = false />	
		<cfset var latestVersion = '' />
		<cfif (not isNumeric(variables.currentVersion))>
			<cfset ok = false />
		</cfif>		
		
		<cfset latestVersion = getLatestVersion() />
		
		<cfif latestVersion gt variables.currentVersion>
			<cfset ok = true />
		</cfif>
		
		<cfreturn ok />		
    </cffunction>			
    
	<cffunction name="getLatestZip" output="false" access="public" returntype="void">
		<cfargument name="filePath" type="string" required="true" />
		
		<cfif !val(application.proxyPort)>
    		<cfhttp 
    			url="#variables.appURL#?#createUUID()#"
    			getasbinary="yes"
				path="#arguments.filepath#"
				file="modelglueExtension.zip"	
				/>
    	<cfelse>
    		<cfhttp 
    			url="#variables.appURL#?#createUUID()#"
    			getasbinary="true"
				path="#arguments.filepath#"
				file="modelglueExtension.zip"	
				proxyport="#application.proxyport#"
				proxyserver="#application.proxyserver#"
				proxyuser="#application.proxyusername#"
				proxypassword="#application.proxyPassword#"	
				/>
    	</cfif>
    	
    	<cfreturn />
		
	</cffunction>	
	
</cfcomponent>
