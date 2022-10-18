<cfparam name="attributes.exMode" default="" />
<cfparam name="attributes.title" default="" />
<cfparam name="attributes.checkupdate" default="false" />

<cfoutput>
	<cfif attributes.exMode is "start">
		<html>
			<head>
				<link rel="stylesheet" href="#application.rootURL#/pages/css/styles.css" />
				<script src="#application.rootURL#/jquery-ui-1.8.7/js/jquery-1.4.4.min.js"></script>
				<script src="#application.rootURL#/jquery-ui-1.8.7/js/jquery-ui-1.8.7.custom.min.js"></script>
				<link rel="stylesheet" href="#application.rootURL#/jquery-ui-1.8.7/css/smoothness/jquery-ui-1.8.7.custom.css" type="text/css" />
			</head>
			<body>
				<div id="page">
		
					<div id="top">
						<h2>
							<img src="#application.rootURL#images/mgLogoTrans.png" />
						</h2>
						<h3>
							#attributes.title#
						</h3>
					</div>
					
					<br clear="all" />
	</cfif>
	
	<cfif attributes.exMode eq "end">
					<cfif attributes.checkUpdate>
						<cf_updateNotification />	
					</cfif>
				</div>
			</body>
		</html>
	</cfif>		
</cfoutput>