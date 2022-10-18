<cfsetting showdebugoutput="false" />
<cfparam name="form.submitted" default="0" />

<cfscript>
	if(form.submitted){
		ok = true;
		message='';
		
		if(!isNumeric(form.proxyPort)){
			ok = false;
			message = 'The proxy port must be numeric';
		}
		
		if(ok){
			iniPath = application.base & 'settings.ini';
			SetProfileString(iniPath,"main","proxyusername",form.proxyusername);
			SetProfileString(iniPath,"main","proxypassword",form.proxypassword);
			SetProfileString(iniPath,"main","proxyserver",form.proxyserver);
			SetProfileString(iniPath,"main","proxyport",form.proxyport);
			application.proxyusername = form.proxyusername;
			application.proxypassword = form.proxypassword;
			application.proxyserver = form.proxyserver;
			application.proxyport = form.proxyport;
		}
	}
</cfscript>

<cfoutput>
	<html>
		<head>
			<link rel="stylesheet" href="#application.rootURL#pages/css/styles.css" />
		</head>
		<body>
			<h2>
				Update Settings
			</h2>
			
			<cfif form.submitted && ok>
				<p class="success">
					Settings saved successfully
				</p>	
			<cfelseif form.submitted && !ok>
				<p class="error">
					#message#
				</p>
			</cfif>	
	
		<form action="#application.rootURL#/pages/settings.cfm" method="post">
			<table width="490" align="center" class="edit">
				<tr>
					<td>
						Proxy Server:
					</td>
					<td>
						<input type="text" name="proxyServer" value="#application.proxyServer#" />
					</td>
				</tr>
				<tr>
					<td>
						Proxy Port:
					</td>
					<td>
						<input type="text" name="proxyPort" value="#application.proxyPort#" />
					</td>
				</tr>
				<tr>
					<td>
						Proxy Username:
					</td>
					<td>
						<input type="text" name="proxyUsername" value="#application.proxyUsername#" />
					</td>
				</tr>
				<tr>
					<td>
						Proxy Password:
					</td>
					<td>
						<input type="password" name="proxyPassword" value="#application.proxyPassword#" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" name="submit" value="Save" />
					</td>
				</tr>
			</table>
			
			<input type="hidden" name="submitted" value="1" />
		</form>
		</body>
	</html>
</cfoutput>