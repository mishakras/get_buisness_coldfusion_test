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

<cfif isDefined("Form.cancelBtn")>
	<cfinclude template="cancel.cfm" >
	<cfabort >
<cfelseif isDefined("Form.finishBtn")>
	<cfinclude template="finish.cfm" >
	<cfabort>
</cfif>

<cfif isDefined("URL.saveBtn")>
	<cfif Form.name eq "">
		<cfset errorMsg = "Extension name is a required field">
	<cfelse>
		<cfset extInfo.setExtensionName(trim(Form.name))>
		<cfset extInfo.setAuthor(trim(Form.author))>
		<cfset extInfo.setVersion(trim(Form.version))>
		<cfset extInfo.setEmail(trim(Form.email))>
		<cfset extInfo.setDescription(trim(Form.desc))>
		<cfset extInfo.setlicense(trim(Form.license))>
	</cfif>
</cfif>

<cfif isDefined("url.genId")>
	<cfset ideeventinfo = application[#url.genid#]>
	<cfset application[#url.genid#] = "">
	
	<cfset StructClear(Session)>
	<cfset Session.extInfo = createObject("component", "extinfo.ExtensionInfo")>
	<cfset extInfo = Session.extInfo>
	
	<cfset requestProcessor = createObject("component","framework.RequestProcessor") >
	
	<cfset requestInfo = requestProcessor.parseRequest(#ideeventinfo#)>
	
	<cfset userDefinedFields  = requestInfo.getUserDefinedFileds()>
	<cfif ArrayLen(userDefinedFields) gt 0>
	 	<cfloop index="i" from="1" to="#arraylen(userDefinedFields)#">
	 		<cfset udf = userDefinedFields[i]>
			<cfset name = udf.getName()>
			<cfset value = udf.getValue()>
			<cfif name eq "location">
				<cfset extInfo.setInstallLocation(value)>
			<cfelseif name eq "createFolder" and value eq "false">
				<cfset extInfo.setCreateNewFolder(false)>
			</cfif>
	     </cfloop>
	</cfif>
	
	<cfset projectInfo = requestInfo.getProjectInfo()>
	<cfset extInfo.setProjectName(projectInfo.getProjectName())>
	<cfset extInfo.setProjectPath(projectInfo.getProjectLocation())>

</cfif>

<cfset extInfo = Session.extInfo>

<cfif isDefined("URL.saveBtn")>
	<cfset extName = Form.name>
	<cfset author = Form.author>
	<cfset version = Form.version>
	<cfset email = Form.email>
	<cfset desc = Form.desc>
	<cfset license = Form.license>
<cfelse>
	<cfset extName = trim(extInfo.getExtensionName())>
	<cfset author = trim(extInfo.getAuthor())>
	<cfset version = trim(extInfo.getVersion())>
	<cfset email = trim(extInfo.getEmail())>
	<cfset desc = trim(extinfo.getDescription())>
	<cfset license = trim(extInfo.getLicense())>
</cfif>

<cfoutput >
<html>
	<body>
		#showError()#
		<form method="post" action="collectExtensionDetails.cfm" name="ExtDetailsForm" >
		
			<table style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
				<tr>
					<td>Extension Name: </td>
					<td><input name="name" type="text" size="40" value="#extName#"></td>
				</tr>
				<tr>
					<td>Author:</td>
					<td><input name="author" type="text" size="40" value="#author#"></td>
				</tr>
				<tr>
					<td>Version:</td>
					<td><input name="version" type="text" size="40" value="#version#"></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input name="email" type="text" size="40" value="#email#"></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td>
						<textarea rows="4" name="desc" cols="40" >#desc#</textarea>
					</td>
				</tr>
				<tr>
					<td>License:</td>
					<td>
						<textarea rows="6" name="license" cols="40">#license#</textarea>
					</td>
				</tr>
			</table>
			<div>
				<table>
					<tr>
						<td colspan="1">
							<input type="button" name="saveBtn" value="Save" onclick="ColdFusion.navigate('collectExtensionDetails.cfm?saveBtn=1','Extension_Details','','','POST','ExtDetailsForm')">
						</td>
					</tr>
				</table>
			</div>
			<br><br>
		</form>
		
		<script type="text/javascript">
			function onload(){
				document.ExtDetailsForm.name.focus();
			}			
		</script>			
	</body>
</html>
</cfoutput>

<cffunction name="showError" output="true">
	<cfif errorMsg neq "">
		<font color="red">#errorMsg#</font>
	</cfif>
</cffunction>
