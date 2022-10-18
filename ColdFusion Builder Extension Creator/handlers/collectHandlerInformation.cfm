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

<cfif isDefined("url.saveHandlerBtn")>
	<cfset processSaveHandler()>
<cfelseif isDefined("url.newHandlerBtn")>
	<cfset processNewHandler()>
<cfelseif isDefined("url.action")>
	<cfset processUrlActions()>
<cfelseif isDefined("url.addHandlerBtn")>
	<cfset showAddHandler()>
<cfelse>
	<cfset listHandlers()>
</cfif>

<cffunction name="showAddHandler" output="true">
	<cfargument name="hdlrIndex" required="false"> 

	<cfset showError()>
	
	<cfset handlerIndex = -1>
	<cfif isDefined("arguments.hdlrIndex") and arguments.hdlrIndex gt 0 >
		<cfset handlerIndex = arguments.hdlrIndex>
		<cfset handler = extInfo.getHandlerAt(handlerIndex)>
		<cfset handlerId = handler.getId()>
		<cfset fileName = handler.getFileName()>
		<cfset generateResponse = handler.isGenerateResponse()>
		<cfset dlgWidth = handler.getDialogWidth()>
		<cfset dlgHeight = handler.getDialogHeight()>
		<cfset dlgTitle = handler.getDialogTitle()>
		<cfset notifyProjectCreation = handler.isNotifyOnProjectCreation()>
		<cfset dlgCloseHandlerFile = handler.getDialgCloseHandlerFile()>
	<cfelseif isDefined("Form.handlerId")>
		<cfset handlerId = Form.handlerId>
		<cfset fileName = Form.fileName>
		<cfif isDefined("Form.generateResponse")>
			<cfset generateResponse = true>
		<cfelse>
			<cfset generateResponse = false>
		</cfif>
		<cfset dlgWidth = Form.dialogWidth>
		<cfset dlgHeight = Form.dialogHeight>
		<cfset dlgTitle = Form.dialogTitle>
		<cfset dlgCloseHandlerFile = Form.dlgCloseHandler>
		<cfif isDefined("Form.onProjectCreationHandler")>
			<cfset notifyProjectCreation = true>
		<cfelse>
			<cfset notifyProjectCreation = false>
		</cfif>
	<cfelse>
		<cfset handlerId = "">
		<cfset fileName = "">
		<cfset generateResponse = true>
		<cfset dlgWidth = "">
		<cfset dlgHeight = "">
		<cfset dlgTitle = "">
		<cfset notifyProjectCreation = false>
		<cfset dlgCloseHandlerFile = "">
	</cfif>
	
	
	<form name="addHandlerForm" action="collectHandlerInformation.cfm" method="post">
		<input type="hidden" name="handlerIndex" value="#handlerIndex#">
		
		
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td><b>Handler details</b></td>
			</tr>
		</table>
				
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			
			<tr>
				<td>Id: </td>
				<td><input type="text" name="handlerId" size="20" value="#handlerId#"></td>
			</tr>
			<tr>
				<td>Handler File: </td>
				<td><input type="text" name="fileName" size="20" value="#fileName#"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="onProjectCreationHandler"
					<cfif notifyProjectCreation>
						checked="yes"
					</cfif>
				>
				</td>
				<td>Notify on project creation</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="generateResponse"
					<cfif generateResponse>
						checked="yes"
					</cfif>
				></td>
				<td>Generates response </td>
			</tr>
			<tr>
				<td colspan="2">Enter following information only if generating response :</td>
			</tr>
			<tr>
				<td>Dialog Title:</td>
				<td><input type="text" size="20" name="dialogTitle" value="#dlgTitle#"></td>
			</tr>
			
			<tr>
				<td>Dialog Width:</td>
				<td><input type="text" size="20" name="dialogWidth" value="#dlgWidth#"></td>
			</tr>
			<tr>
				<td>Dialog Height:</td>
				<td><input type="text" size="20" name="dialogHeight" value="#dlgHeight#"></td>
			</tr>
			<tr>
				<td>Close Handler File:</td>
				<td>
					<input type="text" name="dlgCloseHandler" size="20" value="#dlgCloseHandlerFile#">
				</td>
			</tr>

		</table>
		<input type="button" name="saveHandlerBtn" value="Save Handler" onClick="ColdFusion.navigate('collectHandlerInformation.cfm?saveHandlerBtn=1','Handlers','','','POST','addHandlerForm')">
		<input type="button" name="newHandlerBtn" value="New Handler" onClick="ColdFusion.navigate('collectHandlerInformation.cfm?newHandlerBtn=1','Handlers','','','POST','addHandlerForm')">
		<input type="button" name="doneBtn" value="Done" onClick="ColdFusion.navigate('collectHandlerInformation.cfm?doneBtn=1','Handlers','','','POST','addHandlerForm')">
	</form>
	<script type="text/javascript">
		function onload(){
			document.addMenuForm.handlerId.focus();
		}
	</script>			

</cffunction>

<cffunction name="listHandlers" output="true">
	
	<cfset handlers = extInfo.getHandlers()>
	<cfform name="NewHandlerForm" method="post" action="collectHandlerInformation.cfm">
	<cfif ArrayLen(handlers) gt 0>
		<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			<tr>
				<td><b>Handlers </b></td>
			</tr>
		</table>
	
			<cfgrid name="handler_list" format="html">
				<cfgridcolumn name="no" header="No.">
				<cfgridcolumn name="id" header="Id">
				<cfgridcolumn name="file" header="File">
				<cfgridcolumn name="action" header="Actions">
				<cfloop index="i" from="1" to="#ArrayLen(handlers)#">
					<cfset handler = handlers[i]>
					<cfgridrow data="#i#,#handler.getId()#,#handler.getFileName()#,<a href=""javascript:handler_Action('deleteHandler@'+'#i#')"">Delete</a>/<a href=""javascript:handler_Action('editHandler@'+'#i#')"">Edit</a>">
				</cfloop>
				
			</cfgrid>
		<cfelse>
			<h4 style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px;font-style:italic;" >No Handlers added</h4>
		</cfif>
		<br>
		<input type="button" name="addHandlerBtn" value="Add Handler" onClick="ColdFusion.navigate('collectHandlerInformation.cfm?addHandlerBtn=1','Handlers','','','POST','NewHandlerForm')">
	</cfform>

</cffunction>

<cffunction name="processSaveHandler">
	<cfset var handlerIndex = Form.handlerIndex>
	
	<cfif Form.handlerId eq "" or Form.fileName eq "">
		<cfset ErrorMsg = "Handler Id and File Name are required fields">
			<cfset showAddHandler()>
		<cfreturn>
	</cfif>
	
	<cfif handlerIndex gt 0>
		<cfset handler = extInfo.getHandlerAt(handlerIndex)>
	<cfelse>
		<cfset handler = createObject("component","extinfo.Handler")>
		<cfset extInfo.addHandler(handler)>
		<cfset handlerIndex = ArrayLen(extInfo.getHandlers())>
	</cfif>
	
	<cfset handler.setId(Form.handlerId)>
	<cfset handler.setFileName(Form.fileName)>

	<cfif isDefined("Form.generateResponse")>
		<cfif Form.generateResponse eq "on">
			<cfset handler.setGenerateResponse(true)>
		<cfelse>
			<cfset handler.setGenerateResponse(false)>
		</cfif>
	<cfelse>
			<cfset handler.setGenerateResponse(false)>
	</cfif>

	<cfif isDefined("Form.onProjectCreationHandler")>
		<cfif Form.onProjectCreationHandler eq "on">
			<cfset handler.setNotifyOnProjectCreation(true)>
		<cfelse>
			<cfset handler.setNotifyOnProjectCreation(false)>
		</cfif>
	<cfelse>
			<cfset handler.setNotifyOnProjectCreation(false)>
	</cfif>
	
	<cfset handler.setdialogTitle(Form.dialogTitle)>
	<cfset handler.setDialogWidth(Form.dialogWidth)>
	<cfset handler.setDialogHeight(Form.dialogHeight)>
	<cfset handler.setDialgCloseHandlerFile(Form.dlgCloseHandler)>
	<cfset showAddHandler(handlerIndex)>
	
</cffunction>

<cffunction name="deleteHandler">
	<cfargument name="handlerIndex" required="true">
	
	<cfset extInfo.deleteHandlerAt(handlerIndex)>
	<cfset listHandlers()>
</cffunction>

<cffunction name="editHandler">
	<cfargument name="handlerIndex" required="true">
	
	<cfset showAddHandler(handlerIndex)>
</cffunction>

<cffunction name="processNewHandler">
	<cfset showAddHandler()>
</cffunction>

<cffunction name="processUrlActions">
	<cfset action = Url.action>
	<cfif action eq "deleteHandler" or action eq "editHandler">
		<cfif not isDefined("url.handlerIndex")>
			<cfset listHandlers()>
			<cfreturn>
		</cfif>
		<cfset index = url.handlerIndex>
		
		<cfif action eq "deleteHandler">
			<cfset deleteHandler(index)>
		<cfelseif action eq "editHandler">
			<cfset editHandler(index)>
		<cfelse>
			<cfreturn>
		</cfif>
	</cfif>	
</cffunction>

<cffunction name="showError" output="true">
	<cfif errorMsg neq "">
		<font color="red">#errorMsg#</font>
	</cfif>
</cffunction>
