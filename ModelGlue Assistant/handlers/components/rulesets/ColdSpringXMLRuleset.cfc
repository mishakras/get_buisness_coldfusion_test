<!----------------------
Description: ColdSpringXMLRuleset
Author: Dan Wilson (dan@nodans.com)
Date: 12/28/2010
CHANGE LOG:
------------------------>
<cfcomponent output="false">
	
	<cffunction name="init" access="public" returntype="ColdSpringXMLRuleset">
		<cfargument name="UserMessageContainer" type="any" required="true"/>
		<cfset variables.instance.UserMessageContainer = arguments.UserMessageContainer />
		<cfreturn this />
	</cffunction>
	
    <cffunction name="recommendNewFeatures" output="false" access="public" returntype="boolean" hint="I look at this coldspring with model glue configuration XML file and make recommendations">
		<cfargument name="FileName" type="string" required="true"/>
		<cfargument name="FileContents" type="string" required="true"/>
		<cfset var hasNewRecommendedFeatures = false />    	
		
		<cfif hasHelperMapping( arguments.FileContents ) IS TRUE>
			<cfset variables.instance.UserMessageContainer.addSuccess( "Your application has Model Glue helpers defined. Good Job! ") />
		<cfelse>
			<cfset variables.instance.UserMessageContainer.addInfo( "Your application does not have Model Glue helpers defined." ) />	
			<cfset hasNewRecommendedFeatures = true />    	
		</cfif>
		
		<cfif hasReloadBeanFactory( arguments.FileContents ) IS TRUE>
			<cfset variables.instance.UserMessageContainer.addSuccess( "Your application uses the reloadBeanFactory property to speed up reloads. Good Job! ") />
		<cfelse>
			<cfset variables.instance.UserMessageContainer.addInfo( "Your application does not yet use the reloadBeanFactory property to speed up reloads." ) />	
			<cfset hasNewRecommendedFeatures = true />    	
		</cfif>

		<cfreturn hasNewRecommendedFeatures />    	
    </cffunction>
    
    <cffunction name="hasHelperMapping" output="false" access="private" returntype="boolean" hint="I check to see if helper mappings are defined">
		<cfargument name="FileContents" type="string" required="true"/>
		<cfreturn refindNoCase( 'property name=\"helperMappings\"', arguments.FileContents ) GT 0 />		    	
    </cffunction>
    
    <cffunction name="hasReloadBeanFactory" output="false" access="private" returntype="boolean" hint="I check to see if the reloadBeanFactory property is defined">
		<cfargument name="FileContents" type="string" required="true"/>
		<cfreturn refindNoCase( 'property name=\"reloadBeanFactory\"', arguments.FileContents ) GT 0 />		    	
    </cffunction>
    
</cfcomponent>
