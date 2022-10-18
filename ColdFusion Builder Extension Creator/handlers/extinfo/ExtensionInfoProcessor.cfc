<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="ExtensionInfoProcessor" output="false" >
	<cfset this.extInfo = "">
	<cfset this.logContent = "">
	<cfset this.actionDialogCloseHandlerFiles = arrayNew(1)>
	
	
	<cffunction name="generateHTMLSummary" output="false" returntype="string" >
		<cfargument name="extnInfo" required="true" type="ExtensionInfo">
		
		<cfset this.extInfo = extnInfo>
		
		<cftry>
			<cfset this.extInfo.setValidExtension(true)>
			<cfset extnInfo.validate()>
			<cfcatch >
				<cfset this.extInfo.setValidExtension(false)>
				<cfset msg = replace(cfcatch.message,Chr(10) & Chr(13), "<br>", "all")>
				<cfreturn msg>
	        </cfcatch>
		</cftry>
		
		<cfsavecontent variable="summary">
			<cfoutput>
				<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
							<tr>
								<td><b>Extension #extnInfo.getExtensionName()# summary:</b></td>
							</tr>
				</table>
				<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
					
					<tr>
						<td><b>Installation Location: </b></td>
						<td>#extnInfo.getInstallLocation()#</td>
					</tr>
					<tr>
						<td><b>Create New Folder: </b></td>
						<td>#extnInfo.isCreateNewFolder()#</td>
					</tr>
					<tr>
						<td><b>Author: </b></td>
						<td>#extnInfo.getAuthor()#</td>
					</tr>
					<tr>
						<td><b>Version: </b></td>
						<td>#extnInfo.getVersion()#</td>
					</tr>
					<tr>
						<td><b>Email: </b></td>
						<td>#extnInfo.getEmail()#</td>
					</tr>
					<tr>
						<td><b>Description: </b></td>
						<td>#extnInfo.getDescription()#</td>
					</tr>
					<tr>
						<td><b>License: </b></td>
						<td>#extnInfo.getLicense()#</td>
					</tr>
				</table>
				<hr>
				<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
							<tr>
								<td><b>Menus</b></td>
							</tr>
				</table>
				<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
				<cfset menus = this.extInfo.getMenus()>
				<cfloop index="i" from="1" to="#ArrayLen(menus)#">
					<cfset printMenu(menus[i],i)>
                </cfloop>
				</table>
				<cfif not isSimplevalue(this.extInfo.getInstallWizard())>
					<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
								<tr>
									<td><b>Installation Wizard</b></td>
								</tr>
					</table>
					<cfset printWizard(this.extInfo.getInstallWizard())>
				</cfif>
			</cfoutput>
        </cfsavecontent>
		
		<cfreturn summary>
	</cffunction>

	<cffunction name="printWizard" output="true">
		<cfargument name="wizard" type="InstallWizard" required="true" >
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td><b>Install Wizard Width:</b></td>
				<td>#wizard.getWidth()#</td>
			</tr>		
			<tr>
				<td><b>Install Wizard Height:</b></td>
				<td>#wizard.getHeight()#</td>
			</tr>
			<tr>
				<td><b>Handler Id:</b></td>
				<td>#wizard.getHandlerId()#</td>
			</tr>
			<tr>
				<td><b>Handler Name:</b></td>
				<td>#getHandlerFileName(wizard.getHandlerId())#</td>
			</tr>
			<tr>
				<td colspan=2>
					<cfset pages = wizard.getPages()>
					<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
						<tr><td>Wizard Pages</td></tr>
					</table>
					<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
					<cfloop index="i" from="1" to="#ArrayLen(pages)#">
						<tr>
							<td valign="top"><b>#i#.</b></td>
							<td valign="top">
								<cfset printWizardPage(pages[i])>
							</td>
						</tr>
                    </cfloop>
					</table>
				</td>
			</tr>
		</table>
		
	</cffunction>
	
	<cffunction name="printWizardPage" output="true">
		<cfargument name="page" required="true" type="WizardPage">
							<b>Page Title:</b> #page.getTitle()# <br>
							<b>Inputs:</b>
							<cfset inputs = page.getInputs()>
							<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
								<cfloop index="i" from="1" to="#ArrayLen(inputs)#">
									<cfset printInput(inputs[i],i)>
								</cfloop>
							</table>		
	</cffunction>

	<cffunction name="printMenu" output="true">
		<cfargument name="menu" type="Menu" required="true" >
		<cfargument name="index" required="true" >
		
		<tr>
			<td valign="top">#arguments.index#</td>
			<td>
				<b>Menu Name:</b> #menu.getName()#,
				<b>Target:</b> #menu.getTarget()#
				<cfset actions = menu.getActions()>	
				<!---<b>Actions:</b>--->
				<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
				<cfloop index="i" from="1" to="#ArrayLen(actions)#">
					<cfset printAction(actions[i],i)>
				</cfloop>
				</table>
				<!---<b>Filters:</b>--->
				<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
				<cfset filters = menu.getFilters()>	
				<cfloop index="i" from="1" to="#ArrayLen(filters)#">
					<cfset printFilter(filters[i],i)>
				</cfloop>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
	</cffunction>
	
	<cffunction name="printAction" output="true">
		<cfargument name="action" type="MenuAction" required="true">
		<cfargument name="index" required="true" >
		
		<tr>
			<td valign="top">#arguments.index#</td>
			<td>
				<b>Action Name:</b> #action.getName()#,
				<b>Handler Id:</b> #action.getHandlerId()#,
				<b>Handler File:</b> #getHandlerFileName(action.getHandlerId())#
				<b>Dialog Title:</b> #action.getDialogTitle()#,
				<cfif action.getInputDialogWidth() gt 0>
					<b>Dialog Width:</b> #action.getInputDialogWidth()#,
				</cfif>
				<cfif action.getInputDialogHeight() gt 0>
					<b>Dialog Height:</b> #action.getInputDialogHeight()#,
				</cfif>
				<!---<b>Inputs:</b>--->
				<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
				<cfset inputs = action.getInputs()>	
				<cfloop index="i" from="1" to="#ArrayLen(inputs)#">
					<cfset printInput(inputs[i],i)>
				</cfloop>
				</table>	
			</td>
		</tr>
	</cffunction>
	
	<cffunction name="printInput" output="true">
		<cfargument name="input" type="MenuInput" required="true">
		<cfargument name="index" required="true" >
		
		<tr>
			<td valign="top">#arguments.index#</td>
			<td>
				<b>Input Name:</b> #input.getName()#<br>
				<b>Type:</b> #input.getType()# <br>
				<cfif input.getLabel() neq "">
					<b>Label:</b> #input.getLabel()# <br>
				</cfif>
				<cfif input.getDefault() neq "">
					<b>Default:</b> #input.getDefault()# <br>
				</cfif>
				<cfif input.getErrorMessage() neq "">
					<b>Error Message:</b> #input.getErrorMessage()# <br>
				</cfif>
				<cfif input.getHelpMessage() neq "">
					<b>Help Message:</b> #input.getHelpMessage()# <br>
				</cfif>
				<cfif input.getPattern() neq "">
					<b>Pattern:</b> #input.getPattern()# <br>
				</cfif>
				<cfif input.getTooltip() neq "">
					<b>Tooltip:</b> #input.getTooltip()# <br>
				</cfif>
				<cfif input.isChecked() neq "">
					<b>Checked:</b> #input.isChecked()# <br>
				</cfif>
				<cfif input.isRequired() neq "">
					<b>Required:</b> #input.isrequired()# <br>
				</cfif>
			</td>
		</tr>
	</cffunction>
	
	<cffunction name="printFilter" output="true">
		<cfargument name="filter" type="MenuFilter" required="true">
		<cfargument name="index" required="true" >
		
		<tr>
			<td valign="top">#arguments.index#</td>
			<td>
				<b>Type:</b> #filter.getType()#<br>
				<b>Pattern:</b> #filter.getPattern()# <br>
			</td>
		</tr>
	</cffunction>	

	<cffunction name="getHandlerFileName">
		<cfargument name="handlerId" required="true">
		<cfset handler = this.extInfo.getHandlerFromId(handlerId)>
		<cfreturn handler.getFileName()>	
	</cffunction>
	
	<cffunction name="generateExtension" returntype="boolean" >
		<cfargument name="extnInfo" required="true" type="ExtensionInfo">
		
		<cfset this.extInfo = extnInfo>
		
		<cftry>
			<cfset this.extInfo.validate()>
			<cfcatch >
				<cfset msg = replace(cfcatch.message,Chr(13) & Chr(10), "<br>", "all")>
				<cfreturn msg>
	        </cfcatch>
		</cftry>
		
		<cfset this.logContent = "<ul>">
		
		<cfset appendToLog("<table style=""font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px"">")>
		<cfset appendToLog("<tr><td>")>
		
		<cfset installFolder = createFiles()>
		
		<cfif isDefined("installFolder")>
			<cfset appendToLog("<p>Extension has been installed at " & installFolder & "<br>" &
			"<p>You can test this extension by importing this folder from menu " &
			"Windows->Preferences->ColdFusion->Extensions and click import button."
			 )>
		</cfif>

		<cfset appendToLog("</td></tr></table><br>")>
		
		<cfset installFolder = installFolder & "<ul>">		
		
		<cfreturn true>
	</cffunction>	
	
	<cffunction name="generateIDEconfig" returntype="String" access="private" > 
		<cfsavecontent variable="result">
			<cfoutput>
<application>
	<name>#this.extInfo.getExtensionName()#</name>
	<cfif this.extInfo.getAuthor() neq "">
	<author>#this.extInfo.getAuthor()#</author>
	</cfif>
	<cfif this.extInfo.getVersion() neq "">
	<version>#this.extInfo.getVersion()#</version>
	</cfif>
	<cfif this.extInfo.getEmail() neq "">
	<email>#this.extInfo.getEmail()#</email>
	</cfif>
	<cfif this.extInfo.getDescription() neq "">
	<description>#this.extInfo.getDescription()#</description>
	</cfif>
	<cfif this.extInfo.getLicense() neq "">
	<license>#this.extInfo.getLicense()#</license>
	</cfif>
	
	<cfset generateWizard()>
	<cfset generateMenuContributions()>
	<cfset generateOnProjectCreateEvent()>
	<cfset generateHandlers()>
</application>				
			</cfoutput>
        </cfsavecontent>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="generateWizard" access="private">
		<cfset wizard =  this.extInfo.getInstallWizard()>
		<cfif isSimplevalue(wizard)>
			<cfreturn>
		</cfif>
		<cfoutput>
		<wizard height="#wizard.getHeight()#" width="#wizard.getWidth()#" handlerid="#wizard.getHandlerId()#" >
			<cfset pages = wizard.getPages()>
			<cfloop index="i" from="1" to="#ArrayLen(pages)#">
				<cfset generateWizardPage(pages[i])>
			</cfloop>
		</wizard>
		</cfoutput>
	
	</cffunction>
	
	<cffunction name="generateWizardPage">
		<cfargument name="page" required="true" type="WizardPage">
			<cfoutput>
			<page title="#page.getTitle()#">
				<cfset inputs = page.getInputs()>
				<cfloop index="i" from="1" to="#ArrayLen(inputs)#">
					<cfset generateInput(inputs[i])>
				</cfloop>
			</page>
			</cfoutput>
	</cffunction>
	
	<cffunction name="generateHandlers" access="private" >
	<handlers>
		<cfset handlers = this.extInfo.getHandlers()>
		<cfloop index="handlerIndex" from="1" to="#ArrayLen(handlers)#">
			<cfset generateHandler(handlers[handlerIndex])>
		</cfloop>
	</handlers>
	</cffunction>
	
	<cffunction name="generateOnProjectCreateEvent" access="private">
		<cfset handlers = this.extInfo.getHandlers()>
		<cfloop index="handlerIndex" from="1" to="#ArrayLen(handlers)#">
			<cfset handler = handlers[handlerIndex]>
			<cfif handler.isNotifyOnProjectCreation()>
				<cfset projectNotifyHandler = handler>
				<cfbreak>
			</cfif>
		</cfloop>
		<cfif isDefined("projectNotifyHandler")>
			<cfoutput>
		<events>
			<event type="onprojectcreate" handlerId="#projectNotifyHandler.getId()#"/>
		</events>
			</cfoutput>
		</cfif>
	</cffunction>
	
	<cffunction name="generateMenuContributions" access="private" >
	<cfoutput>
	<menucontributions>
		<cfset menus = this.extInfo.getMenus()>
		<cfset tmpSt = StructNew()>
		
		<cfloop index="i" from="1" to="#ArrayLen(menus)#">
			<cfset target = menus[i].getTarget()>
			<cfif not StructKeyexists(tmpSt,target)>
				<cfset structinsert(tmpSt,target,ArrayNew(1))>
			</cfif>
			<cfset ArrayAppend(tmpSt[#target#],menus[i])>
		</cfloop>
		
		<cfset keyList = StructKeylist(tmpSt)>
		
		<cfloop list="#keyList#" index="targetName">
			<cfset menusInTarget = tmpSt[#targetName#]>
			<cfset generateMenuContribution(targetName, menusInTarget)>
        </cfloop>
		
	</menucontributions>
	</cfoutput>	
	</cffunction>
	
	<cffunction name="generateMenuContribution" access="private" >
		<cfargument name="targetName" required="true" type="String" >
		<cfargument name="menus" required="true" type="Array">
		
		<cfoutput>
		<contribution target="#targetName#">
		<cfloop index="menuIndex" from="1" to="#ArrayLen(menus)#">
			<menu name="#menus[menuIndex].getName()#">
			
				<cfset filters = menus[menuIndex].getFilters()>
				<cfif ArrayLen(filters) gt 0>
				<filters>
				</cfif>
				<cfloop index="filterIndex" from="1" to="#ArrayLen(filters)#">
					<cfset generateFilter(filters[filterIndex])>
                </cfloop>
				<cfif ArrayLen(filters) gt 0>
				</filters>
				</cfif>
				
				<cfset actions = menus[menuIndex].getActions()>
				<cfloop index="actionIndex" from="1" to="#ArrayLen(actions)#">
					<cfset generateAction(actions[actionIndex])>
				</cfloop>
			</menu>		
        </cfloop>		
		</contribution>			
		</cfoutput>
	</cffunction>
	
	<cffunction name="generateAction" access="private" >
		<cfargument name="action" type="MenuAction" required="true" >
		
		<cfoutput>
				<action name="#action.getName()#" handlerid="#action.getHandlerId()#" <cfif action.isShowResponse()>showresponse="true"</cfif>>
					<cfset dlgHeight = action.getInputDialogHeight()>
					<cfset dlgWidth = action.getInputDialogWidth()>
					<dialog
					<cfif action.getDialogTitle() neq "">
						title="#action.getDialogTitle()#"
					</cfif>
					<cfif dlgheight gt 0 and dlgWidth gt 0>
						height="#dlgHeight#" width="#dlgWidth#"
					</cfif>
					<cfif action.getDialgCloseHandlerFile() neq "">
						dialogclosehandler="#action.getDialgCloseHandlerFile()#"
						<cfset arrayAppend(this.actionDialogCloseHandlerFiles,action.getDialgCloseHandlerFile())>
					</cfif>
					>
						<cfset inputs = action.getInputs()>
						<cfloop index="i" from="1" to="#ArrayLen(inputs)#">
							<cfset generateInput(inputs[i])>
						</cfloop>
					</dialog>
				</action>
		</cfoutput>
	</cffunction>
	
	<cffunction name="generateInput" access="private">
		<cfargument name="input" type="MenuInput" required="true" >
		
		<cfoutput>
						<input name="#input.getName()#" type="#input.getType()#"
						<cfif input.getDefault() neq "">
								default="#input.getDefault()#"
						</cfif>
						<cfif input.getErrorMessage() neq "">
								errormessage="#input.getErrorMessage()#"
						</cfif>
						<cfif input.getHelpMessage() neq "">
								helpmessage="#input.getHelpMessage()#"
						</cfif>
						<cfif input.getLabel() neq "">
								label="#input.getLabel()#"
						</cfif>
						<cfif input.getPattern() neq "">
								pattern="#input.getPattern()#"
						</cfif>
						<cfif input.getTooltip() neq "">
								tooltip="#input.getTooltip()#"
						</cfif>
						<cfif input.isChecked() neq "">
								checked="#input.isChecked()#"
						</cfif>
						<cfif input.isRequired() neq "">
								required="#input.isRequired()#"
						</cfif>
						/>
		</cfoutput>
	</cffunction>
	
	<cffunction name="generateFilter" access="private" >
		<cfargument name="filter" required="true" type="MenuFilter">
		
		<cfoutput >
					<filter type="#filter.getType()#" pattern="#filter.getPattern()#"/>
        </cfoutput>
		
	</cffunction>
	
	<cffunction name="generateHandler" access="private" >
		<cfargument name="handler" required="true" type="Handler">
		<cfoutput>
		<handler id="#handler.getId()#" type="#handler.getType()#" filename="#handler.getFileName()#" />
		</cfoutput>
    </cffunction>
	
	<cffunction name="createFiles" access="private" output="false" returntype="String" >
	
		<cfset ideConfigTxt = generateIDEconfig()>
		<cfset ideConfigTxt = trimLines(ideConfigTxt)>

		<cfset installFolder = this.extInfo.getInstallLocation()>
		<cfset createNewFolder = this.extInfo.isCreateNewFolder()>
		
		<cfif createNewFolder>
			<cfset installFolder = installFolder & "/" & this.extInfo.getExtensionName()>
		</cfif>
		
		<!--- First create a folder --->
		<cfif not DirectoryExists(installFolder)>
			<cfdirectory directory="#installFolder#" action="create" >
			<cfset appendToLog("<p>Created folder " & installFolder & "<br>")>
		</cfif>
		
		<cfset ideConfigPath = installFolder & "/" & "ide_config.xml">
		<cffile action="write" file="#ideConfigPath#" output="#ideConfigTxt#">
		<cfset appendToLog("<p>Created file " & ideConfigPath & "<br>")>
		
		<cfset currTemplatePath = expandpath(".")>
		<cfset currTemplateFolder = getDirectoryfrompath(currTemplatePath)>
		<cfset templateFolderPath = currTemplateFolder & "/handlers/template">
		
		<!--- create handlers folder --->
		<cfset handlerDirPath = installFolder & "/" & "handlers">
		<cfif not Directoryexists(handlerDirPath)>
			<cfdirectory directory="#handlerDirPath#" action="create" >
			<cfset appendToLog("<p>Created folder " & handlerDirPath & "<br>")>
		</cfif>
		
		<cfset handlers = this.extInfo.getHandlers()>
		<cfloop index="handlerIndex" from="1" to="#ArrayLen(handlers)#">
			<cfset handlerPath = handlerDirPath & "/" & handlers[handlerIndex].getFileName()>
				<cfset createHandlerFile(handlers[handlerIndex],templateFolderPath,handlerDirPath, handlerPath)>
		</cfloop>
		
		<!--- create comopnents folder under handlers folder --->
		<cfset frameworkDirPath = handlerDirPath & "/" & "framework">
		<cfif not Directoryexists(frameworkDirPath)>
			<cfdirectory directory="#frameworkDirPath#" action="create" >
			<cfset appendToLog("<p>Created folder " & frameworkDirPath & "<br>")>
		</cfif>
		
		<!--- create dialog close handler files for menu actions --->
		<cfif arraylen(this.actionDialogCloseHandlerFiles) gt 0>
			<cfloop index="i" from="1" to="#arraylen(this.actionDialogCloseHandlerFiles)#">
				<cfset createDialogCloseHandler(this.actionDialogCloseHandlerFiles[i],templateFolderPath,handlerDirPath)>
			</cfloop>
		</cfif>
		
		
		<!--- copy files to component folder --->
		<cfset extGenCompFolder = currTemplateFolder & "handlers/framework">
		<cfdirectory action="list" name="dirList" directory="#extGenCompFolder#">
		
		<cfloop query="dirList" >
			<cffile action="copy" source="#extGenCompFolder & '/' & name#"  destination="#frameworkDirPath#">
        </cfloop>
		<cfset appendToLog("<p>Copied framework files to " & frameworkDirPath & "<br>")>
		
		<!--- create application.cfm --->
		<cfset createApplicationCfm(templateFolderPath ,handlerDirPath)>
		
		<cfreturn installFolder>
		
	</cffunction>
	
	<cffunction name="createDialogCloseHandler">
		<cfargument name="handlerFileName" type="string" required="true">
		<cfargument name="templateFolderPath" type="String" required="true" >
		<cfargument name="handlerFolderPath" type="String" required="true" >

		<cfset handlerFilePath = arguments.handlerFolderPath & "/" & arguments.handlerFileName>		
		<cfset handlerTemplatePath = templateFolderPath & "/dialogCloseHandler.cfm.txt">
		<cffile action="copy" source="#handlerTemplatePath#" destination="#handlerFilePath#">
		<cfset appendToLog("<p>Created dialog close handler file " & handlerFilePath & "<br>")>
	</cffunction>
	
	<cffunction name="trimLines">
		<cfargument name="data" required="true" type="string" >
		<cfset result="">
		<cfloop list="#data#" delimiters="#chr(13)& chr(10)#" index="line">
			<cfset trimmmedLine = trim(line)>
			<cfif Len(trimmmedLine) gt 0>
				<cfset result = result & chr(13)& chr(10) & line>
			</cfif>
        </cfloop>
		<cfreturn result>
    </cffunction>
	
	<cffunction name="createHandlerFile" access="private" >
		<cfargument name="handler" type="Handler" required="true">
		<cfargument name="templateFolderPath" required="true" >
		<cfargument name="handlerFolderPath" required="true">
		<cfargument name="handlerFilePath" required="true" >
		
		<cfif handler.getDialgCloseHandlerFile() neq "">
			<cfset createDialogCloseHandler(handler.getDialgCloseHandlerFile(),templateFolderPath, handlerFolderPath)>
		</cfif>
		
		<cfif not handler.isGenerateResponse()>
			<cfset handlerTemplatePath = templateFolderPath & "/handlerWithNoResponse.cfm.txt">
			<cffile action="copy" source="#handlerTemplatePath#" destination="#handlerFilePath#">
			<cfset appendToLog("<p>Created handler file " & handlerFilePath & "<br>")>
			<cfreturn >
		<cfelse>			
			<cfset handlerHelperPath = templateFolderPath & "/handlerHelper.cfm.txt">
			<cfset helperTemplateName = handler.getId() & "_helper.cfm">
			<cfset handlerHelperDestinationPath = handlerFolderPath & "/" & helperTemplateName>
			<cffile action="copy" source="#handlerHelperPath#" destination="#handlerHelperDestinationPath#">
			<cfset appendToLog("<p>Created handler helper file " & handlerHelperPath & "<br>")>

			<cfset handlerTemplatePath = templateFolderPath & "/handlerWithResponse.cfm.txt">
			
			<cfset appLockName = this.extInfo.getExtensionName() & "Lock">
			<cfset dialogTitle = handler.getDialogTitle()>
			<cfif dialogTitle eq "">
				<cfset dialogTitle = "Untitled">
			</cfif>
			
			<cfset dialogWidth = handler.getDialogWidth()>
			<cfif dialogWidth eq "" or dialogWidth eq 0>
				<cfset dialogWidth = 500>
			</cfif>
			
			<cfset dialogHeight = handler.getDialogHeight()>
			<cfif dialogHeight eq "" or dialogHeight eq 0>
				<cfset dialogHeight = 400>
			</cfif>
			
			<cfset javaBufferedReader = createJavaBufferedReader(handlerTemplatePath)>
			
			<cfset isEOF = false>
			
			<cfset handlerContent = "">
			
			<cfset dlgCloseHandlerFile = "">
			<cfif handler.getDialgCloseHandlerFile() neq "">
				<cfset dlgCloseHandlerFile = "dialogclosehandler=""" & handler.getDialgCloseHandlerFile() & """">
			</cfif>
			
			<cfloop condition="not isEOF">
				<cfset line = javaBufferedReader.readLine()>
				<cfif not isDefined("line")>
					<cfset isEOF = true>
					<cfbreak>
				</cfif>
				<cfset line = replace(line,"$$ApplicationLockName$$",appLockName,"all")>
				<cfset line = replace(line,"$$HelperTemplateName$$",helperTemplateName,"all")>
				<cfset line = replace(line,"$$DialogHeight$$",dialogHeight,"all")>
				<cfset line = replace(line,"$$DialogWidth$$",dialogWidth,"all")>
				<cfset line = replace(line,"$$DialogTitle$$",dialogTitle,"all")>
				<cfset line = replace(line,"$$DialogCloseHandler$$",dlgCloseHandlerFile,"all")>
				<cfset handlerContent = handlerContent & chr(13)& chr(10) & line>
	        </cfloop>	
			
			<cfset javaBufferedReader.close()>
			
			<cffile action="write" file="#handlerFilePath#" output="#handlerContent#">
			<cfset appendToLog("<p>Created handler file " & handlerFilePath & "<br>")>
			
		</cfif>		
		
	</cffunction>
	
	<cffunction name="createApplicationCfm" output="false">
		<cfargument name="templateFolderPath" required="true" >
		<cfargument name="handlerDirPath" required="true" >
		
		<cfset appFileTemplatePath = templateFolderPath & "/application.cfm.txt">
		
		<cfset newAppFileContent = "">
		
		<cfset javaBufferedReader = createJavaBufferedReader(appFileTemplatePath)>
		
		<cfset isEOF = false>
		
		<cfloop condition="not isEOF">
			<cfset line = javaBufferedReader.readLine()>
			<cfif not isDefined("line")>
				<cfset isEOF = true>
				<cfbreak>
			</cfif>
			<cfset line = replace(line,"$$ExtensionName$$",this.extInfo.getExtensionName(),"all")>
			<cfset newAppFileContent = newAppFileContent & chr(13)& chr(10) & line>
        </cfloop>	
		
		<cfset javaBufferedReader.close()>
		
		<cfset outputFilePath = handlerDirPath & "/" & "Application.cfm">
		<cffile action="write" file="#outputFilePath#" output="#newAppFileContent#">
		<cfset appendToLog("<p>Created application.cfm at " & outputFilePath & "<br>")>
		
	</cffunction>
	
	<cffunction name="createJavaBufferedReader">
		<cfargument name="filePath" required="true">
		
		<cfset javaFileReader = createObject("java", "java.io.FileReader")>
		<cfset javaFileReader.init(filePath)>
		<cfset javaBufferedReader = createObject("java","java.io.BufferedReader")>
		<cfset javaBufferedReader.init(javaFileReader)>
		
		<cfreturn javaBufferedReader>
	</cffunction>

	<cffunction name="appendToLog">
		<cfargument name="message" required="true">
		<cfset this.logContent = this.logContent & message & Chr(13) & Chr(10)>
	</cffunction>
	
	<cffunction name="getLogContent">
		<cfreturn this.logContent>
	</cffunction>	
</cfcomponent>
