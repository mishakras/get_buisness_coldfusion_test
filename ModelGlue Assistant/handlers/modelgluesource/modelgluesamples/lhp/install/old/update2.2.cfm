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

<!---
This script will handle the new lh_IssueType database table. In order for this to work,
you must ensure your lh_IssueTypes table was created (see readme.txt), and you must add 
the issuetypeidfk column to your issues table. Ensure that when you made lh_IssueTypes
that the default values (Bug, Enhancement) exist. You can get these from the install
scripts or just manually add them.

So - this script will first get the IDs for Bug/Enhancement. It will then look at your
issues table and change isBug to the right values.

This script will NOT work if you have removed the isbug column. After you have run
this script you can drop the isbug column.
--->

<!--- set this DSN to the right value --->
<cfset dsn = "lighthousepro">

<!--- what is the ID for "Bug" --->
<cfquery name="getBugID" datasource="#dsn#">
select	id
from	lh_issuetypes
where	name = 'Bug'
</cfquery>

<cfif getBugID.recordCount is 0>
	<cfoutput>
	Sorry, but you need to put the default values for Bug/Enhancement in the lh_issuetypes 
	table!
	</cfoutput>
	<cfabort>
</cfif>

<cfset bugid = getBugId.id>

<!--- what is the ID for "Bug" --->
<cfquery name="getEnhancementID" datasource="#dsn#">
select	id
from	lh_issuetypes
where	name = 'Enhancement'
</cfquery>

<cfif getEnhancementID.recordCount is 0>
	<cfoutput>
	Sorry, but you need to put the default values for Bug/Enhancement in the lh_issuetypes 
	table!
	</cfoutput>
	<cfabort>
</cfif>

<cfset enhid = getEnhancementId.id>

<cfquery datasource="#dsn#">
update	lh_issues
set		issuetypeidfk = '#bugid#'
where	isbug = 1
</cfquery>

<cfquery datasource="#dsn#">
update	lh_issues
set		issuetypeidfk = '#enhid#'
where	isbug = 0
</cfquery>

