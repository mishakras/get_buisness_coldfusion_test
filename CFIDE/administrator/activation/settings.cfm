����  -� 
SourceFile ,/CFIDE/administrator/activation/settings.cfm cfsettings2ecfm421127599  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   L10N_MAILALERT1 Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   L10N_MAILALERT2   	   LIC_STANDARD   	    L10N_MAILALERT3 " " 	  $ RESTARTCHECKED & & 	  ( _SETTINGS_ERROR * * 	  , DAYS_ALERT1 . . 	  0 ADDMSG 2 2 	  4 ISACTIVATED 6 6 	  8 CHECKCSRFTOKEN : : 	  < CHECKED > > 	  @ URL B B 	  D _SETTINGS_STATMESS F F 	  H AUTORESTARTENABLED J J 	  L ISYEARLY N N 	  P L10N_MAILALERT R R 	  T MAIL V V 	  X AUTO_RESTART_LABEL Z Z 	  \ 	SCHEDULER ^ ^ 	  ` FACTORY b b 	  d RESTART_TIP_3 f f 	  h GETCSRFTOKEN j j 	  l UCHECKED n n 	  p TOKEN r r 	  t RESTART_TIP_2 v v 	  x CURRENTCHECKUSAGE z z 	  | RESTART_TIP_1 ~ ~ 	  � USAGE_CALL_LABEL � � 	  � 	SHOWALERT � � 	  � NOTIFICATIONENABLED � � 	  � SHOWMESSAGE � � 	  � SERVEREDITION � � 	  � ACTIVATIONCFCPATH � � 	  � FORM � � 	  � DISABLED � � 	  � L10N_SETTINGS_SUBMIT � � 	  � REQUEST � � 	  � LIC_ENT � � 	  � BERRORSEXIST � � 	  � com.macromedia.SourceModTime  {�� pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/JspContext �
 � � parent Ljavax/servlet/jsp/tagext/Tag; � �	  � Cp1252 � setPageEncoding (Ljava/lang/String;)V � � !coldfusion/runtime/NeoPageContext �
 � � false � checkSimpleParameter 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V � �
  � LOCALE � REQUEST.LOCALE � en � V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V � �
  � java/lang/String � 
localeFile � java/lang/StringBuilder � resources/activation_ �  �
 � � locale � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � append -(Ljava/lang/String;)Ljava/lang/StringBuilder; � �
 � � .cfm � toString ()Ljava/lang/String; � � java/lang/Object �
 � � _structSetAt ;(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;Z)V � �
  � _setCurrentLineNo (I)V 
  security _resolve �
  isAdminSecurityEnabled	 _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
  _boolean (Ljava/lang/Object;)Z
 � isAdminUserIdRequired canAccessPage  'class$coldfusion$tagext$lang$IncludeTag Ljava/lang/Class; !coldfusion.tagext.lang.IncludeTag forName %(Ljava/lang/String;)Ljava/lang/Class; java/lang/Class
 	 " _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag;$%
 & !coldfusion/tagext/lang/IncludeTag( 	cfinclude* template, GetContextRoot. �
 / "/CFIDE/administrator/forbidden.cfm1 concat &(Ljava/lang/String;)Ljava/lang/String;34
 �5 _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;78
 9 setTemplate; �
)< 	hasEndTag (Z)V>? coldfusion/tagext/GenericTagA
B@ _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)ZDE
 F %class$coldfusion$tagext$lang$AbortTag coldfusion.tagext.lang.AbortTagIH	 K coldfusion/tagext/lang/AbortTagM F
<script language="Javascript" src="../scripts/util.js"></script>

O writeQ � java/io/WriterS
TR  V activationStyles.cfmX (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag[Z	 ] "coldfusion/tagext/lang/ImportedTag_ l10na 
../cftags/c admine setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Vgh
`i &coldfusion/runtime/AttributeCollectionk idm l10n_mailalerto varq ([Ljava/lang/Object;)V s
lt setAttributecollection (Ljava/util/Map;)Vvw  coldfusion/tagext/lang/ModuleTagy
zx 
doStartTag ()I|}
z~ 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � NTo get email notifications, configure the mail server (Server Settings > Mail)� doAfterBody�}
z� _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � doEndTag�} #javax/servlet/jsp/tagext/TagSupport�
�� doCatch (Ljava/lang/Throwable;)V��
z� 	doFinally� 
z� l10n_mailalert1� -Following email IDs are not in valid format: � l10n_mailalert2� <Specify an email address to which notification will be sent.� l10n_mailalert3� >Specify an email address from which notification will be sent.� _settings_statmess� %Server has been updated successfully.� days_alert1� 2Day(s) value must be numeric and between 1 and 15.� usage_call_label� QSend usage data to Adobe ColdFusion licensing servers. For more information, see � $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag��	 � coldfusion/tagext/io/OutputTag�
�~ �<a href="https://helpx.adobe.com/coldfusion/using/coldfusion-licensing-activation.html" target="_blank" style="color: blue;">ColdFusion licensing and activation.</a>�
�� coldfusion/tagext/QueryLoop�
��
��
�� 
� _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V��
 � auto_restart_label� Enable if you want the instances to be automatically restarted after activation, deactivation, or changing usage data settings.� lic_standard� Standard� lic_ent� 
Enterprise� restart_tip_1� �If the option <b style="color:#226600">Auto restart instances</b> is not enabled, restart the instances manually for the changes to take effect.� restart_tip_2� *All instances have restarted successfully.� restart_tip_3� `Unable to restart instances {}. For the changes to take effect, restart the instances manually. � _settings_error� DAn error has occurred while updating the settings. Please try again.� HTTP� https� off� _compare '(Ljava/lang/Object;Ljava/lang/String;)D��
 � _Object (Z)Ljava/lang/Object;��
 �� Len (Ljava/lang/Object;)I��
 � (I)Ljava/lang/Object;��
 �� (Ljava/lang/Object;D)D��
 � http://� 	http_host� ./CFIDE/administrator/activation/activation.cfc� set (Ljava/lang/Object;)V coldfusion/runtime/Variable
 https:// license	 isAutoRestartInstances isCheckUsage
 coldfusion/runtime/CFBoolean t_true Lcoldfusion/runtime/CFBoolean;	 java  coldfusion.server.ServiceFactory CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
  *coldfusion/runtime/TransientVariableHolder &(Lcoldfusion/runtime/NeoPageContext;)V !
 " _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;$%
 & getMailSpoolService( getCronService* _isNull (Ljava/lang/Object;Z)Z,-
 . isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z01
 2 f_false4	5 unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;78 coldfusion/runtime/NeoException:
;9 t39 [Ljava/lang/String; any?=>	 A findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)ICD
;E eG bind '(Ljava/lang/String;Ljava/lang/Object;)VIJ
 K unbindM 
 N 
getEditionP _autoscalarizeR%
 S '(Ljava/lang/Object;Ljava/lang/Object;)D�U
 V isYearlySKUX 	getServerZ Trim\4
 ] SUBMIT_ FORM.SUBMITa  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Zcd
 e 	CSRFTOKENg FORM.CSRFTOKENi 	csrftokenk checkCSRFTokenm licensetabkeynameo 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;qr
 s ../header.cfmu ../include/margintop.cfmw ../include/errors.cfmy M

<style>
	table{
		border-collapse:inherit !important
	}
</style>

	{ 
    } ERRORMESSAGE URL.ERRORMESSAGE� 

        � $
        <ul><li class="errorText">� </li></ul>
    � MESSAGE� URL.MESSAGE� 
            � message� settingsSuccess� 
                � INSTLIST� URL.INSTLIST� usageChanged� _double !(Lcoldfusion/runtime/CFBoolean;)D��
 �� instList� &(Ljava/lang/String;)Ljava/lang/Object;$�
 � formatString�  � '
        <div>
            <img src="� thisURL� �/images/update.gif" height="16" width="16"></span>
            <span>&nbsp;&nbsp;</span>
            <span><p style="color:#226600; display: inline-block">� </p>
        </div>
    � _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;��
 � i
<img src="../images/loader.svg" class="act-loader-img" id="act-loader-img" style="display: none;"/>

� )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTag��	 � #coldfusion/tagext/html/form/FormTag� settingsForm�g �
�� HTML� 	setFormat� �
�� cfform� action� CGI� Script_Name� 	setAction� �
�� POST� 	setMethod� �
��
�~ J
    <input type="hidden" name="csrftoken" id="license_csrftoken" value="� getCSRFToken� ">
�
��
��
��
�� { 
<table border="0" cellpadding="0" cellspacing="5" width="100%"  style='border-spacing :5px !important'>
	<tr bgcolor="#� 	grayLight� V" class="cellBlueTopAndBottom">
		
	</tr>
	
	<tr>
	<td>
		<b class="subheading">� l10n_add_new_dsn_noti� Notification� %</b>
		<br>
		<p class="admin-tip">� notification_tip1� xFor servers that are licensed with Virtual Core metric, ensure that you have an active internet connection at all times.� <br> � notification_tip2� �If ColdFusion server is offline, a grace period of 15 days will be provided, after which the server will revert to developer or trial mode.� )<br> </p>

		
			<p class="admin-tip">� notification_tip3� ZUse the settings below to receive the notifications while the server is in a grace period.�  &nbsp;
			�  l10n_settings_mail_scheduler_tip� wTo enable the below settings and receive notifications, you must install the packages <b>mail</b> and <b>scheduler.</b> 
			 _factor1�
  h</p>
		
	</td>
	</tr>

	<tr>
		<td>

			<table border="0" cellpadding="0" cellspacing="8">
				 
				
 isCheckPeriodically 
					 checked='true' disabled='true' ;
				<tr><td><input type="checkbox" name="schedule_check"  >
				 l10n_checkinterval &nbsp;Notify every &nbsp; H
				<input type="text" size="5" name="interval" id="_interval" value=" getInterval EncodeForHTMLAttribute 4
 ! " # 	> &nbsp; % l10n_checkinterval1' "day(s) till the grace period ends.) J
				 </td></tr>
				 <tr><td height="10px"></td></tr>
			<tr><td>
			+ l10n_emailnotification- Send email notification to/ g</td><td style="padding-left: 20px;">
			<input type="text" name="email" size="50" id="_email" value="1 _factor23�
 4 	getEmails6 %>
			<span style="{color:#626262;}">8 l10n_emailnotification_ex: )(ex. user1@company.com,user2@company.com)< L</span>
		</td></tr>
		<tr><td height="10px"></td></tr>
		<tr><td>
					> l10n_emailnotification_from@ Send email notification fromB q</td><td style="padding-left: 20px;">
					<input type="text" name="fromemail" id="_fromemail" size="50" value="D getFromEmailF ( >
					<span style="{color:#626262;}">H l10n_emailnotification_ex_fromJ (ex. user1@company.com)L ~</span>
		</td></tr>
		<tr><td height="10px"></td></tr>
		</table>

		</td>
	</tr>
	<tr><td height="10px"></td></tr>
	N -
		<tr>
			<td>
				<b class="subheading">P usage_settings_headerR 
Usage DataT �</b>
			</td>
		</tr>
		<tr><td height="5px"></td></tr>
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="6" width="100%" style='border-spacing :5px !important'>
					V 
						X K
					<tr><td><input type="checkbox" name="usage_check" id="_usage_check" Z  >&nbsp;&nbsp;\ x</td></tr>
					<tr><td height="5px"></td></tr>
				</table>
			</td>
		</tr>
		<tr><td height="10px"></td></tr>
	^ _factor3`�
 a ,

	<tr>
		<td>
			<b class="subheading">c auto_restart_headere Auto Restart Instancesg �</b>
		</td>
	</tr>
	<tr><td height="5px"></td></tr>
	<tr>
		<td>
			<table border="0" cellpadding="0" cellspacing="6" width="100%" style='border-spacing :5px !important'>
				i N
				<tr><td><input type="checkbox" name="restart_check" id="_restart_check" k �</td></tr>
				<tr><td height="5px"></td></tr>
			</table>
		</td>
	</tr>
	<tr><td height="10px"></td></tr>
	<tr>
		<td>
			<b class="subheading">m l10n_proxy_headero Proxy Server Settingsq �</b>
		</td>
	</tr>
	<tr><td height="5px"></td></tr>
	<tr>
		<td>

			<table border="0" cellpadding="0" cellspacing="6" width="100%" style='border-spacing :5px !important'>
				s 
				
				<tr><td>
					u l10n_settings_update_proxyw b
				To use the proxy server, provide the settings in the <b>Package Manager > Settings</b> page.y Y</td></tr>
				<tr><td height="5px"></td></tr>
		</table>

		</td>
	</tr>
	<tr>
		{ l10n_settings_submit} Submit Changes _factor4��
 � $
		<td><input type="submit" value="� Y" name="submit" class="buttn" onclick="checkAndSubmit()"/>
		</td>
	</tr>
</table>

� ../include/marginbottom.cfm� ../footer.cfm� _factor5��
 � '
<script type="text/javascript">
    � activationCFCPath� ToScript 8(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;��
 � notificationEnabled� 	showAlert� isActivated� isYearly� currentCheckUsage�o
    var settingFormObj, emailValue, fromemailValue , schedule_check, daysEntered , usage_check , restart_check , cToken = "";
	$(document).ready(function(){
        cToken = document.forms['settingsForm'].csrftoken.value;
    });
	function validateEmail(mail) 
	{
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))
			return (true);
	    return (false);
	}
    function showMessage()
	{
			if (emailValue.trim() != "")
			{
				var result = emailValue.split(",");
				var wrongIds = "";
				var showError = false;
				var separator = "";
				for (var i = 0; i < result.length; i++) 
				{
					if (!validateEmail(result[i])) 
					{
						showError = true;
						if(wrongIds != "")
							separator = ",";
							
						wrongIds = wrongIds + separator + result[i];
						
					}
					
				}
				if (showError) 
				{
					alert("� _ " + wrongIds);
					return false;
				}
			}
			else if(schedule_check)
			{
				alert("� �");
				return false;
			}
			if (fromemailValue.trim() != "")
			{
					if (!validateEmail(fromemailValue.trim()))
					{
						alert("� n " + fromemailValue.trim());
						return false;
					}
			}
			else if(schedule_check)
			{
				alert("� u");
				return false;
			}
			if(schedule_check)
			{
				if (emailValue != "" && showAlert == 1){
					alert("� I");
					return false;
				}
				if(isNaN(daysEntered)){
					alert("� i");
					return false;
				}else if(Number(daysEntered)<= 0 || Number(daysEntered) > 15){
					alert("�i");
					return false;
				}
			}
			
		return true;
	}
	function checkAndSubmit()
	{
		emailValue = $("#_email").text();
		fromemailValue = $("#_fromemail").text();
		schedule_check = $("#_schedule_check").is(":checked");
		daysEntered = $("#_interval").text();
		if(!isYearly && isActivated){
			usage_check = $("#_usage_check").is(":checked");
		}else{
			usage_check = currentCheckUsage;
		}
		restart_check = $("#_restart_check").is(":checked");
		if(showMessage()){		
			$.ajax({
		        url:activationCFCPath +'?method=saveSettings',
		        data:{ token:cToken, schedule_check:schedule_check,interval:daysEntered,email:emailValue, fromemail: fromemailValue, usage_check: usage_check, restart_check: restart_check, notificationEnabled: notificationEnabled },
		        method: 'POST',
		        beforeSend: function(){
		            $("#act-loader-img").css("display", "block");
		        },
		        success: function(res,textStatus, xhr){
		            try{
		                res = JSON.parse(res);
		                if(!res.ACCESSERROR){
		                	if(res.RESULT == 1)
		                   		window.location.href = "settings.cfm?message=settingsSuccess"+"&instList="+res.INSTANCELIST + "&usageChanged="+res.USAGECHANGED;
		                   	else
		                   		window.location.href = "settings.cfm?errorMessage=settingsError";
		                }else
		                    handleSecurityRedirect();
		            }
		            catch(err){
		                if(err.message.indexOf('JSON') != -1 && err.name == "SyntaxError")
		                window.location.href = "� /CFIDE/administrator/index.cfm� �";
		            }
		            
		        },
		        complete: function(){
		            $("#act-loader-img").css("display", "none");
		        }
	    	});
		}else{

		}
	}
	
</script>
� metaData Ljava/lang/Object;��	 � 	Functions� 
Properties� getMetadata ()Ljava/lang/Object; this Lcfsettings2ecfm421127599; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; value 	include23 #Lcoldfusion/tagext/lang/IncludeTag; 	include24 	include25 LineNumberTable form26 %Lcoldfusion/tagext/html/form/FormTag; mode26 I t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module27 $Lcoldfusion/tagext/lang/ImportedTag; mode27 t14 t15 t16 t17 t18 t19 module28 mode28 t22 t23 t24 t25 t26 t27 module29 mode29 t30 t31 t32 t33 t34 t35 module30 mode30 t38 t40 t41 t42 t43 module31 mode31 t46 t47 t48 t49 t50 t51 java/lang/Throwable runPage output46  Lcoldfusion/tagext/io/OutputTag; mode46 output47 mode47 t12 t13 output48 mode48 t20 t21 output49 mode49 output50 mode50 output51 mode51 t36 t37 output52 mode52 t44 t45 output53 mode53 output54 mode54 t54 t55 t56 t57 module39 mode39 module40 mode40 module41 mode41 module42 mode42 include2 abort3 !Lcoldfusion/tagext/lang/AbortTag; include7 module8 mode8 module9 mode9 module10 mode10 t28 t29 module11 mode11 module12 mode12 module13 mode13 t52 t53 module15 mode15 output14 mode14 t59 t60 t61 t62 t63 t64 t65 t66 t67 t68 module16 mode16 t71 t72 t73 t74 t75 t76 module17 mode17 t79 t80 t81 t82 t83 t84 module18 mode18 t87 t88 t89 t90 t91 t92 module19 mode19 t95 t96 t97 t98 t99 t100 module20 mode20 t103 t104 t105 t106 t107 t108 module21 mode21 t111 t112 t113 t114 t115 t116 module22 mode22 t119 t120 t121 t122 t123 t124 t125 ,Lcoldfusion/runtime/TransientVariableHolder; t126 #Lcoldfusion/runtime/AbortException; t127 Ljava/lang/Exception; __cfcatchThrowable0 t129 t130 output45 mode45 t133 t134 t135 t136 t137 	include43 t139 	include44 t141 t142 t143 t144 t145 !coldfusion/runtime/AbortException� java/lang/Exception� module32 mode32 module33 mode33 module34 mode34 <clinit> module35 mode35 module36 mode36 module37 mode37 module38 mode38 1     .                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     �     �     �       H   Z   �   =>   �   ��    �� �   "     ���   �       ��      �      �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � ��   �       ���    ���   ���  �� �  a    �*,¶�*�#+�'�):*\�v�=�C�G� �*,¶�*�#+�'�):*]�x�=�C�G� �*,¶�*�#+�'�):*^�z�=�C�G� �,|�U*� �W�*,~��*� 5W�*,~��**� E���f� :*,���*� �**� -�T�,��U,**� ��T� �U,��U��**� E���f��*,���*� �*C� �Y�S� �*,���*C� �Y�S� ������ "*,���*� �**� I�T�*,���*,���**� E���f� �*,���*C� �Y�S� ������� �**� M�T�� o*C� �Y�S� �W���� B*� 5*u�**����� �Y**� i�TSY*C� �Y�S� �S��� *� 5**� y�T�� *� 5**� ��T�*� �**� ��T� ���6**� 5�T� �6�*,���,��U,*�� �Y�S� � �U,��U,**� ��T� �U,��U*�   �   H   ���    �� �   ���   ���   ���   ���   ��� �  J �  \  \  \ T ] T ] = ] � ^ � ^ r ^ � f � f � f � f � f � f � g � g � g � g � g � g � h � h � h � h � h � h � h � h � h � h � i � i � i � i � i � i � j � j � j � j � j k k k k k k k k k k/ l/ l/ l/ l+ l+ lJ mJ mZ mZ mq nq nq nq nm nm nJ m� p� p� p� p� p� p� p� p� p� p� r� r� r� r� s� s� t� t� t� t� u� u u u u u� u� u� u� u� u/ w/ w/ w/ w+ w� tA zA zA zA z= z� s� rP }P }P }P }[ }[ }P }P }P }P }a }a }a }a }P }P }P }P }L }� q� p� �� �� �� �� �� �� �� �� �� � k � h � �  	p  4  ,��U*��+�'��:* �����¶���*�� �Y�S� � ��:��Ҷ��C��Y6� q*,��M,ضU,* ��**� m�'�*� �Y*�� �YpS� �S�t� �U,ܶU�ݚ��� � :� �:*,��M���� :� #�� � #:		�ߨ � :
� 
�:��,�U,*�� �Y�S� � �U,�U*�^+�'�`:* ��bdf�j�lY� �YnSY�S�u�{�C�Y6� 6*,��M,�U������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,�U*�^+�'�`:* ��bdf�j�lY� �YnSY�S�u�{�C�Y6� 6*,��M,�U������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,�U*�^+�'�`:* ��bdf�j�lY� �YnSY�S�u�{�C�Y6� 6*,��M,��U������ � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,��U**� ��T�� �*�^+�'�`:$* ��$bdf�j$�lY� �YnSY�S�u�{$�C$�Y6%� 6*$%,��M,��U$������ � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+,��U� �*�^+�'�`:,* ��,bdf�j,�lY� �YnSY S�u�{,�C,�Y6-� 6*,-,��M,�U,������ � :.� .�:/*-,��M�/,��� :0� #0�� � #:1,1��� � :2� 2�:3,���3*,��*� 0 i � � � � � ^ � � � � � ^ � � � � � � � � � �������{�����{�����������Jfiini?�����?�����������*--2-MYSVYMhSVhYehhmh������+%(+�:%(:+7::?:������������������ �  
 4  ��    � �   ��   ��   ��   ��   ��   ��   ��   �� 	  �� 
  ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��    �� !  �� "  �� #  �� $  �� %  �� &  =� '  �� (  �� )  �� *  �� +  �� ,  �� -  �� .  �� /  �� 0   � 1  � 2  � 3�   � ,  �  � ' � ' � 5 � 5 � 5 � 5 � R � R � � � � � � � � � � � � � � � � � z �  � � � � � �k �k �4 �/ �/ �� �� �� �� �� �� �� �� �� �� �� �U �U �� � � �    :  V*� �� �L*� �N*� �Ķ �*-+��� �+��U*��.-�'��:*��C��Y6� �*+���+*�**� ��T����U*+���+*�**� ��T����U*+���+*�**� ��T����U*+���+*�**� 9�T����U*+���+*�**� Q�T����U*+���+*�**� }�T����U*+~������-��� :� #�� � #:��� � :� �:	���	+��U*��/-�'��:
*4�
�C
��Y6� +**� �T� �U
�����
��� :� #�� � #:
��� � :� �:
���+��U*��0-�'��:*:��C��Y6� +**� �T� �U�������� :� #�� � #:��� � :� �:���+��U*��1-�'��:*A��C��Y6� +**� �T� �U�������� :� #�� � #:��� � :� �:���+��U*��2-�'��:*G��C��Y6� +**� %�T� �U�������� :� #�� � #:��� � : �  �:!���!+��U*��3-�'��:"*M�"�C"��Y6#� +**� U�T� �U"�����"��� :$� #$�� � #:%"%��� � :&� &�:'"���'+��U*��4-�'��:(*Q�(�C(��Y6)� +**� 1�T� �U(�����(��� :*� #*�� � #:+(+��� � :,� ,�:-(���-+��U*��5-�'��:.*T�.�C.��Y6/� +**� 1�T� �U.�����.��� :0� #0�� � #:1.1��� � :2� 2�:3.���3+��U*��6-�'��:4*|�4�C4��Y65� !+*|�*�0�U+��U4�����4��� :6� #6�� � #:747��� � :8� 8�:94���9+��U� 6 E2>8;> E2M8;M>JMMRM�������������������,8258�,G25G8DGGLG{�����{������������&2,/2�&A,/A2>AAFAu�����u������������ ,&),� ;&);,8;;@;o�����o������������!-'*-�!<'*<-9<<A< �  F :  V��    V��   V��   V � �   V   V�   V��   V��   V��   V�� 	  V	 
  V
�   V�   V�   V��   V��   V   V�   V��   V��   V�   V�   V   V�   V��   V��   V��   V��   V   V�   V��   V��   V��    V�� !  V "  V� #  V� $  V� %  V�� &  V=� '  V (  V� )  V�� *  V�� +  V� ,  V� -  V .  V� /  V�� 0  V � 1  V� 2  V� 3  V 4  V � 5  V!� 6  V"� 7  V#� 8  V$� 9�  � h ` ` h h ` ` ` ` X � � � � � � � � y � � � � � � � � � � � � � � � � � � � � � � � � � � � � )�4�4�4�4�4e4
:
:
:
:	:�:�A�A�A�A�A_AGGGGG�G�M�M�M�M�MYM�Q�Q�Q�Q�Q�Q{T{T{T{TzTST�|�|�|�|�|�|      �   #     *� 
�   �       ��   �� �  �  $  �,d�U*�^'+�'�`:* ٶbdf�j�lY� �YnSYfS�u�{�C�Y6� 6*,��M,h�U������ � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,j�U*� )W�*,��* �**�� �Y
S�� ��������� *,��*� )�*,��,l�U,**� )�T� �U,]�U,**� ]�T� �U,n�U*�^(+�'�`:* �bdf�j�lY� �YnSYpS�u�{�C�Y6� 6*,��M,r�U������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,t�U*� AW�,v�U*�^)+�'�`:* ��bdf�j�lY� �YnSYxS�u�{�C�Y6� 6*,��M,z�U������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,|�U*�^*+�'�`:*�bdf�j�lY� �YnSY~SYrSY~S�u�{�C�Y6� 6*,��M,��U������ � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*�   Y u x x } x N � � � � � N � � � � � � � � � � ������������������������v�����v�����������QmppupF�����F����������� �  j $  ���    �� �   ���   ���   �%�   �&�   ���   ���   ���   ��� 	  ��� 
  ���   �'�   �(�   ���   ���   ���   ���   ���   ���   �)�   �*�   ���   ���   ���   ���   ���   ���   �+�   �,�   ���   ���   ���    ��� !  ��� "  ��� #�   � / > � > �  � � � � � � � � � � � � � � � � � � � � � � � � � � � � �/ �/ �/ �/ �. �E �E �E �E �D �� �� �Z �" �" �" �" � � �f �f �/ �**66� �� �  "�  �  **� �̶ �**� ���ֶ �*�� �Y�S� �Y� �*�� �Y�S� � � ��� � �� �*�**�� �YS�
� ��Y�� %W*�**�� �YS�� ���� �*�**�� �YS�� �YS���� j*�#+�'�):*�+-*�*�02�6�:�=�C�G� �*�L+�'�N:*��C�G� �,P�U**� �W� �**� Q̶ �**� 9̶ �*�#+�'�):*�Y�=�C�G� �*�^+�'�`:*�bdf�j�lY� �YnSYpSYrSYpS�u�{�C�Y6� 6*,��M,��U������ � :	� 	�:
*,��M�
��� :� #�� � #:��� � :� �:���*�^	+�'�`:*�bdf�j�lY� �YnSY�SYrSY�S�u�{�C�Y6� 6*,��M,��U������ � :� �:*,��M���� :� #�� � #:��� � :� �:���*�^
+�'�`:*�bdf�j�lY� �YnSY�SYrSY�S�u�{�C�Y6� 6*,��M,��U������ � :� �:*,��M���� :� #�� � #:��� � :� �:���*�^+�'�`:*�bdf�j�lY� �YnSY�SYrSY�S�u�{�C�Y6 � 6* ,��M,��U������ � :!� !�:"* ,��M�"��� :#� ##�� � #:$$��� � :%� %�:&���&*�^+�'�`:'* �'bdf�j'�lY� �YnSY�SYrSY�S�u�{'�C'�Y6(� 6*'(,��M,��U'������ � :)� )�:**(,��M�*'��� :+� #+�� � #:,',��� � :-� -�:.'���.*�^+�'�`:/*!�/bdf�j/�lY� �YnSY�SYrSY�S�u�{/�C/�Y60� 6*/0,��M,��U/������ � :1� 1�:2*0,��M�2/��� :3� #3�� � #:4/4��� � :5� 5�:6/���6*�^+�'�`:7*"�7bdf�j7�lY� �YnSY�SYrSY�S�u�{7�C7�Y68� �*78,��M,��U*��7�'��:9*"�9�C9��Y6:� ,��U9�����9��� :;� )� E� };�� � #:<9<��� � :=� =�:>9���>7������ � :?� ?�:@*8,��M�@7��� :A� #A�� � #:B7B��� � :C� C�:D7���D*,¶�*�^+�'�`:E*#�Ebdf�jE�lY� �YnSY�SYrSY�S�u�{E�CE�Y6F� 6*EF,��M,ʶUE������ � :G� G�:H*F,��M�HE��� :I� #I�� � #:JEJ��� � :K� K�:LE���L*�^+�'�`:M*$�Mbdf�jM�lY� �YnSY�SYrSY�S�u�{M�CM�Y6N� 6*MN,��M,ζUM������ � :O� O�:P*N,��M�PM��� :Q� #Q�� � #:RMR��� � :S� S�:TM���T*�^+�'�`:U*%�Ubdf�jU�lY� �YnSY�SYrSY�S�u�{U�CU�Y6V� 6*UV,��M,ҶUU������ � :W� W�:X*V,��M�XU��� :Y� #Y�� � #:ZUZ��� � :[� [�:\U���\*�^+�'�`:]*&�]bdf�j]�lY� �YnSY�SYrSY�S�u�{]�C]�Y6^� 6*]^,��M,ֶU]������ � :_� _�:`*^,��M�`]��� :a� #a�� � #:b]b��� � :c� c�:d]���d*�^+�'�`:e*'�ebdf�je�lY� �YnSY�SYrSY�S�u�{e�Ce�Y6f� 6*ef,��M,ڶUe������ � :g� g�:h*f,��M�he��� :i� #i�� � #:jej��� � :k� k�:le���l*�^+�'�`:m*(�mbdf�jm�lY� �YnSY�SYrSY�S�u�{m�Cm�Y6n� 6*mn,��M,޶Um������ � :o� o�:p*n,��M�pm��� :q� #q�� � #:rmr��� � :s� s�:tm���t*�^+�'�`:u*)�ubdf�ju�lY� �YnSY�SYrSY�S�u�{u�Cu�Y6v� 6*uv,��M,�Uu������ � :w� w�:x*v,��M�xu��� :y� #y�� � #:zuz��� � :{� {�:|u���|*�� �Y�S� ����~���Y�� /W**�*�� �Y�S� ��������~���� :*� ��*�� �Y�S� � �6*+�*�0�6 �6�� 7*� �*�� �Y�S� � �6*-�*�0�6 �6�*� M*/�**�� �Y
S�� ���*� }*0�**�� �Y
S�� ���*� ��*� ���*� e*4�*��� Y*� ��#:}*� Y*6�***� e�')� ���*� a*7�***� e�'+� �Y�S��**� Y�/��Y�� W**� a�/��Y�� W**� Y�3���Y�� W**� a�3���� *� ��6�� W� ]:~~�:�<:���B�F�     *           }H��L*� ��6�� �� � :�� ��:�}�O��*� �*>�**�� �Y
S�Q� ���**� ��T**� !�T�W�~���Y��  W**� ��T**� ��T�W�~���� *� 9��� *� 9�6�*� Q*E�**�� �Y
S�Y� ���**� Y�/�� ;*J�*J�***� Y�'[� ��� �^W���� *� ��**� �`b�f� m*� uW�**� �hj�f� *� u*�� �YlS� �*W�**� =�'n*� �Y**� u�TSY*�� �YpS� �S�tW*��-+�'��:�*[���C���Y6��*�,��� :��&��*�,�� :����*�,�5� :�� ���*�,�b� :�� ���*�,��� :�� ���,��U,**� ��T� �U,��U*�#+��'�):�*����=��C��G� :�� ���*,¶�*�#,��'�):�*����=��C��G� :�� E��*,¶����������� :�� #��� � #:������ � :�� ��:������*� �� �#/),/�#>),>/;>>C>�����������������t�����i�����i�����������<X[[`[1{����1{���������� ##(#�COILO�C^IL^O[^^c^��������&&#&&+&�������������'�$'','��S�GSMPS��b�GbMPbS_bbgb�������# #�2 2#/2272������������������������	h	�	�	�	�	�	]	�	�	�	�	�	]	�	�	�	�	�	�	�	�	�	�	�
0
L
O
O
T
O
%
o
{
u
x
{
%
o
�
u
x
�
{
�
�
�
�
�
�
�7C=@C
�7R=@RCORRWR����������������}�����}�����������=���=���=�,�),,1,���������!/�5��������������������!/�5���������������� �  � �  ��    � �   ��   ��   -�   ./   0�   1�   2�   �� 	  �� 
  ��   �   �   ��   3�   4�   ��   ��   ��   �   �   ��   5�   6�   ��   ��   ��   7�   8�   ��   9�   :�    �� !  �� "  �� #  � $  � %  �� &  ;� '  <� (  �� )  �� *  �� +  � ,  � -  �� .  =� /  >� 0   � 1  � 2  � 3  ?� 4  @� 5  !� 6  A� 7  B� 8  C 9  D� :  E� ;  F� <  G� =  H� >  I� ?  J� @  K� A  L� B  M� C  N� D  O� E  P� F  Q� G  R� H  S� I  T� J  U� K  V� L  W� M  X� N  Y� O  Z� P  [� Q  \� R  ]� S  ^� T  _� U  `� V  a� W  b� X  c� Y  d� Z  e� [  f� \  g� ]  h� ^  i� _  j� `  k� a  l� b  m� c  n� d  o� e  p� f  q� g  r� h  s� i  t� j  u� k  v� l  w� m  x� n  y� o  z� p  {� q  |� r  }� s  ~� t  � u  �� v  �� w  �� x  �� y  �� z  �� {  �� |  �� }  �� ~  ��   �� �  �� �  �� �  � �  �� �  �� �  �� �  �� �  �� �  �� �  �� �  �� �  �� �  �� �  �� �  �� �  �� �  �� ��  ~�     
 	  
  
 (  (  -  -  -  -  B  B  $  $  $  $      T  T  T  T  }  }  }  }  T  T  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �   �  T @ @ K K U U q q Z � � � � � � � � � O M M Y Y    ! ! � �  �  �  �  �  � !� !� !� !o !m "m "y "y "� "7 "� #� #� #� #{ #y $y $� $� $C $	A %	A %	M %	M %	 %
	 &
	 &
 &
 &	� &
� '
� '
� '
� '
� '� (� (� (� (c (a )a )m )m )+ )� *� * * *� *� *� *� *! *! *! *! *8 *8 *! *! *! *! *� *� *P +P +S +S +S +S +P +P +P +P +p +p +p +p +P +P +P +P +w +w +P +P +P +P +L +L +� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� -� ,� *� /� /� /� /� /� /� 0� 0� 0� 0� 0� 0 1 1 3 3 3 3 3$ 4$ 4' 4' 4# 4# 4# 4# 4 4H 6H 6G 6G 6G 6G 6= 6h 7h 7y 7y 7g 7g 7g 7g 7] 7� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 8� 9� 9� 9� 9� 9� 8 < < < < <0 5G >G >G >G >= >e ?e ?m ?m ?e ?e ?e ?e ?� ?� ?� ?� ?� ?� ?� ?� ?e ?e ?� @� @� @� @� @� C� C� C� C� Ce ?� E� E� E� E� E 2� I� I� I� I� I� I J J J J J J J J J J( K( K J� I1 O1 O1 O1 O5 O5 O8 O8 O0 O0 OE RE RE RE RA RL SL SL SL SP SP SS SS SK SK S` U` U` U` U\ UK Sy Wy W� W� W� W� Wy Wy Wy WA P0 O====<kkR���� [ 3� �  �    y,	�U*� AW�*,��* ��**�� �Y
S�� ��������� *,��*� A�*,��*,��*� �W�*,��**� ��T��� *,��*� ��*,��,�U,**� A�T� �U*,���,**� ��T� �U,�U*�^ +�'�`:* ��bdf�j�lY� �YnSYS�u�{�C�Y6� 6*,��M,�U������ � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,�U,* ��* ��**�� �Y
S�� ��� �"�U,$�U,**� ��T� �U,&�U*�^!+�'�`:* ��bdf�j�lY� �YnSY(S�u�{�C�Y6� 6*,��M,*�U������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,,�U*�^"+�'�`:* ��bdf�j�lY� �YnSY.S�u�{�C�Y6� 6*,��M,0�U������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,2�U*� -ILLQL"lxrux"l�ru�x�����A]``e`6�����6�����������!$$)$�DPJMP�D_JM_P\__d_ �     y��    y� �   y��   y��   y��   y��   y��   y��   y��   y�� 	  y�� 
  y��   y��   y��   y��   y��   y��   y��   y��   y��   y��   y��   y��   y��   y��   y��   y��   y�� �   E  �  �  �  �  �  �   �   � ; � ; � U � U � U � U � Q � Q �   � o � o � o � o � k � k � } � } � } � } � } � } � � � � � � � � � � � � � } � � � � � � � � � � � � � � � � � � � � � � � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �& �& �� �� �� �� � �  �   �     c�!�#J�!�L\�!�^��!��� �Y@S�B��!���lY� �Y�SY� �SY�SY� �S�u���   �       c��   `� �  n  $  �,* ��* ��* ��**�� �Y
S�7� ��� �^�"�U,$�U,**� ��T� �U,9�U*�^#+�'�`:* ��bdf�j�lY� �YnSY;S�u�{�C�Y6� 6*,��M,=�U������ � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,?�U*�^$+�'�`:* ��bdf�j�lY� �YnSYAS�u�{�C�Y6� 6*,��M,C�U������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,E�U,* ��* ��* ��**�� �Y
S�G� ��� �^�"�U,$�U,**� ��T� �U,I�U*�^%+�'�`:* ��bdf�j�lY� �YnSYKS�u�{�C�Y6� 6*,��M,M�U������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,O�U**� Q�T����Y�� W**� 9�T��],Q�U*�^&+�'�`:* Ķbdf�j�lY� �YnSYSS�u�{�C�Y6� 6*,��M,U�U������ � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,W�U*� qW�*,��* ̶**�� �Y
S�� ��������� *,Y��*� q�*,��,[�U,**� q�T� �U,]�U,**� ��T� �U,_�U*�   � � � � � � � � � � � � � � � � �p�����e�����e����������������������������������������t�����t����������� �  j $  ���    �� �   ���   ���   ���   ���   ���   ���   ���   ��� 	  ��� 
  ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���    ��� !  ��� "  ��� #�  j Z  �  �  �  �  �  �  �  �  �  �  �  �   � E � E � E � E � D � � � � � Z �U �U � �� �� �� �� �� �� �� �� �� �� �� �� �� �' �' �' �' �& �s �s �< �  �  �  �  �  �  �  �  � � � � �  �  �d �d �- �� �� �� �� �� �� �
 �
 �% �% �? �? �? �? �; �; �
 �U �U �U �U �T �k �k �k �k �j �  �       �    �