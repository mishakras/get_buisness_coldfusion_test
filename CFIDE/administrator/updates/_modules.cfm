����  - � 
SourceFile )/CFIDE/administrator/updates/_modules.cfm *cf_modules2ecfm84162068$funcGETMODULESDATA  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( MODULEHELPERSERVICE * _setCurrentLineNo (I)V , -
  . 	component 0 )CFIDE.administrator.updates.module_helper 2 CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; 4 5 coldfusion/runtime/CFPage 7
 8 6 _set '(Ljava/lang/String;Ljava/lang/Object;)V : ;
  < STR > _get &(Ljava/lang/String;)Ljava/lang/Object; @ A
  B 
getModules D java/lang/Object F _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; H I
  J INSTALLEDBUNDLES L java/lang/String N installedBundles P _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; R S
  T UNINSTALLEDBUNDLES V uninstalledBundles X INSTUPDATECOUNT Z instUpdateCount \ ANYMODULESINSTALLED ^ anyModulesInstalled ` ANYMODULESAVAILABLE b anyModulesAvailable d getModulesData f metaData Ljava/lang/Object; h i	  j &coldfusion/runtime/AttributeCollection l name n 
Parameters p ([Ljava/lang/Object;)V  r
 m s getMetadata ()Ljava/lang/Object; this ,Lcf_modules2ecfm84162068$funcGETMODULESDATA; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       h i     u v  z   "     � k�    y        w x    { |  z   !     g�    y        w x    } ~  z   #     � O�    y        w x     �  z  �  
   �+� � :+� ,� :	-� � %:-� ):-+-X� /-13� 9� =-?-Y� /--+� CE� G� K� =-M-?� OYQS� U� =-W-?� OYYS� U� =-[-?� OY]S� U� =-_-?� OYaS� U� =-c-?� OYeS� U� =�    y   f 
   � w x     � � �    � � i    � � �    � � �    � � �    � � i    � & '    �  �    �  � 	 �   � +   W $ W . X . X 0 X 0 X - X - X - X - X $ X B Y B Y A Y A Y A Y A Y 8 Y W Z W Z W Z W Z T Z l [ l [ l [ l [ i [ � \ � \ � \ � \ ~ \ � ] � ] � ] � ] � ] � ^ � ^ � ^ � ^ � ^     z   #     *� 
�    y        w x    �   z   C     %� mY� GYoSYgSYqSY� GS� t� k�    y       % w x        ����  -� 
SourceFile )/CFIDE/administrator/updates/_modules.cfm cf_modules2ecfm84162068  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   REDIRECTLINK Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   INSTUPDATECOUNT   	   MODULESERVICE   	    DOWNGRADE_DEPENDENCY_TEXT " " 	  $ UNINSTALL_ACTION & & 	  ( CHECKCSRFTOKEN * * 	  , UPGRADE_ACTION . . 	  0 INSTALLEDBUNDLES 2 2 	  4 UNINSTALLALL_ACTION 6 6 	  8 MODULE_UPGRADECONFIRMATION : : 	  < MODULE_INSTALLCONFIRMATION > > 	  @ ADMINISTRATOR_BUNDLE B B 	  D 
COM_BUNDLE F F 	  H AXIS_BUNDLE J J 	  L GETMODULESDATA N N 	  P CHECKUPDATESACTION R R 	  T INSTALLALL_ACTION V V 	  X DOWNGRADE_ACTION Z Z 	  \ TOKEN ^ ^ 	  ` MODULEINSTALLSERVICE b b 	  d NO_NEW_UPDATES f f 	  h SHOWMESSAGE j j 	  l UPDATEALL_ACTION n n 	  p FORM r r 	  t UNINSTALL_ADMIN_MSG v v 	  x UNINSTALLONRESTART z z 	  | ADMINAPI_BUNDLE ~ ~ 	  � FORMATSTRING � � 	  � INSTALL_ACTION � � 	  � NEW_UPDATES_AVAILABLE � � 	  � UPDATEALLACTION � � 	  � UNINSTALL_DEPENDENCY_TEXT � � 	  � MODULE_UNINSTALLCONFIRMATION � � 	  � UNINSTALLEDBUNDLES � � 	  � MODULE_DOWNGRADECONFIRMATION � � 	  � BERRORSEXIST � � 	  � com.macromedia.SourceModTime  {��� pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/JspContext �
 � � parent Ljavax/servlet/jsp/tagext/Tag; � �	  � Cp1252 � setPageEncoding (Ljava/lang/String;)V � � !coldfusion/runtime/NeoPageContext �
 � � (class$coldfusion$tagext$lang$ImportedTag Ljava/lang/Class; "coldfusion.tagext.lang.ImportedTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � "coldfusion/tagext/lang/ImportedTag � _setCurrentLineNo (I)V � �
  � l10n � 
../cftags/ � admin � setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V � �
 � � &coldfusion/runtime/AttributeCollection � java/lang/Object � id � serviceconfigpagename � var � pagename � ([Ljava/lang/Object;)V  �
 � � setAttributecollection (Ljava/util/Map;)V � �  coldfusion/tagext/lang/ModuleTag �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
   Server Packages write � java/io/Writer
 doAfterBody	 �
 �
 _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;
  doEndTag � #javax/servlet/jsp/tagext/TagSupport
 doCatch (Ljava/lang/Throwable;)V
 � 	doFinally 
 � Delete module Package  installed_mod" Installed Packages$ installed_tip& 3These packages are already installed on the system.( none_installed_tip* .There are no packages installed on the system., available_mod. Available Packages0 not_installed_tip2 3These packages are not yet installed on the system.4 none_available_tip6 &No more packages available to install.8 status: Status< 	installed> 	Installed@ not_installedB Not InstalledD 
label_nameF NameH closeJ CloseL descriptionN DescriptionP installR InstallT 	uninstallV 	UninstallX upgradeZ Upgrade\ 	downgrade^ 	Downgrade` installed_versionb Installed Versiond required_cfcore_versionf Required CF Core Versionh req_bundlesj Required ColdFusion Packagesl req_jarsn Required Jarsp avail_versionsr Available Versionst install_statusv Install Statusx 	updateallz 
Update All| checkupdates~ Check Updates� var_none� None� 
installall� Install All� uninstallall� Uninstall All� module_uninstallConfirmation� 8Are you sure you want to uninstall package <b> {}  </b>?� module_installConfirmation� 5Are you sure you want to install package <b> {} </b>?� module_upgradeConfirmation� 5Are you sure you want to upgrade package <b> {} </b>?� module_downgradeConfirmation� 7Are you sure you want to downgrade package <b> {} </b>?� module_allInstallConfirmation� .Are you sure you want to install all packages?� module_allUpdateConfirmation� -Are you sure you want to update all packages?� module_allUninstallConfirmation� pAre you sure you want to uninstall all packages?<br>Packages Administrator and Adminapi will not be uninstalled.� pagedesc� CColdFusion lets you install/uninstall packages as per requirements.� YesLabel� Yes� NoLabel� No� module_installSuccessMsg� +Package {} has been installed successfully.� module_downgradeSuccessMsg� ,Package {} has been downgraded successfully.� module_upgradeSuccessMsg� *Package {} has been upgraded successfully.� module_uninstallSuccessMsg� -Package {} has been uninstalled successfully.� module_allInstallSuccessMsg� .All packages have been installed successfully.� module_allUninstallSuccessMsg� EAll packages except Administrator and Adminapi have been uninstalled.� module_allUpgradeSuccessMsg� -All packages have been upgraded successfully.� no_new_updates� No new updates available.� _factor1 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;��
 � new_updates_available� 0New updates available to the installed packages.� confirmation� Confirmation� uninstall_admin_msg� 3<b> {} </b>package cannot be uninstalled from here.� uninstall_dependency_text� �Package <b>{} </b>cannot be uninstalled because the package <b> {} </b> is dependent on it. You must first uninstall the package <b> {} </b>.� downgrade_dependency_text� �Package <b>{} </b>cannot be downgraded because the package <b> {} </b> is dependent on it. You must first downgrade the package <b> {} </b>.� check_logs_tip� #Please check logs for more details.� package_core_update_req1� <This package requires the core server to be at update level � dependent_packages_install� 5Following dependent packages will also be installed :� dependent_packages_upgrade� 4Following dependent packages will also be upgraded :� dependent_packages_downgrade� 6Following dependent packages will also be downgraded :  current_version_label 	(Current) category Category uninstallonrestart
 |This package requires server to be restarted once the uninstallation is done. Please restart for the changes to take effect. installAllNeedsRestart �The packages Administrator, Adminapi, Axis and Com require server to be restarted once the installation is done. If any of these are affected, please restart the server. uninstallAllNeedsRestart �The packages Administrator, Adminapi, Axis and Com require server to be restarted once the uninstallation is done. If any of these are affected, please restart the server.   checkSimpleParameter 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V
  %class$coldfusion$tagext$lang$ParamTag coldfusion.tagext.lang.ParamTag �	  coldfusion/tagext/lang/ParamTag! formatValues# � �
"% cfparam' default) ArrayNew (I)Ljava/util/List;+,
 - _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;/0
 1 
setDefault (Ljava/lang/Object;)V34
"5 array7 setType9 �
": _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z<=
 > adminapi@ setB4 coldfusion/runtime/VariableD
EC administratorG axisI comK javaM !coldfusion.server.felix.FelixUtilO CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;QR
 S &coldfusion.osgi.servlet.ModulesServletU _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;WX
 Y getModulesData[ 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;]^
 _ '
<script type="text/javascript">
    a $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTagdc �	 f coldfusion/tagext/io/OutputTagh
i � 

        k _whitespace %(Ljava/io/Writer;Ljava/lang/String;)Vmn
 o _autoscalarizeqX
 r jsUninstalledBundlest ToScript 8(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;vw
 x jsInstalledBundlesz install_action| uninstall_action~ installAll_action� uninstallAll_action� upgrade_action� downgrade_action� updateAll_action� _factor0��
 � 
    �
i
 coldfusion/tagext/QueryLoop�
�
�
iR
    
    function showModulesPopup(action){
        // modname
        let dependentStr = "",coreStr="", coreAction = null;
        $.ajax({
            url: downloadCFCPath + "?method=isSessionValid",
            type: "GET",
            success: function(res,textStatus, xhr){
                try{
                    var isValid = JSON.parse(res);
                    if(action == uninstall_action ){
                        modname = document.forms['moduleactions_installed'].currentInModname.value;
                        openDialog("uninstall-module-dialog");
                        if(jsInstalledBundles[modname].depbundlename != null){
                            depStr = formatString(uninstall_dependency_text,modname,jsInstalledBundles[modname].depbundlename,jsInstalledBundles[modname].depbundlename)
                            $("#uninstall-module-dialog  #uninstall-confirm-text").hide();
                            $("#uninstall-module-dialog  #uninstall-dependency-text").show();
                            $("#uninstall-module-dialog  #uninstallModuleActionCancel").hide();
                            $("#uninstall-module-dialog  #uninstall-dependency-text").html(depStr);
                            document.getElementById("uninstallModuleAction").onclick = function(){
                                closeDialog("uninstall-module-dialog");
                            }
                        }else{
                            // some bundles will be uninstalled only on next server restart CF-4210591
                            additionalStr = "";
                            if(modname == ADMINAPI_BUNDLE || modname == ADMINISTRATOR_BUNDLE || modname == COM_BUNDLE || modname ==AXIS_BUNDLE){
                                additionalStr = uninstallonrestart;
                            }
                            $("#uninstall-module-dialog  #uninstall-confirm-text").show();
                            $("#uninstall-module-dialog  #uninstall-confirm-text").html(formatString(module_uninstallConfirmation,modname));
                            $("#uninstall-module-dialog  #uninstall-dependency-text").show();
                            $("#uninstall-module-dialog  #uninstall-dependency-text").html(additionalStr);
                            $("#uninstall-module-dialog  #uninstallModuleActionCancel").show();
                            document.getElementById("uninstallModuleAction").onclick = function(){
                                uninstallModule(modname);
                            }
                        }
                    }else if(action == install_action){
                        // showing loader before popup as ajax call takes time
                        modname = document.forms['moduleactions_available'].currentUnModname.value;
                        token = document.forms['moduleactions_available'].csrftoken.value;
                        version = document.getElementById('un-module-version-select').value;
                        lcaseVer = version.toLowerCase();
                        $.ajax({
                            url:moduleCFCPath+"?method=getListOfBundlesForUpgradeOrDowngrade",
                            type:'POST',
                            data:{commaBundles:modname+":"+lcaseVer,
                                actionType:"package|"+action,
                                token:cToken},
                            beforeSend:function(){
                                $("#module-loader-img").css("display", "block"); 
                            },
                            success:function(res){
                                res = JSON.parse(res);
                                if(!res.ACCESSERROR){
                                    openDialog("install-module-dialog");
                                    $("#install-module-dialog  .dialog-module-text").html(formatString(module_installConfirmation,modname));
                                    storeToBeInstalledBundles(res.LIST);
                                    coreStr = res.MESSAGE;
                                    $("#install-module-dialog  .dialog-module-tip").html(dependentStr + coreStr);
                                    document.getElementById("installModuleAction").onclick = function(){
                                        if(res.BLOCKACTION){ // jee case- or when downgrade not possible
                                           $("#install-module-dialog  .dialog-module-text").html('');
                                           closeDialog("install-module-dialog");
                                        }else
                                            installModule(action,modname,version,res.COREACTION,res.LIST);
                                    }

                                }else
                                    handleSecurityRedirect();
                            },
                            complete: function(){
                                $("#module-loader-img").css("display", "none");
                            }
                        });
                    }
                    else if(action == upgrade_action ||  action == downgrade_action){
                        modname = document.forms['moduleactions_installed'].currentInModname.value;
                        token = document.forms['moduleactions_installed'].csrftoken.value;
                        
                        version = document.getElementById("module-version-select").value;
                        lcaseVer = version.toLowerCase();
                        // when a package to be downgraded , is a dependent package for some other packages 
                        if(action == downgrade_action && jsInstalledBundles[modname].depbundlename != null){
                            openDialog("install-module-dialog");
                            msgStr = action == upgrade_action?module_upgradeConfirmation:module_downgradeConfirmation;
                            $("#install-module-dialog  .dialog-module-text").html(formatString(msgStr,modname));
                            depStr = formatString(downgrade_dependency_text,modname,jsInstalledBundles[modname].depbundlename,jsInstalledBundles[modname].depbundlename);
                            $("#install-module-dialog  .dialog-module-text").hide();
                            $("#install-module-dialog  .dialog-module-tip").html(depStr);
                            $("#install-module-dialog  #installModuleActionCancel").hide();
                            document.getElementById("installModuleAction").onclick = function(){
                                closeDialog("install-module-dialog");
                            }
                        }
                        else{
                            $("#uninstall-module-dialog  .dialog-module-text").show();
                            $("#uninstall-module-dialog  #installModuleActionCancel").show();
                            $.ajax({
                                url:moduleCFCPath+"?method=getListOfBundlesForUpgradeOrDowngrade",
                                type:'POST',
                                data:{commaBundles:modname+":"+lcaseVer,
                                    actionType:"package|"+action,
                                    token:cToken},
                                beforeSend:function(){
                                    $("#module-loader-img").css("display", "block");
                                },
                                success:function(res){
                                    res = JSON.parse(res);
                                    if(!res.ACCESSERROR){
                                        openDialog("install-module-dialog");
                                        msgStr = action == upgrade_action?module_upgradeConfirmation:module_downgradeConfirmation;
                                        $("#��install-module-dialog  .dialog-module-text").html(formatString(msgStr,modname));
                                        storeToBeInstalledBundles(res.LIST);
                                        coreStr = res.MESSAGE;
                                        $("#install-module-dialog  .dialog-module-tip").html(dependentStr + coreStr);
                                        document.getElementById("installModuleAction").onclick = function(){
                                            if(res.BLOCKACTION){ // jee case- or when downgrade not possible
                                                $("#install-module-dialog  .dialog-module-text").html('');
                                                closeDialog("install-module-dialog");
                                            }else
                                                installModule(action,modname,version,res.COREACTION,res.LIST);
                                        }

                                    }else
                                        handleSecurityRedirect();
                                },
                                complete:function(){
                                    $("#module-loader-img").css("display", "none");
                                }
                            })
                        
                        }
                    }
                    else if(action == installAll_action){
                        $.ajax({
                            url:moduleCFCPath+"?method=getListOfBundlesForUpgradeOrDowngrade",
                            type:'POST',
                            data:{commaBundles:Object.keys(jsUninstalledBundles).toString(),
                                actionType:"package|"+action,
                                token:cToken},
                            beforeSend:function(){
                                $("#module-loader-img").css("display", "block");
                            },
                            success:function(res){
                                res = JSON.parse(res);
                                if(!res.ACCESSERROR){
                                    openDialog("install-all-dialog");
                                    storeToBeInstalledBundles(res.LIST);
                                    coreStr = res.MESSAGE;
                                    $("#install-all-dialog  .dialog-module-tip").html(dependentStr + coreStr);
                                    document.getElementById("installAllAction").onclick = function(){
                                        if(res.BLOCKACTION){ // jee case- or when downgrade not possible
                                           $("#install-all-dialog  .dialog-module-text").html('');
                                           closeDialog("install-all-dialog");
                                        }else
                                            installAllModules(res.COREACTION);
                                    }

                                }else
                                    handleSecurityRedirect();
                            },
                            complete:function(){
                                $("#module-loader-img").css("display", "none");
                            }
                        })

                    }else if(action == updateAll_action){
                        $.ajax({
                            url:moduleCFCPath+"?method=getListOfBundlesForUpgradeOrDowngrade",
                            type:'POST',
                            data:{commaBundles:Object.keys(jsInstalledBundles).toString(),
                                actionType:"package|"+action,
                                token:cToken},
                            beforeSend:function(){
                                $("#module-loader-img").css("display", "block");
                            },
                            success:function(res){
                                res = JSON.parse(res);
                                if(!res.ACCESSERROR){
                                    openDialog("update-all-dialog");
                                    storeToBeInstalledBundles(res.LIST);
                                    coreStr = res.MESSAGE;
                                    $("#update-all-dialog  .dialog-module-tip").html(dependentStr + coreStr);
                                    document.getElementById("updateAllAction").onclick = function(){
                                        if(res.BLOCKACTION){ // jee case- or when downgrade not possible
                                            $("#update-all-dialog  .dialog-module-text").html('');
                                            closeDialog("update-all-dialog");
                                        }else
                                            updateAllModules(res.COREACTION);
                                    }

                                }else
                                    handleSecurityRedirect();
                            },
                            complete:function(){
                                $("#module-loader-img").css("display", "none");
                            }
                        })
                    }else if(action == uninstallAll_action){
                        openDialog("uninstall-all-dialog");
                        document.getElementById("uninstallAllAction").onclick = function(){
                            uninstallAllModules();
                        }
                    }
                }catch(err){
                    if(err.message.indexOf('JSON') != -1 && err.name == "SyntaxError")
                    window.location.href = "� GetContextRoot ()Ljava/lang/String;��
 �/CFIDE/administrator/updates/index.cfm"; 
                }
            }
        })
    }

    function installModule(action,modname,version,coreAction,toInstBundles){
        let redirect = true;
        closeDialog("install-module-dialog");
        if(coreAction!=null && coreAction!= ''){
            // window.localStorage.setItem("toInstBundles",toInstBundles);
            redirect = false;
            if(coreAction == upgrade_action){
                setTime(5000);
                openDialog('install-info-dialog',true);
            }else if(coreAction == downgrade_action){
                setUninstallTime(5000);
                openDialog('uninstall-info-dialog',true);
            }
        }
        version = version || '';
        try{
            $.ajax({
                url: downloadCFCPath + "?method=isSessionValid",
                type: "GET",
                success: function(res,textStatus, xhr){
                    try{
                    var isValid = JSON.parse(res);
                        // if(action == "install"){
                            $.ajax({
                                url: moduleCFCPath + "?method=installBundle",
                                data : {modname:modname,version:version,token:cToken},
                                type: "POST",
                                beforeSend: function(){
                                    if(redirect)
                                    $("#module-loader-img").css("display", "block");
                                },
                                success: function(res,textStatus, xhr){
                                    res = JSON.parse(res);
                                    if(!res.ACCESSERROR){
                                        if(redirect){
                                            // handling for Search module- Collections page throws 500 in compilation since the cfcollection tag is udes in solr/index.cfm
                                            if(modname == 'search')
                                                handleSearchPackage(action,res)
                                            window.localStorage.setItem("update_section",2);
                                            window.location.href = "index.cfm?" + (res.ERROR == true?"errorMessage="+res.MESSAGE : "modname="+modname+"&action="+action);
                                        }
                                    }
                                    else
                                        handleSecurityRedirect();
                                },
                                complete: function(){
                                    setTimeout(function(){$("#module-loader-img").css("display", "none");},1000);
                                    
                                }
                            });
                        // }
                    }catch(err){
                        if(err.message.indexOf('JSON') != -1 && err.name == "SyntaxError")
                        window.location.href = "��/CFIDE/administrator/updates/index.cfm"; 
                    }
                }
            })
        }catch(e){ 
        }
        
    }

    function uninstallModule(modname){
        closeDialog("uninstall-module-dialog");
        $.ajax({
            url: moduleCFCPath + "?method=uninstallBundle",
            data:{modname:modname,token:cToken},
            type: "POST",
            beforeSend: function(){
                $("#module-loader-img").css("display", "block");
            },
            success: function(res,textStatus, xhr){
                try{
                    res = JSON.parse(res);
                    if(!res.ACCESSERROR){
                        if(modname == 'search'){
                            handleSearchPackage(uninstall_action,res);
                        }else{
                            window.localStorage.setItem("update_section",3);
                            window.location.href = "index.cfm?" + (res.ERROR == true?"errorMessage="+res.MESSAGE : "modname="+modname+"&action="+uninstall_action);
                        }
                    }else
                        handleSecurityRedirect();
                }
                catch(error){
                    window.location.href = "� /CFIDE/administrator/index.cfm��";
                }
                
            },
            complete: function(){
                setTimeout(function(){$("#module-loader-img").css("display", "none");},2000);
            }
        });
        
    }

    function uninstallAllModules(){
        closeDialog("uninstall-all-dialog");
        $('#uninstallAllBtn').hide();
        $.ajax({
            url: moduleCFCPath + "?method=uninstallAllBundles",
            data:{token:cToken},
            type: "POST",
            beforeSend: function(){
                $("#module-loader-img").css("display", "block");
            },
            success: function(res,textStatus, xhr){
                try {
                    res = JSON.parse(res);
                    if(!res.ACCESSERROR){
                        $('#uninstallAllBtn').show();
                        window.localStorage.setItem("update_section",3);
                        window.location.href = "index.cfm?" + (res.ERROR == true?"errorMessage="+res.MESSAGE :"action="+uninstallAll_action);
                    }else
                        handleSecurityRedirect();
                }
                catch(error){
                    window.location.href = "��";
                }
            },
            complete: function(){
                $("#module-loader-img").css("display", "none");
            }
        });
    }

    function installAllModules(coreAction){
        let redirect = true;
        closeDialog("install-all-dialog");
        showProgressBar('progressbar-module-install');
        $('#installAllBtn').hide();
        if(coreAction!=null && coreAction!= ''){
            // window.localStorage.setItem("toInstBundles",JSON.stringify(Object.keys(jsUninstalledBundles)));
            redirect = false;
            if(coreAction == upgrade_action){
                setTime(5000);
                openDialog('install-info-dialog',true);
            }
        }
        
        $.ajax({
            url:moduleCFCPath +'?method=installAllBundles',
            data:{token:cToken},
            type:'POST',
            beforeSend: function(){
                if(redirect)
                $("#module-loader-img").css("display", "block");
            },
            success:function(res){
                try{
                    id = JSON.parse(res);
                    if(!res.ACCESSERROR){
                        if(redirect){
                            startProgressBar('progressbar-module-install',id,installAll_action);
                            window.localStorage.setItem("moduleProgressBarId","3|"+id);
                        }
                    }else
                        handleSecurityRedirect();
                }
                catch(error){
                    window.localStorage.setItem("moduleProgressBarId","");
                    window.location.href = "��";
                }
            },
            complete:function(){
                if(redirect)
                $("#module-loader-img").css("display", "none");
            }
        });    
    }
    function getInstallAllStatus(pid,id,action){
        let progressInterval = setInterval(function() {
            path = moduleCFCPath;
            $.get(path +'?method=getInstallAllstatus&id='+id,function(res){
                try{
                    res = JSON.parse(res);
                    if(res.STATUS == 1 || res.STATUS == -1){
                        stopProgressBar(pid);
                        hideProgressBar(pid);
                        clearInterval(progressInterval);
                        window.localStorage.setItem("moduleProgressBarId","");
                        window.localStorage.setItem("update_section",(res.STATUS == -1?3:2));
                        let errList = getFailedPackageStr("An error has occurred while installing the package ", res.LOG.error, true);
                        window.location.href = "index.cfm?" + (res.STATUS == -1?"errorMessage="+res.MESSAGE :"action="+action+"&list1="+res.SUCCESSINSTALLED+"&list2="+errList);
                    }
                    updateProgressBar(pid,res.STATUS,res.MESSAGE);
                }
                catch(error){
                    console.log(error);
                    window.localStorage.setItem("moduleProgressBarId","");
                    window.location.href = "�m";
                }
            });
        }, 5000);
    }
    function updateAllModules(coreAction){
        let redirect = true;
        closeDialog("update-all-dialog");
        showProgressBar('progressbar-module-update');
        $('#updateAllBtn').hide();
        $('#uninstallAllBtn').hide();
        $('#checkUpdatesBtn').hide();
        if(coreAction!=null && coreAction!= ''){
            // window.localStorage.setItem("toInstBundles",JSON.stringify(Object.keys(jsInstalledBundles)));
            redirect = false;
            if(coreAction == upgrade_action){
                setTime(5000);
                openDialog('install-info-dialog',true);
            }
        }
        
        $.ajax({
            url:moduleCFCPath +'?method=updateAllBundles',
            data:{token:cToken},
            type:'POST',
            beforeSend: function(){
                if(redirect)
                $("#module-loader-img").css("display", "block");
            },
            success:function(res){
                try{
                    id = JSON.parse(res);
                    if(!res.ACCESSERROR){
                        if(redirect){
                            startProgressBar('progressbar-module-update',id,updateAll_action);
                            window.localStorage.setItem("moduleProgressBarId","2|"+id);
                        }
                    }else
                        handleSecurityRedirect();
                }
                catch(error){
                    window.localStorage.setItem("moduleProgressBarId","");
                    window.location.href = "�	�";
                }
            },
            complete:function(){
                if(redirect)
                $("#module-loader-img").css("display", "none");
            }
        });    
    }
    function handleSearchPackage(action,res){
        if(!res.ERROR && window.parent.jsMenuItems && window.parent.jsMenuItems.verity){
            if(action == install_action){
                if(!res.ERROR && window.parent.jsMenuItems && window.parent.jsMenuItems.verity){
                    window.parent.jsMenuItems.verity.href = "solr/index.cfm"
                        }
            }else {
                $.get(moduleCFCPath+"?method=getPackageExceptionString&modname="+modname,function(res){
                    msg = encodeURI(JSON.parse(res));
                    page = encodeURI("solr/index.cfm");
                    window.parent.jsMenuItems.verity.href = 'module.cfm?modulemessage='+msg+'&page='+page;
                    window.localStorage.setItem("update_section",3);
                    window.location.href = "index.cfm?" + (res.ERROR == true?"errorMessage="+res.MESSAGE : "modname="+modname+"&action="+uninstall_action);
                });
            }
        }
    }
   
    function getFailedPackageStr(searchStr, str, caseSensitive) {
        if(str == null || str== '')
            return "";
        var searchStrLen = searchStr.length;
        if (searchStrLen == 0) {
            return [];
        }
        var startIndex = 0,endIndex=0, index, indices = [],ends=[], packageNames = "";
        if (!caseSensitive) {
            str = str.toLowerCase();
            searchStr = searchStr.toLowerCase();
        }
        while ((index = str.indexOf(searchStr, startIndex)) > -1) {
            indices.push(index + searchStrLen);
            startIndex = index + searchStrLen;
            endIndex = str.indexOf(".",startIndex);
            ends.push(endIndex)

        }
        // return indices;
        for (var i = 0; i < indices.length; i++) {
            let name = str.substring(indices[i],ends[i]);
            if(packageNames.indexOf(name) == -1)
                packageNames += name + ",";
        }
        packageNames = packageNames.slice(0, -1);
        return packageNames;
    }
    // storing to be installed bundles - to be used for expected package timeout
    function storeToBeInstalledBundles(commaBundles){
        window.localStorage.setItem("toInstBundles",commaBundles);
    }
</script>

� isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z��
 � 	CSRFTOKEN� FORM.CSRFTOKEN�  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z��
 � java/lang/String� 	csrftoken� _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;��
 � checkCSRFToken� REQUEST� updatetabkeyname� 

� _boolean (Ljava/lang/Object;)Z�� coldfusion/runtime/Cast�
�� _compare (Ljava/lang/Object;D)D��
 � Lcoldfusion/runtime/UDFMethod; *cf_modules2ecfm84162068$funcGETMODULESDATA�
� 	[�	 � registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V��
 � metaData Ljava/lang/Object;��	 � 	Functions�	�� 
Properties� getMetadata ()Ljava/lang/Object; this Lcf_modules2ecfm84162068; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; value LineNumberTable module0 $Lcoldfusion/tagext/lang/ImportedTag; mode0 I t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module1 mode1 t14 t15 t16 t17 t18 t19 module2 mode2 t22 t23 t24 t25 t26 t27 module3 mode3 t30 t31 t32 t33 t34 t35 module4 mode4 t38 t39 t40 t41 t42 t43 module5 mode5 t46 t47 t48 t49 t50 t51 module6 mode6 t54 t55 t56 t57 t58 t59 module7 mode7 t62 t63 t64 t65 t66 t67 module8 mode8 t70 t71 t72 t73 t74 t75 module9 mode9 t78 t79 t80 t81 t82 t83 module10 mode10 t86 t87 t88 t89 t90 t91 module11 mode11 t94 t95 t96 t97 t98 t99 module12 mode12 t102 t103 t104 t105 t106 t107 module13 mode13 t110 t111 t112 t113 t114 t115 module14 mode14 t118 t119 t120 t121 t122 t123 module15 mode15 t126 t127 t128 t129 t130 t131 module16 mode16 t134 t135 t136 t137 t138 t139 module17 mode17 t142 t143 t144 t145 t146 t147 module18 mode18 t150 t151 t152 t153 t154 t155 module19 mode19 t158 t159 t160 t161 t162 t163 module20 mode20 t166 t167 t168 t169 t170 t171 module21 mode21 t174 t175 t176 t177 t178 t179 module22 mode22 t182 t183 t184 t185 t186 t187 module23 mode23 t190 t191 t192 t193 t194 t195 module24 mode24 t198 t199 t200 t201 t202 t203 module25 mode25 t206 t207 t208 t209 t210 t211 module26 mode26 t214 t215 t216 t217 t218 t219 module27 mode27 t222 t223 t224 t225 t226 t227 module28 mode28 t230 t231 t232 t233 t234 t235 module29 mode29 t238 t239 t240 t241 t242 t243 module30 mode30 t246 t247 t248 t249 t250 t251 module31 mode31 t254 t255 t256 t257 t258 t259 module32 mode32 t262 t263 t264 t265 t266 t267 module33 mode33 t270 t271 t272 t273 t274 t275 module34 mode34 t278 t279 t280 t281 t282 t283 module35 mode35 t286 t287 t288 t289 t290 t291 module36 mode36 t294 t295 t296 t297 t298 t299 module37 mode37 t302 t303 t304 t305 t306 t307 module38 mode38 t310 t311 t312 t313 t314 t315 module39 mode39 t318 t319 t320 t321 t322 t323 module40 mode40 t326 t327 t328 t329 t330 t331 module41 mode41 t334 t335 t336 t337 t338 t339 module42 mode42 t342 t343 t344 t345 t346 t347 module43 mode43 t350 t351 t352 t353 t354 t355 module44 mode44 t358 t359 t360 t361 t362 t363 module45 mode45 t366 t367 t368 t369 t370 t371 module46 mode46 t374 t375 t376 t377 t378 t379 module47 mode47 t382 t383 t384 t385 t386 t387 java/lang/Throwablex registerUDFs runPage module48 mode48 module49 mode49 module50 mode50 module51 mode51 module52 mode52 module53 mode53 module54 mode54 module55 mode55 module56 mode56 module57 mode57 module58 mode58 module59 mode59 module60 mode60 module61 mode61 module62 mode62 module63 mode63 param65 !Lcoldfusion/tagext/lang/ParamTag; output67  Lcoldfusion/tagext/io/OutputTag; mode67 output68 mode68 output69 mode69 t148 t149 output70 mode70 t156 t157 output71 mode71 output72 mode72 output73 mode73 t172 t173 output74 mode74 t180 t181 <clinit> 1     )                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     � �    �   c �   [�   ��    �� �   "     ��   �       ��      �  �    �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � ��   �       ���    ���   ���  �� �  �    ~*,l�p,*d� �**� ��su�y�*,l�p,*e� �**� 5�s{�y�*,l�p,*f� �**� y�s�y�*,l�p,*g� �**� ��s�y�*,l�p,*h� �**� %�s�y�*,l�p,*i� �**� A�s��y�*,l�p,*j� �**� =�s��y�*,l�p,*k� �**� ��s��y�*,l�p,*l� �**� ��s��y�*,l�p,*m� �**� ��s}�y�*,l�p,*n� �**� )�s�y�*,l�p,*o� �**� Y�s��y�*,l�p,*p� �**� 9�s��y�*,l�p,*q� �**� 1�s��y�*,l�p,*r� �**� ]�s��y�*,l�p,*s� �**� q�s��y�*,l�p,*t� �**� ��s�y�*,l�p,*u� �**� E�sC�y�*,l�p,*v� �**� M�sK�y�*,l�p,*w� �**� I�sG�y�*�   �   *   ~��    ~� �   ~��   ~�� �  � �  d  d  d  d  d  d  d  d  d / e / e 7 e 7 e / e / e / e / e ( e O f O f W f W f O f O f O f O f H f o g o g w g w g o g o g o g o g h g � h � h � h � h � h � h � h � h � h � i � i � i � i � i � i � i � i � i � j � j � j � j � j � j � j � j � j � k � k � k � k � k � k � k � k � k l l l l l l l l l/ m/ m7 m7 m/ m/ m/ m/ m( mO nO nW nW nO nO nO nO nH no oo ow ow oo oo oo oo oh o� p� p� p� p� p� p� p� p� p� q� q� q� q� q� q� q� q� q� r� r� r� r� r� r� r� r� r� s� s� s� s� s� s� s� s� s t t t t t t t t t. u. u6 u6 u. u. u. u. u' uM vM vU vU vM vM vM vM vF vl wl wt wt wl wl wl wl we w �� �  F� �  '�*� �+� �� �:*� ����� �� �Y� �Y�SY�SY�SY�S� �� �� �� �Y6� 6*,�M,������ � :� �:*,�M��� :� #�� � #:		�� � :
� 
�:��*� �+� �� �:*� ����� �� �Y� �Y�SYSY�SYS� �� �� �� �Y6� 6*,�M,������ � :� �:*,�M��� :� #�� � #:�� � :� �:��*� �+� �� �:*� ����� �� �Y� �Y�SYSY�SYS� �� �� �� �Y6� 6*,�M,!������ � :� �:*,�M��� :� #�� � #:�� � :� �:��*� �+� �� �:*� ����� �� �Y� �Y�SY#SY�SY#S� �� �� �� �Y6� 6*,�M,%������ � :� �:*,�M��� : � # �� � #:!!�� � :"� "�:#��#*� �+� �� �:$*� �$���� �$� �Y� �Y�SY'SY�SY'S� �� �$� �$� �Y6%� 6*$%,�M,)�$����� � :&� &�:'*%,�M�'$�� :(� #(�� � #:)$)�� � :*� *�:+$��+*� �+� �� �:,*	� �,���� �,� �Y� �Y�SY+SY�SY+S� �� �,� �,� �Y6-� 6*,-,�M,-�,����� � :.� .�:/*-,�M�/,�� :0� #0�� � #:1,1�� � :2� 2�:3,��3*� �+� �� �:4*
� �4���� �4� �Y� �Y�SY/SY�SY/S� �� �4� �4� �Y65� 6*45,�M,1�4����� � :6� 6�:7*5,�M�74�� :8� #8�� � #:949�� � ::� :�:;4��;*� �+� �� �:<*� �<���� �<� �Y� �Y�SY3SY�SY3S� �� �<� �<� �Y6=� 6*<=,�M,5�<����� � :>� >�:?*=,�M�?<�� :@� #@�� � #:A<A�� � :B� B�:C<��C*� �+� �� �:D*� �D���� �D� �Y� �Y�SY7SY�SY7S� �� �D� �D� �Y6E� 6*DE,�M,9�D����� � :F� F�:G*E,�M�GD�� :H� #H�� � #:IDI�� � :J� J�:KD��K*� �	+� �� �:L*� �L���� �L� �Y� �Y�SY;SY�SY;S� �� �L� �L� �Y6M� 6*LM,�M,=�L����� � :N� N�:O*M,�M�OL�� :P� #P�� � #:QLQ�� � :R� R�:SL��S*� �
+� �� �:T*� �T���� �T� �Y� �Y�SY?SY�SY?S� �� �T� �T� �Y6U� 6*TU,�M,A�T����� � :V� V�:W*U,�M�WT�� :X� #X�� � #:YTY�� � :Z� Z�:[T��[*� �+� �� �:\*� �\���� �\� �Y� �Y�SYCSY�SYCS� �� �\� �\� �Y6]� 6*\],�M,E�\����� � :^� ^�:_*],�M�_\�� :`� #`�� � #:a\a�� � :b� b�:c\��c*� �+� �� �:d*� �d���� �d� �Y� �Y�SYGSY�SYGS� �� �d� �d� �Y6e� 6*de,�M,I�d����� � :f� f�:g*e,�M�gd�� :h� #h�� � #:idi�� � :j� j�:kd��k*� �+� �� �:l*� �l���� �l� �Y� �Y�SYKSY�SYKS� �� �l� �l� �Y6m� 6*lm,�M,M�l����� � :n� n�:o*m,�M�ol�� :p� #p�� � #:qlq�� � :r� r�:sl��s*� �+� �� �:t*� �t���� �t� �Y� �Y�SYOSY�SYOS� �� �t� �t� �Y6u� 6*tu,�M,Q�t����� � :v� v�:w*u,�M�wt�� :x� #x�� � #:yty�� � :z� z�:{t��{*� �+� �� �:|*� �|���� �|� �Y� �Y�SYSSY�SYSS� �� �|� �|� �Y6}� 6*|},�M,U�|����� � :~� ~�:*},�M�|�� :�� #��� � #:�|��� � :�� ��:�|���*� �+� �� �:�*� ������ ��� �Y� �Y�SYWSY�SYWS� �� ��� ��� �Y6�� 6*��,�M,Y������� � :�� ��:�*�,�M����� :�� #��� � #:����� � :�� ��:�����*� �+� �� �:�*� ������ ��� �Y� �Y�SY[SY�SY[S� �� ��� ��� �Y6�� 6*��,�M,]������� � :�� ��:�*�,�M����� :�� #��� � #:����� � :�� ��:�����*� �+� �� �:�*� ������ ��� �Y� �Y�SY_SY�SY_S� �� ��� ��� �Y6�� 6*��,�M,a������� � :�� ��:�*�,�M����� :�� #��� � #:����� � :�� ��:�����*� �+� �� �:�*� ������ ��� �Y� �Y�SYcSY�SYcS� �� ��� ��� �Y6�� 6*��,�M,e������� � :�� ��:�*�,�M����� :�� #��� � #:����� � :�� ��:�����*� �+� �� �:�*� ������ ��� �Y� �Y�SYgSY�SYgS� �� ��� ��� �Y6�� 6*��,�M,i������� � :�� ��:�*�,�M����� :�� #��� � #:����� � :�� ��:�����*� �+� �� �:�*� ������ ��� �Y� �Y�SYkSY�SYkS� �� ��� ��� �Y6�� 6*��,�M,m������� � :�� ��:�*�,�M����� :�� #��� � #:����� � :�� ��:�����*� �+� �� �:�*� ������ ��� �Y� �Y�SYoSY�SYoS� �� ��� ��� �Y6�� 6*��,�M,q������� � :�� ��:�*�,�M����� :�� #��� � #:����� � :�� ��:�����*� �+� �� �:�*� ������ ��� �Y� �Y�SYsSY�SYsS� �� ��� ��� �Y6�� 6*��,�M,u������� � :�� ��:�*�,�M����� :�� #��� � #:����� � :¨ ¿:�����*� �+� �� �:�*� ������ �Ļ �Y� �Y�SYwSY�SYwS� �� ��� �Ķ �Y6ř 6*��,�M,y�Ķ���� � :ƨ ƿ:�*�,�M��Ķ� :Ȩ #Ȱ� � #:��ɶ� � :ʨ ʿ:�Ķ��*� �+� �� �:�*� ������ �̻ �Y� �Y�SY{SY�SY{S� �� ��� �̶ �Y6͙ 6*��,�M,}�̶���� � :Ψ ο:�*�,�M��̶� :Ш #а� � #:��Ѷ� � :Ҩ ҿ:�̶��*� �+� �� �:�*� ������ �Ի �Y� �Y�SYSY�SYS� �� ��� �Զ �Y6ՙ 6*��,�M,��Զ���� � :֨ ֿ:�*�,�M��Զ� :ب #ذ� � #:��ٶ� � :ڨ ڿ:�Զ��*� �+� �� �:�* � ������ �ܻ �Y� �Y�SY�SY�SY�S� �� ��� �ܶ �Y6ݙ 6*��,�M,��ܶ���� � :ި ޿:�*�,�M��ܶ� :� #న � #:���� � :� �:�ܶ��*� �+� �� �:�*!� ������ �� �Y� �Y�SY�SY�SY�S� �� ��� �� �Y6� 6*��,�M,������� � :� �:�*�,�M���� :� #谨 � #:���� � :� �:����*� �+� �� �:�*"� ������ �� �Y� �Y�SY�SY�SY�S� �� ��� �� �Y6� 6*��,�M,������� � :� �:�*�,�M���� :� #� � #:���� � :� �:����*� �+� �� �:�*$� ������ ��� �Y� �Y�SY�SY�SY�S� �� ��� ��� �Y6�� 6*��,�M,�������� � :�� ��:�*�,�M����� :�� #��� � #:����� � :�� ��:�����*� �+� �� �:�*%� ������ ��� �Y� �Y�SY�SY�SY�S� �� ��� ��� �Y6�� 6*��,�M,�������� � :�� ��:�*�,�M����� �: � -� �� %� /�:���� � �:� ���:��ĩ*� � +� �� ��:*&� ������ ��� �Y� �Y�SY�SY�SY�S� �� ��� ��� �Y�6� F*��,�M,������� � !�:� ���:*�,�Mĩ��� �:� /��� '� 3�:	��	�� � �:
� �
��:��ĩ*� �!+� �� ��:*'� ������ ��� �Y� �Y�SY�SY�SY�S� �� ��� ��� �Y�6� F*��,�M,������� � !�:� ���:*�,�Mĩ��� �:� /��� '� 3�:���� � �:� ���:��ĩ*� �"+� �� ��:*(� ������ ��� �Y� �Y�SY�SY�SY�S� �� ��� ��� �Y�6� F*��,�M,������� � !�:� ���:*�,�Mĩ��� �:� /��� '� 3�:���� � �:� ���:��ĩ*� �#+� �� ��:*)� ������ ��� �Y� �Y�SY�SY�SY�S� �� ��� ��� �Y�6� F*��,�M,������� � !�:� ���:*�,�Mĩ��� �: � /� �� '� 3�:!��!�� � �:"� �"��:#��ĩ#*� �$+� �� ��:$**� ��$���� ��$� �Y� �Y�SY�SY�SY�S� �� ��$� ��$� �Y�6%� F*�$�%,�M,���$���� � !�:&� �&��:'*�%,�Mĩ'�$�� �:(� /�(�� '� 3�:)�$�)�� � �:*� �*��:+�$�ĩ+*� �%+� �� ��:,*+� ��,���� ��,� �Y� �Y�SY�SY�SY�S� �� ��,� ��,� �Y�6-� F*�,�-,�M,���,���� � !�:.� �.��:/*�-,�Mĩ/�,�� �:0� /�0�� '� 3�:1�,�1�� � �:2� �2��:3�,�ĩ3*� �&+� �� ��:4*,� ��4���� ��4� �Y� �Y�SY�SY�SY�S� �� ��4� ��4� �Y�65� F*�4�5,�M,���4���� � !�:6� �6��:7*�5,�Mĩ7�4�� �:8� /�8�� '� 3�:9�4�9�� � �::� �:��:;�4�ĩ;*� �'+� �� ��:<*-� ��<���� ��<� �Y� �Y�SY�SY�SY�S� �� ��<� ��<� �Y�6=� F*�<�=,�M,���<���� � !�:>� �>��:?*�=,�Mĩ?�<�� �:@� /�@�� '� 3�:A�<�A�� � �:B� �B��:C�<�ĩC*� �(+� �� ��:D*.� ��D���� ��D� �Y� �Y�SY�SY�SY�S� �� ��D� ��D� �Y�6E� F*�D�E,�M,���D���� � !�:F� �F��:G*�E,�MĩG�D�� �:H� /�H�� '� 3�:I�D�I�� � �:J� �J��:K�D�ĩK*� �)+� �� ��:L*/� ��L���� ��L� �Y� �Y�SY�SY�SY�S� �� ��L� ��L� �Y�6M� F*�L�M,�M,���L���� � !�:N� �N��:O*�M,�MĩO�L�� �:P� /�P�� '� 3�:Q�L�Q�� � �:R� �R��:S�L�ĩS*� �*+� �� ��:T*0� ��T���� ��T� �Y� �Y�SY�SY�SY�S� �� ��T� ��T� �Y�6U� F*�T�U,�M,���T���� � !�:V� �V��:W*�U,�MĩW�T�� �:X� /�X�� '� 3�:Y�T�Y�� � �:Z� �Z��:[�T�ĩ[*� �++� �� ��:\*1� ��\���� ��\� �Y� �Y�SY�SY�SY�S� �� ��\� ��\� �Y�6]� F*�\�],�M,Ŷ�\���� � !�:^� �^��:_*�],�Mĩ_�\�� �:`� /�`�� '� 3�:a�\�a�� � �:b� �b��:c�\�ĩc*� �,+� �� ��:d*2� ��d���� ��d� �Y� �Y�SY�SY�SY�S� �� ��d� ��d� �Y�6e� F*�d�e,�M,ɶ�d���� � !�:f� �f��:g*�e,�Mĩg�d�� �:h� /�h�� '� 3�:i�d�i�� � �:j� �j��:k�d�ĩk*� �-+� �� ��:l*3� ��l���� ��l� �Y� �Y�SY�SY�SY�S� �� ��l� ��l� �Y�6m� F*�l�m,�M,Ͷ�l���� � !�:n� �n��:o*�m,�Mĩo�l�� �:p� /�p�� '� 3�:q�l�q�� � �:r� �r��:s�l�ĩs*� �.+� �� ��:t*4� ��t���� ��t� �Y� �Y�SY�SY�SY�S� �� ��t� ��t� �Y�6u� F*�t�u,�M,Ѷ�t���� � !�:v� �v��:w*�u,�Mĩw�t�� �:x� /�x�� '� 3�:y�t�y�� � �:z� �z��:{�t�ĩ{*� �/+� �� ��:|*5� ��|���� ��|� �Y� �Y�SY�SY�SY�S� �� ��|� ��|� �Y�6}� F*�|�},�M,ն�|���� � !�:~� �~��:*�},�Mĩ�|�� �:�� /���� '� 3�:��|���� � �:�� ����:��|�ĩ�*�� T p sy s x sy I � �y � � �y I � �y � � �y � � �y � � �y14y494y
T`yZ]`y
ToyZ]oy`loyotoy���y���y�"y"y�1y1y".1y161y���y���y���y���y���y���y���y���y[wzyzzyP��y���yP��y���y���y���y9<y<A<y\hybehy\wybewyhtwyw|wy���y��y�+y%(+y�:y%(:y+7:y:?:y���y���y���y���y���y���y���y��yf��y���y[��y���y[��y���y���y���y)EHyHMHyhtynqtyh�ynq�yt��y���y�yy�+7y147y�+Fy14Fy7CFyFKFy���y���y���y���y��		y��		y�			y					y	r	�	�y	�	�	�y	g	�	�y	�	�	�y	g	�	�y	�	�	�y	�	�	�y	�	�	�y
5
Q
Ty
T
Y
Ty
*
t
�y
z
}
�y
*
t
�y
z
}
�y
�
�
�y
�
�
�y
�yy
�7Cy=@Cy
�7Ry=@RyCORyRWRy���y���y��y y��y yyy~��y���ys��y���ys��y���y���y���yA]`y`e`y6��y���y6��y���y���y���y #y#(#y�COyILOy�C^yIL^yO[^y^c^y���y���y�yy�!y!y!y!&!y���y���y��y���y��y���y���y���yMilylqlyB��y���yB��y���y���y���y,/y/4/yO[yUX[yOjyUXjy[gjyjojy���y���y�yy�-y-y*-y-2-y���y���y���y���y���y���y���y���yYuxyx}xyN��y���yN��y���y���y���y8;y;@;y[gyadgy[vyadvygsvyv{vy���y��y�*y$'*y�9y$'9y*69y9>9y���y���y���y���y���y���y���y��ye��y���yZ��y���yZ��y���y���y���y(DGyGLGygsympsyg�ymp�ys�y���y�
y

y�,:y47:y�,My47My:JMyMTMy���y���y�+y%(+y�@y%(@y+=@y@G@y���y���y� y y�5y5y 25y5<5y���y���y�yy�*y*y'*y*1*y���y���y��
y
y��yy
y&y���y���y���y���y��y��y�yy���y���y���y���y��	y��	y�	y		y���y���yy��y���yy��y���y���y��y}��y���yn��y���yn��y���y���y���y r � �y � � �y c � �y � � �y c � �y � � �y � � �y � � �y!g!�!�y!�!�!�y!X!�!�y!�!�!�y!X!�!�y!�!�!�y!�!�!�y!�!�!�y"\"~"�y"�"�"�y"M"�"�y"�"�"�y"M"�"�y"�"�"�y"�"�"�y"�"�"�y#Q#s#vy#v#}#vy#B#�#�y#�#�#�y#B#�#�y#�#�#�y#�#�#�y#�#�#�y$F$h$ky$k$r$ky$7$�$�y$�$�$�y$7$�$�y$�$�$�y$�$�$�y$�$�$�y%;%]%`y%`%g%`y%,%�%�y%�%�%�y%,%�%�y%�%�%�y%�%�%�y%�%�%�y&0&R&Uy&U&\&Uy&!&�&�y&�&�&�y&!&�&�y&�&�&�y&�&�&�y&�&�&�y'%'G'Jy'J'Q'Jy''x'�y'�'�'�y''x'�y'�'�'�y'�'�'�y'�'�'�y �  *�  '���    '�� �   '���   '���   '���   '���   '���   '���   '���   '��� 	  '��� 
  '���   '� �   '��   '��   '��   '��   '��   '��   '��   '��   '�	�   '�
�   '��   '��   '��   '��   '��   '��   '��   '��   '��   '��    '�� !  '�� "  '�� #  '�� $  '�� %  '�� &  '�� '  '�� (  '�� )  '�� *  '�� +  '� � ,  '�!� -  '�"� .  '�#� /  '�$� 0  '�%� 1  '�&� 2  '�'� 3  '�(� 4  '�)� 5  '�*� 6  '�+� 7  '�,� 8  '�-� 9  '�.� :  '�/� ;  '�0� <  '�1� =  '�2� >  '�3� ?  '�4� @  '�5� A  '�6� B  '�7� C  '�8� D  '�9� E  '�:� F  '�;� G  '�<� H  '�=� I  '�>� J  '�?� K  '�@� L  '�A� M  '�B� N  '�C� O  '�D� P  '�E� Q  '�F� R  '�G� S  '�H� T  '�I� U  '�J� V  '�K� W  '�L� X  '�M� Y  '�N� Z  '�O� [  '�P� \  '�Q� ]  '�R� ^  '�S� _  '�T� `  '�U� a  '�V� b  '�W� c  '�X� d  '�Y� e  '�Z� f  '�[� g  '�\� h  '�]� i  '�^� j  '�_� k  '�`� l  '�a� m  '�b� n  '�c� o  '�d� p  '�e� q  '�f� r  '�g� s  '�h� t  '�i� u  '�j� v  '�k� w  '�l� x  '�m� y  '�n� z  '�o� {  '�p� |  '�q� }  '�r� ~  '�s�   '�t� �  '�u� �  '�v� �  '�w� �  '�x� �  '�y� �  '�z� �  '�{� �  '�|� �  '�}� �  '�~� �  '�� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '��� �  '���   '���  '���  '���  '���  '���  '���  '���  '���  '���	  '���
  '���  '� �  '��  '��  '��  '��  '��  '��  '��  '��  '�	�  '�
�  '��  '��  '��  '��  '��  '��  '��  '��  '��  '��   '��!  '��"  '��#  '��$  '��%  '��&  '��'  '��(  '��)  '��*  '��+  '� �,  '�!�-  '�"�.  '�#�/  '�$�0  '�%�1  '�&�2  '�'�3  '�(�4  '�)�5  '�*�6  '�+�7  '�,�8  '�-�9  '�.�:  '�/�;  '�0�<  '�1�=  '�2�>  '�3�?  '�4�@  '�5�A  '�6�B  '�7�C  '�8�D  '�9�E  '�:�F  '�;�G  '�<�H  '�=�I  '�>�J  '�?�K  '�@�L  '�A�M  '�B�N  '�C�O  '�D�P  '�E�Q  '�F�R  '�G�S  '�H�T  '�I�U  '�J�V  '�K�W  '�L�X  '�M�Y  '�N�Z  '�O�[  '�P�\  '�Q�]  '�R�^  '�S�_  '�T�`  '�U�a  '�V�b  '�W�c  '�X�d  '�Y�e  '�Z�f  '�[�g  '�\�h  '�]�i  '�^�j  '�_�k  '�`�l  '�a�m  '�b�n  '�c�o  '�d�p  '�e�q  '�f�r  '�g�s  '�h�t  '�i�u  '�j�v  '�k�w  '�l�x  '�m�y  '�n�z  '�o�{  '�p�|  '�q�}  '�r�~  '�s�  '�t��  '�u��  '�v��  '�w���  � �    0  0  :  :     �  �  �  �  � � � � � � s s ~ ~ B 5 5 @ @  � 	� 	 	 	� 	� 
� 
� 
� 
� 
} } � � K @ @ K K      � � � � � � � � � � W 	L 	L 	W 	W 	 
 
 
 
 	� 
� 
� 
� 
� 
� � � � � c X X c c &   & & � � � � � � � � � � o d d o o 2 ' ' 2 2 � � � � � � � � � � { p p { { > 3 3 > >  � �   � �  �  �  �  �  | !| !� !� !J !? "? "J "J " " $ $ $ $� $� %� %� %� %� %� &� &� &� &f &� '� '� '� '[ '� (� (� (� (P (} )} )� )� )E )r *r *} *} *: *g +g +r +r +/ +\ ,\ ,g ,g ,$ ,Q -Q -\ -\ - - F . F . Q . Q .  .!; /!; /!F /!F /! /"0 0"0 0"; 0"; 0!� 0#% 1#% 1#0 1#0 1"� 1$ 2$ 2$% 2$% 2#� 2% 3% 3% 3% 3$� 3& 4& 4& 4& 4%� 4&� 5&� 5' 5' 5&� 5 z  �   (     
*O�ضܱ   �       
��   {� �  $N  �  �*� �� �L*� �N*� ��� �*-+��� �*� �0-� �� �:*6� ����� �� �Y� �Y�SY�SY�SY�S� �� �� �� �Y6� 6*+�L+ݶ����� � :� �:*+�L��� :� #�� � #:		�� � :
� 
�:��*� �1-� �� �:*7� ����� �� �Y� �Y�SY�SY�SY�S� �� �� �� �Y6� 6*+�L+������ � :� �:*+�L��� :� #�� � #:�� � :� �:��*� �2-� �� �:*8� ����� �� �Y� �Y�SY�SY�SY�S� �� �� �� �Y6� 6*+�L+������ � :� �:*+�L��� :� #�� � #:�� � :� �:��*� �3-� �� �:*9� ����� �� �Y� �Y�SY�SY�SY�S� �� �� �� �Y6� 6*+�L+������ � :� �:*+�L��� : � # �� � #:!!�� � :"� "�:#��#*� �4-� �� �:$*:� �$���� �$� �Y� �Y�SY�SY�SY�S� �� �$� �$� �Y6%� 6*$%+�L+��$����� � :&� &�:'*%+�L�'$�� :(� #(�� � #:)$)�� � :*� *�:+$��+*� �5-� �� �:,*;� �,���� �,� �Y� �Y�SY�SY�SY�S� �� �,� �,� �Y6-� 6*,-+�L+�,����� � :.� .�:/*-+�L�/,�� :0� #0�� � #:1,1�� � :2� 2�:3,��3*� �6-� �� �:4*<� �4���� �4� �Y� �Y�SY�SY�SY�S� �� �4� �4� �Y65� 6*45+�L+��4����� � :6� 6�:7*5+�L�74�� :8� #8�� � #:949�� � ::� :�:;4��;*� �7-� �� �:<*>� �<���� �<� �Y� �Y�SY�SY�SY�S� �� �<� �<� �Y6=� 6*<=+�L+��<����� � :>� >�:?*=+�L�?<�� :@� #@�� � #:A<A�� � :B� B�:C<��C*� �8-� �� �:D*?� �D���� �D� �Y� �Y�SY�SY�SY�S� �� �D� �D� �Y6E� 6*DE+�L+��D����� � :F� F�:G*E+�L�GD�� :H� #H�� � #:IDI�� � :J� J�:KD��K*� �9-� �� �:L*@� �L���� �L� �Y� �Y�SY�SY�SY�S� �� �L� �L� �Y6M� 6*LM+�L+�L����� � :N� N�:O*M+�L�OL�� :P� #P�� � #:QLQ�� � :R� R�:SL��S*� �:-� �� �:T*A� �T���� �T� �Y� �Y�SYSY�SYS� �� �T� �T� �Y6U� 6*TU+�L+�T����� � :V� V�:W*U+�L�WT�� :X� #X�� � #:YTY�� � :Z� Z�:[T��[*� �;-� �� �:\*B� �\���� �\� �Y� �Y�SYSY�SYS� �� �\� �\� �Y6]� 6*\]+�L+	�\����� � :^� ^�:_*]+�L�_\�� :`� #`�� � #:a\a�� � :b� b�:c\��c*� �<-� �� �:d*C� �d���� �d� �Y� �Y�SYOSY�SYOS� �� �d� �d� �Y6e� 6*de+�L+Q�d����� � :f� f�:g*e+�L�gd�� :h� #h�� � #:idi�� � :j� j�:kd��k*� �=-� �� �:l*D� �l���� �l� �Y� �Y�SYSY�SYS� �� �l� �l� �Y6m� 6*lm+�L+�l����� � :n� n�:o*m+�L�ol�� :p� #p�� � #:qlq�� � :r� r�:sl��s*� �>-� �� �:t*E� �t���� �t� �Y� �Y�SYSY�SYS� �� �t� �t� �Y6u� 6*tu+�L+�t����� � :v� v�:w*u+�L�wt�� :x� #x�� � #:yty�� � :z� z�:{t��{*� �?-� �� �:|*F� �|���� �|� �Y� �Y�SYSY�SYS� �� �|� �|� �Y6}� 6*|}+�L+�|����� � :~� ~�:*}+�L�|�� :�� #��� � #:�|��� � :�� ��:�|���**� ��*� A-� ��":�*J� ��$�&�(**J� �*�.�2�6�8�;�� ���?� �**� �*� �A�F*� EH�F*� MJ�F*� IL�F*� !*R� �*NP�T�F*� e*S� �*NV�T�F*`� �**� Q�Z\*� �`W+b�*�gC-� ��i:�*c� ��� ���jY6�� G*�+��� :�� e��*+l�p+*x� �**� }�s�y�*+��p���������� :�� #��� � #:������ � :�� ��:������+��+��*�gD-� ��i:�*I� ��� ���jY6�� +*I� �*������������� :�� #��� � #:������ � :�� ��:������+��*�gE-� ��i:�*�� ��� ���jY6�� +*�� �*������������� :�� #��� � #:������ � :�� ��:������+��*�gF-� ��i:�*�� ��� ���jY6�� !+*�� �*���+������������ :�� #��� � #:������ � :�� ��:������+��*�gG-� ��i:�*Ķ ��� ���jY6�� !+*Ķ �*���+������������ :�� #��� � #:������ � :�� ��:������+��*�gH-� ��i:�*� ��� ���jY6�� !+*� �*���+������������ :�� #��� � #:������ � :�� ��:������+��*�gI-� ��i:�*� ��� ���jY6�� !+*� �*���+������������ :�� #��� � #:������ � :�� ��:������+��*�gJ-� ��i:�*7� ��� ���jY6�� !+*7� �*���+������������ :�� #��� � #:������ � :�� ��:������+��**� ���� o*� a�F**� u����� *� a*s��Y�S���F*|� �**� -�Z�*� �Y**� a�sSY*���Y�S��S�`W*+ȶp**� U��� �*� a�F**� u����� *� a*s��Y�S���F*�� �**� -�Z�*� �Y**� a�sSY*���Y�S��S�`W*�� �**� Q�Z\*� �`W**� ��s���� 6**� �s����� *� m**� i�s�F� *� m**� ��s�F� � z � �y � � �y o � �y � � �y o � �y � � �y � � �y � � �y=Y\y\a\y2|�y���y2|�y���y���y���y y$y�?KyEHKy�?ZyEHZyKWZyZ_Zy���y���y�yy�yyy"y���y���y{��y���y{��y���y���y���yIehyhmhy>��y���y>��y���y���y���y(+y+0+yKWyQTWyKfyQTfyWcfyfkfy���y���y�yy�)y)y&)y).)y���y���y���y���y���y���y���y���yUqtytytyJ��y���yJ��y���y���y���y47y7<7yWcy]`cyWry]`rycoryrwry���y���y�		&y	 	#	&y�		5y	 	#	5y	&	2	5y	5	:	5y	�	�	�y	�	�	�y	�	�	�y	�	�	�y	�	�	�y	�	�	�y	�	�	�y	�	�	�y
a
}
�y
�
�
�y
V
�
�y
�
�
�y
V
�
�y
�
�
�y
�
�
�y
�
�
�y$@CyCHCycoyiloyc~yil~yo{~y~�~y�yy�&2y,/2y�&Ay,/Ay2>AyAFAyIb�yh��y���yIb�yh��y���y���y���y�(4y.14y�(Cy.1Cy4@CyCHCyw��y���yw��y���y���y���y�)5y/25y�)Dy/2Dy5ADyDIDyx��y���yx��y���y���y���y�1=y7:=y�1Ly7:Ly=ILyLQLy���y���y���y���y���y���y9Ey?BEy9Ty?BTyEQTyTYTy �   �  ���    ���   ���   � � �   �|�   �}�   ���   ���   ���   ��� 	  ��� 
  ���   �~�   ��   ��   ��   ��   ��   ��   ��   ���   ���   �
�   ��   ��   ��   ��   ��   ���   ���   ��   ��   ��    �� !  �� "  �� #  ��� $  ��� %  �� &  �� '  �� (  �� )  �� *  �� +  ��� ,  ��� -  �"� .  �#� /  �$� 0  �%� 1  �&� 2  �'� 3  ��� 4  ��� 5  �*� 6  �+� 7  �,� 8  �-� 9  �.� :  �/� ;  ��� <  ��� =  �2� >  �3� ?  �4� @  �5� A  �6� B  �7� C  ��� D  ��� E  �:� F  �;� G  �<� H  �=� I  �>� J  �?� K  ��� L  ��� M  �B� N  �C� O  �D� P  �E� Q  �F� R  �G� S  ��� T  ��� U  �J� V  �K� W  �L� X  �M� Y  �N� Z  �O� [  ��� \  ��� ]  �R� ^  �S� _  �T� `  �U� a  �V� b  �W� c  ��� d  ��� e  �Z� f  �[� g  �\� h  �]� i  �^� j  �_� k  ��� l  ��� m  �b� n  �c� o  �d� p  �e� q  �f� r  �g� s  ��� t  ��� u  �j� v  �k� w  �l� x  �m� y  �n� z  �o� {  ��� |  ��� }  �r� ~  �s�   �t� �  �u� �  �v� �  �w� �  ��� �  ��� �  ��� �  �{� �  �|� �  �}� �  �~� �  �� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� �  ��� ��  �1 T 6 T 6 _ 6 _ 6 " 6 7 7" 7" 7 � 7� 8� 8� 8� 8� 8� 9� 9� 9� 9k 9` :` :k :k :. :# ;# ;. ;. ;� ;� <� <� <� <� <� >� >� >� >w >l ?l ?w ?w ?: ?/ @/ @: @: @� @� A� A� A� A� A� B� B� B� B� B	x C	x C	� C	� C	F C
; D
; D
F D
F D
	 D
� E
� E	 E	 E
� E� F� F� F� F� FW IW It Jt J� J� J� J� J� J� J� J� J] J� K� K� M� M� M� M� M� M� N� N� N� N� N� N� O� O� O� O� O� O� P� P� P� P� P� P� R� R� R� R� R� R� R� R� R� R S S S S  S  S  S  S� S� S ` ` ` ` ` Uw xw x x xw xw xw xw xp x. cIIIII�I����������[�������������������\�������������d77777�7mumumumululu{w{w{w{www�x�x�x�x�x�x�x�x�x�x�z�z�z�z�z�x�|�|�|�|�|�|�|�|�|lult������������������������������ � ������ �/�/�A�A�L�L�/�/�/�i�i�i�i�i�}�}�}�}�}�}���������������������������������������}�����      �   #     *� 
�   �       ��   �  �   � 	    S¸ ȳ �� ȳ e� ȳg��Y�ֳػ �Y� �Y�SY� �Y��SSY�SY� �S� ���   �       S��  �   
  : W : W       �    �