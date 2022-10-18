<cfsetting showdebugoutput="false" />
<cfset helper = createObject("component","components.builderHelper").init(ideEventInfo)>

<cfif helper.getRunType() neq "projectview">
	<cfabort>
</cfif>
<cfset folder = helper.getSelectedResource().path>

<!--- 
So, based on the folder we will attempt to load your configuration files. For now, this is based on the assumption of
/config/ModelGlue.xml and/config/ColdSpring.xml - also support the .cfm versions
--->

<cfif directoryExists(folder & "/config")>
	<cfset configDir = folder & "/config/">
<cfelse>
	<cfoutput>
	Sorry, but we are unable to find the configuration folder: #folder#/config.
	</cfoutput>
	<cfabort>
</cfif>

<cfif fileExists(configDir & "ModelGlue.xml")>
	<cfset mgXML = configDir & "ModelGlue.xml">
<cfelseif fileExists(configDir & "ModelGlue.xml.cfm")>
	<cfset mgXML = configDir & "ModelGlue.xml.cfm">
<cfelse>
	<cfoutput>
	Sorry, but we are unable to find the ModelGlue configuration: #configDir#ModelGlue.xml.
	</cfoutput>
	<cfabort>
</cfif>

<cfif fileExists(configDir & "ColdSpring.xml")>
	<cfset csXML = configDir & "ColdSpring.xml">
<cfelseif fileExists(configDir & "ColdSpring.xml.cfm")>
	<cfset csXML = configDir & "ColdSpring.xml.cfm">
<cfelse>
	<cfoutput>
	Sorry, but we are unable to find the ModelGlue configuration: #configDir#ColdSpring.xml.
	</cfoutput>
	<cfabort>
</cfif>

<!--- begin to read in and parse our data --->
<cfset csFile = fileRead(csXML)>
<cfset configData = xmlParse(csFile)>
<cfset mgConfigRaw = xmlSearch(configData,"//beans/bean[@id='modelglue.modelGlueConfiguration']")>

<cfif arrayLen(mgConfigRaw) is 0>
	<cfoutput>
	Sorry, but this does not appear to be a Model-Glue 3.0 or higher application.
	</cfoutput>
	<cfabort>
</cfif>

<cfset mgConfigRaw = mgConfigRaw[1]>
<!--- preset some keys I assume --->
<cfset mgConfig = {reload="", debug="", eventValue="", defaultEvent="", missingEvent="", defaultExceptionHandler="", reloadPassword="", reloadKey="", applicationMapping="", viewMappings="", helperMappings="", generationEnabled=""}>

<cfloop index="x" from="1" to="#arrayLen(mgConfigRaw.property)#">
	<cfset config = mgConfigRaw.property[x]>
	<cfset mgConfig[config.xmlAttributes.name] = config.value.xmlText>
</cfloop>

<cfset mgFile = fileRead(mgXML)>
<cfset mgData = xmlParse(mgFile)>
<!--- before we try to config we need to look for includes as well --->
<cfset includeArray = xmlSearch(mgData, "/modelglue/include")>
<cfset includes = [mgXml]>
<cfif arrayLen(includeArray)>
	<cfloop index="inc" array="#includeArray#">
		<!---
		 We need to convert a path to a real path. This may be near impossible since we don't execute in process and have access to the mappings.
		 But we can make reasonable guesses. For example, */config/* should imply that config is in the same folder as our core MG file. 
		 --->
		 <cfif refindnocase(".*?/config/", inc.xmlAttributes.template)>
		 	<cfset pathWOConfig = rereplace(inc.xmlAttributes.template, ".*?/config/",  "")>
		 	<cfif fileExists(configdir & pathWOConfig)>
 				<cfset arrayAppend(includes, configdir & pathWOConfig)>
			</cfif>
		</cfif>
	</cfloop>
</cfif>

<!--- Going to add mg xml file to include array to allow me to simply loop over each item in the array --->
<!--- Note that we may not be able to 'find' the xml file --->
<!--- screw it - first draft, doing main file only --->
<cfset eventList = []>
<cfset controllerList = []>
<cfset eventTypeList = []>
<cfloop index="theFile" array="#includes#">
	
	<cfset xmlData = xmlParse(theFile)>
	<cfset events = xmlSearch(xmlData, "/modelglue/event-handlers/event-handler")>
	<cfloop index="x" from="1" to="#arrayLen(events)#">
		<cfset eventRaw = events[x]>
		<cfset event = {}>
		<cfset event.name = eventRaw.xmlAttributes.name>
		<cfset event.broadcasts = []>
		<cfset event.results = []>
		<cfset event.views = []>
		<cfset event.type = "">
		
		<cfif structKeyExists(eventRaw.xmlAttributes, "type")>
			<cfset event.type = eventRaw.xmlAttributes.type>
		</cfif>
		
		<cfif structKeyExists(eventRaw, "broadcasts") and structKeyExists(eventRaw.broadcasts,"message")>
			<cfloop index="y" from="1" to="#arrayLen(eventRaw.broadcasts.message)#">
				<cfset messageRaw = eventRaw.broadcasts.message[y]>
				<cfset msg = {}>
				<cfset msg.name = messageRaw.xmlAttributes.name>
				<cfset arrayAppend(event.broadcasts, msg)>
			</cfloop>
		</cfif>
	
		<cfif structKeyExists(eventRaw, "results") and structKeyExists(eventRaw.results,"result")>
			<cfloop index="y" from="1" to="#arrayLen(eventRaw.results.result)#">
				<cfset resultRaw = eventRaw.results.result[y]>
				<cfset result = {}>
				<cfif structkeyExists(resultRaw.xmlAttributes, "name")>
					<cfset result.name = resultRaw.xmlAttributes.name>
				</cfif>
				<cfset result.do = resultRaw.xmlAttributes.do>
				<cfif structkeyExists(resultRaw.xmlAttributes, "redirect")>
					<cfset result.redirect = resultRaw.xmlAttributes.redirect>
				</cfif>
				<cfset arrayAppend(event.results, result)>
			</cfloop>
		</cfif>
	
		<cfif structKeyExists(eventRaw, "views") and structKeyExists(eventRaw.views,"include")>
			<cfloop index="y" from="1" to="#arrayLen(eventRaw.views.include)#">
				<cfset viewRaw = eventRaw.views.include[y]>
				<cfset view = {}>
				<cfset view.name = viewRaw.xmlAttributes.name>
				<cfset view.template = viewRaw.xmlAttributes.template>
				<cfset arrayAppend(event.views, view)>
			</cfloop>
		</cfif>
			
		<cfset arrayAppend(eventList, event)>
	</cfloop>

	<cfset eventTypes = xmlSearch(xmlData, "/modelglue/event-types/event-type")>
	<cfloop index="x" from="1" to="#arrayLen(eventTypes)#">
		<cfset eventTypeRaw = eventTypes[x]>
		<cfset eventType = {}>
		<cfset eventType.name = eventTypeRaw.xmlAttributes.name>
		<cfset eventType.before = {}>
		<cfset eventType.before.broadcasts = []>
		<cfset eventType.before.results = []>
		<cfset eventType.before.views = []>
		<cfset eventType.after = {}>
		<cfset eventType.after.broadcasts = []>
		<cfset eventType.after.results = []>
		<cfset eventType.after.views = []>

		<cfloop index="scope" list="before,after">

			<cfif structKeyExists(eventTypeRaw, scope)>
				<cfif structKeyExists(eventTypeRaw[scope], "broadcasts") and structKeyExists(eventTypeRaw[scope].broadcasts,"message")>
					<cfloop index="y" from="1" to="#arrayLen(eventTypeRaw[scope].broadcasts.message)#">
						<cfset messageRaw = eventTypeRaw[scope].broadcasts.message[y]>
						<cfset msg = {}>
						<cfset msg.name = messageRaw.xmlAttributes.name>
						<cfset arrayAppend(eventType[scope].broadcasts, msg)>
					</cfloop>
				</cfif>
			
				<cfif structKeyExists(eventTypeRaw[scope], "results") and structKeyExists(eventTypeRaw[scope].results,"result")>
					<cfloop index="y" from="1" to="#arrayLen(eventTypeRaw[scope].results.result)#">
						<cfset resultRaw = eventTypeRaw[scope].results.result[y]>
						<cfset result = {}>
						<cfif structkeyExists(resultRaw.xmlAttributes, "name")>
							<cfset result.name = resultRaw.xmlAttributes.name>
						</cfif>
						<cfset result.do = resultRaw.xmlAttributes.do>
						<cfif structkeyExists(resultRaw.xmlAttributes, "redirect")>
							<cfset result.redirect = resultRaw.xmlAttributes.redirect>
						</cfif>
						<cfset arrayAppend(eventType[scope].results, result)>
					</cfloop>
				</cfif>
			
				<cfif structKeyExists(eventTypeRaw[scope], "views") and structKeyExists(eventTypeRaw[scope].views,"include")>
					<cfloop index="y" from="1" to="#arrayLen(eventTypeRaw[scope].views.include)#">
						<cfset viewRaw = eventTypeRaw[scope].views.include[y]>
						<cfset view = {}>
						<cfset view.name = viewRaw.xmlAttributes.name>
						<cfset view.template = viewRaw.xmlAttributes.template>
						<cfset arrayAppend(eventType[scope].views, view)>
					</cfloop>
				</cfif>
			</cfif>

		</cfloop>
			
		<cfset arrayAppend(eventTypeList, eventType)>
	</cfloop>
	<cfset controllers = xmlSearch(xmlData, "/modelglue/controllers/controller")>
	<cfloop index="x" from="1" to="#arrayLen(controllers)#">
		<cfset controllerRaw = controllers[x]>
		<cfset controller = {}>
		
		<cfset controller.id = controllerRaw.xmlAttributes.id>
		<cfset controller.type = controllerRaw.xmlAttributes.type>
		<cfset controller.listens = []>
		
		<cfif structKeyExists(controllerRaw, "message-listener")>
			<cfloop index="y" from="1" to="#arrayLen(controllerRaw["message-listener"])#">
				<cfset mlRaw = controllerRaw["message-listener"][y]>
				<cfset ml = {}>
				<cfset ml.message = mlRaw.xmlAttributes.message>
				<cfif structKeyExists(mlRaw.xmlAttributes, "function")>
					<cfset ml.function = mlRaw.xmlAttributes.function>
				<cfelse>
					<cfset ml.function = ml.message>
				</cfif>
				<cfset arrayAppend(controller.listens, ml)>
			</cfloop>
		</cfif>
		
		<cfset arrayAppend(controllerList, controller)>
	</cfloop>
	
</cfloop>


<!---
<cfdump var="#eventTypeList#" abort>
<cfdump var="#controllerList#" abort>
<cfdump var="#eventList#" abort>
--->

<cf_view id="modelgluesettings" title="Model-Glue Settings">

<script>
$(function() {
	$("#tabs").tabs();
	//used to link to et's
	$(".etLink").click(function(e) {
		$("#tabs").tabs("select","eventtype");
		e.preventDefault();
	});
});
</script>

<div id="tabs">
	<ul>
		<li><a href="#config">Model-Glue Configuration</a></li>
		<li><a href="#event">Events</a></li>
		<li><a href="#eventtype">Event Types</a></li>
		<li><a href="#controller">Controllers</a></li>
	</ul>
	<div id="config">
		 <cfoutput>
		 <table cellpadding="6" border="1">
		 	<tr>
		 		<td>Reload</td>
		 		<td>#mgconfig.reload#</td>
		 	</tr>
		 	<tr>
		 		<td>Debug</td>
		 		<td>#mgconfig.debug#</td>
		 	</tr>
		 	<tr>
		 		<td>Event Value</td>
		 		<td>#mgconfig.eventValue#</td>
		 	</tr>
		 	<tr>
		 		<td>Default Event</td>
		 		<td>#mgconfig.defaultevent#</td>
		 	</tr>
		 	<tr>
		 		<td>Missing Event</td>
		 		<td>#mgconfig.missingEvent#</td>
		 	</tr>
		 	<tr>
		 		<td>Default Exception Handler</td>
		 		<td>#mgconfig.defaultexceptionhandler#</td>
		 	</tr>
		 	<tr>
		 		<td>Reload Password</td>
		 		<td>#mgconfig.reloadpassword#</td>
		 	</tr>
		 	<tr>
		 		<td>Reload Key</td>
		 		<td>#mgconfig.reloadkey#</td>
		 	</tr>
		 	<tr>
		 		<td>Application Mapping</td>
		 		<td>#mgconfig.applicationMapping#</td>
		 	</tr>
		 	<tr>
		 		<td>View Mappings</td>
		 		<td>#mgconfig.viewMappings#</td>
		 	</tr>
		 	<tr>
		 		<td>Helper Mappings</td>
		 		<td>#mgconfig.helperMappings#</td>
		 	</tr>
		 	<tr>
		 		<td>Generation Enabled</td>
		 		<td>#mgconfig.generationEnabled#</td>
		 	</tr>
		 </table>
		 </cfoutput>

	</div>
	<div id="event">
		<cfloop index="event" array="#eventList#">
			<cfoutput>
			<p>
			<b>#event.name#</b> <cfif len(event.type)>(<a href="" class="etLink">#event.type#</a>)</cfif><br/>
			Broadcasts: <cfloop index="x" from="1" to="#arrayLen(event.broadcasts)#">#event.broadcasts[x].name#<cfif x lt arrayLen(event.broadcasts)>, </cfif></cfloop><br/>
			Views: <cfloop index="x" from="1" to="#arrayLen(event.views)#">#event.views[x].name# (#event.views[x].template#)<cfif x lt arrayLen(event.views)>, </cfif></cfloop><br/>
			Results: <cfloop index="x" from="1" to="#arrayLen(event.results)#">#event.results[x].do#<cfif x lt arrayLen(event.results)>, </cfif></cfloop><br/>
			</p>
			</cfoutput>
		</cfloop>
	</div>
	<div id="eventtype">

		<cfloop index="event" array="#eventTypeList#">
			<cfoutput>
			<p>
			<b>#event.name#</b> <br/>
			<div style="padding-left: 50px">
			<b>Before:</b><br/>
			Broadcasts: <cfloop index="x" from="1" to="#arrayLen(event.before.broadcasts)#">#event.before.broadcasts[x].name#<cfif x lt arrayLen(event.before.broadcasts)>, </cfif></cfloop><br/>
			Views: <cfloop index="x" from="1" to="#arrayLen(event.before.views)#">#event.before.views[x].name# (#event.before.views[x].template#)<cfif x lt arrayLen(event.before.views)>, </cfif></cfloop><br/>
			Results: <cfloop index="x" from="1" to="#arrayLen(event.before.results)#">#event.before.results[x].do#<cfif x lt arrayLen(event.before.results)>, </cfif></cfloop><br/>
			<br/>
			<b>After:</b><br/>
			Broadcasts: <cfloop index="x" from="1" to="#arrayLen(event.after.broadcasts)#">#event.after.broadcasts[x].name#<cfif x lt arrayLen(event.after.broadcasts)>, </cfif></cfloop><br/>
			Views: <cfloop index="x" from="1" to="#arrayLen(event.after.views)#">#event.after.views[x].name# (#event.after.views[x].template#)<cfif x lt arrayLen(event.after.views)>, </cfif></cfloop><br/>
			Results: <cfloop index="x" from="1" to="#arrayLen(event.after.results)#">#event.after.results[x].do#<cfif x lt arrayLen(event.after.results)>, </cfif></cfloop><br/>
			</div>
			</p>
			</cfoutput>
		</cfloop>
		
	</div>
	<div id="controller">
		<cfloop index="controller" array="#controllerList#">
			<cfoutput>
			<p>
			<b>#controller.id# (#controller.type#)</b><br/>
			Listens: <cfloop index="x" from="1" to="#arrayLen(controller.listens)#">#controller.listens[x].message#<cfif controller.listens[x].function neq controller.listens[x].message> (#controller.listens[x].function#)</cfif><cfif x lt arrayLen(controller.listens)>, </cfif></cfloop><br/>
			</p>
			</cfoutput>
		</cfloop>
	</div>
</div>
</cf_view>