component {

	this.name = "modelglueExtension5";
	this.mappings["/modelglueExtension"] = expandPath("../");
	this.customTagPaths = ExpandPath('customTags/');

	public boolean function onRequestStart() {
	
		if (structKeyExists(url, "flush")){
			ApplicationStop();
		}
		checkForUpdates();
		return true;
	}
	
	public boolean function onApplicationStart(){
		application.version = "1.2";
		application.buildURL = "http://model-glue.com/extension/buildinfo.cfm";
		application.appURL = "http://model-glue.com/extension/modelglueExtension.zip";
		
		application.update = new modelglueExtension.handlers.components.update(application.version, application.buildURL, application.appURL);
		
		application.root = getDirectoryFromPath(getCurrentTemplatePath());
		application.base = expandpath('../');
		local.rootScriptName = getDirectoryFromPath( cgi.script_name );
		local.scriptDepth = ( listLen( expandPath( local.rootScriptName ), "\/" ) - listLen( application.root, "\/" ) );
		local.rootScriptName = reReplace( local.rootScriptName, "([^\\/]+[\\/]){" & local.scriptDepth & "}$", "", "one" );
		application.rootURL = ( "http://" & cgi.server_name & ":" & cgi.server_port & local.rootScriptName );
		
		
		application.updateNeeded = false;
		application.updateInterval = 24;
		
		/*get proxy info*/
		iniPath = application.base & 'settings.ini';
		application.proxyUsername = trim(GetProfileString(iniPath,"main","proxyusername"));
		application.proxyPassword = trim(GetProfileString(iniPath,"main","proxypassword"));
		application.proxyServer = trim(GetProfileString(iniPath,"main","proxyserver"));
		application.proxyPort = trim(GetProfileString(iniPath,"main","proxyport"));
		return true;
	}
	
	
	public void function checkForUpdates(){
		if (not structKeyExists(application,"updateLastChecked") OR 
				DateAdd("h",application.updateInterval, application.updateLastChecked) < now() ){
		
			if (application.update.isOnline()){
				application.updateNeeded = application.update.shouldUpdate();
			}
			else{
				application.updateNeeded = false;
			}		
			
			application.updateLastChecked = Now();
		
		}
	}
	
}