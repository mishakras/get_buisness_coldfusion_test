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

<cfset event.setValue("title", "Feeds")>
<cfset event.setValue("selected", "feeds")>
<cfset myProjects = event.getValue("myprojects")>
<cfset projects = event.getValue("projects", 0)>
<cfset settings = event.getValue("settings")>
<cfset root = event.getValue("myself")>
<cfset user = event.getValue("currentuser")>
<cfset auth = "u=#user.getUserName()#&p=#user.getPassword()#">
<cfset auth = urlEncodedFormat(encrypt(auth,settings.secretkey))>

<cfif structKeyExists(settings,"rssfeedsenabled") and settings.rssfeedsenabled><!--- only execute if rss feeds are turned on --->

	<!--- FF RSS Feed URLs --->
	<cfsavecontent variable="rssheader">
	<cfoutput>
	<link rel="alternate" type="application/rss+xml" title="All Projects" href="#root#page.rss&projects=0&auth=#auth#" />
	<link rel="alternate" type="application/rss+xml" title="All Projects (My Issues)" href="#root#page.rss&projects=-1&auth=#auth#" />
	</cfoutput>
	<cfif myProjects.recordCount>   
		<cfoutput query="myProjects">
		<link rel="alternate" type="application/rss+xml" title="#name#" href="#root#page.rss&projects=#id#&auth=#auth#" />
		</cfoutput>
	</cfif>
	</cfsavecontent>
	
	<cfhtmlhead text="#rssheader#">
	
	<h2 class="red">RSS Feeds</h2>
	<p>
	The follow links correspond to various RSS feeds for each of the projects you are assigned to. You can also
	subscribe to a link for all your projects or to a feed of just your issues.
	</p>
	
	<cfif myProjects.recordCount>
	
		<cfoutput>
		<p>
		<a href="#root#page.rss&projects=0&auth=#auth#">All Projects</a><br>
		<a href="#root#page.rss&projects=-1&auth=#auth#">All Projects (My Issues)</a><br>
		</cfoutput>
	
		<cfoutput query="myProjects">
			<a href="#root#page.rss&projects=#id#&auth=#auth#">#name#</a><br>
		</cfoutput>
		
		<cfoutput>
		</p>
		</cfoutput>
	
	<cfelse>
	
		<cfoutput>
		<p>
		There are no projects available for you.
		</p>
		</cfoutput>
	
	</cfif>

<cfelse>

	<h2 class="red">RSS Feeds</h2>
	<p>
	All RSS feeds have been disabled by the administrator.  Please contact your administrator for further information.
	</p>

</cfif>
