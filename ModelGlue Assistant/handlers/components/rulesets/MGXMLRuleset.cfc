<!----------------------
Description: ColdSpringXMLRuleset
Author: Dan Wilson (dan@nodans.com)
Date: 12/28/2010
CHANGE LOG:
------------------------>
<cfcomponent output="false">
	
	<cffunction name="init" access="public" returntype="MGXMLRuleset">
		<cfargument name="UserMessageContainer" type="any" required="true"/>
		<cfset variables.instance.UserMessageContainer = arguments.UserMessageContainer />
		<cfreturn this />
	</cffunction>
	
    <cffunction name="recommendNewFeatures" output="false" access="public" returntype="boolean" hint="I look at this coldspring with model glue configuration XML file and make recommendations">
		<cfargument name="FileName" type="string" required="true"/>
		<cfargument name="FileContents" type="string" required="true"/>
		<cfset var hasNewRecommendedFeatures = false />    	
		
		<cfif hasAnyEventTypesDefined( arguments.FileContents ) IS true>
			<cfset variables.instance.UserMessageContainer.addSuccess( "Your application has event types defined. Good Job!" ) />	
		<cfelse>
			<cfset variables.instance.UserMessageContainer.addInfo( "Your application does not define event-types. Event Types are an awesome way to define common functionality for your Model Glue Events" ) />	
			<cfset hasNewRecommendedFeatures = true />    	
		</cfif>
		
		<cfreturn hasNewRecommendedFeatures />    	
    </cffunction>
    
    <cffunction name="hasAnyEventTypesDefined" output="false" access="private" returntype="boolean" hint="I check to see if the viewstate is being referenced.">
		<cfargument name="FileContents" type="string" required="true"/>
		<cfreturn refindNoCase( '<event-type', arguments.FileContents ) GT 0 />		    	
    </cffunction>

</cfcomponent>