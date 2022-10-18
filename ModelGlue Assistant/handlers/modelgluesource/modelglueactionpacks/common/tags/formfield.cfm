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

<cfparam name="attributes.propertyName" type="string" />
<cfparam name="attributes.label" type="string" />
<cfparam name="attributes.required" type="boolean" default="true" />
<cfparam name="attributes.validationErrors" default="" />
<cfparam name="attributes.showLabel" type="boolean" default="true" />

<cfswitch expression="#thisTag.executionMode#">

<cfcase value="start">
<cfoutput>
		<div class="<cfif attributes.required>required</cfif> <cfif isObject(attributes.validationErrors) and attributes.validationErrors.hasErrors(attributes.propertyName)>error</cfif>">
			<cfif isObject(attributes.validationErrors) and attributes.validationErrors.hasErrors(attributes.propertyName)><p class="error">Oops!</p></cfif>
			<cfif attributes.showLabel>
				<label for="name" class="fieldLabel">#attributes.label#</label>
			</cfif>
</cfoutput>
</cfcase>
<cfcase value="end">
<cfoutput>
			<cfif isObject(attributes.validationErrors)>
				#caller.helpers.modelglue.showErrors(attributes.validationErrors, attributes.propertyName)#
			</cfif>
		</div>
</cfoutput>
</cfcase>
</cfswitch>
