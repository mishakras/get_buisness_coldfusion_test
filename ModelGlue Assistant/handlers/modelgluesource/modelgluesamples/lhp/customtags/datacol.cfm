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

<cfsetting enablecfoutputonly=true>
<!---
	Name         : datacol.cfm
	Author       : Raymond Camden 
	Created      : September 7, 2004
	Last Updated : June 22, 2006
	History      : 
	Purpose		 : Allows you to specify settings for datatable 
--->

<cfassociate baseTag="cf_datatable">

<cfparam name="attributes.colname" type="string" default="">
<cfparam name="attributes.name" type="string" default="#attributes.colname#">
<cfparam name="attributes.label" type="string" default="#attributes.name#">
<cfparam name="attributes.data" type="string" default="">
<cfparam name="attributes.sort" type="string" default="true">

<cfif attributes.name is "" and attributes.data is "">
	<cfthrow message="dataCol: Both name and data cannot be empty.">
</cfif>

<cfif len(attributes.data)>
	<cfset attributes.name = attributes.data>
</cfif>

<cfsetting enablecfoutputonly=false>

<cfexit method="EXITTAG">
