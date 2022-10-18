<cfinclude template="misc.cfm" />

<cfset logpath=getdebuglogpath()>
<cfset logfile="#logpath#recatoruncomment.txt ">
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
	<cffile action="read" file="#csxmlfile#" variable="csxml">
	<cfif Len(Trim(csxml)NEQ 0 ) >
		

		<cfset csxmlobj=xmlparse(csxml)>
		<cfset reactorconfigbeannum=searchforelement(csxmlobj.beans,"id","reactorConfiguration")>
		<cfif reactorconfigbeannum EQ 0>
			<cfset startpos= find("<alias alias=""ormAdapter"" name=""ormAdapter.Reactor"" />",csxml,1)>
			<cfset csxml= insert("-->",csxml,startpos-2)>
			<cfset endpos= find("</bean>",csxml,startpos)>
			<cfset endpos= endpos+Len("</bean>")>
			<cfset csxml= insert("<!--",csxml,endpos)>
			<cffile action="append" file="#logfile#" output="#csxml#" addnewline="true">
			<cfset csxmlobj=xmlparse(csxml)>
			<cfset reactorconfigbeannum=searchforelement(csxmlobj.beans,"id","reactorConfiguration")>
			<cfif reactorconfigbeannum NEQ 0>
				<cffile action="write" file="#csxmlfile#" output="#csxmlobj#">
			</cfif>
			
		</cfif>
	</cfif>	
</cffunction>