<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->


	
<cfset errorMsg = "">

<cfif isDefined("url.showMenu")>
	<cfset showListOfMenus()>
<cfelseif isDefined("url.addMenu") or isDefined("url.addMenuBtn") >
	<cfset showAddMenu()>
<cfelseif isDefined("url.newMenuBtn")>
	<cfset showAddMenu()>
<cfelseif isDefined("url.saveMenuBtn")>
	<cfset processSaveMenu()>
<cfelseif isDefined("url.action")>
	<cfset processURLAction()>
<cfelseif isDefined("url.addActionBtn")>
	<cfset showAddAction(Form.menuIndex)>
<cfelseif isDefined("url.saveActionBtn")>
	<cfset processSaveMenuAction()>
<cfelseif isDefined("url.doneActionBtn")>
	<cfset processDoneAction()>
<cfelseif isDefined("url.newActionBtn")>
	<cfset processNewAction()>
<cfelseif isDefined("url.addInputBtn")>
	<cfset showAddInput(Form.menuIndex, Form.actionIndex)>
<cfelseif isDefined("url.saveInputBtn")>
	<cfset processSaveInput()>
<cfelseif isDefined("url.doneInputBtn")>
	<cfset processDoneInput()>
<cfelseif isDefined("url.newInputBtn")>
	<cfset processNewInput()>
<cfelseif isDefined("url.addFilterBtn")>
	<cfset showAddFilter(Form.menuIndex)>
<cfelseif isDefined("url.saveFilterBtn")>
	<cfset processSaveFilter()>
<cfelseif isDefined("url.doneFilterBtn")>
	<cfset processDoneFilter()>
<cfelseif isDefined("url.newFilterBtn")>
	<cfset processNewFilter()>
<cfelse>
	<cfset showListOfMenus()>
</cfif>


<cffunction name="showAddMenu" output="true">
	<cfargument name="selectedMenu" required="false"> 

	<cfset showError()>
	<cfset menus = extInfo.getMenus()>
		
	<cfset selectedMenuIndex = -1>
	<cfif isDefined("arguments.selectedMenu") and not isSimpleValue(arguments.selectedMenu) >
		<cfset menuName = arguments.selectedMenu.getName()>
		<cfset target = arguments.selectedMenu.getTarget()>
		<cfset selectedMenuIndex = extInfo.getMenuIndex(menuName)>
	<cfelseif isDefined("Form.menuName")>
		<cfset menuName = Form.menuName>
		<cfset target = Form.menuTarget>
	<cfelse>
		<cfset menuName = "">
		<cfset target = "">
	</cfif>
	
	<cfform name="addMenuForm" action="collectMenuInformation.cfm" method="post">
		<input type="hidden" name="menuIndex" value="#selectedMenuIndex#">
		
		<br>
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td><b>Menu details</b></td>
			</tr>
		</table>
		
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td>Name: </td>
				<td><input type="text" name="menuName" size="20" value="#menuName#"></td>
			</tr>
			<tr>
				<td>Target:</td>
				<cfset types = Session.optionManager.getMenuTargets()>
				<td>
					<select size="1" name="menuTarget">
						<cfloop index="i" from="1" to="#ArrayLen(types)#">
							<option value="#types[i]#" label="#types[i]#" 
								<cfif target eq types[i]>
									selected="selected"
								</cfif>
							>#types[i]#</option>
                        </cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<input type="button" name="saveMenuBtn" value="Save Menu" onclick="ColdFusion.navigate('collectMenuInformation.cfm?saveMenuBtn=1','Menu_Contributions','','','POST','addMenuForm')">
					<input type="button" name="newMenuBtn" value="New Menu" onclick="ColdFusion.navigate('collectMenuInformation.cfm?newMenuBtn=1','Menu_Contributions','','','POST','addMenuForm')">
				</td>
			</tr>
		</table>
		<hr>
	</cfform>

	<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
		<tr>
			<td><b>Action Details</b></td>
		</tr>
	</table>
	
	<cfset listActions(selectedMenuIndex)>
	<hr>
	
	<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
		<tr>
			<td><b>Filter Details</b></td>
		</tr>
		
	</table>
	
	<cfset listFilters(selectedMenuIndex)>
	
	<cfform name="addMenuForm1" action="collectMenuInformation.cfm" method="post">
		<input type="hidden" name="menuIndex" value="#selectedMenuIndex#">
		<hr>
		
		<input type="button" name="doneBtn" value="Done" onclick="ColdFusion.navigate('collectMenuInformation.cfm?doneBtn=1','Menu_Contributions','','','POST','addMenuForm1')">
		
	</cfform>
	
	<script type="text/javascript">
		function onload(){
			document.addMenuForm.menuName.focus();
		}
	</script>			

</cffunction>

<cffunction name="showListOfMenus" output="true">

	<cfset showError()>
	
	<cfset menus = extInfo.getMenus()>
	<cfform name="ListMenuForm" method="post" action="collectMenuInformation.cfm">
	<cfif ArrayLen(menus) gt 0>
	
	<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td><b>List of Menus </b></td>
			</tr>
		</table>
	
			<cfgrid name="Menu_list" format="html">
				<cfgridcolumn name="no" header="No.">
				<cfgridcolumn name="name" header="Name">
				<cfgridcolumn name="target" header="Target">
				<cfgridcolumn name="action" header="Actions">
				
					<cfloop index="i" from="1" to="#ArrayLen(menus)#">
						<cfset menu = menus[i]>
						<cfgridrow data="#i#,#menu.getName()#,#menu.getTarget()#,<a href=""javascript:menu_Action('delete@'+'#i#')"">Delete</a>/<a href=""javascript:menu_Action('edit@'+'#i#')"">Edit</a>">					
					</cfloop>
			</cfgrid>
		<cfelse>
			<h4 style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px;font-style:italic;" >No Menus added</h4>
		</cfif>
		<br>
		<input type="button" name="addMenuBtn" value="Add Menu" onClick="ColdFusion.navigate('collectMenuInformation.cfm?addMenuBtn=1','Menu_Contributions','','','','ListMenuForm')" >
	</cfform>
</cffunction>

<cffunction name="processSaveMenu">
	<cfif not isDefined("Form.menuIndex") or Form.menuIndex lt 1>
		<cfset selectedMenu = "">
	<cfelse>
		<cfset selectedMenu = extInfo.getMenuAt(Form.menuIndex)>
	</cfif>
	
	<cfif trim(Form.menuName) neq "">
		<cfif isSimpleValue(selectedMenu)>
			<cfset selectedMenu = createObject("Component", "extinfo.Menu")>
			<cfset extInfo.addMenu(selectedMenu)>
		</cfif>
		
		<cfset selectedMenu.setName(Form.menuName)>
		<cfset selectedMenu.setTarget(Form.menuTarget)>
	<cfelse>
		<cfset errorMsg = "Name field is required">
	</cfif>
	
	<cfset showAddMenu(selectedMenu)>
	
</cffunction>
<cffunction name="processUrlAction">
	<cfset action = Url.action>
	<cfif action eq "delete" or action eq "edit">
		<cfif not isDefined("url.index")>
			<cfset showListOfMenus()>
			<cfreturn>
		</cfif>
		<cfset index = url.index>
		
		<cfif action eq "delete">
			<cfset deleteMenu(index)>
		<cfelseif action eq "edit">
			<cfset editMenu(index)>
		<cfelse>
			<cfreturn>
		</cfif>
	<cfelseif action eq "deleteAction" or action eq "editAction">
		<cfset actionIndex = url.actionIndex>
		<cfset menuIndex = url.menuIndex>
		
		<cfif action eq "deleteAction">
			<cfset deleteMenuAction(menuIndex, actionIndex)>
		<cfelseif action eq "editAction">
			<cfset editMenuAction (menuIndex, actionIndex)>
		<cfelse>
			<cfreturn>
		</cfif>
	<cfelseif action eq "deleteInput" or action eq "editInput">
		<cfset inputIndex = url.inputIndex>
		<cfset actionIndex = url.actionIndex>
		<cfset menuIndex = url.menuIndex>
		
		<cfif action eq "deleteInput">
			<cfset deleteActionInput(menuIndex, actionIndex, inputIndex)>
		<cfelseif action eq "editInput">
			<cfset editActionInput (menuIndex, actionIndex, inputIndex)>
		<cfelse>
			<cfreturn>
		</cfif>
	<cfelseif action eq "deleteFilter" or action eq "editFilter">
		<cfset filterIndex = url.filterIndex>
		<cfset menuIndex = url.menuIndex>
		
		<cfif action eq "deleteFilter">
			<cfset deleteFilter(menuIndex, filterIndex)>
		<cfelseif action eq "editFilter">
			<cfset editFilter (menuIndex, filterIndex)>
		<cfelse>
			<cfreturn>
		</cfif>
	</cfif>
</cffunction>

<cffunction name="editMenu">
	<cfargument name="index" required="true" >
	
	<cfset var menus = extInfo.getmenus()>
	<cfset var selectedMenu = menus[index]>
	
	<cfif not isSimpleValue(selectedMenu)>
		<cfset showAddMenu(selectedMenu)>
	<cfelse>
		<cfset errorMsg = "Menu item not found">
		<cfset showListOfMenus()>
	</cfif>	
</cffunction>

<cffunction name="showError" output="true">
	<cfif errorMsg neq "">
		<font color="red">#errorMsg#</font>
	</cfif>
</cffunction>

<cffunction name="deleteMenu">
	<cfargument name="index" required="true" >
	<cfif index gt 0>
		<cfset extInfo.deleteMenuAt(index)>
	</cfif>
	<cfset showListOfMenus()>	
</cffunction>

<cffunction name="findMenuIndexInSession" returntype="numeric" >
	<cfargument name="name" required="true">
	
	<cfset var menus = extInfo.getMenus()>
	<cfset var selectedMenuIndex = -1>
	
	<cfloop index="i" from="1" to="#ArrayLen(menus)#">
		<cfif menus[i].getName() eq name>
			<cfset selectedMenuIndex = i>
			<cfbreak>
		</cfif>
	</cfloop>
	
	<cfreturn selectedMenuIndex>
</cffunction>

<cffunction name="findMenuInSession">
	<cfargument name="name" required="true">
	
	<cfset var menus = extInfo.getMenus()>

	<cfset selectedMenu = "">
	
	<cfset index = findMenuIndexInSession(name)>
	
	<cfif index gt 0>
		<cfset selectedMenu = menus[index]>
	</cfif>	
	<cfreturn selectedMenu>
</cffunction>


<cffunction name="showAddAction">
	<cfargument name="menuIndex" required="true" type="numeric" >
	<cfargument name="actionIndex" required="false" type="numeric" >
	
	<cfset showError()>
	
	<cfif menuIndex eq -1>
		<cfset errorMsg = "Menu must be saved before adding actions">
		<cfset showAddMenu()>
		<cfreturn>
	</cfif>
	
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	<cfset actIndex = -1>
	
	<cfif isDefined("arguments.actionIndex") and arguments.actionIndex gt 0>
		<cfset actIndex = arguments.actionIndex>
		<cfset action = menu.getActionAt(actIndex)>
	</cfif>
	
	<cfset showResponse = true>
	<cfset handlerIdFieldValue = "">
	
	<cfif isDefined("action")>
		<cfset name = action.getName()>
		<cfset width = action.getInputDialogWidth()>
		<cfset height = action.getInputDialogHeight()>
		<cfset handlerId = action.getHandlerId()>
		<cfset showResponse = action.isShowResponse()>
		<cfset dialogTitle = action.getDialogTitle()>
		<cfset handlerName = "">
		<cfset closeDialogHandler = action.getDialgCloseHandlerFile()>
	<cfelseif isDefined("Form.actionName")>
		<cfset name = Form.actionName>
		<cfset width = Form.dlgWidth>
		<cfset height = Form.dlgHeight>
		<cfset handlerId = Form.handlerIds>
		<cfif handlerId eq "" and Form.handlerId neq "">
			<cfset handlerIdFieldValue = Form.handlerId>
		</cfif>
		<cfset handlerName = Form.handlerFile>
		<cfif not isDefined("form.showResponse")>
			<cfset showResponse = false>
		</cfif>
		<cfset dialogTitle = Form.dialogTitle>
		<cfset closeDialogHandler = Form.dlgCloseHandler>
	<cfelse>
		<cfset name = "">
		<cfset width = "0">
		<cfset height = "0">
		<cfset handlerId = "">
		<cfset handlerName = "">
		<cfset dialogTitle = "">
		<cfset closeDialogHandler = "">
	</cfif>
	
	<cfset handlerIds = extInfo.getHandlerIds()>
	<cfset ArrayAppend(handlerIds,"")>
	<cfoutput>
		<cfform name="addActionForm" action="collectMenuInformation.cfm" method="post" style="margin:10px">
			<input type="hidden" name="menuIndex" value="#arguments.menuIndex#">
			<input type="hidden" name="actionIndex" value="#actIndex#">
			
			<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
				<tr>
					<td><b>Menu Action</b></td>
				</tr>
			</table>
			
			<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:10px">
				<tr>
					<td>Name:</td>
					<td><input type="text" name="actionName" size="20" value="#name#"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td>Handler:</td>
					<td>
						<select size="1" name="handlerIds">
							<cfloop index="i" from="1" to="#ArrayLen(handlerIds)#">
								<option value="#handlerIds[i]#"
									<cfif actIndex gt 0 and handlerIds[i] eq handlerId>
										selected="selected"
									<cfelseif actIndex lte 0 and handlerIds[i] eq "">
										selected="selected"
									</cfif>
								>#handlerIds[i]#</option>
							</cfloop>
						</select>
					</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="4"><b>Or Create a New Handler</b></td>
				</tr>
				<tr>
					<td >Handler Id:</td>
					<td style="margin-right:20"><input type="text" name="handlerId" size="20" value=#handlerIdFieldValue#></td>
					<td >Handler File:</td>
					<td ><input type="text" name="handlerFile" size="20" value="#handlerName#"></td>
				</tr>
				<tr>
					<td>Show Response</td>
					<td><input type="checkbox" name="showResponse"
					<cfif showResponse>
						checked="yes"
					</cfif>
					>
				</tr>
				<tr>
					<td colspan="4">
						<fieldset><legend>Dialog Info</legend>
							<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:10px">
								<tr>
									<td>Dialog Title:</td>
									<td><input type="text" name="dialogTitle" size="20" value="#dialogTitle#"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td>Dialog Width:</td>
									<td><input type="text" name="dlgWidth" size="20" value="#width#"></td>
								</tr>
								<tr>
									<td>Height:</td>
									<td><input type="text" name="dlgHeight" size="20" value="#height#"></td>
								</tr>
								<tr>
									<td>Close Handler File:</td>
									<td>
										<input type="text" name="dlgCloseHandler" size="20" value="#closeDialogHandler#">
									</td>
									<td colspan="2"></td>
								</tr>
							</table>
						</fieldset>
					</td>
				</tr>
				<tr>
					<td>
						<br>
						<input type="button" name="saveActionBtn" value="Save" onclick="ColdFusion.navigate('collectMenuInformation.cfm?saveActionBtn=1','Menu_Contributions','','','POST','addActionForm')">
						<input type="button" name="newActionBtn" value="New Action" onclick="ColdFusion.navigate('collectMenuInformation.cfm?newActionBtn=1','Menu_Contributions','','','POST','addActionForm1')">
					</td>
				</tr>
			</table>
			<hr>
			</cfform>
			<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:10px">
				<tr>
					<td><b>Menu Action Inputs</b></td>
				</tr>
			</table>
			<cfset listinputs(menuIndex,actIndex)>
			
		<cfform name="addActionForm1" action="collectMenuInformation.cfm" method="post" >	
			<input type="hidden" name="menuIndex" value="#arguments.menuIndex#">
			<input type="hidden" name="actionIndex" value="#actIndex#">
			
			<input type="button" name="doneActionBtn" value="Done" onclick="ColdFusion.navigate('collectMenuInformation.cfm?doneActionBtn=1','Menu_Contributions','','','POST','addActionForm1')">
		</cfform>
	</cfoutput>
	
</cffunction>

<cffunction name="processSaveMenuAction">
	<cfset var menuIndex = Form.menuIndex>
	<cfset var actionIndex = Form.actionIndex>
	
	<cfif Form.actionName eq "">
		<cfset ErrorMsg = "Action name is a required filed">
		<cfset showaddAction(menuIndex)>
		<cfreturn>
	</cfif>
	
	<cfif menuIndex lte 0>
		<cfset ErrorMsg = "No menu selected">
		<cfset showaddAction(menuIndex)>
		<cfreturn>
	</cfif>
	
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	
	<cfset newHandlerId = Form.handlerId>
	<cfset newHandlerFile = Form.handlerFile>
	<cfif isDefined("Form.showResponse")>
		<cfif Form.showResponse eq "on">
			<cfset showResponse = true>
		<cfelse>
			<cfset showResponse = false>
		</cfif>
	<cfelse>
		<cfset showResponse = false>
	</cfif>
	
	<cfset handlerId = "">
	
	<cfif trim(newHandlerId) neq "" and trim(newHandlerFile) neq "">
		<cfset newHandler = createObject("component", "extinfo.Handler")>
		<cfset newHandler.setId(newHandlerId)>
		<cfset newHandler.setFileName(newHandlerFile)>
		<cfset newHandler.setGenerateResponse(showResponse)>
		<cfset extInfo.addHandler(newHandler)>
		<cfset handlerId = newHandlerId>
	<cfelseif isDefined("Form.handlerIds") and Form.handlerIds neq "">
		<cfset newHandlerId = Form.handlerIds>
		<cfset handler = extInfo.getHandlerFromId(newHandlerId)>
		<cfset handler.setGenerateResponse(showResponse)>
	<cfelse>
		<cfset ErrorMsg = "You must specify handler id for the action">
		<cfset showAddAction(menuIndex,actionIndex)>
		<cfreturn>
	</cfif>

	<cfif actionIndex gt 0>
		<cfset action = menu.getActionAt(actionIndex)>
	<cfelse>
		<cfset action = createObject("component","extinfo.MenuAction")>
		<cfset menu.addAction(action)>
		<cfset actionIndex = ArrayLen(menu.getActions())>
	</cfif>

	<cfset action.setName(Form.actionName)>
	<cfset action.setInputDialogWidth(Form.dlgWidth)>
	<cfset action.setInputDialogHeight(Form.dlgHeight)>
	<cfset action.setDialogTitle(Form.dialogTitle)>
	<cfset action.setDialgCloseHandlerFile(Form.dlgCloseHandler)>
	
	
	<cfset action.setHandlerId(newHandlerId)>
	
	<cfset action.setShowResponse(showResponse)>
	
	<cfset showAddAction(menuIndex,actionIndex)>
	
</cffunction>

<cffunction name="listActions" output="true">
	<cfargument name="menuIndex" type="numeric" required="true">
	
	<cfform name="listActionForm" action="collectMenuInformation.cfm" method="post" >
		<input name="menuIndex" type="hidden" value="#menuIndex#">
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td width="70%"> 
				<cfif menuIndex gt 0>
					<cfset menu = extInfo.getMenuAt(menuIndex)>
					<cfset actions = menu.getActions()>
				</cfif>
				<cfif menuIndex gt 0 and ArrayLen(actions) gt 0>
				<cfgrid name="Action_list" format="html" >
						<cfgridcolumn name="no" header="No.">
						<cfgridcolumn name="name" header="Action Name">
						<cfgridcolumn name="target" header="Handler Id">
						<cfgridcolumn name="action" header="Actions">
					
							<cfloop index="i" from="1" to="#ArrayLen(actions)#">
								<cfset action = actions[i]>
								<cfset parameter=#i#&"@"&#menuindex# >
								<cfgridrow data="#i#,#action.getName()#,#action.getHandlerId()#,<a href= ""javascript:action_Action('deleteAction@'+'#parameter#')"">Delete</a>/<a href= ""javascript:action_Action('editAction@'+'#parameter#')"">Edit</a>">
							</cfloop>
						
				</cfgrid>
				<cfelse>
							<div style="font-style:italic;">No Actions</div>
				</cfif>
				</td>
				<td width="30%"> 
				 	<input type="button" name="addActionBtn" value="Add Action" onclick="ColdFusion.navigate('collectMenuInformation.cfm?addActionBtn=1','Menu_Contributions','','','POST','listActionForm')">
				</td>
			</tr>
		
		</table>
	</cfform>
	
</cffunction>

<cffunction name="deleteMenuAction">
	<cfargument name="menuIndex" required="true">
	<cfargument name="actionIndex" required="true" >
	
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	<cfset menu.deleteAction(actionIndex)>
	<cfset showAddMenu(menu)>
</cffunction>

<cffunction name="editMenuAction">
	<cfargument name="menuIndex" required="true">
	<cfargument name="actionIndex" required="true" >
	
	<cfset showaddAction(menuIndex,actionIndex)>
</cffunction>

<cffunction name="processDoneAction">
	<cfset menuIndex = Form.menuIndex>
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	<cfset showAddMenu(menu)>
</cffunction>

<cffunction name="processNewAction">
	<cfset menuIndex = Form.menuIndex>
	<cfset showAddAction(menuIndex)>
</cffunction>

<cffunction name="showAddInput">
	<cfargument name="menuIndex" required="true" type="numeric" >
	<cfargument name="actionIndex" required="true" type="numeric" >
	<cfargument name="inputIdex" required="false" type="numeric" >
	
	<cfset showError()>
	
	<cfif menuIndex lte 0>
		<cfset errorMsg = "Menu must be saved before adding actions and inputs">
		<cfset showAddMenu()>
		<cfreturn>
	</cfif>

	<cfif actionIndex lte 0>
		<cfset errorMsg = "Action must be saved before adding input">
		<cfset showAddAction(menuIndex,actionIndex)>
		<cfreturn>
	</cfif>
	
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	<cfset action = menu.getActionAt(actionIndex)>
	
	<cfset inptIndex = -1>
	
	<cfif isDefined("arguments.inputIdex")>
		<cfset inptIndex = arguments.inputIdex>
		<cfset input = action.getInput(inptIndex)>
	</cfif>
	
	<cfif isDefined("input")>
		<cfset name = input.getName()>
		<cfset label = input.getLabel()>
		<cfset tooltip = input.getTooltip()>
		<cfset type = input.getType()>
		<cfset pattern = input.getPattern()>
		<cfset errorMessage = input.getErrorMessage()>
		<cfset helpMessage = input.getHelpMessage()>
		<cfset default = input.getDefault()>
		<cfif  input.isChecked()>
			<cfset checked = "yes">
		<cfelse>
			<cfset checked = "no">
		</cfif>
		<cfif  input.isRequired()>
			<cfset required = "yes">
		<cfelse>
			<cfset required = "no">
		</cfif>
	<cfelseif isDefined("Form.inputName")>
		<cfset name = Form.inputName>
		<cfset label = Form.label>
		<cfset tooltip = Form.tooltip>
		<cfset type = Form.types>
		<cfset pattern = Form.pattern>
		<cfset errorMessage = Form.errMsg>
		<cfset helpMessage = Form.helpMsg>
		<cfif Form.defaultTxt neq "">
			<cfset default = Form.defaultTxt>
		<cfelse>
			<cfset default = Form.defaults>
		</cfif>
		<cfif isDefined("Form.checked")>
			<cfset checked = true>
		<cfelse>
			<cfset checked = false>
		</cfif>
		<cfif isDefined("Form.required")>
			<cfset required = true>
		<cfelse>
			<cfset required = false>
		</cfif>
	<cfelse>
		<cfset name = "">
		<cfset label = "">
		<cfset tooltip = "">
		<cfset type = "">
		<cfset pattern = "">
		<cfset errorMessage = "">
		<cfset helpMessage = "">
		<cfset default = "">
		<cfset checked = "no">
		<cfset required = "no">
	</cfif>
	
	<cfset types = session.optionManager.getInputDataTypes()>
	<cfset defaultKeys = session.optionManager.getDefaultKeywords()>
	<cfset ArrayAppend(defaultKeys,"")>
	<cfoutput>
		<form name="addInputForm" action="collectMenuInformation.cfm" method="post">
			<input type="hidden" name="menuIndex" value="#menuIndex#">
			<input type="hidden" name="actionIndex" value="#actionIndex#">
			<input type="hidden" name="inputIndex" value="#inptIndex#">
			
			<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
				<tr>
					<td><b>Action Inputs</b></td>
				</tr>
			</table>
			<hr style="margin:5px">
					
			<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:10px">
				<tr>
					<td>Name:</td>
					<td colspan="2"><input type="text" name="inputName" size="20" value="#name#"></td>
				</tr>
				<tr>
					<td>Label:</td>
					<td colspan="2"><input type="text" name="label" size="20" value="#label#"></td>
				</tr>
				<tr>
					<td>Tooltip:</td>
					<td colspan="2"><input type="text" name="tooltip" size="40" value="#tooltip#"></td>
				</tr>
				<tr>
					<td>Type:</td>
					<td colspan="2">
						<select size="1" name="types">
							<cfloop index="i" from="1" to="#ArrayLen(types)#">
								<option value="#types[i]#"
									<cfif inptIndex gt 0 and types[i] eq type>
										selected="selected"
									</cfif>
								>#types[i]#</option>
							</cfloop>
						</select>
					</td>
				</tr>
				<tr>
					<td>Default:</td>
					<td><input type="text" name="defaultTxt" size="20" value="#default#"></td>
					<td>
						<b>OR</b>
						<select size="1" name="defaults">
							<cfloop index="i" from="1" to="#ArrayLen(defaultKeys)#">
								<option value="#defaultKeys[i]#"
									<cfif inptIndex gt 0 and defaultKeys[i] eq default and default eq "">
										selected="selected"
									<cfelseif (inptIndex lte 0 or default neq "") and defaultKeys[i] eq "">
										selected="selected"
									</cfif>
								>#defaultKeys[i]#</option>
							</cfloop>
						</select>
					</td>
				</tr>

				<tr>
					<td>Pattern:</td>
					<td colspan="2"><input type="text" name="pattern" size="40" value="#pattern#"></td>
				</tr>

				<tr>
					<td>Error Message:</td>
					<td colspan="2"><input type="text" name="errMsg" size="40" value="#errorMessage#"></td>
				</tr>

				<tr>
					<td>Help Message:</td>
					<td colspan="2"><input type="text" name="helpMsg" size="40" value="#helpMessage#"></td>
				</tr>

				<tr>
					<td><input type="checkbox" name="checked"
						<cfif checked>
							checked="yes" 
						</cfif>
					></td>
					<td colspan="2">Checked</td>
				</tr>

				<tr>
					<td><input type="checkbox" name="required"
						<cfif required>
							checked="yes" 
						</cfif>
 
					></td>
					<td colspan="2">Required</td>
				</tr>
				<tr>
					<td>
						<br>
						<input type="button" name="saveInputBtn" value="Save" onclick="ColdFusion.navigate('collectMenuInformation.cfm?saveInputBtn=1','Menu_Contributions','','','POST','addInputForm')">
					</td>
				</tr>
			</table>
			
			<hr>
			
			<input type="button" name="newInputBtn" value="New Input" onclick="ColdFusion.navigate('collectMenuInformation.cfm?newInputBtn=1','Menu_Contributions','','','POST','addInputForm')" >
			<input type="button" name="doneInputBtn" value="Done" onclick="ColdFusion.navigate('collectMenuInformation.cfm?doneInputBtn=1','Menu_Contributions','','','POST','addInputForm')">
		</form>
	</cfoutput>
	
</cffunction>

<cffunction name="processSaveInput">
	<cfset var menuIndex = Form.menuIndex>
	<cfset var actionIndex = Form.actionIndex>
	<cfset var inputIndex = Form.inputIndex>
	
	<cfif menuIndex lte 0>
		<cfset ErrorMsg = "No menu selected">
		<cfset showaddAction(menuIndex)>
		<cfreturn>
	</cfif>
	
	<cfif actionIndex lte 0>
		<cfset ErrorMsg = "No action selected">
		<cfset showAddAction(menuIndex)>
		<cfreturn>
	</cfif>
	
	<cfif Form.inputName eq "">
		<cfset ErrorMsg = "Input name is a required field">
		<cfset showAddInput(menuIndex, actionIndex)>
		<cfreturn>
	</cfif>
	
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	<cfset action = menu.getActionAt(actionIndex)>
	
	<cfif inputIndex gt 0>
		<cfset input = action.getinput(inputIndex)>
	<cfelse>
		<cfset input = createObject("component","extinfo.MenuInput")>
		<cfset action.addInput(input)>
		<cfset inputIndex = ArrayLen(action.getInputs())>
	</cfif>
	
	<cfset input.setName(Form.inputName)>
	<cfif isDefined("Form.checked")>
		<cfset input.setChecked(true)>
	<cfelse>
		<cfset input.setChecked(false)>
	</cfif>
	<cfif isDefined("Form.required")>
		<cfset input.setRequired(true)>
	<cfelse>
		<cfset input.setRequired(false)>
	</cfif>
	<cfif Form.defaults neq "">
		<cfset input.setDefault(Form.defaults)>
	<cfelseif Form.defaultTxt neq "">
		<cfset input.setDefault(Form.defaultTxt)>
	</cfif>
	<cfset input.setErrorMessage(Form.errMsg)>
	<cfset input.setHelpMessage(Form.helpMsg)>
	<cfset input.setLabel(Form.label)>
	<cfset input.setTooltip(Form.tooltip)>
	<cfset input.setType(Form.types)>
	<cfset input.setPattern(Form.pattern)>
	
	<cfset showAddInput(menuIndex, actionIndex, inputIndex)>
	
</cffunction>

<cffunction name="listInputs" output="true">
	<cfargument name="menuIndex" type="numeric" required="true">
	<cfargument name="actionIndex" type="numeric" required="true">
	
	<cfif menuIndex gt 0>
		<cfset menu = extInfo.getMenuAt(menuIndex)>
		<cfif actionIndex gt 0>
			<cfset inputs = action.getInputs()>
		</cfif>
	</cfif>

	<cfform name="listInputsForm" action="collectMenuInformation.cfm" method="post">
		<input type="hidden" name="menuIndex" value="#menuIndex#">
		<input type="hidden" name="actionIndex" value="#actionIndex#">
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td width="70%"> 
					<cfif menuIndex gt 0 and actionIndex gt 0 and ArrayLen(inputs) gt 0>
						<cfgrid name="Inputs_list" format="html" >
					
							<cfgridcolumn name="no" header="No.">
							<cfgridcolumn name="name" header="Input Name">
							<cfgridcolumn name="type" header="Type">
							<cfgridcolumn name="action" header="Actions">
							
								<cfloop index="i" from="1" to="#ArrayLen(inputs)#">
									<cfset input = inputs[i]>
									<cfset parameter=#i#&"@"&#actionindex#&"@"&#menuindex# >
									<cfgridrow data="#i#,#input.getName()#,#input.getType()#,<a href= ""javascript:input_Action('deleteInput@'+'#parameter#')"">Delete</a>/<a href= ""javascript:input_Action('editInput@'+'#parameter#')"">Edit</a>">
								</cfloop>
							
						</cfgrid>	
					<cfelse>
						<div style="font-style:italic;">No Inputs</div>
					</cfif>
				</td>
				<td width="30%"> 
				 	<input type="button" name="addInputBtn" value="Add Input" onclick="ColdFusion.navigate('collectMenuInformation.cfm?addInputBtn=1','Menu_Contributions','','','POST','listInputsForm')" >
				</td>
			</tr>		
		</table>
		<br>
		
		<hr>
	</cfform>
	
</cffunction>

<cffunction name="deleteActionInput">
	<cfargument name="menuIndex" required="true">
	<cfargument name="actionIndex" required="true" >
	<cfargument name="inputIndex" required="true" >
	
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	<cfset action = menu.getActionAt(actionIndex)>
	<cfset action.deleteInput(inputIndex)>
	<cfset showAddAction(menuIndex,actionIndex)>
</cffunction>

<cffunction name="editActionInput">
	<cfargument name="menuIndex" required="true">
	<cfargument name="actionIndex" required="true" >
	<cfargument name="inputIndex" required="true" >
	
	<cfset showaddInput(menuIndex,actionIndex,inputIndex)>
</cffunction>

<cffunction name="processDoneInput">
	<cfset menuIndex = Form.menuIndex>
	<cfset actionIndex = Form.actionIndex>
	<cfset showAddAction(menuIndex, actionIndex)>
</cffunction>

<cffunction name="processNewInput">
	<cfset menuIndex = Form.menuIndex>
	<cfset actionIndex = Form.actionIndex>
	<cfset showAddInput(menuIndex, actionIndex)>
</cffunction>

<cffunction name="showAddFilter">
	<cfargument name="menuIndex" required="true" type="numeric" >
	<cfargument name="fltrIndex" required="false" type="numeric" >
	
	<cfset showError()>
	
	<cfif menuIndex eq -1>
		<cfset errorMsg = "Menu must be saved before adding actions">
		<cfset showAddMenu()>
		<cfreturn>
	</cfif>
	
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	<cfset filterIndex = -1>
	
	<cfif isDefined("arguments.fltrIndex") and arguments.fltrIndex gt 0>
		<cfset filterIndex = arguments.fltrIndex>
		<cfset filter = menu.getFilterAt(filterIndex)>
	</cfif>
	
	<cfif isDefined("filter")>
		<cfset type = filter.getType()>
		<cfset pattern = filter.getPattern()>
	<cfelseif isDefined("Form.pattern")>
		<cfset type = Form.filterTypes>
		<cfset pattern = Form.pattern>
	<cfelse>
		<cfset type = "">
		<cfset pattern = "">
	</cfif>
	
	<cfset filterTypes = session.optionManager.getFilterTypes()>
	<cfoutput>
		<form name="addFilterForm" action="collectMenuInformation.cfm" method="post">
			<input type="hidden" name="menuIndex" value="#menuIndex#">
			<input type="hidden" name="filterIndex" value="#filterIndex#">
			
			<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
				<tr>
					<td><b>Filter Details</b></td>
				</tr>
			</table>
			<hr style="margin:5px">
					
			<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:10px">
				<tr>
					<td>Type:</td>
					<td>
						<select size="1" name="filterTypes">
							<cfloop index="i" from="1" to="#ArrayLen(filterTypes)#">
								<option value="#filterTypes[i]#"
									<cfif filterTypes[i] eq type>
										selected="selected"
									</cfif>
								>#filterTypes[i]#</option>
							</cfloop>
						</select>
					</td>
				</tr>
				<tr>
					<td>Pattern:</td>
					<td><input type="text" name="pattern" size="20" value="#pattern#"></td>
				</tr>
				<tr>
					<td>
						<br>
						<input type="button" name="saveFilterBtn" value="Save" onclick="ColdFusion.navigate('collectMenuInformation.cfm?saveFilterBtn=1','Menu_Contributions','','','POST','addFilterForm')">
					</td>
				</tr>
			</table>
			
			<hr>
			
			<input type="button" name="newFilterBtn" value="New Filter" onclick="ColdFusion.navigate('collectMenuInformation.cfm?newFilterBtn=1','Menu_Contributions','','','POST','addFilterForm')">
			<input type="button" name="doneFilterBtn" value="Done" onclick="ColdFusion.navigate('collectMenuInformation.cfm?doneFilterBtn=1','Menu_Contributions','','','POST','addFilterForm')">
		</form>
	</cfoutput>
	
</cffunction>

<cffunction name="processSaveFilter">
	<cfset var menuIndex = Form.menuIndex>
	<cfset var filterIndex = Form.filterIndex>
	
	<cfif menuIndex lte 0>
		<cfset ErrorMsg = "No menu selected">
		<cfset showAddFilter(menuIndex, filterIndex)>
		<cfreturn>
	</cfif>
	
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	
	<cfif filterIndex gt 0>
		<cfset filter = menu.getFilterAt(filterIndex)>
	<cfelse>
		<cfset filter = createObject("component","extinfo.MenuFilter")>
		<cfset menu.addFilter(filter)>
		<cfset filterIndex = ArrayLen(menu.getFilters())>
	</cfif>
	
	<cfset filter.setType(Form.filterTypes)>
	<cfset filter.setPattern(Form.pattern)>
	
	<cfset showAddFilter(menuIndex,filterIndex)>
	
</cffunction>


<cffunction name="listFilters" output="true">
	<cfargument name="menuIndex" type="numeric" required="true">
	
	<cfform name="listFiltersForm" action="collectMenuInformation.cfm" method="post">
		<input name="menuIndex" type="hidden" value="#menuIndex#">
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td width="70%"> 
				<cfset menuIndex = selectedmenuIndex>
				<cfif menuIndex gt 0>
					<cfset menu = extInfo.getMenuAt(menuIndex)>
					<cfset filters = menu.getFilters()>
				</cfif>
				
				<cfif menuIndex gt 0 and ArrayLen(filters) gt 0>
				<cfgrid name="Filters_list" format="html" >
					
						<cfgridcolumn name="no" header="No.">
						<cfgridcolumn name="type" header="Type">
						<cfgridcolumn name="pattern" header="Pattern">
						<cfgridcolumn name="action" header="Actions">
						
							<cfloop index="i" from="1" to="#ArrayLen(filters)#">
								<cfset filter = filters[i]>
								<cfset parameter=#i#&"@"&#filterindex#&"@"&#menuindex# >
								<cfgridrow data="#i#,#filter.getType()#,#filter.getPattern()#,<a href= ""javascript:filter_Action('deleteFilter@'+'#parameter#')"">Delete</a>/<a href= ""javascript:filter_Action('editFilter@'+'#parameter#')"">Edit</a>">
							</cfloop>
						
				</cfgrid>
				<cfelse>
							<div style="font-style:italic;">No Filters</div>
				</cfif>
				</td>
				<td width="30%"> 
				 	&nbsp;&nbsp;&nbsp;<input type="button" name="addfilterBtn" value="Add Filter" onclick="ColdFusion.navigate('collectMenuInformation.cfm?addFilterBtn=1','Menu_Contributions','','','POST','listFiltersForm')">
				</td>
			</tr>
		</table>
	</cfform>
	
</cffunction>


<cffunction name="deleteFilter">
	<cfargument name="menuIndex" required="true">
	<cfargument name="filterIndex" required="true" >
	
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	<cfset menu.deleteFilter(filterIndex)>
	<cfset showAddMenu(menu)>
</cffunction>

<cffunction name="editFilter">
	<cfargument name="menuIndex" required="true">
	<cfargument name="filterIndex" required="true" >
	
	<cfset showaddFilter(menuIndex,filterIndex)>
</cffunction>

<cffunction name="processDoneFilter">
	<cfset menuIndex = Form.menuIndex>
	<cfset menu = extInfo.getMenuAt(menuIndex)>
	<cfset showAddMenu(menu)>
</cffunction>

<cffunction name="processNewFilter">
	<cfset menuIndex = Form.menuIndex>
	<cfset showAddFilter(menuIndex)>
</cffunction>

