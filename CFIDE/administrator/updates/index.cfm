����  -m 
SourceFile &/CFIDE/administrator/updates/index.cfm cfindex2ecfm715844041  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   PATH Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   MODULE_UNINSTALLSUCCESSMSG   	   INSTANCEPATH   	    UPGRADE_ACTION " " 	  $ 	FELIXUTIL & & 	  ( CONTINUELABEL * * 	  , MODULECFCPATH . . 	  0 DEFAULTPATH 2 2 	  4 ERRMSG 6 6 	  8 SESSIONENABLED : : 	  < VAR_NONE > > 	  @ INDEX B B 	  D DOWNGRADE_ACTION F F 	  H TOKEN J J 	  L DIALOGSTYLE N N 	  P INFO_DIALOG R R 	  T PACKAGE_UPGRADE_SUCCESS_MULT V V 	  X CONFIRM_DIALOG Z Z 	  \ SHOWOTHERINSTANCES ^ ^ 	  ` 	TREEFIELD b b 	  d UPDATEALL_ACTION f f 	  h MODULE_DOWNGRADESUCCESSMSG j j 	  l PACKAGE_UPGRADE_ERROR_MULT n n 	  p L10N_UPDATE_MESSAGE5 r r 	  t PAGE v v 	  x INSTALL_ACTION z z 	  | ADMINOBJ ~ ~ 	  � L10N_UPDATE_MESSAGE1 � � 	  � YESLABEL � � 	  � L10N_UPDATE_MESSAGE2 � � 	  � OKLABEL � � 	  � APPSETTINGS � � 	  � INSTALLALLNEEDSRESTART � � 	  � CHECK_LOGS_TIP � � 	  � UNINSTALLALLNEEDSRESTART � � 	  � 	RETURNURL � � 	  � FILESEPARATOR � � 	  � MODULE_ALLUNINSTALLSUCCESSMSG � � 	  � L10N_SELECT_INSTANCES_ALL � � 	  � JR � � 	  � L10N_ERR_MESSAGE1_SUCCESS � � 	  � UNINSTALL_ACTION � � 	  � CHECKCSRFTOKEN � � 	  � CURRENTINSTANCE � � 	  � UNINSTALLALL_ACTION � � 	  � URL � � 	  � WWWROOTPATH � � 	  � CANCELLABEL � � 	  � !APPLICATION_VAR_CHECK_FOR_UPDATES � � 	  � L10N_UPDATE_STATUSINIT � � 	  � L10N_INSTALLER_MESSAGE1 � � 	  � L10N_SELECT_INSTANCES � � 	  � EXPORT_SERVER_TIP � � 	  � L10N_INSTALLER_MESSAGE2 � � 	  � MODULE_INSTALLSUCCESSMSG � � 	  � MODULE_ALLUPGRADESUCCESSMSG � � 	  � L10N_INSTALL_UPDATE_TITLE � � 	  � SESSION_VAR_CHECK_FOR_UPDATES � � 	  � PACKAGE_INSTALL_ERROR_MULT � � 	   BROWSESUBMIT 	  MODULE_ALLINSTALLSUCCESSMSG 	  L10N_UPDATE_ERR2

 	  INSTALLALL_ACTION 	  L10N_UPDATE_ERR1 	  GETCSRFTOKEN 	  MODULE_UPGRADESUCCESSMSG 	  SHOWMESSAGE 	   FORM"" 	 $ UNINSTALL_DIALOG&& 	 ( L10N_WINDOW_TITLE2** 	 , L10N_WINDOW_TITLE1.. 	 0 )APPLICATION_SESSION_VAR_CHECK_FOR_UPDATES22 	 4 SESSION66 	 8 AERRORMESSAGES:: 	 < EXPORTFILEPATH>> 	 @ PACKAGE_INSTALL_SUCCESS_MULTBB 	 D EXPORT_SERVER_LABELFF 	 H NOLABELJJ 	 L REQUESTNN 	 P ADDITIONALMSGRR 	 T DOWNLOADCFCPATHVV 	 X BERRORSEXISTZZ 	 \ APPLICATIONENABLED^^ 	 ` com.macromedia.SourceModTime  {��� pageContext #Lcoldfusion/runtime/NeoPageContext;ef	 g getOut ()Ljavax/servlet/jsp/JspWriter;ij javax/servlet/jsp/JspContextl
mk parent Ljavax/servlet/jsp/tagext/Tag;op	 q UTF8s setPageEncoding (Ljava/lang/String;)Vuv !coldfusion/runtime/NeoPageContextx
yw <html>
<head>
{ write}v java/io/Writer
�~ 'class$coldfusion$tagext$lang$IncludeTag Ljava/lang/Class; !coldfusion.tagext.lang.IncludeTag� forName %(Ljava/lang/String;)Ljava/lang/Class;�� java/lang/Class�
����	 � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag;��
 � !coldfusion/tagext/lang/IncludeTag� _setCurrentLineNo (I)V��
 � 
_style.cfm� setTemplate�v
�� 	hasEndTag (Z)V�� coldfusion/tagext/GenericTag�
�� _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z��
 � 
<script src="� $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag���	 � coldfusion/tagext/io/OutputTag� 
doStartTag ()I��
�� java/lang/String� adminScriptSrcPath� _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;��
 � _String &(Ljava/lang/Object;)Ljava/lang/String;�� coldfusion/runtime/Cast�
�� doAfterBody��
�� doEndTag�� coldfusion/tagext/QueryLoop�
�� doCatch (Ljava/lang/Throwable;)V��
�� 	doFinally� 
�� Cajaxtree/jquery.js" type="text/javascript"></script>
<script src="� Pajaxtree/jquery-ui.js" type="text/javascript"></script>

</head>

<body>

� 
� _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V��
 � GetAuthUser ()Ljava/lang/String;��
 � matches� java/lang/Object� ^\w$� _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;��
 � _boolean (Ljava/lang/Object;)Z��
�� %class$coldfusion$tagext$net$CookieTag coldfusion.tagext.net.CookieTag���	 � coldfusion/tagext/net/CookieTag� 30� 
setExpires (Ljava/lang/Object;)V��
�� cfcookie� value� CGI� script_name  _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  setValuev
� setHttpOnly	�
�
 name cfadmin_lastpage_ concat &(Ljava/lang/String;)Ljava/lang/String;
� setNamev
� $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag�	  coldfusion/tagext/io/SilentTag
� 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; 
 !
�� _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;$%
 & #javax/servlet/jsp/tagext/TagSupport(
)�
��
�� LOCALE- REQUEST.LOCALE/ en1 checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V34
 5 
localeFile7 java/lang/StringBuilder9 resources/updates_; v
:= locale? append -(Ljava/lang/String;)Ljava/lang/StringBuilder;AB
:C .cfmE toStringG�
�H _structSetAt ;(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;Z)VJK
 L updateN 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V3P
 Q falseS (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTagVU�	 X "coldfusion/tagext/lang/ImportedTagZ l10n\ 
../cftags/^ admin` :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Vb
[c &coldfusion/runtime/AttributeCollectione idg session_var_check_for_updatesi vark ([Ljava/lang/Object;)V m
fn setAttributecollection (Ljava/util/Map;)Vpq  coldfusion/tagext/lang/ModuleTags
tr
t� �Sorry, but in order to use this application, you must enable session variables.
	You may do so by enabling session variables on the "Memory Variables" page.w
t�
t�
t� runtime| 	variables~ session� enable� set�� coldfusion/runtime/Variable�
�� !application_var_check_for_updates� �Sorry, but in order to use this application, you must enable application variables.
	You may do so by enabling application variables on the "Memory Variables" page.� coldfusion/runtime/CFBoolean� f_false Lcoldfusion/runtime/CFBoolean;��	�� )application_session_var_check_for_updates� �Sorry, but in order to use this application, you must enable application  and session variables.
	You may do so by enabling both the variables on the "Memory Variables" page.� *coldfusion/runtime/TransientVariableHolder� &(Lcoldfusion/runtime/NeoPageContext;)V �
�� APPLICATION� updateSettings� t_true��	�� unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;�� coldfusion/runtime/NeoException�
�� t83 [Ljava/lang/String; ANY���	 � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I��
�� CFCATCH� bind '(Ljava/lang/String;Ljava/lang/Object;)V��
�� unbind� 
�� ArrayNew (I)Ljava/util/List;��
 � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray;��
�� setArray !(Lcoldfusion/runtime/FastArray;)V��
�� _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;��
 � _List $(Ljava/lang/Object;)Ljava/util/List;��
�� ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z��
 � _Object (Z)Ljava/lang/Object;��
�� HTTP� https� off� _compare '(Ljava/lang/Object;Ljava/lang/String;)D��
 � Len (Ljava/lang/Object;)I��
 � (I)Ljava/lang/Object;��
�� (Ljava/lang/Object;D)D��
 � http://� 	http_host� GetContextRoot��
 � )/CFIDE/administrator/updates/download.cfc� https://� ./CFIDE/administrator/updates/module_helper.cfc� install� 	uninstall� 
installAll� uninstallAll� upgrade 	downgrade 	updateAll &

<script type="text/javascript">
	 
			 downloadCFCPath ToScript 8(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
  moduleCFCPath java java.io.File CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
  _Map #(Ljava/lang/Object;)Ljava/util/Map;
� 	separator 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object;�!
 " fileSeparator$ downloadHome& 	../entman( 
ExpandPath*
 + DirectoryExists (Ljava/lang/String;)Z-.
 / showOtherInstances1 isStandAlone3 
			5 &class$coldfusion$tagext$lang$ObjectTag  coldfusion.tagext.lang.ObjectTag87�	 :  coldfusion/tagext/lang/ObjectTag< create> 	setAction@v
=A setTypeCv
=D )com.adobe.coldfusion.entman.ProcessServerF setClassHv
=I jrK
= _getN�
 O getInstanceNameQ cfusionS currentInstanceU updateServiceW _resolveY�
 Z getServerBaseDir\ instancePath^ GetTemplatePath`�
 a CFIDEc Find '(Ljava/lang/String;Ljava/lang/String;)Ief
 g _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;ij
 k _double (Ljava/lang/Object;)Dmn
�o _int (D)Iqr
�s Left '(Ljava/lang/String;I)Ljava/lang/String;uv
 w SERVERy 
ColdFusion{ rootdir} 	/wwwroot/ wwwrootPath� 
	�S

</script>

<script>
	function wopen(formelem) {
		// CollectionPath is hardcoded here, how can I use the value of formelem?
		defpath = "" ;
		window.open("../filedialog/index.cfm?fromjscript=true&dialogStyle=selectDirectory&formelem=" + formelem + "&defaultPath=" + escape(defpath), "NewWindow","height=500,width=600,dependent=true,resizable=yes");
	}
	// function changeTab($1)
	// {
	// 	document.editForm.page.value = $1;
	// 	document.editForm.submit();
	// }
	function resizeInfoWin(contentLength)
	{
		if(contentLength <= 100)
			$( "#download-info-dialog" ).height(150);
		else if(contentLength < 200)
			$( "#download-info-dialog" ).height(200);
		else 
			$( "#download-info-dialog" ).height(250);
	}

	function timedRefresh(timeoutPeriod){
		//setTimeout("location.reload(true);",timeoutPeriod);
	}
</script>
� 	component� CFIDE.adminapi.administrator� 

� ../header.cfm� ../include/margintop.cfm� ../include/errors.cfm� 	_core.cfm� _modules.cfm� '
<script type="text/javascript">
    � 

    var � var_none� ;
    �`
    function formatString() {
        var i = 1;
        let args = arguments;
        let str = args[0];
        var len = args.length - 1;
        var matches = str.match(/{}/g);
        if( !matches || matches.length !== len ) {
            return " ";
        }
        return str.replace(/{}/g, function () {
            return args[i++];
        });
    }
	function openSection(tabNumber){
		var i;
		sections = document.getElementsByClassName("section-body");
		window.localStorage.setItem('update_section',tabNumber);
        for (i = 0; i < sections.length; i++) {
			if(i == tabNumber-1){
				state = sections[i].style.display == "block";
				sections[i].style.display = state?"none":"block";
				document.getElementById("section-arrow-"+tabNumber).src = state?"../images/collapse-arrow.png": "../images/expand-arrow.png";
				if(tabNumber==1)
					document.getElementById("section-arrow-"+tabNumber).alt = state?"Core Server Collapsed icon": "Core Server Expanded icon";
				else if(tabNumber==2)
					document.getElementById("section-arrow-"+tabNumber).alt = state?"Installed Packages Collapsed icon": "Installed Packages Expanded icon";
				else
					document.getElementById("section-arrow-"+tabNumber).alt = state?"Available Packages Collapsed icon": "Available Packages Expanded icon";
            }
			else{
				sections[i].style.display = "none";
				document.getElementById("section-arrow-"+(i+1)).src = "../images/collapse-arrow.png";
				if(i==0)
					document.getElementById("section-arrow-"+(i+1)).alt = " Core Server Collapsed icon";
				else if(i==1)
					document.getElementById("section-arrow-"+(i+1)).alt = "Installed Packages Collapsed icon";
				else
					document.getElementById("section-arrow-"+(i+1)).alt = "Available Packages Collapsed icon";
				
			}
		}
        
        hidePopup();
	}
    function realignSectionList(number){
        $(".section-list").removeClass("expanded");

        secList = document.getElementsByClassName("section-list");
        for (i = 0; i < secList.length; i++) {
            if(i == number-1){
                secList[i].style.width = 0.9*secList[i].parentElement.getBoundingClientRect().width;
                secList[i].className = "section-list expanded";
            }
        }
    }
    function hidePopup(){
        var modal = document.getElementsByClassName("popup-content");
        for (i = 0; i < modal.length; i++) {
                modal[i].style.display = "none";
        }
        secList = document.getElementsByClassName("section-list");
        for (i = 0; i < secList.length; i++) {
            secList[i].style.width = "100%";
                
        }
        $(".section-list.expanded").removeClass("expanded");
        $(".module-grid.expanded").removeClass("expanded");
        thisModule = {};
        coreModule = {};
        currentCoreId = {}
    }
	$(document).ready(function(){
		var sec = window.localStorage.getItem('update_section') || 1;
		if(sec){
			openSection(window.localStorage.getItem('update_section'));
			if(sec == 1){
				showCorePopup();
			}
		}
		
	});
</script>

	�  � 
		
		� EXPORTSERVERSTATE� FORM.EXPORTSERVERSTATE�  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z��
 � 

			� 	CSRFTOKEN� FORM.CSRFTOKEN� 	csrftoken� checkCSRFToken� updatetabkeyname� 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;��
 � !coldfusion.server.felix.FelixUtil� handleExportCommand� Sleep (J)V��
 � 	getLibDir� installedBundles.txt� %class$coldfusion$tagext$net$HeaderTag coldfusion.tagext.net.HeaderTag���	 � coldfusion/tagext/net/HeaderTag� Content-Disposition�
� #attachment; filename=cfpackages.txt�
� &class$coldfusion$tagext$net$ContentTag  coldfusion.tagext.net.ContentTag���	 �  coldfusion/tagext/net/ContentTag� 
text/plain�
�D 	cfcontent� file� setFile�v
�� ERRORMESSAGE� URL.ERRORMESSAGE� errorMessage� 
			<ul><li class="errorText">� </li></ul>
		� ACTION� 
URL.ACTION� action� '(Ljava/lang/Object;Ljava/lang/Object;)D��
 � 
				� {}� modname� Replace J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String; 
  
	         
	        	 LIST2 	URL.LIST2
 list2 
	        		 package_install_error_mult 4An error has occurred while installing the packages  EncodeForHTML
   . 
					 package_install_success_mult The packages  list1 " have been installed successfully.! _factor1#j
 $ package_upgrade_error_mult& 3An error has occurred while upgrading the packages ( package_upgrade_success_mult* ! have been upgraded successfully., _factor2.j
 / _factor31j
 2 7
			<div style="margin-bottom: 10px;">
				<img src="4 thisURL6 p/images/update.gif" height="16" width="16">
				<span style="color:226600;word-break: break-all;">&nbsp;&nbsp; 8 </span>
				
				: isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z<=
 > 7 
					<p style="color:226600;word-break: break-all;">@ 
</p>
				B D
					<ul style="padding-inline-start:20px;"><li class="errorText">D </li></ul>
				F 
				
			</div>
		H _factor5Jj
 K CHECKM 
FORM.CHECKO REFRESHQ FORM.REFRESHS 

		U k
			<script>
				parent.document.getElementById('topnav').contentWindow.checkUpdates();
			</script>
		W 	DirectoryY selectDirectory[ 	directory] ../filedialog/index.cfm_ %class$coldfusion$tagext$lang$AbortTag coldfusion.tagext.lang.AbortTagba�	 d coldfusion/tagext/lang/AbortTagf _factor6hj
 i 
	
	<h2 class="pageHeader">k update_pageheaderm 

	Updateso |
	</h2>
	
		<img src="../images/loader.svg" class="module-loader-img" id="module-loader-img" style="display: none;"/>
		q )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTagts�	 v #coldfusion/tagext/html/form/FormTagx updatePageMainFormz
y HTML} 	setFormatv
y� cfform� Script_Name�
yA POST� 	setMethod�v
y�
y� I
			<input type="hidden" name="csrftoken" id="updates_csrftoken" value="� getCSRFToken� ">
		�
y�
y�
y�
y� N
		<div class="export-form">
			<span style="float: left;line-height: 20px">� export_server_tip� �When clicked, exports the list of all the installed packages that can be applied to other ColdFusion instance(s) using import command.� </span>
			� export_server_label� Export Server State� '
			<span style="float: right;">
				� updatePageExportForm� 3
				<input type="hidden" name="csrftoken" value="� W">
				<input type="submit" class="buttn-blue-light" name="exportServerState"  value="� ">
			� _factor7�j
 � '
			</span>
			
		</div>
		<br>
		� core_module.cfm� installed_modules.cfm� uninstalled_modules.cfm� 
		


		� ../include/marginbottom.cfm� &
		<div id="uninstall-dialog" title="� >" style="display:none" role="dialog" tabindex="-1">
        	� uninstall.cfm� ;
	    </div>
	    <div id="uninstall-info-dialog" title="� >" style="display:none" role="dialog" tabindex="-1">
	        � uninstall_info.cfm� _factor8�j
 � 
	    </div>
	    � UPDATES� SESSION.UPDATES� 0
	        <div id="install-info-dialog" title="� B" style="display:none" role="dialog" tabindex="-1">
	            � info.cfm� B
	        </div>
	        <div id="download-info-dialog" title="� download_info.cfm� :
	        </div>
	        <div id="error-dialog" title="� 	error.cfm� D
	        </div>
	        <div id="installer-input-dialog" title="� F" style="display: none" role="dialog" tabindex="-1">
                � installer_input.cfm� A
            </div>
	        <div id="overwrite-dialog" title="� overwrite.cfm� _factor4�j
 � 
	        </div>
	    � _factor9�j
 � �

<script type="text/javascript">
	var cToken = '';
    $(document).ready(function(){
        cToken = document.forms['updatePageMainForm'].csrftoken.value;
    })

	� 
	
	� YesLabel� NoLabel� OkLabel� CancelLabel� ContinueLabel��
	
	function loadDialog(popupId,fromModules){
		switch(popupId){
			case "download-info-dialog":
				output = "";
				$("#"+popupId +" .dialog-body").html('');
				$.get(downloadCFCPath + "?method=getSessionDownloadInfo",function(res){
					downloadinfo = JSON.parse(res);
					if(downloadinfo.CURRENT){
						id = downloadinfo.CURRENT;
						dwnStruct =  downloadinfo[id];
						if(dwnStruct){
							output += '<div class="dialog-text"><img src="../images/info_icon.png" >&nbsp;&nbsp;</div>';			
							if(dwnStruct.INSTALL == 0){
								pathStr = "("+ downloadHome + fileSeparator + dwnStruct.CFHF_SERVERS[0].CFHF_FILENAME+")";
								output += '<div class="dialog-text" style="word-break:break-all">'+ '� '+ wordWrap(pathStr,65) + ' </div>'
								if(dwnStruct.CFHF_SERVERS.length > 0){
									serverInfo = dwnStruct.CFHF_SERVERS[0]
									if(serverInfo.CFHF_FILENAME){									
										contentLength =  (downloadHome + fileSeparator + dwnStruct.CFHF_SERVERS[0].CFHF_FILENAME).length;
										if(contentLength > 50)
											resizeInfoWin(contentLength);
									}
								}
							}
						}
					}
					
					$("#"+popupId +" .dialog-body").html(output);
					$("#"+popupId +" .dialog-body").attr("aria-label","");
				});
				break;

			case "install-info-dialog":
				output = "";
				$("#"+popupId+" .dialog-body").html('');
				if(fromModules){
					output += '<div class="dialog-text">  <img src="../images/info_icon.png" >&nbsp;&nbsp; &nbsp;</div>';
					output += ' <br/> ,';
					output += '<div id="refresh"><p>'+' |'+'</p></div>';
					$("#"+popupId+" .dialog-body").html(output);
					$("#"+popupId +" .dialog-body").attr("aria-label","	  �");
				}else{
					$.get(downloadCFCPath + "?method=getSessionDownloadInfo",function(res){
						downloadinfo = JSON.parse(res);
						if(downloadinfo.CURRENT){
							id = downloadinfo.CURRENT;
							dwnStruct =  downloadinfo[id];
							output += '<div class="dialog-text">  <img src="../images/info_icon.png" >&nbsp;&nbsp; &nbsp;</div>';
							if(dwnStruct.INSTALL == 0){
								output += '<div class="dialog-text">' + ' �' + downloadHome + fileSeparator + dwnStruct.CFHF_SERVERS[0].CFHF_FILENAME + '</div>';
								$("#"+popupId +" .dialog-body").attr("aria-label"," \");
							}

							if(!dwnStruct.ERROR && dwnStruct.INSTALL == 1){
								output += ' /';
								output += '<div id="refresh"><p>'+' L'+'</p></div>';
								$("#"+popupId +" .dialog-body").attr("aria-label","�");
							}
						}
						$("#"+popupId+" .dialog-body").html(output);
					});	
				}		
				break;

			case "error-dialog": 
				output = "";
				$("#"+popupId+" .dialog-body").html('');
				$.get(downloadCFCPath + "?method=getSessionDownloadInfo",function(res){
					downloadinfo = JSON.parse(res);
					if(downloadinfo.CURRENT){
						id = downloadinfo.CURRENT;
						dwnStruct =  downloadinfo[id];
						if(dwnStruct && dwnStruct.ERROR){
							output += '<div class="dialog-text"><img src="../images/info_icon.png">&nbsp;&nbsp; &nbsp;</div>';
							if(dwnStruct.INSTALL == 1){
								output += '<div class="dialog-text"> =';
							$("#"+popupId+" .dialog-body").attr("aria-label"," 0");
							}
							else{
								output += ' >';
								$("#"+popupId+" .dialog-body").attr("aria-label","_");
							}
							output += dwnStruct.ERROR+'</div>';
							$.post(downloadCFCPath + "?method=setErrorDialogActions",{token:cToken},function(res){
								res = JSON.parse(res);
								if(res.ACCESSERROR)
									handleSecurityRedirect();
							});
						}else if(!downloadinfo.DOWNLOAD){
							output += '<div class="dialog-text">'+ ' �' + downloadHome + fileSeparator + dwnStruct.CFHF_SERVERS[0].CFHF_FILENAME +'</div>';
							$("#"+popupId+" .dialog-body").attr("aria-label","!");
						}
					}
					$("#"+popupId+" .dialog-body").html(output);
				});
				break;

			case "overwrite-dialog":
				output = '';
				$("#"+popupId + " .dialog-actions").html('');
				$.get(downloadCFCPath + "?method=getSessionDownloadInfo",function(res){
					downloadinfo = JSON.parse(res);
					if(downloadinfo.CURRENT){
						id = downloadinfo.CURRENT;
						dwnStruct =  downloadinfo[id];
						output += '<form>'
						if(dwnStruct.INSTALL == 0){
							output += '<input type="button" value="'+OkLabel+'" class="buttn-blue-light" onClick="overwtite(\'' +id + '\',0,true)">'
							output += '<input type="button" value="'+CancelLabel+'" class="buttn-blue-light" '+
							'onClick="closeDialog(\''+ popupId +'\')">';
						}else {
							output += '<input type="button" value="'+YesLabel+'" class="buttn-blue-light" onClick="overwtite(' +id + ',1,true)">';
							output += '<input type="button" value="'+NoLabel+'" class="buttn-blue-light"'+ 
							'onClick="overwtite(\''+ id + '\',1,false)">'
						}
						output += '</form>';
					}
					$("#"+popupId + " .dialog-actions").html(output);
				});
				break;

			case "installer-input-dialog":
				header = "";
				output = "";
				actions = "";
				$("#"+popupId+" .dialog-header").html('');
				$("#"+popupId+" .dialog-text").html('');
				$("#"+popupId+" .dialog-tip").html('');
				$("#"+popupId+" .dialog-actions").html('');
				$.get(downloadCFCPath +"?method=getCurrentOpenedUpdate",function(res){
					update_id = res || "";
					update = jsCoreStruct[update_id]
					update_buildno = update.cfhf_buildnumber;

					$.get(downloadCFCPath + "?method=getColdFusionInstances&update_id="+update_id+"&update_buildno="+update_buildno, function(res){
						var instances = JSON.parse(res);
						title = '# �';
		           		if(update.cfhf_servers[0].cfhf_installinput.trim() == "" && 
		      				(Array.isArray(instances) &&  instances.length  <= 1)){
		           			title = '%'
		           		}
		           		header = update.title + '-'+ title ;
		           		if((showOtherInstances && (Array.isArray(instances) && instances.length < 2)) || !showOtherInstances){
		           			output += '<img src="../images/info_icon.png">&nbsp;' F';
		           			$("#"+popupId+" .dialog-body").attr("aria-label",") �");
		           		}
		           		if(Array.isArray(instances) && instances.length > 1 && showOtherInstances){
		           			output += '<img src="../images/p_serverupdates_55x45.png">+ <b>- </b>/ j';
		           		}
						if(update.cfhf_servers[0].cfhf_installinput.trim() != ""){
							output += '1 �' +
							'<form name="installerform_'+update_id+'" >'+ update.cfhf_servers[0].cfhf_installinput + '</form>';
							$("#"+popupId+" .dialog-body").attr("aria-label","3 �");
						}

						if(Array.isArray(instances) && instances.length > 1 && showOtherInstances){
							output += '<form name="instanceform_'+update_id+'" style="margin-bottom:0;margin-top:0;">'
								+ '5' +'<br/>';
							output += '<div style="height:70px;width:340px;overflow-y:auto;border:1px solid ##9d9d9d;">';
								
							for (var i = 0; i < instances.length; i++) {
								disabledStr =  currentInstance == instances[i]? 'disabled="yes" checked="yes"':'';
								output += '<input ' + disabledStr + ' type="checkbox" name="'+ instances[i].trim()+ update_id + '" '+
									'value="'+instances[i].trim()+ '" id="' + instances[i] +'" onClick="disableSelectChkBox(\''+ update_id +'\')">';
								output += '<label for="'+ instances[i] + '"> ' + instances[i].trim() + '</label><br>';

							}
							output += '</div>'		
							output += '<input type="checkbox" name="all" id="all" onclick="toggleInstances(\''+ update_id +'\')">';
							output += '<label for="all">7�</label>';
							output += '</form>';
						}else{
							output += '<form name="instanceform_'+update_id + '" style="margin-bottom:0;margin-top:0;">';
							output += '<input type="checkbox" checked="checked" style="visibility:hidden;" name="instance'+update_id +  '" value="'+currentInstance + '" id="' + currentInstance + '" onClick="javascript:disableSelectChkBox(\''+ update_id +'\')">';
							output += '</form>';
						}
						$("#"+popupId+" .dialog-header").html(header);	
						$("#"+popupId+" .dialog-text").html(output);

						actions += '<form name="modeform_'+ update_id + '" style="margin-bottom:0;margin-top:0;">';
						actions += '<input  type="hidden" name="INSTALLER_UI" value="silent" />';
						actions += '<input type="hidden" size="50" name="USER_INSTALL_DIR" value="'+instancePath +'"/>'
						actions += '<input type="hidden" size="50" name="DOC_ROOT" value="'+ wwwrootPath + '"/>';				
						actions += '</form>';

						buttonActions = "";
						buttonActions += '<form style="margin-bottom:0;margin-top:0;">';
						buttonActions +=	'<input class="buttn-blue-light" type="button" value="'+ OkLabel + '" onClick="showDownloadProgressBar(\'progressbar-core\',1,false,false)" />';
						buttonActions += '<input class="buttn-blue-light" type="button" value="'+CancelLabel+'" onClick="closeDialog(\''+ popupId +'\')" /> '	
						buttonActions += '</form>';

						// check if upgrading core also updates any packages
						$.post(moduleCFCPath + "?method=getListOfBundlesForUpgradeOrDowngrade",{commaBundles:"",
							actionType:"core|install",updateLevel:update.cfhf_updatelevel,token:cToken},function(res){
							res = JSON.parse(res);
							if(!res.ACCESSERROR){
								storeToBeInstalledBundles(res.LIST);
								tipStr = res.MESSAGE;
								$("#"+popupId+" .dialog-tip").html(tipStr);
								if(res.BLOCKACTION){
									buttonActions = "";
									buttonActions += '<form style="margin-bottom:0;margin-top:0;">';
									buttonActions += '<input class="buttn-blue-light" type="button" value="'+OkLabel+'" onClick="closeDialog(\''+ popupId +'\')" /> '	
									buttonActions += '</form>';
								}
								actions += buttonActions;
								$("#"+popupId+" .dialog-actions").html(actions);
							}else
								handleSecurityRedirect();
						});
					});
				})
				break;
			case "uninstall-dialog":
				output = "";
				$.post(moduleCFCPath + "?method=getListOfBundlesForUpgradeOrDowngrade",{commaBundles:"",
							actionType:"core|uninstall",token:cToken},function(res){
					res = JSON.parse(res);
					if(!res.ACCESSERROR){
						storeToBeInstalledBundles(res.LIST);
						output = res.MESSAGE;
						if(res.BLOCKACTION){
							// jee case - block further action on popup
							buttonActions = "";
							buttonActions += '<form>';
							buttonActions += '<input class="buttn" type="button" value="'+OkLabel+'" onClick="closeDialog(\''+ popupId +'\')" /> '	
							buttonActions += '</form>';
							$("#"+popupId+" .dialog-actions").html(buttonActions);
			            }
					}else
						handleSecurityRedirect();
					$("#"+popupId+" .dialog-tip").html(output);
				});
				break;
			default:
				break;

		}
	}


	function wordWrap(str, maxWidth) {
	    var newLineStr = "\n"; done = false; res = '';
	    while (str.length > maxWidth) {                 
	        found = false;
	        // Inserts new line at first whitespace of the line
	        for (i = maxWidth - 1; i >= 0; i--) {
	            if (testWhite(str.charAt(i))) {
	                res = res + [str.slice(0, i), newLineStr].join('');
	                str = str.slice(i + 1);
	                found = true;
	                break;
	            }
	        }
	        // Inserts new line at maxWidth position, the word is too long to wrap
	        if (!found) {
	            res += [str.slice(0, maxWidth), newLineStr].join('');
	            str = str.slice(maxWidth);
	        }

	    }

	    return res + str;
	}

	function testWhite(x) {
	    var white = new RegExp(/^\s$/);
	    return white.test(x.charAt(0));
	}

	let progressTracker = 0;
	function closeDialog(id){
		document.getElementById(id).style.display = 'none';
	}

	function openDialog(id,fromModules){
		fromModules = fromModules || false;
		let el = document.getElementById(id);
		if(el.style.display == 'none'){
			el.style.display = 'block';
			loadDialog(id,fromModules);
		}
		el.focus();
	}

	function showProgressBar(id){
		document.getElementById(id).style.display = 'block';
	}

	function hideProgressBar(id){
		document.getElementById(id).style.display = 'none';
	}

	function startProgressBar(pid,uid,action){
		var progressbar = $("#"+pid);
		progressbar.progressbar("enable");
		if(pid == "progressbar-core")
			jsGetStatus(pid,uid);
		if(pid == "progressbar-module-install" || pid == "progressbar-module-update")
			getInstallAllStatus(pid,uid,action);
	}

	function stopProgressBar(id){
		$("#"+id).progressbar("disable");
	}

	function updateProgressBar(pid,value,message){
		$("#"+pid).progressbar({
			value: value*100
		})
		var progressLabel = $( "#"+pid + " .progress-label" );
		progressLabel.text( message);
	}

	function jsGetStatus(pid,uid){
		progressTracker = 1;
		let progressInterval = setInterval(function() {
			path = downloadCFCPath;
			if(progressTracker!=0){
	           	$.get(path +'?method=getstatus&id='+uid,function(res){
	           		res = JSON.parse(res);
	                updateProgressBar(pid,res.STATUS,res.MESSAGE);
	                if(res.STATUS == 1 || res.ERRORINFO){
	                	progressTracker = 0;
	                	hideAll();
	                    clearInterval(progressInterval);
	                }
	            });
	       	}
        }, 500);
	}
	
</script>
9 ../footer.cfm;�
</body>
<script>

	
		function checkProgress()
		{
			$.get(downloadCFCPath +"?method=getPercentComplete",function(res){
				percentComplete = JSON.parse(res);
				if(percentComplete > 0 && percentComplete < 100){
					$.get(downloadCFCPath + "?method=getCurrent" , function(res){
						showProgressOnPageRefresh(JSON.parse(res));
					});
				}
			});
		}
		function showProgressOnPageRefresh(update)
		{
			if (update.CURRENT != "" ){
				if($("#open-hfid") && $("#open-hfid").val() == update.CURRENT)
				{
					showProgressBar("progressbar-core");
					startProgressBar("progressbar-core",update.CURRENT);
					changeUIButtionState(true);
				}else{
					hideProgressBar("progressbar-core");
					changeUIButtionState(false)
				}
			}
			
		}
		//checkProgress();
	// });
	
	$(document).ready(function(){
		function checkModuleProgressOnPageRefresh(){
	        if(window.localStorage){
	            let currentProgressId = window.localStorage.getItem("moduleProgressBarId");
	            if(currentProgressId && currentProgressId != ""){
	            	let section = currentProgressId.split("|")[0];
	            	let progressId = currentProgressId.split("|")[1];
	            	if(section && progressId){
		            	if(section == 2){
		            		// update all progressbar
		            		$('#updateAllBtn').hide();
					        $('#uninstallAllBtn').hide();
					        $('#checkUpdatesAction').hide();
		            		showProgressBar('progressbar-module-update');
		            		startProgressBar('progressbar-module-update',progressId);
		            	}else{
		            		// install all progressbar
		            		$('#installAllBtn').hide();
		                	showProgressBar('progressbar-module-install');
		                	startProgressBar('progressbar-module-install',progressId);
		            	}
		            }
	            }else{
	            	$('#installAllBtn').show();
	            }
	        }
	    }

	    checkModuleProgressOnPageRefresh();
	});

	function catchAjaxError(err){
		if(err.message.includes('JSON') && err.name == "SyntaxError")
            window.location.href = "=/CFIDE/administrator/updates/index.cfm"; 
	}
	function handleSecurityRedirect(){
        window.alert("There was an error accessing this page. Check logs for more details. ")
        window.location.href = "../securityerror.cfm";
    }

</script>



</body>
</html>
? metaData Ljava/lang/Object;AB	 C 	FunctionsE 
PropertiesG getMetadata ()Ljava/lang/Object; this Lcfindex2ecfm715844041; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; 	include37 #Lcoldfusion/tagext/lang/IncludeTag; 	include38 	include39 	include40 	include41 	include42 LineNumberTable include0 output1  Lcoldfusion/tagext/io/OutputTag; mode1 I t7 t8 Ljava/lang/Throwable; t9 t10 output2 mode2 t13 t14 t15 t16 cookie3 !Lcoldfusion/tagext/net/CookieTag; silent4  Lcoldfusion/tagext/io/SilentTag; mode4 t20 t21 t22 t23 t24 t25 module8 $Lcoldfusion/tagext/lang/ImportedTag; mode8 t28 t29 t30 t31 t32 t33 module9 mode9 t36 t37 t38 t39 t40 t41 module10 mode10 t44 t45 t46 t47 t48 t49 t50 ,Lcoldfusion/runtime/TransientVariableHolder; t51 #Lcoldfusion/runtime/AbortException; t52 Ljava/lang/Exception; __cfcatchThrowable0 t54 t55 output12 mode12 t58 t59 t60 t61 t62 	include13 	include14 	include15 	include16 	include17 output18 mode18 t70 t71 t72 t73 output48 mode48 t76 t77 t78 t79 t80 t81 t82 t84 java/lang/Throwable� !coldfusion/runtime/AbortException� java/lang/Exception� output29 mode29 t6 	include30 abort31 !Lcoldfusion/tagext/lang/AbortTag; module32 mode32 t11 form33 %Lcoldfusion/tagext/html/form/FormTag; mode33 t17 t18 t19 module34 mode34 t26 t27 module35 mode35 t34 t35 form36 mode36 t42 t43 object11 "Lcoldfusion/tagext/lang/ObjectTag; module22 mode22 output21 mode21 t12 module24 mode24 output23 mode23 runPage output49 mode49 output50 mode50 output51 mode51 output52 mode52 output53 mode53 output54 mode54 output55 mode55 output56 mode56 output57 mode57 t56 t57 output58 mode58 t63 output59 mode59 t66 t67 t68 t69 output60 mode60 t74 t75 output61 mode61 output62 mode62 t85 t86 t87 output63 mode63 t90 t91 t92 t93 output64 mode64 t96 t97 t98 t99 output65 mode65 t102 t103 t104 t105 output66 mode66 t108 t109 t110 t111 output67 mode67 t114 t115 t116 t117 output68 mode68 t120 t121 t122 t123 output69 mode69 t126 t127 t128 t129 output70 mode70 t132 t133 t134 t135 output71 mode71 t138 t139 t140 t141 output72 mode72 t144 t145 t146 t147 output73 mode73 t150 t151 t152 t153 output74 mode74 t156 t157 t158 t159 	include75 output76 mode76 t163 t164 t165 t166 	include43 	include44 	include45 	include46 	include47 header19 !Lcoldfusion/tagext/net/HeaderTag; 	content20 "Lcoldfusion/tagext/net/ContentTag; module26 mode26 output25 mode25 module28 mode28 output27 mode27 <clinit> 1     _                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �            
                        "    &    *    .    2    6    :    >    B    F    J    N    R    V    Z    ^    ��   ��   ��   �   U�   ��   7�   ��   ��   a�   s�   AB    IJ N   "     �D�   M       KL      N  5    *+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� �**+,� �**+,� �	**+,� �**+,� �**+,� �**+,� �**+,� �**+,� �!**#+,� �%**'+,� �)**++,� �-**/+,� �1**3+,� �5**7+,� �9**;+,� �=**?+,� �A**C+,� �E**G+,� �I**K+,� �M**O+,� �Q**S+,� �U**W+,� �Y**[+,� �]**_+,� �a�   M       KL    OP   QR     N   #     *� 
�   M       KL   �j N  _  
  o,���*��%+����:*l���������� �*,V��*��&+����:*n���������� �*,
��*��'+����:*o���������� �*,���*��(+����:*s���������� �,���,**�)�˸���,���*��)+����:*u���������� �,ö�,**� U�˸���,Ŷ�*��*+����:	*x��	Ƕ�	��	��� �*�   M   f 
  oKL    oSp   oTU   o�B   oVW   oXW   oYW   oZW   o[W   o\W 	]   r  l l l Un Un =n �o �o so �s �s �s �t �t �t �t �tuu �u*w*w*w*w)wWxWx?x �j N   
 U  h,|��*��+����:*���������� �,���*��+����:*������Y6� #,*O��Y�S�������Ě����� :� #�� � #:�ͨ � :	� 	�:
�Щ
,Ҷ�*��+����:*������Y6� #,*O��Y�S�������Ě����� :� #�� � #:�ͨ � :� �:�Щ,Զ�*,ֶ�*��**��*�����Y�S��� w*��+����:*�������*���YS��������*��*�޶������� �*�+���:*�����Y6� /*,�"M�#���� � :� �:*,�'M��*� :� #�� � #:�+� � :� �:�,�**�Q.02�6*O��Y8S�:Y<�>*O��Y@S�����DF�D�I�M**� yO�R**�]T�R*�Y+���[:* ��]_a�d�fY��YhSYjSYlSYjS�o�u���vY6� 6*,�"M,x���y���� � :� �:*,�'M��*� :� #�� � #:�z� � : �  �:!�{�!*� =*O��Y}SYSY�SY�S����*�Y	+���[:"*%��"]_a�d"�fY��YhSY�SYlSY�S�o�u"��"�vY6#� 6*"#,�"M,���"�y���� � :$� $�:%*#,�'M�%"�*� :&� #&�� � #:'"'�z� � :(� (�:)"�{�)*�a����*�Y
+���[:***��*]_a�d*�fY��YhSY�SYlSY�S�o�u*��*�vY6+� 6**+,�"M,���*�y���� � :,� ,�:-*+,�'M�-*�*� :.� #.�� � #:/*/�z� � :0� 0�:1*�{�1*�a������Y*�h��:2*� �*���Y�S����*�a����� K� Q:33�:44��:55�����              2�5��� 4�� � :6� 6�:72���7*�=*7��*���ö�**� =�˸��� Z*�]����**�a�˸��� )*;��**�=�˸�**�5�˸�W�  *=��**�=�˸�**� ��˸�W**�a�˸����Y�� W**� =�˸� ?*�=*@��*���ö�*�]����*B��**�=�˸�**� ٶ˸�W*���Y�S��ݸ��~���Y�� /W*G��*���Y�S���������~��׸� :*�Y�*���Y�S�����*H��*������� 7*�Y�*���Y�S�����*J��*������*���Y�S��ݸ��~���Y�� /W*L��*���Y�S���������~��׸� :*� 1�*���Y�S�����*M��*������� 7*� 1�*���Y�S�����*O��*������*� }���*� ����*����*� � ��*� %��*� I��*� i��,��*��+����:8*[��8��8��Y69� �*8,�l� ::� �:�*,
��**� E������� A*,6��*� �*o��**� �˸�**� E�˸pg�t�x��*,
�ڧ :*,6��*� �*z��Y|SY~S��������*,
��*,
��,*s��**� Ѷ�����*,���8�Ě�08��� :;� #;�� � #:<8<�ͨ � :=� =�:>8�Щ>,���*� �* ���*�����*,���*��+����:?* ���?���?��?��� �*��+����:@* ���@���@��@��� �*��+����:A* ���A���A��A��� �*��+����:B* ���B���B��B��� �*��+����:C* ���C���C��C��� �,���*��+����:D* ���D��D��Y6E� 2,���,* ���**� A������,���D�Ě��D��� :F� #F�� � #:GDG�ͨ � :H� H�:ID�ЩI,���*��0+����:J* ���J��J��Y6K� �*J,�L� :L� �L�*J,�j� :M� �M�*J,��� :N� �N�*J,��� :O� xO�,̶�**�9�ж�� *J,��� :P� LP�,���*,���J�Ě�pJ��� :Q� #Q�� � #:RJR�ͨ � :S� S�:TJ�ЩT*� O R � �� � � �� R � �� � � �� � � �� � � �� ��� �'�'�$'�','��$��?K�EHK��?Z�EHZ�KWZ�Z_Z�+GJ�JOJ� jv�psv� j��ps��v�������9<�<A<�\h�beh�\w�bew�htw�w|w�����.:�47:��.I�47I�:FI�INI�q���q���q�������������	���	�	��	�	�	����	���	�	��	�	�	��	�	�	��	�	�	��
�AM�GJM�
�A\�GJ\�MY\�\a\���F���F���F���F��F�:F�@CF���U���U���U���U��U�:U�@CU�FRU�UZU� M  T U  hKL    hSp   hTU   h�B   h^W   h_`   hab   hcB   hde   hfe 	  hgB 
  hh`   hib   hjB   hke   hle   hmB   hno   hpq   hrb   hse   htB   huB   hve   hwe   hxB   hyz   h{b   h|e   h}B   h~B   he   h�e    h�B !  h�z "  h�b #  h�e $  h�B %  h�B &  h�e '  h�e (  h�B )  h�z *  h�b +  h�e ,  h�B -  h�B .  h�e /  h�e 0  h�B 1  h�� 2  h�� 3  h�� 4  h�e 5  h�e 6  h�B 7  h�` 8  h�b 9  h�B :  h�B ;  h�e <  h�e =  h�B >  h�W ?  h�W @  h�W A  h�W B  h�W C  h�` D  h�b E  h�B F  h�e G  h�e H  h�B I  h�` J  h�b K  h�B L  h�B M  h�B N  h�B O  h�B P  h�B Q  h�e R  h�e S  h�B T]  ��       ^  ^  ^  ^  ]  9  �  �  �  �  �  � ? T T a a M M � � � � � � � � � � � � � � n M � l l l l p p s s v v k k k � � � � � � � � � � � � | | � � � � � � � � � � � � � � � � � �         �  � "� "� "� "� "� "� %� % % %� %� '� '� '� '� '� '� *� *� *� *� *^ ,^ ,^ ,^ ,Z ,Z ,u 0u 0u 0u 0q 0q 0� 1� 1� 1� 1� 1� 1d /� 7� 7� 7� 7� 7� 7� 7� 8� 8� 8� 8� 8� 8 9 9 9 9 9 : : : : : :, ;, ;, ;, ;7 ;7 ;, ;, ;, ;L =L =L =L =W =W =L =L =L =L = :� 8c ?c ?c ?c ?c ?c ?c ?c ?{ ?{ ?{ ?{ ?c ?c ?� @� @� @� @� @� @� @� A� A� A� A� A� B� B� B� B� B� B� B� B� Bc ?� 6� G� G� G� G� G� G� G� G� G� G� G� G
 G
 G� G� G� G� G� G� G" H" H% H% H% H% H" H" H" H" HB HB HB HB H" H" H" H" HI HI H" H" H" H" H H HY JY J\ J\ J\ J\ JY JY JY JY Jy Jy Jy Jy JY JY JY JY J� J� JY JY JY JY JU JU JU I� G� L� L� L� L� L� L� L� L� L� L� L� L� L� L� L� L� L� L� L� L� M� M� M� M� M� M� M� M� M� M M M M M� M� M� M� M M M� M� M� M� M� M� M O O  O  O  O  O O O O O= O= O= O= O O O O OD OD O O O O O O O N� LQ RQ RQ RQ RM RM R[ S[ S[ S[ SW SW Se Te Te Te Ta Ta To Uo Uo Uo Uk Uk Uy Vy Vy Vy Vu Vu V� W� W� W� W W W� X� X� X� X� X� X� n� n� n� n	  o	  o	  o	  o	 o	 o	 o	 o	 o	 o	 o	 o	 o	 o	  o	  o	  o	  o� o� o	8 q	8 q	8 q	8 q	R q	R q	8 q	8 q	8 q	8 q	4 q	4 q	, p� n	r s	r s	z s	z s	r s	r s	r s	r s	k s� [	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �

 �

 �	� �
8 �
8 �
  �
f �
f �
N �
� �
� �
| �
� �
� �
� � � � � � � � � � �
� ��z�z�z�z�z�z�z�z�z�z�zt � hj N  T    *,���**�%NP����Y�� W**�%RT���׸� �*,V��*� M���**�%����� *� M*#��Y�S����*G��**� ��P�*��Y**� M��SY*O��Y�S��S��W*,
��*��+����:*I������Y6� ,X���Ě����� :� #�� � #:�ͨ � :� �:	�Щ	*,���*,���**��?� �*,
��*� eZ��*,
��*� Q\��*,
��*� 5*#��Y^S����*,
��*� �*���YS����*,
��*��+����:
*T��
`��
��
��� �*,
��*�e+���g:*U������� �*,���*�  � �� � � � �� � ��� M   z   KL    Sp   TU   �B   �`   �b   �B   ce   de   fB 	  �W 
  �� ]  � ` 	> 	> 	> 	> > > > > > > > > "> "> "> "> &> &> )> )> !> !> !> !> > > DB DB DB DB @B KC KC KC KC OC OC RC RC JC JC _E _E _E _E [E JC zG zG �G �G �G �G zG zG zG @@ �I >4O4O4O4O3O3OJPJPJPJPFPFP\Q\Q\Q\QXQXQnRnRnRnRjRjR�S�S�S�S�S�S�S�S�T�T�T�U3O �j N  �  ,  �,l��*�Y +���[:*X��]_a�d�fY��YhSYnS�o�u���vY6� 6*,�"M,p���y���� � :� �:*,�'M��*� :� #�� � #:		�z� � :
� 
�:�{�,r��*�w!+���y:*]��{�|~����*���Y�S��������������Y6� r*,�"M,���,*^��**��P�*��Y*O��Y�S��S������,��������� � :� �:*,�'M���� :� #�� � #:��� � :� �:���,���*�Y"+���[:*a��]_a�d�fY��YhSY�SYlSY�S�o�u���vY6� 6*,�"M,����y���� � :� �:*,�'M��*� :� #�� � #:�z� � :� �:�{�,**� �˸���,���*�Y#+���[:*b��]_a�d�fY��YhSY�SYlSY�S�o�u���vY6� 6*,�"M,����y���� � :� �:*,�'M��*� : � # �� � #:!!�z� � :"� "�:#�{�#,���*�w$+���y:$*d��$��|$~��$��*���Y�S�������$���$��$��Y6%� �*$%,�"M,���,*e��**��P�*��Y*O��Y�S��S������,���,**�I�˸���,���$������ � :&� &�:'*%,�'M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � ��-�������"�������"���������������9UX�X]X�.x��~���.x��~�����������47�7<7�Wc�]`c�Wr�]`r�cor�rwr��Z]�]b]��}�������}�������������� M  � ,  �KL    �Sp   �TU   ��B   ��z   ��b   ��e   �cB   �dB   �fe 	  �ge 
  ��B   ���   ��b   �ke   �lB   �mB   ��e   ��e   ��B   ��z   ��b   �ue   �vB   �wB   �xe   ��e   ��B   ��z   ��b   �~e   �B   ��B    ��e !  ��e "  ��B #  ��� $  ��b %  ��e &  ��B '  ��B (  ��e )  ��e *  ��B +]   � ? >X >X X �] �] �] �] �] �] �] �]]]F^F^X^X^F^F^F^F^>^ �]aaaa�a�a�a�a�a�a�b�b�b�b�b�d�d�d�d�d�d�d�d�d�deeeeeeee�e:f:f:f:f9f�d ij N  �    �*,
��,*\��**�Y�����*,
��,*]��**� 1�����*,
��*� �**^��*����Y S�#��*,
��,*_��**� ���%���*,
��,*`��*���Y�SY'S��'���*,
��*� a*a��**a��*)�,�0�׶�*,
��,*b��**� a��2���*,
��*���Y�SY4S���� �*,6��*�;+���=:*d��?�B�EG�JL�M����� �*,6��*� �*e��***� ��PR����*,
�ڧ *,6��*� �T��*,
��*,
��,*i��**� Ŷ�V���*,
��*� !*j��**���Y�SYXS�[]����*,
��,*k��**� !��_���*,
��*� *l��*�b��*,
��*� E*m��d**� �˸��h���*�   M   4   �KL    �Sp   �TU   ��B   ��� ]  * �  \  \  \  \  \  \  \  \  \ / ] / ] 7 ] 7 ] / ] / ] / ] / ] ( ] T ^ T ^ W ^ W ^ S ^ S ^ L ^ L ^ L ^ L ^ H ^ H ^  _  _ � _ � _  _  _  _  _ x _ � ` � ` � ` � ` � ` � ` � ` � ` � ` � a � a � a � a � a � a � a � a � a � a � a � a � b � b � b � b � b � b � b � b � b c cL dL dT dT d\ d\ dd dd d5 d� e� e� e� e� e� e� e� e� g� g� g� g� g� g� f c� i� i� i� i� i� i� i� i� i� j� j� j� j� j� j- k- k5 k5 k- k- k- k- k& kP lP lP lP lF lF li mi ml ml ml ml mi mi mi mi m_ m_ m #j N  �     �*,��**� �	����Y�� !W*���YS������~�׸�2*,��*�Y+���[:*��]_a�d�fY��YhSYSYlSYS�o�u���vY6� �*,�"M*������:*������Y6� :,��,*��*���YS�������,���Ě����� :� )� E� }�� � #:		�ͨ � :
� 
�:�Щ�y��^� � :� �:*,�'M��*� :� #�� � #:�z� � :� �:�{�*,��*�Y+���[:*��]_a�d�fY��YhSYSYlSYS�o�u���vY6� �*,�"M*������:*������Y6� :,��,*��*���Y S�������,"���Ě����� :� )� E� }�� � #:�ͨ � :� �:�Щ�y��^� � :� �:*,�'M��*� :� #�� � #:�z� � :� �:�{�*,��*�!**�E�˶�*,��*� 9**��˸�**� ��˸����*,��*�U**� ��˶�*,�ڧ 9*,��*�!**�	�˶�*,��*�U**� ��˶�*,��*� " �%1�+.1� �%@�+.@�1=@�@E@� �%_�+\_�_d_� �%��+������ �%��+��������������8�������8������������������������������������������������� M  B    �KL    �Sp   �TU   ��B   ��z   ��b   ��`   ��b   �dB   �fe 	  �ge 
  ��B   ��e   �jB   �kB   �le   �me   ��B   ��z   ��b   ��`   ��b   �uB   �ve   �we   �xB   ��e   ��B   �|B   �}e   �~e   �B ]  r \ 	 	 	 	         ! ! 1 1 ! ! ! !   � � � � � � � � � � � � � � L����RRRRRRRRJ�5555@@@@555511] ] ] ] Y Y """"{"{"�#�#�#�#�#�#s!  �J N  �  �  �*�h�nL*�rN*�ht�z*-+��� �+��*��1-����:*�������Y6� �*+���+*���**� �������*+���+*���**�M������*+���+*���**� �������*+���+*���**� ն�����*+���+*���**� -������*+����Ě�N��� :� #�� � #:�ͨ � :� �:	�Щ	+ ��*��2-����:
*���
��
��Y6� +**� ��˸���
�Ě��
��� :� #�� � #:
�ͨ � :� �:
�Щ+��*��3-����:*�������Y6� +**� ��˸����Ě����� :� #�� � #:�ͨ � :� �:�Щ+��*��4-����:*�������Y6� 0+**� ��˸���+��+**� u�˸����Ě����� :� #�� � #:�ͨ � :� �:�Щ+��*��5-����:*¶�����Y6� +**� ݶ˸����Ě����� :� #�� � #:�ͨ � : �  �:!�Щ!+
��*��6-����:"*Ķ�"��"��Y6#� 1+**� ��˸���*+��+**� ݶ˸���"�Ě��"��� :$� #$�� � #:%"%�ͨ � :&� &�:'"�Щ'+��*��7-����:(*Ͷ�(��(��Y6)� +**� ��˸���(�Ě��(��� :*� #*�� � #:+(+�ͨ � :,� ,�:-(�Щ-+��*��8-����:.*ζ�.��.��Y6/� +**� ��˸���.�Ě��.��� :0� #0�� � #:1.1�ͨ � :2� 2�:3.�Щ3+��*��9-����:4*Ҷ�4��4��Y65� 0+**� ��˸���+��+**� u�˸���4�Ě��4��� :6� #6�� � #:747�ͨ � :8� 8�:94�Щ9+��*��:-����::*Ӷ�:��:��Y6;� +**� ݶ˸���:�Ě��:��� :<� #<�� � #:=:=�ͨ � :>� >�:?:�Щ?+��*��;-����:@*Զ�@��@��Y6A� 1+**� u�˸���*+��+**� ݶ˸���@�Ě��@��� :B� #B�� � #:C@C�ͨ � :D� D�:E@�ЩE+��*��<-����:F*��F��F��Y6G� +**��˸���F�Ě��F��� :H� #H�� � #:IFI�ͨ � :J� J�:KF�ЩK+��*��=-����:L*��L��L��Y6M� +**��˸���L�Ě��L��� :N� #N�� � #:OLO�ͨ � :P� P�:QL�ЩQ+��*��>-����:R*��R��R��Y6S� +**��˸���R�Ě��R��� :T� #T�� � #:URU�ͨ � :V� V�:WR�ЩW+��*��?-����:X*��X��X��Y6Y� +**��˸���X�Ě��X��� :Z� #Z�� � #:[X[�ͨ � :\� \�:]X�Щ]+ ��*��@-����:^*���^��^��Y6_� +**� ��˸���^�Ě��^��� :`� #`�� � #:a^a�ͨ � :b� b�:c^�Щc+"��*��A-����:d*���d��d��Y6e� +**� ��˸���d�Ě��d��� :f� #f�� � #:gdg�ͨ � :h� h�:id�Щi+$��*��B-����:j*$��j��j��Y6k� +**�1�˸���j�Ě��j��� :l� #l�� � #:mjm�ͨ � :n� n�:oj�Щo+&��*��C-����:p*'��p��p��Y6q� +**�-�˸���p�Ě��p��� :r� #r�� � #:sps�ͨ � :t� t�:up�Щu+(��*��D-����:v*+��v��v��Y6w� +**� ��˸���v�Ě��v��� :x� #x�� � #:yvy�ͨ � :z� z�:{v�Щ{+*��*��E-����:|*,��|��|��Y6}� +**� ��˸���|�Ě��|��� :~� #~�� � #:|�ͨ � :�� ��:�|�Щ�+,��*��F-����:�*/��������Y6�� (+.��+**� ��˸���+0����Ě������ :�� #��� � #:����ͨ � :�� ��:���Щ�+2��*��G-����:�*2��������Y6�� +**� �˸�����Ě������ :�� #��� � #:����ͨ � :�� ��:���Щ�+4��*��H-����:�*4��������Y6�� +**� �˸�����Ě������ :�� #��� � #:����ͨ � :�� ��:���Щ�+6��*��I-����:�*9��������Y6�� +**� �˸�����Ě������ :�� #��� � #:����ͨ � :�� ��:���Щ�+8��*��J-����:�*E��������Y6�� +**� ��˸�����Ě������ :�� #��� � #:����ͨ � :�� ��:���Щ�+:��*��K-����:�*���<��������� �+>��*��L-����:�*,��������Y6�� +*,��*�����Ě������ :�� #��� � #:����ͨ � :�� ��:���Щ�+@��� � F�� F-�-�*-�-2-�a�������a�������������������'�'�$'�','�[�������[����������������(�"%(��7�"%7�(47�7<7�k�������k����������������-9�369��-H�36H�9EH�HMH�|�������|����������������=I�CFI��=X�CFX�IUX�X]X�������������������������	NZ�TWZ�	Ni�TWi�Zfi�ini�������������������������HT�NQT�Hc�NQc�T`c�chc�������������������������BN�HKN�B]�HK]�NZ]�]b]�������������������������		<	H�	B	E	H�		<	W�	B	E	W�	H	T	W�	W	\	W�	�	�	��	�	�	��	�	�	��	�	�	��	�	�	��	�	�	��

6
B�
<
?
B�

6
Q�
<
?
Q�
B
N
Q�
Q
V
Q�
�
�
��
�
�
��
�
�
��
�
�
��
�
�
��
�
�
��0<�69<�0K�69K�<HK�KPK�����������������������
8D�>AD�
8S�>AS�DPS�SXS�������������������������2>�8;>�2M�8;M�>JM�MRM�������������������������3am�gjm�3a|�gj|�my|�|�|� M  � �  �KL    �TU   ��B   �op   ��`   ��b   ��B   �ce   �de   �fB 	  ��` 
  ��b   ��B   �je   �ke   �lB   ��`   ��b   ��B   ��e   �se   �tB   ��`   ��b   �wB   �xe   ��e   ��B   ��`   ��b   �~B   �e   ��e    ��B !  ��` "  ��b #  ��B $  ��e %  ��e &  ��B '  ��` (  ��b )  ��B *  ��e +  ��e ,  ��B -  ��` .  ��b /  ��B 0  ��e 1  ��e 2  ��B 3  ��` 4  ��b 5  ��B 6  ��e 7  ��e 8  ��B 9  ��` :  ��b ;  ��B <  ��e =  ��e >  ��B ?  ��` @  ��b A  ��B B  ��e C  ��e D  � B E  �` F  �b G  ��B H  ��e I  �e J  �B K  �` L  �b M  ��B N  ��e O  ��e P  ��B Q  �` R  �b S  ��B T  �	e U  �
e V  �B W  �` X  �b Y  �B Z  �e [  �e \  �B ]  �` ^  �b _  �B `  �e a  �e b  �B c  �` d  �b e  �B f  �e g  �e h  �B i  �` j  �b k  � B l  �!e m  �"e n  �#B o  �$` p  �%b q  �&B r  �'e s  �(e t  �)B u  �*` v  �+b w  �,B x  �-e y  �.e z  �/B {  �0` |  �1b }  �2B ~  �3e   �4e �  �5B �  �6` �  �7b �  �8B �  �9e �  �:e �  �;B �  �<` �  �=b �  �>B �  �?e �  �@e �  �AB �  �B` �  �Cb �  �DB �  �Ee �  �Fe �  �GB �  �H` �  �Ib �  �JB �  �Ke �  �Le �  �MB �  �N` �  �Ob �  �PB �  �Qe �  �Re �  �SB �  �TW �  �U` �  �Vb �  �WB �  �Xe �  �Ye �  �ZB �]  � � a� a� i� i� a� a� a� a� Y� �� �� �� �� �� �� �� �� z� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� *�m�m�m�m�l�E�������������g�g�g�g�f�}�}�}�}�|�?�������������w�w�w�w�v�����������O�����
�������������`�����������������������p������,�,�,�,�+���������������&�&�&�&�%�������������{� � � � ��������������u�	�	�	�	�	���	�$	�$	�$	�$	�$	o$
'
'
'
'
'	�'
�+
�+
�+
�+
�+
i+,,,,,
�,�/�/�/�/�/c/22222�2�4�4�4�4�4k499999�9�E�E�E�E�EeE������F,F,F,F,>,,   �j N  �  	  y,Ҷ�,**� U�˸���,Զ�*��++����:*|��ֶ������ �,ض�,**� U�˸���,Զ�*��,+����:*��ڶ������ �,ܶ�,**� U�˸���,Զ�*��-+����:*���޶������ �,��,**� U�˸���,��*��.+����:*���������� �,��,**� ]�˸���,Զ�*��/+����:*���������� �*�   M   \ 	  yKL    ySp   yTU   y�B   y[W   y\W   y]W   y^W   y_W ]   � ( { { { { { 5| 5| | S~ S~ S~ S~ R~ � � h �� �� �� �� �� �� �� �� �� �� �� �� ���� ��4�4�4�4�3�a�a�I� Jj N  �    �*,
��*�!���*,���**�%������*,���*� M���**�%����� *� M*#��Y�S����* ��**� ��P�*��Y**� M��SY*O��Y�S��S��W*� )*��*����*��***� )�P���Y�S��W*��* ȅ��*,6��*�A*��**O��Y}S�[�����**� ��˸��ȶ��*,6��*��+����:*��Ѷ�Զ������ �*,6��*��+����:*��޶���**�A�˸��������� �*,
��*,���**� ����� B*,6��*�!*���Y�S����,��,**�!�˸���,��� �**� ������ �*+,�3� �,5��,*O��Y7S������,9��,**�!�˸���,;��**�U�?�  ,A��,**�U�˸���,C��*,���**� 9�?�  ,E��,**� 9�˸���,G��,I��*�   M   >   �KL    �Sp   �TU   ��B   �`a   �bc ]  � �  �  �  �  �  �  �  �  �  �  �  �  � " � " �  �  � 7 � 7 � 7 � 7 � 3 � > � > � > � > � B � B � E � E � = � = � R � R � R � R � N � = � m  m      �  �  m  m  m  � � � � � � � � � � � � � � � � � � � � � � � 3 � � � � � � � � �(( � � � � � �QQYY9������w  �����������������    $$''D2D2D2D2C2c3c3c3c3b3y5y5y5y5x5x5�6�6�6�6�6x5�8�8�8�8�8�8�9�9�9�9�9�8� .j N  �     �*,��**� �	����Y�� !W*���YS������~�׸�2*,��*�Y+���[:*'��]_a�d�fY��YhSY'SYlSY'S�o�u���vY6� �*,�"M*������:*'������Y6� :,)��,*'��*���YS�������,���Ě����� :� )� E� }�� � #:		�ͨ � :
� 
�:�Щ�y��^� � :� �:*,�'M��*� :� #�� � #:�z� � :� �:�{�*,��*�Y+���[:*(��]_a�d�fY��YhSY+SYlSY+S�o�u���vY6� �*,�"M*������:*(������Y6� :,��,*(��*���Y S�������,-���Ě����� :� )� E� }�� � #:�ͨ � :� �:�Щ�y��^� � :� �:*,�'M��*� :� #�� � #:�z� � :� �:�{�*,��*�!**� Y�˶�*,��*� 9**� q�˸�**� ��˸����*,��*�U**� ��˶�*,�ڧ 9*,��*�!**� ��˶�*,��*�U**� ��˶�*,��*� " �%1�+.1� �%@�+.@�1=@�@E@� �%_�+\_�_d_� �%��+������ �%��+��������������8�������8������������������������������������������������� M  B    �KL    �Sp   �TU   ��B   �dz   �eb   �f`   �gb   �dB   �fe 	  �ge 
  ��B   ��e   �jB   �kB   �le   �me   ��B   �hz   �ib   �j`   �kb   �uB   �ve   �we   �xB   ��e   ��B   �|B   �}e   �~e   �B ]  r \ 	& 	& 	& 	& & & & & & & & & !& !& 1& 1& !& !& !& !& & & �' �' �' �' �' �' �' �' �' �' �' �' �' �' L'�(�(�(�(R(R(R(R(R(R(R(R(J((�())))))5*5*5*5*@*@*@*@*5*5*5*5*1*1*]+]+]+]+Y+Y+----{-{-�.�.�.�.�.�.s, & l  N   �     ������������������W���Y��Y�S��9���;˸���ظ���c���eu���w�fY��YFSY��SYHSY��S�o�D�   M       �KL   1j N  � 	   r*,6��*���Y�S��**� }�˸��~�� E*,���*�!*��**� �˸��*���Y�S�����*,6�ڧ*���Y�S��**� ��˸��~�� E*,���*�!*��**� �˸��*���Y�S�����*,�ڧ�*���Y�S��**� %�˸��~�� E*,��*�!*��**��˸��*���Y�S�����*,�ڧ9*���Y�S��**� I�˸��~�� E*,��*�!*��**� m�˸��*���Y�S�����*,�ڧ �*���Y�S��**� ɶ˸��~�� <*,��*�!**� ��˶�*,��*�U**� ��˶�*,�ڧ v*���Y�S��**��˸��~�� *+,�%� �*,�ڧ ;*���Y�S��**� i�˸��~�� *+,�0� �*,6��*�   M   *   rKL    rSp   rTU   r�B ]  � u       ? ? ? ? J J M M ? ? ? ? 4 4 n n ~ ~ n n � � � � � � � � � � � � � � � � � � � �  ::JJ::qqqq||qqqqff����������������������8%8%H%H%8%8%8%��: � n       b   c