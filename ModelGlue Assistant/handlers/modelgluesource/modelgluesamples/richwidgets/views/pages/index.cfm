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

<h1>Rich Widgets</h1>

<h3>Plain old HTML</h3>

<p>Submit this form, and the page will reload, translating your input into pig latin.</p>

<cfform action="#event.linkTo("page.index")#" id="html">
	<cfinput type="text" name="phrase" required="true" message="Please enter a phrase." />
	<input type="submit" value="Go" />
</cfform>

<cfoutput>
#viewCollection.getView("translation")#
</cfoutput>

<h3>Simple &lt;div&gt; replacement.</h3>

<p>Using Prototype (jQuery would work, too) to update a div - same event handler, different request format!</p>

<form id="ajax" onsubmit="new Ajax.Updater('ajax_result', 'index.cfm?requestFormat=htmlPartial&phrase=' + $('ajax_phrase').value);return false;">
	<input type="text" id="ajax_phrase" />
	<input type="submit" value="Go" />
</form>

<div id="ajax_result">
	Here you go:
</div>