<!---
LICENSE INFORMATION:

Copyright 2010, Joe Rinehart, Dan Wilson

Licensed under the Apache License, Version 2.0 (the "License"); you may not 
use this file except in compliance with the License. 

You may obtain a copy of the License at 

	http://www.apache.org/licenses/LICENSE-2.0 
	
Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
CONDITIONS OF ANY KIND, either express or implied. See the License for the 
specific language governing permissions and limitations under the License.

VERSION INFORMATION:

This file is part of Model-Glue 'Gesture' 3.1 Maintenance Release Candidate (3.1.299).

The version number in parentheses is in the format versionNumber.subversion.revisionNumber.
--->

<cfset event.setValue("title", "Milestones")>
<cfset projects = event.getValue("projects")>
<cfset root = event.getValue("myself")>
<cfset lastproject = event.getValue("lastproject")>

<script>
$(document).ready(function() {
	$("#project").change(function() {
		var selproject = $("#project option:selected").val()
		if(selproject == '') { $("#milestonelist").html(""); return; }
		$("#milestonelist").html("<img src='images/ajax-loader.gif'>")
		<cfoutput>$("##milestonelist").load('#root#page.milestonelist&project='+selproject)</cfoutput>
	})
	
	<cfif lastproject neq "">
	<cfoutput>$("##milestonelist").load('#root#page.milestonelist&project=#lastproject#')</cfoutput>
	</cfif>
})
</script>	

<h2 class="red">Milestones</h2>	

<cfoutput>
<form name="pForm" method="get">
<p>
<b>Project:</b>
<select name="project" id="project">
<option vaue=""></option>
<cfloop query="projects">
<option value="#id#" <cfif lastproject is id>selected</cfif>>#name#</option>
</cfloop>
</select>
</p>
</form>
</cfoutput>

<div id="milestonelist"></div>
