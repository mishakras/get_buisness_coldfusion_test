<cfinclude template="misc.cfm" />

<cfparam name ="ideeventinfo">

<cfset xmldoc = XMLParse(ideeventinfo) >
<cfset userInputs = XMLSearch(xmldoc, "/event/user/input")>   
	
<cfset userentry = XMLSearch(xmldoc, "/event/user/input[@name='location']")>  
<cfif arrayLen(userentry) GT 0> 
   <cfset location=userentry[1].XMLAttributes.value>
<cfelse>
   <cfset location="">
</cfif>

<cfset userentry1 = XMLSearch(xmldoc, "/event/user/input[@name='uname']")>  
<cfif arrayLen(userentry1) GT 0> 
	<cfset uname=userentry1[1].XMLAttributes.value>
<cfelse>
	<cfset uname="">
</cfif>

<cfset userentry2=XMLSearch(xmldoc, "/event/user/input[@name='pwd']")>  
<cfif arrayLen(userentry2) GT 0> 
	<cfset pwd=userentry2[1].XMLAttributes.value>
<cfelse>
	<cfset pwd="">
</cfif>

<cfset userentry3 = XMLSearch(xmldoc, "/event/user/input[@name='dbtype']")>  
<cfif arrayLen(userentry3) GT 0> 
	<cfset dbtype=userentry3[1].XMLAttributes.value>
<cfelse >
	<cfset dbtype="">
</cfif>
		
<cfset loc="#location#/config/reactor/Reactor.xml">
	
<!---Checking for the reactor xml exists---->	
<cfif not fileexists(loc)>
   <cfheader statuscode="432" statustext="Reactorxml file does not exist">
   <cfabort />
</cfif>

<cffile action="read" file="#loc#" variable="reactor">

<cfset reactorxml= XMLParse(reactor)>

<cfset database = XMLSearch(xmldoc, "/event/ide/rdsview/database")>    
<cfset dsn=database[1].XMLAttributes.name>
<cfset table=database[1].table.xmlattributes["name"]>
		
<cfset project=location>
<cfset pos=1>
<cfloop condition="Len(GetToken(location, pos ,'/')) GT 0  AND pos LT Len(location)"> 
	<cfset project=GetToken(location, pos ,'/')>
	<cfset pos=pos+1>
</cfloop>	
	
<cfset srch=searchfornode(reactorxml.reactor,"config")>
<cfif srch EQ 0>
	<cfset num=numofchildren(reactorxml.reactor)+1>
	<cfset reactorxml.reactor.XmlChildren[num]=Xmlelemnew(reactorxml,"config")>
</cfif>
	
<cfif searchfornode(reactorxml.reactor.config,"project") EQ 0>
	<cfset num=numofchildren(reactorxml.reactor.config) + 1>
 	<cfset reactorxml.reactor.config.XmlChildren[num]=Xmlelemnew(reactorxml,"project")>
</cfif>
<cfset reactorxml.reactor.config.project.xmlattributes["value"] = project>
	
<cfif searchfornode(reactorxml.reactor.config,"dsn") EQ 0>
	<cfset num=numofchildren(reactorxml.reactor.config) +1>		 
	<cfset reactorxml.reactor.config.XmlChildren[num]=Xmlelemnew(reactorxml,"dsn")>
</cfif>
<cfset reactorxml.reactor.config.dsn.xmlattributes["value"]=dsn>
	
<cfif searchfornode(reactorxml.reactor.config,"type") EQ 0>
	<cfset num=numofchildren(reactorxml.reactor.config) + 1>
	<cfset reactorxml.reactor.config.XmlChildren[num]=Xmlelemnew(reactorxml,"type")>
</cfif>
<cfset reactorxml.reactor.config.type.xmlattributes["value"]=dbtype>
	
<cfif searchfornode(reactorxml.reactor.config,"username") EQ 0>
	<cfset num=numofchildren(reactorxml.reactor.config) +1>
 	<cfset reactorxml.reactor.config.XmlChildren[num]=Xmlelemnew(reactorxml,"username")>	
</cfif>
<cfset reactorxml.reactor.config.username.xmlattributes["value"]=uname>
	
<cfif searchfornode(reactorxml.reactor.config,"password") EQ 0>
	<cfset num=numofchildren(reactorxml.reactor.config) + 1>
	<cfset reactorxml.reactor.config.XmlChildren[num]=Xmlelemnew(reactorxml,"password")>
</cfif>	
<cfset reactorxml.reactor.config.password.xmlattributes["value"]=pwd> 
	
<cfif searchfornode(reactorxml.reactor,"objects") EQ 0>
	<cfset num=numofchildren(reactorxml.reactor) + 1>
	<cfset reactorxml.reactor.XmlChildren[num]=Xmlelemnew(reactorxml,"objects")>
</cfif>	
	
<cfset objectnodenum=searchforelement(reactorxml.reactor.objects,"name",table)>
<cfif objectnodenum EQ 0>
	<cfset objectnodenum=numofchildren(reactorxml.reactor.objects)+1>
	<cfset reactorxml.reactor.objects.xmlchildren[objectnodenum]=xmlElemNew(reactorxml,"object")>
	<cfset reactorxml.reactor.objects.xmlchildren[objectnodenum].xmlattributes["name"]=table>
<cfelse >
	<cfheader statuscode="432" statustext="This objects entry is already present in the Reactor xml">
	<cfabort />
</cfif> 
 	
<cfif srch EQ 0>
	<!--- A new config node is added  and should be formatted--->
	<cfset formmattednodestring=xmlHumanReadable(reactorxml.reactor.config)>
	<cfset formattedstring=replaceNoCase(formmattednodestring,"<?xml version=""1.0"" encoding=""UTF-8""?>","")>
	<cfset updatedreactorxml=insert(formattedstring,reactor,find("<reactor>",reactor,0)+Len("<reactor>"))>

	<cfif objectnodenum GT 1>
		<!---Object node was already present--->
		<cfset formmattednodestring=ToString(reactorxml.reactor.objects.xmlchildren[objectnodenum])>
		<cfset formattedstring=chr(10) & replaceNoCase(formmattednodestring,"<?xml version=""1.0"" encoding=""UTF-8""?>","") & chr(10)>
		<cfset updatedreactorxml=insert(formattedstring,updatedreactorxml,find("</objects>",updatedreactorxml,0)-1)>
	<cfelse>
		<!---Object node was not present--->
		<cfset objectspos=find("<objects />",updatedreactorxml)>
		<cfset formmattednodestring=ToString(reactorxml.reactor.objects.xmlchildren[objectnodenum])>
		<cfset formattedstring=chr(10) & replaceNoCase(formmattednodestring,"<?xml version=""1.0"" encoding=""UTF-8""?>","") & chr(10)>
		<cfif objectspos NEQ 0>
			<cfset formattedstring=chr(10) & "<objects>" & formattedstring & "</objects>" & chr(10)>
			<cfset updatedreactorxml=replaceNoCase(updatedreactorxml,"<objects />",formattedstring)>
		<cfelseif find("</objects>",updatedreactorxml)>
			<cfset updatedreactorxml=insert(formattedstring,updatedreactorxml,find("</objects>",updatedreactorxml)-1)>
		</cfif>
	</cfif>
<cfelse>
	<cfset reactorstring=tostring(reactorxml)>
	<cfset formattedstring=replace(reactorstring,"<?xml version=""1.0"" encoding=""UTF-8""?>","")>
	<cfset updatedreactorxml=insert(chr(10),formattedstring,find("</objects>",formattedstring)-1)>
</cfif>
	
	
<!---Editing the reactor entry in coldfspring.xml --->

<cfset csxmlfile =location & "/config/ColdSpring.xml">
<!---Checking if coldspring xml file exists --->
<cfif not fileExists(csxmlfile)>
	<cfheader statuscode="432" statustext="Coldspring xml file not found">
	<cfabort />
</cfif>

<cffile action="read" file="#csxmlfile#" variable="csxml">

<cfif Len(Trim(csxml)NEQ 0) >
	<cfset csxmlobj=xmlparse(csxml)>
	<cfset reactorconfigbeannum=searchforelement(csxmlobj.beans,"id","reactorConfiguration")>
	<!---Checking if reactor is configured in coldspring xml--->
	<cfif reactorconfigbeannum EQ 0>
		<cfheader statuscode="432" statustext="Ractor is not configured properly in your colspring.xml">
		<cfabort />
	</cfif>

	<cfset reactorconfigbean=csxmlobj.beans.xmlchildren[reactorconfigbeannum]>
	
	<cfset dsnnodenum=searchforelement(reactorconfigbean,"name","dsn")>
	<cfset dsnnode=reactorconfigbean.xmlchildren[dsnnodenum]>
	<cfset dsnnode.value.xmltext=dsn>
	
	<cfset typenodenum=searchforelement(reactorconfigbean,"name","type")>
	<cfset typenode=reactorconfigbean.xmlchildren[typenodenum]>
	<cfset typenode.value.xmltext=dbtype>
			
</cfif>	

<!---- Adding Scaffold entry to modelglue.xml ---->
	
<!---Checking if coldspring xml file exists --->
<cfset modxmlfile="#location#/config/ModelGlue.xml" >
<cfif fileExists(modxmlfile) EQ "No">
	<cfheader statuscode="432" statustext="ModelGlue  xml file not found">
	<cfabort />
</cfif>

<cffile action="read" file="#location#/config/ModelGlue.xml" variable="modelxml">

<cfset modelxmlobj=xmlparse(modelxml) >
<cfset eventhndlrs=modelxmlobj.modelglue.xmlchildren[searchfornode(modelxmlobj.modelglue,"event-handlers")]>
<cfset scaffoldnodenum= searchfornode(eventhndlrs,"scaffold")>
<cfif scaffoldnodenum EQ 0>
	<cfset scaffoldnodenum=numofchildren(eventhndlrs)+1>
	<cfset eventhndlrs.xmlchildren[scaffoldnodenum]=xmlelemNew(modelxmlobj,"scaffold")>
	<cfset eventhndlrs.xmlchildren[scaffoldnodenum].xmlattributes["object"]=table>
<cfelseif searchforelement(eventhndlrs,"object",table) EQ 0 >
	<cfset scaffoldnodenum=numofchildren(eventhndlrs)+1>
	<cfset eventhndlrs.xmlchildren[scaffoldnodenum]=xmlelemNew(modelxmlobj,"scaffold")>
	<cfset eventhndlrs.xmlchildren[scaffoldnodenum].xmlattributes["object"]=table>
</cfif>

<cffile action="write"  file="#loc#" output="#updatedreactorxml#">
<cffile action="write" file="#csxmlfile#" output="#csxmlobj#">
<cffile action="write" file="#location#/config/ModelGlue.xml" output="#modelxmlobj#">
