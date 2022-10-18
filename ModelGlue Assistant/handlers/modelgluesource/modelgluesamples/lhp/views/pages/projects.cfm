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


<cfset event.setValue("title", "Projects")>
<cfset projects = event.getValue("projects")>
<cfset root = event.getValue("myself")>
	

<h2 class="red">Projects</h2>
<p>
Use the form below to select a project to modify. You may also add a new project or delete an existing project.
Note that deleting a project will also delete all issues assigned to it.
</p>
	
<cf_datatable data="#projects#" queryString="event=#event.getValue(event.getValue("eventValue"))#" editlink="#root#page.project" deletelink="#root#action.projectdelete" label="Project" linkcol="name">
	<cf_datacol colname="name" label="name" />
	<cf_datacol colname="numissues" label="Number of Issues" />
	<!--- Removed june 30, 2009, since it allowed an admin to view/add issues to a project he didn't own. If you want to do that admin, add it to your list... 
	I may rethink this...
	<cf_datacol label="View Issues" data="<a href=""#root#page.viewissues&id=$id$"">View Issues</a>" sort="false" />
	--->
</cf_datatable>

