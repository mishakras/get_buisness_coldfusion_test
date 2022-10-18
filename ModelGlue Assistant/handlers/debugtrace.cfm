<cfinclude template="misc.cfm" />

<cfset logpath=getdebuglogpath()>
<cfset logfile="#logpath#debugtrace1.txt ">
<cffile action="write"  file="#logfile#" output="#NOW()#" >

<cfset slash =getslash()>

<cfparam name ="ideeventinfo">
<cfset a=ToggleDebugTrace(ideeventinfo) >

<cffunction name="ToggleDebugTrace" access="private" >
<cfargument name="inputinfo">

	<cfset xmldoc = XMLParse(ideeventinfo) >
	<cfset mxmlobj=xmlsearch(xmldoc,"/event/ide/projectview")>
	<cfset projectpath=#mxmlobj[1].xmlattributes.projectlocation# >
	
	<cfset csxmlfile =projectpath & "#slash#config#slash#ColdSpring.xml">
	<cfif fileExists(csxmlfile) EQ "No">
	<cffile action="append" file="#logfile#" output="Coldspring xml is not present at #csxmlfile#" addnewline="true">
	<cfheader statuscode="432" statustext="Coldspring xml is not present" >
	<cfabort />
	</cfif>
	<cffile action="read" file="#csxmlfile#" variable="csxml">
	<cfif Len(Trim(csxml)NEQ 0) >
		<cfset csxmlobj=xmlparse(csxml)>
		<cfset modelconfigbeannum=searchforelement(csxmlobj.beans,"id","modelGlueConfiguration")>
		<cfset modelconfigbean=csxmlobj.beans.xmlchildren[modelconfigbeannum]>
		<cfset debugnodenum=searchforelement(modelconfigbean,"name","debug")>
		<cfset debugnode=modelconfigbean.xmlchildren[debugnodenum]>
		<cfset debugval=debugnode.value.xmltext>	
		<cffile action="append" file="#logfile#" output="#debugnode#" addnewline="true">
		<cfif comparenocase(debugval,"true") EQ  0>
			<cfset debugnode.value.xmltext="false">
		<cfelse >
			<cfset debugnode.value.xmltext="true">
		</cfif>
		<cffile action="append" file="#logfile#" output="#debugnode#" addnewline="true">
		<cffile action="write" file="#csxmlfile#" output="#csxmlobj#">
	<cfelse>
		<cfheader statuscode="432" statustext="Coldspring xml is invalid" >
	</cfif>	
</cffunction>