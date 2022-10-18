<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfajaximport tags="cfform,cfgrid,cfwindow">

<script type="text/javascript">

	function menu_Action(str){
		var temp = str.split('@');
		var action = temp[0]; var i = temp[1]; 
		var url= "collectMenuInformation.cfm?action="+action+"&index="+i;
		ColdFusion.navigate(url,'Menu_Contributions','','','POST','ListMenuForm');
	}
	function action_Action(str){
		var temp = str.split('@');
		var action = temp[0]; var i = temp[1]; var menuindex=temp[2]; 
		var url= "collectMenuInformation.cfm?action="+action+"&actionindex="+i+"&menuindex="+menuindex;
		ColdFusion.navigate(url,'Menu_Contributions','','','POST','listActionForm');
	}
	
	function input_Action(str){
		var temp = str.split('@');
		var action = temp[0]; var i = temp[1]; var actionindex=temp[2]; var menuindex=temp[3]; 
		
		var url= "collectMenuInformation.cfm?action="+action+"&inputindex="+i+"&actionindex="+actionindex+"&menuindex="+menuindex;
		ColdFusion.navigate(url,'Menu_Contributions','','','POST','listInputsForm');
	}
	function filter_Action(str){
		var temp = str.split('@');
		var action = temp[0]; var i = temp[1]; var filterindex=temp[2]; var menuindex=temp[3]; 
		
		var url= "collectMenuInformation.cfm?action="+action+"&filterindex="+i+"&menuindex="+menuindex;
		ColdFusion.navigate(url,'Menu_Contributions','','','POST','listFiltersForm');
	}
	function page_Action(str){
		var temp = str.split('@');
		var action = temp[0]; var i = temp[1];
		var url= "collectWizardInformation.cfm?action="+action+"&pageIndex="+i;
		ColdFusion.navigate(url,'Install_Wizards','','','POST','listpagesForm');
	}
	function pageIP_Action(str){
		var temp = str.split('@');
		var action = temp[0]; var i = temp[1]; var pageindex=temp[2]; 
		var url= "collectWizardInformation.cfm?action="+action+"&inputindex="+i+"&pageindex="+pageindex;
		ColdFusion.navigate(url,'Install_Wizards','','','POST','listInputsForm');
	}
	function handler_Action(str){
		var temp = str.split('@');
		var action = temp[0]; var i = temp[1]; 
		var url= "collectHandlerInformation.cfm?action="+action+"&handlerIndex="+i;
		ColdFusion.navigate(url,'Handlers','','','POST','NewHandlerForm');
	}
</script>

<cfset pagePath = Session.utilComp.getURLBasePath() & "/">

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
	
<cfset url1 = pagePath & "collectExtensionDetails.cfm" >
<cfset url2 = pagePath & "collectMenuInformation.cfm">
<cfset url3 = pagePath & "collectHandlerInformation.cfm">
<cfset url4 = pagePath & "collectWizardInformation.cfm">
<cfset url5 = pagePath & "cancel.cfm">
<cfset url6 = pagePath & "finish.cfm">
	
<cflayout type="vbox" name="main">
	<cflayoutarea name="tabs">
		<cflayout name="outer" type="tab" tabheight="470">
			<cflayoutarea name="Extension_Details" title="Extension Details" source=#url1# style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px" >
        	</cflayoutarea>
			<cflayoutarea name="Menu_Contributions" title="Menu Contributions"  source=#url2# style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px" >
			</cflayoutarea>
			<cflayoutarea name="Handlers" title="Handlers"  source=#url3# style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px" >
			</cflayoutarea>
			<cflayoutarea name="Install_Wizards" title="Install Wizards" source=#url4# style="font-family:Arial, Helvetica, sans-serif;font-size:12;margin:5px">
			</cflayoutarea>
		</cflayout>
	</cflayoutarea>
	<cflayoutarea name="buttons">
<!---	
		<div name= "help" align="left" style="margin:10px">
			<img src=".././icons/help.png" href="">
		</div>
--->		
		<div align="right">
			<table>
				<tr>
					<td colspan="1"><input type="button" name="cancelBtn" value="Cancel" onclick="ColdFusion.navigate('cancel.cfm')"></td>
					<td colspan="1"><input type="button" name="finishBtn" value="Finish" onclick="ColdFusion.navigate('finish.cfm')"></td>
				</tr>
			</table>
		</div>
	</cflayoutarea>
</cflayout>

