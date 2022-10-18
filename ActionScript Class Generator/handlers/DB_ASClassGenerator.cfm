<!---

ADOBE SYSTEMS INCORPORATED

 Copyright 2009 Adobe Systems Incorporated

 All Rights Reserved.

 

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 

terms of the Adobe license agreement accompanying it.  If you have received this file from a 

source other than Adobe, then your use, modification, or distribution of it requires the prior 

written permission of Adobe.

--->


<cfsetting enablecfoutputonly="true">
<cfprocessingdirective suppresswhitespace="true" >
<cfparam name="ideeventinfo" >

<cfset a=generateASClass(ideeventinfo) >

<cffunction name="generateASClass" access="private" >
	<cfargument name="inputXML" required="yes" >

    <cfset xmldoc = XMLParse(inputXML) >        
   	<cfset database = XMLSearch(xmldoc, "/event/ide/rdsview/database")>    
    <cfset dbname=database[1].XMLAttributes.name >    
    <cfset tableNode = XMLSearch(xmldoc, "/event/ide/rdsview/database/table")>    
    <cfif listlen(tableNode[1].XMLAttributes.name,'.') eq 2>
         <cfset table= listgetat(tableNode[1].XMLAttributes.name,2,'.') >
    <cfelse>
         <cfset table = tableNode[1].XMLAttributes.name > 
    </cfif>     
    <cfset userInputs = XMLSearch(xmldoc, "/event/user/input")>     
    <cfset location= #userInputs[1].XMLAttributes.value#>    
    <cfset fields = XMLSearch(xmldoc, "/event/ide/rdsview/database/table/fields/field") >
    

<cfset DBTypeMapping = CreateObject("component","Util") >   	
<cfset remoteCFC = XMLSearch(xmldoc, "/event/user/input[@name='remotecfcmapping']")>
<cfset package = XMLSearch(xmldoc, "/event/user/input[@name='packagename']")>
<cfset IsMetadata = XMLSearch(xmldoc, "/event/user/input[@name='includemetadata']")>
<cfset IDFieldName = DBTypeMapping.getPK(dbname,table)>



<!--- generate AS Class file --->
    <cfsavecontent variable="ormcfcContent" >
    	<cfoutput>
<cfif IsMetadata[1].XMLAttributes.value eq true>
package #trim(package[1].XMLAttributes.value)#
{   <cfif trim(remoteCFC[1].XMLAttributes.value) neq ""> 
	[RemoteClass(alias="#remoteCFC[1].XMLAttributes.value#")]</cfif>
	[Entity]
	public class #table#
	{   <cfloop index="i" from="1" to="#ArrayLen(fields)#" ><cfif listContainsnocase(IDFieldName,fields[i].XMLAttributes.name) neq 0>
        [Id]</cfif>
        public var #fields[i].XMLAttributes.name#:#trim(DBTypeMapping.getASDataType(fields[i].XMLAttributes.type))#;</cfloop>

        public function #table#()
	    {
		}   
	}
}
<cfelse>
package #trim(package[1].XMLAttributes.value)#
{
	public class #table#
	{   <cfloop index="i" from="1" to="#ArrayLen(fields)#" >
        public var #fields[i].XMLAttributes.name#:#trim(DBTypeMapping.getASDataType(fields[i].XMLAttributes.type))#;</cfloop>

        public function #table#()
	    {
		}   
	}
}
</cfif> 
        </cfoutput>
    </cfsavecontent>
    
    <!--- get save location--->    
    <cfset location = XMLSearch(xmldoc, "/event/user/input[@name='location']")>  
    <cfif ArrayLen(location) gt 0>
    <cfset location = location[1].XMLAttributes.value >
    	<cffile action="write" file="#location#/#table#.as" nameconflict="overwrite" output="#Trim(ormcfcContent)#" >
      
    </cfif>
    
</cffunction>
</cfprocessingdirective>