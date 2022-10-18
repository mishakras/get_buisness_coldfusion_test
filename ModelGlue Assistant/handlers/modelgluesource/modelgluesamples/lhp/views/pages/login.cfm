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

<cfset settings = event.getValue("settings")>
<cfset root = event.getValue("myself")>
<cfset loginError = event.getValue("loginError", 0)>
	
<cfoutput>
<div id="loginBox">

	<div id="loginForm">
		<h1 class="bgreplace">Lighthouse Pro Login</h1>
			<form action="#root#action.login" method="post" name="loginform">
			<div class="field clear">
				<label>Username:</label>
				<input type="text" name="username" id="username" class="bigInput" />
			</div>
			<div class="field clear">
				<label>Password:</label>
				<input type="password" name="password" class="bigInput" />
			</div>
			<input type="hidden" name="login" value="">
			<input type="image" name="loginimg" src="images/loginBtn.jpg" class="loginBtn"/>
		</form>
	</div>
	<cfif loginError>
		<br /><div class="error" align="center">The username/password you entered is incorrect. Please try again.</div>
	</cfif>			
	ver. <strong>#settings.version#</strong>

</div>
<script>
$(document).ready(function() {
	$("##username").focus()
})
</script>
</cfoutput>
