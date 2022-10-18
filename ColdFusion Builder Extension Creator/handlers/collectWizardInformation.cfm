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

<cfif isDefined("url.saveWizardBtn")>
	<cfset processSaveWizard()>
<cfelseif isDefined("url.addPageBtn")>
	<cfset showAddPage()>
<cfelseif isDefined("url.savePageBtn")>
	<cfset processSavePage()>
<cfelseif isDefined("url.addInputBtn")>
	<cfset showAddInput(Form.pageIndex)>
<cfelseif isDefined("url.action")>
	<cfset processURLAction()>
<cfelseif isDefined("url.saveWInputBtn")>
	<cfset processSaveInput()>
<cfelseif isDefined("url.newPageBtn")>
	<cfset processNewPage()>
<cfelseif isDefined("url.donePageBtn")>
	<cfset processDonePage()>
<cfelseif isDefined("url.newInputBtn")>
	<cfset showAddInput(Form.pageIndex)>
<cfelseif isDefined("url.doneInputBtn")>
	<cfset showAddPage(Form.pageIndex)>
<cfelse>	
	<cfset showAddWizard()>
</cfif>

<cffunction name="showAddWizard" output="true">
	<cfset showError()>
	
	<cfset installWizard = extInfo.getInstallWizard()>
	<cfset installWizardExists = false>
	<cfset handlerFile = "">
	<cfset handlerIdFieldValue = "">
	<cfif not isSimplevalue(installWizard) and installWizard.getHandlerId() neq "">
		<cfset height = installWizard.getHeight()>
		<cfset width = installWizard.getWidth()>
		<cfset handlerId = installWizard.getHandlerId()>
		<cfset installWizardExists = true>
	<cfelseif isDefined("Form.wizardWidth")>
		<cfset height = Form.wizardHeight>
		<cfset width = Form.wizardWidth>
		<cfset handlerId = Form.handlerIds>
		<cfif handlerId eq "" and Form.handlerId neq "">
			<cfset handlerIdFieldValue = Form.handlerId>
		</cfif> 
		<cfset handlerFile = Form.handlerFile>
	<cfelse>
		<cfset height = "">
		<cfset width = "">
		<cfset handlerId = "">
	</cfif>
	
	<cfset handlerIds = extInfo.getHandlerIds()>
	<cfset ArrayAppend(handlerIds,"")>
	
	<cfform name="addWizardForm" method="post" action="collectWizardInformation.cfm">
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			
			<tr>
				<td>Wizard Width:</td>
				<td><input type="text" name="wizardWidth" size="20" value="#width#"></td>
			</tr>
			<tr>
				<td>Wizard Height:</td>
				<td><input type="text" name="wizardHeight" size="20" value="#height#"></td>
			</tr>
			<tr>
				<td>Handler:</td>
				<td>
					<select size="1" name="handlerIds">
						<cfloop index="i" from="1" to="#ArrayLen(handlerIds)#">
							<option value="#handlerIds[i]#"
								<cfif installWizardExists and handlerIds[i] eq handlerId>
									selected="selected"
								<cfelseif not installWizardExists and handlerIds[i] eq "">
									selected="selected"
								</cfif>
							>#handlerIds[i]#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4"><b>Or create a new handler</b></td>
			</tr>
			<tr>
				<td>Handler Id:</td>
				<td><input type="text" name="handlerId" size="20" value="#handlerIdFieldValue#"></td>
				<td>Handler File:</td>
				<td><input type="text" name="handlerFile" size="20" value="#handlerFile#"></td>
			</tr>
		</table>
		<input type="button" name="saveWizardBtn" value="Save" onClick="ColdFusion.navigate('collectWizardInformation.cfm?saveWizardBtn=1','Install_Wizards','','','POST','addWizardForm')">
		<hr>
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td><b>Wizard Pages</b></td>
			</tr>
		</table>
	</cfform>
	<cfset listPages()>
	<cfform name="addWizardForm1" action="collectWizardInformation.cfm" method="post">
		
		<input type="button" name="addPageBtn" value="Add Page" onClick="ColdFusion.navigate('collectWizardInformation.cfm?addPageBtn=1','Install_Wizards','','','POST','addWizardForm1')">
	</cfform>
	
</cffunction>

<cffunction name="processSaveWizard">
	<cfset installWizard = extInfo.getInstallWizard()>
	<cfif isSimplevalue(installWizard)>
		<cfset installWizard = createObject("component","extinfo.InstallWizard")>
		<cfset extInfo.setInstallWizard(installWizard)>
	</cfif>
	
	<cfif Form.wizardHeight eq "" or Form.wizardWidth eq "">
		<cfset ErrorMsg = "You must specify width and height of the wizard">
		<cfset showAddWizard()>
		<cfreturn>
	</cfif>
	
	<cfset installWizard.setHeight(Form.wizardHeight)>
	<cfset installWizard.setWidth(Form.wizardWidth)>
	
	<cfset handlerId = "">
	<cfset newHandlerId = Form.handlerId>
	<cfset newHandlerFile = Form.handlerFile>
	
	<cfif trim(newHandlerId) neq "" and trim(newHandlerFile) neq "">
		<cfset newHandler = createObject("component", "extinfo.Handler")>
		<cfset newHandler.setId(newHandlerId)>
		<cfset newHandler.setFileName(newHandlerFile)>
		<cfset newHandler.setGenerateResponse(false)>
		<cfset extInfo.addHandler(newHandler)>
		<cfset handlerId = newHandlerId>
	<cfelseif isDefined("Form.handlerIds") and Form.handlerIds neq "">
		<cfset newHandlerId = Form.handlerIds>
		<cfset tmpHandler = extInfo.getHandlerFromId(newHandlerId)>
		<cfset tmpHandler.setGenerateResponse(false)>
	<cfelse>
		<cfset ErrorMsg = "You must specify handler id for the wizard">
		<cfset showAddWizard()>
		<cfreturn>
	</cfif>
	
	<cfset installWizard.setHandlerId(newHandlerId)>

	<cfset showAddWizard()>
	
</cffunction>

<cffunction name="listPages" output="true" >
	
	<cfset installWizard = extInfo.getInstallWizard()>
	
	<cfif isSimplevalue(installWizard)>
		<div style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px;font-style:italic;"><br>No pages added</div>
		<cfreturn>
	</cfif>
	
	<cfset pages = installWizard.getPages()>
	<cfform name="listpagesForm" action="collectWizardInformation.cfm" method="post">
	<cfif ArrayLen(pages) eq 0>
			<h4 style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px;font-style:italic;" >No pages added</h4>
	<cfelse>
		<cfgrid name="pages_list" format="html">
				<cfgridcolumn name="no" header="No.">
				<cfgridcolumn name="title" header="Title">				
				<cfgridcolumn name="action" header="Actions">
				<cfloop index="i" from="1" to="#ArrayLen(pages)#">
						<cfset page = pages[i]>
						<cfgridrow data="#i#,#page.getTitle()#,<a href=""javascript:page_Action('deletePage@'+'#i#')"">Delete</a>/<a href=""javascript:page_Action('editPage@'+'#i#')"">Edit</a>">					
				</cfloop>
		</cfgrid>
	</cfif>
	</cfform>
			<!---
				<a href= "#'collectWizardInformation.cfm?action=deletePage&pageIndex=' & i#">Delete</a>
				<a href= "#'collectWizardInformation.cfm?action=editPage&pageIndex=' & i#">Edit</a>
			--->
	
</cffunction>

<cffunction name="showAddPage" output="true" >
	<cfargument name="pageIndex" required="false" >
	
	<cfset showError()>
	
	<cfset installWizard = extInfo.getInstallWizard()>
	<cfif isSimplevalue(installWizard)>
		<cfset errorMsg = "You must save wizard information before adding a page">
		<cfset showAddWizard()>
		<cfreturn>
	</cfif>
	
	<cfset pgIndex = -1>
	<cfif isDefined("Arguments.pageIndex") >
		<cfif Arguments.pageIndex lte 0>
			<cfset errorMsg = "You must save wizard page before adding input">
			<cfset showAddPage()>
			<cfreturn>
		</cfif>
		<cfset page = installWizard.getPageAt(arguments.pageIndex)>
		<cfset title = page.getTitle()>
		<cfset pgIndex = arguments.pageIndex>
	<cfelseif isDefined("Form.title")>
		<cfset title = "Form.title">
	<cfelse>
		<cfset title = "">
	</cfif>
	<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td><b>Wizard Page</b></td>
			</tr>
		</table>
	<cfform name="addPageForm" action="collectWizardInformation.cfm" method="post">
		<input type="hidden" name="pageIndex" value="#pgIndex#">
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
		
			<tr>
				<td>Title:</td>
				<td><input type="text" name="title" size="20" value="#title#"></td>
			</tr>
		</table>
		<input type="button" name="savePageBtn" value="Save" onClick="ColdFusion.navigate('collectWizardInformation.cfm?savePageBtn=1','Install_Wizards','','','POST','addPageForm')">
		<input type="button" name="newPageBtn" value="New Page" onClick="ColdFusion.navigate('collectWizardInformation.cfm?newPageBtn=1','Install_Wizards','','','POST','addPageForm1')">
		<hr>
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td><b>Page Inputs</b></td>
			</tr>
		</table>
	</cfform>
	
		<cfset listInputs(pgIndex)>
	<cfform name="addPageForm1" action="collectWizardInformation.cfm" method="post">
		<input type="hidden" name="pageIndex" value="#pgIndex#">
		<input type="button" name="addInputBtn" value="Add Input" onClick="ColdFusion.navigate('collectWizardInformation.cfm?addInputBtn=1','Install_Wizards','','','POST','addPageForm1')">
		<hr>
		<input type="button" name="donePageBtn" value="Done" onClick="ColdFusion.navigate('collectWizardInformation.cfm?donePageBtn=1','Install_Wizards','','','POST','addPageForm1')">
	</cfform>
</cffunction>

<cffunction name="processSavePage">
	<cfset pageIndex = Form.pageIndex>
	
	<cfif Form.title eq "">
		<cfset ErrorMsg = "Page title is a required filed">
		<cfset showAddPage(pageIndex)>
		<cfreturn>
	</cfif>
	
	<cfset installWizard = extInfo.getInstallWizard()>
	
	<cfif pageIndex gt 0>
		<cfset page = installWizard.getPageAt(pageIndex)>
	<cfelse>
		<cfset page = createObject("component","extinfo.WizardPage")>
		<cfset installWizard.addPage(page)>
		<cfset pageIndex = ArrayLen(installWizard.getPages())>
	</cfif>
	
	<cfset page.setTitle(Form.title)>
	
	<cfset showAddPage(pageIndex)>
	
</cffunction>

<cffunction name="listInputs" output="true">
	
	<cfargument name="pageIndex" type="numeric" required="true">
	<cfform name="listInputsForm" action="collectWizardInformation.cfm" method="post">
	<cfset installWizard = extInfo.getInstallWizard()>

	<cfif pageIndex gt 0>
		<cfset page = installWizard.getPageAt(pageIndex)>
		<cfset inputs = page.getInputs()>
	</cfif>
	
	<cfif pageIndex gt 0 and ArrayLen(inputs) gt 0>
		
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td><b>List of Inputs </b></td>
			</tr>
		</table>
	
			<cfgrid name="inputs_list" format="html">
				<cfgridcolumn name="no" header="No.">
				<cfgridcolumn name="name" header="Name">
				<cfgridcolumn name="type" header="Type">
				<cfgridcolumn name="action" header="Actions">
				
					<cfloop index="i" from="1" to="#ArrayLen(inputs)#">
						<cfset input = inputs[i]>
						<cfset parameter=#i#&"@"&#pageindex# >
						<cfgridrow data="#i#,#input.getName()#,#input.getType()#,<a href=""javascript:pageIP_Action('deleteInput@'+'#parameter#')"">Delete</a>/<a href=""javascript:pageIP_Action('editInput@'+'#parameter#')"">Edit</a>">					
					</cfloop>
			</cfgrid>
		<cfelse>
			<h4 style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px;font-style:italic;" >No input added</h4>
		</cfif>
		</cfform>
		<!---
					<a href= "#'collectWizardInformation.cfm?action=deleteInput&inputIndex=' & i & '&pageIndex=' & pageIndex #">Delete</a>
					<a href= "#'collectWizardInformation.cfm?action=editInput&inputIndex=' & i & '&pageIndex=' & pageIndex#">Edit</a>
				
	   --->
	
	
</cffunction>


<cffunction name="showAddInput">
	<cfargument name="pageIndex" required="true" type="numeric" >
	<cfargument name="inputIdex" required="false" type="numeric" >
	
	<cfset showError()>
	
	<cfif pageIndex lte 0>
		<cfset errorMsg = "Page must be saved before adding input">
		<cfset showAddPage(pageIndex)>
		<cfreturn>
	</cfif>

	<cfset installWizard = extInfo.getInstallWizard()>
	
	<cfset page = installWizard.getPageAt(pageIndex)>
	
	<cfset inptIndex = -1>
	
	<cfif isDefined("arguments.inputIdex")>
		<cfset inptIndex = arguments.inputIdex>
		<cfset input = page.getInputAt(inptIndex)>
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
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td><b>Wizard Page Input</b></td>
			</tr>
		</table>
		<cfform name="addWzInputForm" action="collectWizardInformation.cfm" method="post">
			<input type="hidden" name="pageIndex" value="#pageIndex#">
			<input type="hidden" name="inputIndex" value="#inptIndex#">
			
			<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
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
					<td><input type="checkbox" value="required" name="required"
						<cfif required>
							checked="yes" 
						</cfif>
 
					></td>
					<td colspan="2">Required</td>
				</tr>

			</table>
			<input type="button" name="saveWInputBtn" value="Save" onClick="ColdFusion.navigate('collectWizardInformation.cfm?saveWInputBtn=1','Install_Wizards','','','POST','addWzInputForm')">
			<hr>
			<input type="button" name="newInputBtn" value="New Input" onClick="ColdFusion.navigate('collectWizardInformation.cfm?newInputBtn=1','Install_Wizards','','','POST','addWzInputForm')">
			<input type="button" name="doneInputBtn" value="Done" onClick="ColdFusion.navigate('collectWizardInformation.cfm?doneInputBtn=1','Install_Wizards','','','POST','addWzInputForm')">
		</cfform>
	</cfoutput>
	
</cffunction>

<cffunction name="processSaveInput">
	<cfset var pageIndex = Form.pageIndex>
	<cfset var inputIndex = Form.inputIndex>
	
	<cfif pageIndex lte 0>
		<cfset ErrorMsg = "No page selected">
		<cfset showAddPage(pageIndex)>
		<cfreturn>
	</cfif>
	
	<cfif Form.inputName eq "">
		<cfset ErrorMsg = "Input name is a required field">
		<cfset showAddInput(pageIndex)>
		<cfreturn>
	</cfif>
	
	<cfset installWizard = extInfo.getInstallWizard()>
	
	<cfset page = installWizard.getPageAt(pageIndex)>
	
	<cfif inputIndex gt 0>
		<cfset input = page.getInputAt(inputIndex)>
	<cfelse>
		<cfset input = createObject("component","extinfo.MenuInput")>
		<cfset page.addInput(input)>
		<cfset inputIndex = ArrayLen(page.getInputs())>
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
	
	<cfset showAddInput(pageIndex,inputIndex)>
	
</cffunction>

<cffunction name="processUrlAction">
	<cfset action = Url.action>
	<cfif action eq "deletePage" or action eq "editPage">
		<cfset pageIndex = url.pageIndex>
		
		<cfif action eq "deletePage">
			<cfset deletePage(pageIndex)>
		<cfelseif action eq "editPage">
			<cfset editPage (pageIndex)>
		<cfelse>
			<cfreturn>
		</cfif>
	<cfelseif action eq "deleteInput" or action eq "editInput">
		<cfset inputIndex = url.inputIndex>
		<cfset pageIndex = url.pageIndex>
		
		<cfif action eq "deleteInput">
			<cfset deleteInput(pageIndex, inputIndex)>
		<cfelseif action eq "editInput">
			<cfset editInput (pageIndex, inputIndex)>
		<cfelse>
			<cfreturn>
		</cfif>
	</cfif>
</cffunction>

<cffunction name="deleteInput">
	<cfargument name="pageIndex" required="true">
	<cfargument name="inputIndex" required="true" >

	<cfset installWizard = extInfo.getInstallWizard()>

	<cfset page = installWizard.getPageAt(pageIndex)>
	<cfset page.deleteInputAt(inputIndex)>
	<cfset showAddPage(pageIndex)>
</cffunction>

<cffunction name="editInput">
	<cfargument name="pageIndex" required="true">
	<cfargument name="inputIndex" required="true" >
	
	<cfset showAddInput(pageIndex,inputIndex)>
</cffunction>

<cffunction name="deletePage">
	<cfargument name="pageIndex" required="true" >
	
	<cfset installWizard = extInfo.getInstallWizard()>
	<cfset installWizard.deletePageAt(pageIndex)>
	<cfset showAddWizard()>
</cffunction>

<cffunction name="editPage">
	<cfargument name="pageIndex" required="true">
	
	<cfset showAddPage(pageIndex)>
</cffunction>

<cffunction name="processNewPage">
	<cfset showAddPage()>
</cffunction>

<cffunction name="processDonePage">
	<cfset showAddWizard()>
</cffunction>

<cffunction name="showError" output="true">
	<cfif errorMsg neq "">
		<font color="red">#errorMsg#</font>
	</cfif>
</cffunction>