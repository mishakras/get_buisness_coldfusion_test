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

<cfset xmldoc = XMLParse(ideeventinfo) > 
<cfset srchpath = XMLSearch(xmldoc, "/event/ide/projectview/resource")>
<cfset CFCAbsPath = srchpath[1].XMLAttributes.path >
<cfset utilObj = CreateObject("component","Util") >
<cfset CFCDotPath = utilObj.getDotNotationCFCPath(CFCAbsPath)>

<cfif CFCDotPath contains 'Error'>
    <cfthrow message="#CFCDotPath#">
    <cfabort>
</cfif>

<cfset compMeta = GetComponentMetaData(CFCDotPath)>
<!--- Commenting this Restriction as to Make it work with NON-ORM CFCs too
<cfif not StructKeyexists(compMeta,'PERSISTENT') OR compMeta.PERSISTENT eq false>
   <cfthrow message="Error:Specified CFC is not ORM CFC, make sure that persistent=true is set for the CFC">
   <cfabort> 
</cfif>
--->  
<cfset remoteCFC = compMeta.fullname>
<cfset package = XMLSearch(xmldoc, "/event/user/input[@name='packagename']")>
<cfset IsMetadata = XMLSearch(xmldoc, "/event/user/input[@name='includemetadata']")>
<cfset location = XMLSearch(xmldoc, "/event/user/input[@name='location']")>
<cfset IsCFAIRMetadata = XMLSearch(xmldoc, "/event/user/input[@name='includecfairmetadata']")>


<cfif isdefined('compMeta.Properties') and ArrayLen(compMeta.Properties) gt 0>
     <cfset fields = compMeta.Properties >
<cfelse>
     <cfthrow message="CFC doesnt have any Properties in it, Can not convert it to an AS Class file">
</cfif>
<cfset table = listlast(compMeta.Name,'.')>
<cfset DS = XMLSearch(xmldoc, "/event/user/input[@name='cfdatasource']")>

<cfset PropRows = utilObj.getPropertyRecordSet(DS[1].XMLAttributes.value,table,fields)>

<!---<cfdump var="#remoteCFC#" output="C:\ormcfc.txt">
<cfdump var="#table#" output="C:\ormcfc.txt"><cfabort>--->

<!--- generate AS Class file --->
    <cfsavecontent variable="ormcfcContent" >
    	<cfoutput>
<cfif IsMetadata[1].XMLAttributes.value eq true>
package #package[1].XMLAttributes.value#
{
	[RemoteClass(alias="#remoteCFC#")]<cfif IsCFAIRMetadata[1].XMLAttributes.value eq true>
	[Entity]</cfif>
    public class #table#
	{  <cfloop query="PropRows"><cfif propRows.ISPK eq 'yes' and IsCFAIRMetadata[1].XMLAttributes.value eq true>
          [Id]</cfif>
          public var #PropRows.PropName#:#PropRows.PropType#;</cfloop>

          public function #table#()
	      {
		  }    
	}
}
<cfelse>
package #package[1].XMLAttributes.value#
{   <cfif IsCFAIRMetadata[1].XMLAttributes.value eq true>
	[Entity]</cfif>
	public class #table#
	{   <cfloop query="PropRows"><cfif propRows.ISPK eq 'yes' and IsCFAIRMetadata[1].XMLAttributes.value eq true>
        [Id]</cfif>
        public var #PropRows.PropName#:#PropRows.PropType#;</cfloop>
         
        public function #table#()
		{
		}
	}
}
</cfif> 
        </cfoutput>
    </cfsavecontent>
    
    <!--- get save location--->    
      
    <cfif ArrayLen(location) gt 0>
        <cfset location = location[1].XMLAttributes.value >
    	<cffile action="write" file="#location#/#table#.as" nameconflict="overwrite" output="#Trim(ormcfcContent)#" >
      
    </cfif>
 </cfprocessingdirective>