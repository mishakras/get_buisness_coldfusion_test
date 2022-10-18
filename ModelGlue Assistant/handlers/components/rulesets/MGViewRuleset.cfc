<!----------------------
Description: ColdSpringXMLRuleset
Author: Dan Wilson (dan@nodans.com)
Date: 12/28/2010
CHANGE LOG:
------------------------>
<cfcomponent output="false">
	
	<cffunction name="init" access="public" returntype="MGViewRuleset">
		<cfargument name="UserMessageContainer" type="any" required="true"/>
		<cfset variables.instance.UserMessageContainer = arguments.UserMessageContainer />
		<cfreturn this />
	</cffunction>
	
    <cffunction name="recommendNewFeatures" output="false" access="public" returntype="boolean" hint="I look at this model glue view file and make recommendations">
		<cfargument name="FileName" type="string" required="true"/>
		<cfargument name="FileContents" type="string" required="true"/>
		<cfset var hasNewRecommendedFeatures = false />    	
		
		<cfif hasViewStateReference( arguments.FileContents ) IS true>
			<cfset variables.instance.UserMessageContainer.addInfo( "Your application references the viewstate. The viewstate was deprecated in favor of the Event object. Use Event.getValue() or Event.copyToScope( variables, 'list,of,event,values,you,want,accessible,in,your,page')." ) />	
			<cfset hasNewRecommendedFeatures = true />    	
		</cfif>
		
		<cfreturn hasNewRecommendedFeatures />    	
    </cffunction>
    
    <cffunction name="hasViewStateReference" output="false" access="private" returntype="boolean" hint="I check to see if the viewstate is being referenced.">
		<cfargument name="FileContents" type="string" required="true"/>
		<cfreturn refindNoCase( 'viewstate\."', arguments.FileContents ) GT 0 />		    	
    </cffunction>

</cfcomponent>
