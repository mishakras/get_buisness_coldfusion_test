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

<p>I'm an example of using the new "onApplicationStart", "onSessionStart", and "onSessionEnd" broadcasts.</p>

<cfoutput>
<p>
According to its controller, this app has <font color="green" size="+1"><strong>#event.getValue("sessionCount")#</strong></font> active session<cfif event.getValue("sessionCount") gt 1>s</cfif>.  If you open a second type of browser or browse from another computer, you should see this number go up when you reload.
</p>
</cfoutput>

<p>To listen for any of these events, just add a message listener tag to any of your controllers:</p>

<pre>
&lt;controller id="Controller" type="modelgluesamples.applicationcfc.controller.Controller">
	&lt;message-listener message="onApplicationStart" function="onApplicationStart" />
	&lt;message-listener message="onRequestStart" function="getSessionCount" />
	&lt;message-listener message="onSessionStart" function="onSessionStart" />
	&lt;message-listener message="onSessionEnd" function="onSessionEnd" />
&lt;/controller>
</pre>

<p>Like any other message broadcast, you can have as many listener functions as you desire.</p>
