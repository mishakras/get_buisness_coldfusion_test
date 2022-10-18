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


<cfset event.setValue("title", "Project Areas")>
<cfset projectareas = event.getValue("projectareas")>
<cfset root = event.getValue("myself")>
	

<h2 class="red">Project Areas</h2>
<p>
Use the form below to select a project area to modify. Project areas help you organize your issues based on what part of your project the issue was found. 
</p>
	
<cf_datatable data="#projectareas#" queryString="event=#event.getValue(event.getValue("eventValue"))#" editlink="#root#page.projectarea" deletelink="#root#action.projectareadelete" label="Project Area" linkcol="name">
	<cf_datacol colname="name" label="name" />
</cf_datatable>

