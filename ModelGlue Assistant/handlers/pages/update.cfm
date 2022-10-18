<cfsetting showdebugoutput="false" />
<cfparam name="form.submitted" default="0" />
<cfparam name="formatPage" default="0" />

<cfoutput>
		<html>
			<head>
				<link rel="stylesheet" href="#application.rootURL#pages/css/styles.css" />
			</head>
			<body>
			<h2>
				Updates
			</h2>
<cfif form.submitted>
	<cfscript>
		upgradeDetails = application.update.getLatestDetails();
		appFolder = ExpandPath('../../install/');
		application.update.getLatestZip(appFolder);
		resultFile = appFolder & "modelglueExtension.zip";
		parentFolder = ExpandPath("../../");
		application.version = upgradeDetails.version;
		ApplicationStop();
	</cfscript>
	
	<cfzip action="unzip" destination="#ExpandPath("../../")#" file="#resultFile#" overwrite="true" />
	<p>
		You are now running the most up-to-date version of the Model Glue Extension: #application.version#
	</p>
<cfelse>	

		<cfif application.update.isOnline() >
			<cfset shouldUpdate = application.update.shouldUpdate() />
		
			<cfif shouldUpdate>
				<cfset upgradeDetails = application.update.getLatestDetails() />
			
				<table class="edit" width="590">
					<tr>
						<td  width="200">
							<strong>
								You are running version:
							</strong>
						</td>
						<td>
								#application.version#
						</td>
					</tr>
					<tr>
						<td width="200">
							<strong>
								The most current version online is:
							</strong>
						</td>
						<td>
							#upgradeDetails.version#
						</td>
					</tr>
					<tr>
						<td width="200" valign="top">
							<strong>
								In the new version offers these additional features:
							</strong>
						</td>
						<td valign="top">
							#upgradeDetails.details#
						</td>
					</tr>
				</table>
				
				<br /><br /><br /><br />
				
				<form action="#application.rootURL#pages/update.cfm" method="post">
					<label for="config">Are you sure you want to update?</label>
					<input id="confirm" name="confirm" type="submit" value="Yes, I want to update!" />
					<input type="hidden" name="submitted" value="1" />
					<input type="hidden" name="ideeventinfo" value="#xmlformat(ideeventinfo)#" />
				</form>
			<cfelse>
				<p>
					You are currently running at the latest version of the Model Glue extension.
				</p>	
			</cfif>
		<cfelse>
			<p>
				Online updates are not available. Either you are offline, or there is a problem with the update site.
			</p>
		</cfif>
	</cfif>

		</body>
	</html>
</cfoutput>