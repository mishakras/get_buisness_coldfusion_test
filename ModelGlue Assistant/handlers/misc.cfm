<cffunction name="searchfornode" returntype="numeric">
	<cfargument name="xmlobj" required="yes" type="XML">
	<cfargument name="nodename" required="true" type="string">
	
	<cfset var rslt = 0>
	<cfset var myarr ="#xmlobj.xmlchildren#">
	<cfset var i = "">
	
	<cfloop index="i" from="1" to="#arrayLen(myarr)#">
		<cfif xmlobj.xmlchildren[i].xmlname EQ  nodename>
			<cfset rslt=i>
			<cfbreak >
		</cfif>
	</cfloop>
	
	<cfreturn rslt>
</cffunction>
	
<cffunction name="numofchildren" returntype="numeric">
	<cfargument name="xmlobj" required="yes" type="XML">
   <cfreturn arrayLen(xmlObj.xmlChildren)>	
</cffunction>
	
<cffunction name="searchforelement" returntype="Numeric">
	<cfargument name="xmlobj" required="yes" type="XML">
	<cfargument name="attributename" required="true" type="String" >
	<cfargument name="attributevalue" required="true" type="String" >
	
	<cfset var rslt = 0>
   <cfset var i = "">
   	
	<cfloop index="i" from="1" to="#arrayLen(xmlObj.xmlChildren)#">
	<cftry>
		<cfif xmlobj.xmlchildren[i].xmlattributes[attributename] EQ  attributevalue>
			<cfreturn i>
		</cfif>
		<cfcatch>
		</cfcatch>
	</cftry>
	</cfloop>
	
	<cfreturn rslt>
</cffunction>	
	
<cffunction name="getdebuglogpath" returntype="string">
	<cfset var logpath=replace(expandpath("*.*"),"*.*","logs/")>
	<cfreturn logpath>
</cffunction>
	
<cfscript>
/**
* Formats an XML document for readability.
* update by Fabio Serra to CR code
*
* @param XmlDoc      XML document. (Required)
* @return Returns a string.
* @author Steve Bryant (steve@bryantwebconsulting.com)
* @version 2, March 20, 2006
*/
function xmlHumanReadable(XmlDoc) {
    var elem = "";
    var result = "";
    var tab = "    ";
    var att = "";
    var i = 0;
    var temp = "";
    var cr = createObject("java","java.lang.System").getProperty("line.separator");
    
    if ( isXmlDoc(XmlDoc) ) {
        elem = XmlDoc.XmlRoot;//If this is an XML Document, use the root element
    } else if ( IsXmlElem(XmlDoc) ) {
        elem = XmlDoc;//If this is an XML Document, use it as-as
    } else if ( NOT isXmlDoc(XmlDoc) ) {
        XmlDoc = XmlParse(XmlDoc);//Otherwise, try to parse it as an XML string
        elem = XmlDoc.XmlRoot;//Then use the root of the resulting document
    }
    //Now we are just working with an XML element
    result = "<#elem.XmlName#";//start with the element name
    if ( StructKeyExists(elem,"XmlAttributes") ) {//Add any attributes
        for ( att in elem.XmlAttributes ) {
            result = '#result# #att#="#XmlFormat(elem.XmlAttributes[att])#"';
        }
    }
    if ( Len(elem.XmlText) OR (StructKeyExists(elem,"XmlChildren") AND ArrayLen(elem.XmlChildren)) ) {
        result = "#result#>#cr#";//Add a carriage return for text/nested elements
        if ( Len(Trim(elem.XmlText)) ) {//Add any text in this element
            result = "#result##tab##XmlFormat(Trim(elem.XmlText))##cr#";
        }
        if ( StructKeyExists(elem,"XmlChildren") AND ArrayLen(elem.XmlChildren) ) {
            for ( i=1; i lte ArrayLen(elem.XmlChildren); i=i+1 ) {
                temp = Trim(XmlHumanReadable(elem.XmlChildren[i]));
                temp = "#tab##ReplaceNoCase(trim(temp), cr, "#cr##tab#", "ALL")#";//indent
                result = "#result##temp##cr#";
            }//Add each nested-element (indented) by using recursive call
        }
        result = "#result#</#elem.XmlName#>";//Close element
    } else {
        result = "#result# />";//self-close if the element doesn't contain anything
    }
    
    return result;
}
</cfscript>