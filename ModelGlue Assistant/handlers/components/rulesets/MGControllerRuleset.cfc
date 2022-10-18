<!----------------------
Description: MGControllerRuleset
Author: Dan Wilson (dan@nodans.com)
Date: 12/28/2010
CHANGE LOG:
------------------------>
<cfcomponent output="false">
	<cfset variables.instance.lengthOfControllerMethodsToWarnOn = 25 />
	<cffunction name="init" access="public" returntype="MGControllerRuleset">
		<cfargument name="UserMessageContainer" type="any" required="true"/>
		<cfset variables.instance.UserMessageContainer = arguments.UserMessageContainer />
		<cfreturn this />
	</cffunction>
	
    <cffunction name="recommendNewFeatures" output="false" access="public" returntype="boolean" hint="I look at this controller file and make recommendations">
		<cfargument name="FileName" type="string" required="true"/>
		<cfargument name="FileContents" type="string" required="true"/>
		<cfset var hasNewRecommendedFeatures = false />    	
		<cfif usesBeansAttribute( arguments.FileContents ) IS TRUE>
			<cfset variables.instance.UserMessageContainer.addSuccess( "The Controller [#arguments.FileName#] uses the beans attribute to document ColdSpring objects used. Good Job! ") />
		<cfelse>
			<cfset variables.instance.UserMessageContainer.addInfo( "The Controller [#arguments.FileName#] does not use the beans attribute to document ColdSpring objects used. Use of the beans attribute provides better documentation of which ColdSpring managed objects are used by this controller." ) />	
			<cfset hasNewRecommendedFeatures = true />    	
		</cfif>

		<cfreturn hasNewRecommendedFeatures />    	
    </cffunction>
    
<!---    
	This is going to be a little tougher than I thought. 
	
	There are a lot of ways to write a function. 
	I think one of the better idea I have about this is to use getComponentMetadata( ) to get the number of functions in the CFC and do a linecount and just do a rough average.
	
	
	
	<cffunction name="recommendBetterPractices" output="false" access="public" returntype="boolean" hint="I look at this controller file and make recommendations on best practices">
		<cfargument name="FileName" type="string" required="true"/>
		<cfargument name="FileContents" type="string" required="true"/>
		<cfset var hasRecommendedBetterPractices = false />
		<cfif controllerMethodsAreTooLong( arguments.FileContents ) IS true>
			<cfset variables.instance.UserMessageContainer.addInfo( "The Controller [#arguments.FileName#] has methods that are longer than #variables.instance.lengthOfControllerMethodsToWarnOn# lines. While this may be ok, it also may be a sign your controllers have logic that belongs in your Model layer.") />
			<cfset hasRecommendedBetterPractices = true />
		</cfif>
		<cfreturn hasRecommendedBetterPractices />     	
    </cffunction>--->
    
    <cffunction name="usesBeansAttribute" output="false" access="private" returntype="boolean" hint="I check to see if the beans attribute is used by this controller">
		<cfargument name="FileContents" type="string" required="true"/>
		<cfreturn refindNoCase( 'component(.*?)beans=[\"''](.*?)[\/;]', arguments.FileContents ) GT 0 />		    	
    </cffunction>
    
</cfcomponent>
