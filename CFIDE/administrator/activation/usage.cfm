����  -& 
SourceFile )/CFIDE/administrator/activation/usage.cfm 1cfusage2ecfm1296628650$funcISEDITIONVALIDFORUSAGE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( 
	 * _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V , -
  . (class$coldfusion$tagext$lang$ImportedTag Ljava/lang/Class; "coldfusion.tagext.lang.ImportedTag 2 forName %(Ljava/lang/String;)Ljava/lang/Class; 4 5 java/lang/Class 7
 8 6 0 1	  : _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; < =
  > "coldfusion/tagext/lang/ImportedTag @ _setCurrentLineNo (I)V B C
  D l10n F 
../cftags/ H admin J setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V L M
 A N &coldfusion/runtime/AttributeCollection P java/lang/Object R id T lic_dev V var X file Z java/lang/StringBuilder \ resources/general_ ^ (Ljava/lang/String;)V  `
 ] a REQUEST c java/lang/String e locale g _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; i j
  k _String &(Ljava/lang/Object;)Ljava/lang/String; m n coldfusion/runtime/Cast p
 q o append -(Ljava/lang/String;)Ljava/lang/StringBuilder; s t
 ] u .cfm w toString ()Ljava/lang/String; y z
 S { ([Ljava/lang/Object;)V  }
 Q ~ setAttributecollection (Ljava/util/Map;)V � �  coldfusion/tagext/lang/ModuleTag �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � 	Developer � write � ` java/io/Writer �
 � � doAfterBody � �
 � � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � doEndTag � � #javax/servlet/jsp/tagext/TagSupport �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � � lic_eva � 
Evaluation � lic_ent_trial � Enterprise Trial � 
	
	 � license � edition � LIC_DEV � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
  � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
  � _Object (Z)Ljava/lang/Object; � �
 q � _boolean (Ljava/lang/Object;)Z � �
 q � '(Ljava/lang/Object;Ljava/lang/String;)D � �
  � LIC_EVA � LIC_ENT_TRIAL � 
		 � coldfusion/runtime/CFBoolean � f_false Lcoldfusion/runtime/CFBoolean; � �	 � � t_true � �	 � � 
 � isEditionValidForusage � metaData Ljava/lang/Object; � �	  � boolean � name � 
returnType � 
Parameters � getMetadata ()Ljava/lang/Object; this 3Lcfusage2ecfm1296628650$funcISEDITIONVALIDFORUSAGE; LocalVariableTable Code getName getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; module56 $Lcoldfusion/tagext/lang/ImportedTag; mode56 I t12 Ljava/lang/Throwable; t13 t14 t15 t16 t17 module57 mode57 t20 t21 t22 t23 t24 t25 module58 mode58 t28 t29 t30 t31 t32 t33 LineNumberTable java/lang/Throwable# <clinit> 1       0 1    � �     � �  �   "     � �    �        � �    � z  �   !     �    �        � �    � z  �   !     �    �        � �    � �  �   #     � f�    �        � �    � �  �  �  "  c+� � :+� ,� :	-� � %:-� ):-+� /-+� /-� ;� ?� A:
-t� E
GIK� O
� QY� SYUSYWSYYSYWSY[SY� ]Y_� b-d� fYhS� l� r� vx� v� |S� � �
� �
� �Y6� :-
� �:�� �
� ����� � :� �:-� �:�
� �� :� #�� � #:
� �� � :� �:
� ��-+� /-� ;� ?� A:-u� EGIK� O� QY� SYUSY�SYYSY�SY[SY� ]Y_� b-d� fYhS� l� r� vx� v� |S� � �� �� �Y6� :-� �:�� �� ����� � :� �:-� �:�� �� :� #�� � #:� �� � :� �:� ��-+� /-� ;� ?� A:-v� EGIK� O� QY� SYUSY�SYYSY�SY[SY� ]Y_� b-d� fYhS� l� r� vx� v� |S� � �� �� �Y6� :-� �:�� �� ����� � :� �:-� �:�� �� :� #�� � #:� �� � : �  �:!� ��!-�� /-d� fY�SY�S� l-�� �� ��~�� �Y� ͚ &W-d� fY�SY�S� l�� ��~�� �Y� ͚ *W-d� fY�SY�S� l-Ҷ �� ��~�� �Y� ͚ &W-d� fY�SY�S� l�� ��~�� �Y� ͚ *W-d� fY�SY�S� l-Զ �� ��~�� �Y� ͚ &W-d� fY�SY�S� l�� ��~�� ɸ ͙ -ֶ /� ܰ-+� /� -ֶ /� ߰-+� /-� /�  � � �$ � � �$ � �$$ � �$$$$���$���$��$�$��$�$$$���$���$�� $�� $��$��$ $$  �  V "  c � �    c � �   c � �   c �    c   c   c �   c & '   c    c  	  c 
  c	
   c   c �   c �   c   c   c �   c   c
   c   c �   c �   c   c   c �   c   c
   c   c �   c �   c   c     c! � !"  � }   r , s g t g t q t q t  t  t � t � t � t � t � t � t { t { t 4 tc uc um um u{ u{ u� u� u� u� u� u� uw uw u0 u_ v_ vi vi vw vw v| v| v| v| v� v� vs vs v, v( x( x< x< x( x( x( x( xV xV xj xj xV xV xV xV x( x( x( x( x� x� x� x� x� x� x� x� x( x( x( x( x� x� x� x� x� x� x� x� x( x( x( x( x� x� x� x� x� x� x� x� x( x( x( x( x x x x x x x x x( x( x6 y6 y6 y6 y6 yM {M {M {M {M {E z( x     �   #     *� 
�    �        � �   %   �   V     83� 9� ;� QY� SY�SY�SY�SY�SY�SY� SS� � �    �       8 � �        ����  - � 
SourceFile )/CFIDE/administrator/activation/usage.cfm )cfusage2ecfm1296628650$funcGETEPOCHTODATE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( get (I)Ljava/lang/Object; * + %coldfusion/runtime/ArgumentCollection -
 . , DATESECONDS 0   2 put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 4 5
 . 6 getVariable  (I)Lcoldfusion/runtime/Variable; 8 9
 . : 
     < _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V > ?
  @ 	STARTDATE B _setCurrentLineNo (I)V D E
  F 	utc2Local H CreateDateTime ((IIIIII)Lcoldfusion/runtime/OleDateTime; J K coldfusion/runtime/CFPage M
 N L DateConvert D(Ljava/lang/String;Ljava/util/Date;)Lcoldfusion/runtime/OleDateTime; P Q
 N R _set '(Ljava/lang/String;Ljava/lang/Object;)V T U
  V java/lang/String X dateSeconds Z _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; \ ]
  ^ 	IsNumeric (Ljava/lang/Object;)Z ` a
 N b _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; d e
  f _double (Ljava/lang/Object;)D h i coldfusion/runtime/Cast k
 l j@�@      _div (DD)D p q
  r _Object (D)Ljava/lang/Object; t u
 l v set (Ljava/lang/Object;)V x y coldfusion/runtime/Variable {
 | z 
RESULTDATE ~ 	local2Utc � s � _int (Ljava/lang/Object;)I � �
 l � _Date $(Ljava/lang/Object;)Ljava/util/Date; � �
 l � DateAdd E(Ljava/lang/String;ILjava/util/Date;)Lcoldfusion/runtime/OleDateTime; � �
 N � mmm dd � DateTimeFormat 6(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String; � �
 N � 
 � getEpochToDate � metaData Ljava/lang/Object; � �	  � true � &coldfusion/runtime/AttributeCollection � java/lang/Object � name � hint � Returns Epoch from Date � output � 
Parameters � DEFAULT � NAME � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this +Lcfusage2ecfm1296628650$funcGETEPOCHTODATE; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� YY1S�    �       
 � �    � �  �  �    +� � :+� ,� :	-� � %:-� ):� /� 13� 7W� ;:
-=� A-C- �� G-I- �� G-�� O� S� W- �� G-� YY[S� _� c�� 3�
-1� g� m n� s� w� }-- �� G-�- �� G-�-� YY[S� _� �-C� g� �� �� S� W- �� G--� g� ��� ��-�� A�    �   p    � �     � �    � �    � �    � �    � �    � �    & '     �     � 	   0 � 
 �  R T   � 2 � 2 � S � S � ] � ] � ` � ` � a � a � b � b � c � c � d � d � \ � \ � \ � \ � R � R � R � R � H � u � u � u � u � u � u � u � u � � � � � � � � � � � u � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � H �     �   #     *� 
�    �        � �    �   �   |     ^� �Y� �Y�SY�SY�SY�SY�SY�SY�SY� �Y� �Y� �Y�SY3SY�SY[S� �SS� �� ��    �       ^ � �    � �  �   !     ��    �        � �        ����  -	 
SourceFile )/CFIDE/administrator/activation/usage.cfm cfusage2ecfm1296628650  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   SERVICE_NOTAVAILABLE Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   USAGE_CALENDAR_TIP   	   DEACTIVATED_ON   	    SORTASCENDINGLABEL " " 	  $ END_DATE & & 	  ( ISYEARLY * * 	  , SERVICEAVAILABLE . . 	  0 	NEXTLABEL 2 2 	  4 DATADEFINED 6 6 	  8 END_DATE_FORMAT_LABEL : : 	  < UNITSGRAPHTITLE > > 	  @ YESLABEL B B 	  D HEADER_CORES F F 	  H USAGE_PAGE_DESC J J 	  L 	NODATAMSG N N 	  P TOTALUSAGECOUNTLABEL R R 	  T ACTIVATEDLABEL V V 	  X HEADER_SERVER_INSTANCE Z Z 	  \ PREVIOUSLABEL ^ ^ 	  ` INFOEMPTYLABEL b b 	  d ACTIVATIONGRAPHTITLE f f 	  h GETUSAGELABEL j j 	  l HEADER_DOCKER n n 	  p CHARTSERVICE r r 	  t E v v 	  x 	INFOLABEL z z 	  | TOTALACTIVATIONCOUNTLABEL ~ ~ 	  � URL � � 	  � HEADER_UNITS � � 	  � INVALID_END_DATE � � 	  � DEACTIVATEDLABEL � � 	  � START_DATE_LABEL � � 	  � EMPTYTABLELABEL � � 	  � USAGETABLETITLE � � 	  � FACTORY � � 	  � GETCSRFTOKEN � � 	  � ACTIVATED_ON � � 	  � HEADER_ACT_STATUS � � 	  � START_DATE_FORMAT_LABEL � � 	  � EXPORTPDFLABEL � � 	  � SHOWMESSAGE � � 	  � ACTIVATIONCFCPATH � � 	  � DOCKERGRAPHTITLE � � 	  � DATES_INVALID � � 	  � ZERORECORDSLABEL � � 	  � HEADER_DEPLOYMENT � � 	  � 
START_DATE � � 	  � AERRORMESSAGES � � 	  � SORTDESCENDINGLABEL � � 	  � HEADER_ACT_DATE � � 	  � INFOFILTEREDLABEL � � 	  � OFFLINEERRORMSG � � 	  � SEARCHLABEL � � 	  � NOLABEL � � 	  � SHOWUSAGEDATA � � 	  � REQUEST � � 	  � ISEDITIONVALIDFORUSAGE � � 	  � NOUSAGEFOREDITION � � 	  � END_DATE_LABEL � � 	   DOCUMENTSERVICE 	  BERRORSEXIST 	  com.macromedia.SourceModTime  {��4 pageContext #Lcoldfusion/runtime/NeoPageContext;	  getOut ()Ljavax/servlet/jsp/JspWriter; javax/servlet/jsp/JspContext
 parent Ljavax/servlet/jsp/tagext/Tag;	  Cp1252 setPageEncoding (Ljava/lang/String;)V !coldfusion/runtime/NeoPageContext 
! <html>
<head>

<script src="# write% java/io/Writer'
(& $class$coldfusion$tagext$io$OutputTag Ljava/lang/Class; coldfusion.tagext.io.OutputTag, forName %(Ljava/lang/String;)Ljava/lang/Class;./ java/lang/Class1
20*+	 4 _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag;67
 8 coldfusion/tagext/io/OutputTag: _setCurrentLineNo (I)V<=
 > 	hasEndTag (Z)V@A coldfusion/tagext/GenericTagC
DB 
doStartTag ()IFG
;H java/lang/StringJ adminScriptSrcPathL _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;NO
 P _String &(Ljava/lang/Object;)Ljava/lang/String;RS coldfusion/runtime/CastU
VT doAfterBodyXG
;Y doEndTag[G coldfusion/tagext/QueryLoop]
^\ doCatch (Ljava/lang/Throwable;)V`a
^b 	doFinallyd 
;e Eajaxtree/jquery.js" type="text/javascript"></script>

<script src="g Rajaxtree/d3/d3.v4.min.js"></script>
<link rel="stylesheet" type="text/css" href="i ?ajaxtree/jquery.dataTables.min.css">
	
</head>
<body>
	

k GetAuthUser ()Ljava/lang/String;mn
 o matchesq java/lang/Objects ^\w$u _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;wx
 y _boolean (Ljava/lang/Object;)Z{|
V} %class$coldfusion$tagext$net$CookieTag coldfusion.tagext.net.CookieTag�+	 � coldfusion/tagext/net/CookieTag� 30� 
setExpires (Ljava/lang/Object;)V��
�� cfcookie� value� CGI� script_name� _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;��
 � setValue�
�� setHttpOnly�A
�� name� cfadmin_lastpage_� concat &(Ljava/lang/String;)Ljava/lang/String;��
K� setName�
�� _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z��
 � 


� _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V��
 � �
<script language="Javascript" src="../scripts/util.js"></script>
<script language="Javascript" src="./chartUtil.js"></script>

� security� _resolve�O
 � isAdminSecurityEnabled� isAdminUserIdRequired� canAccessPage�  'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag��+	 � !coldfusion/tagext/lang/IncludeTag� 	cfinclude� template� GetContextRoot�n
 � "/CFIDE/administrator/forbidden.cfm� setTemplate�
�� %class$coldfusion$tagext$lang$AbortTag coldfusion.tagext.lang.AbortTag��+	 � coldfusion/tagext/lang/AbortTag� activationStyles.cfm� LOCALE� REQUEST.LOCALE� en� checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V��
 � 
localeFile� java/lang/StringBuilder� resources/activation_� 
�� locale� append -(Ljava/lang/String;)Ljava/lang/StringBuilder;��
�� .cfm� toString�n
t� _structSetAt ;(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;Z)V��
 � (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag��+	  "coldfusion/tagext/lang/ImportedTag l10n 
../cftags/ admin	 :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V�
 &coldfusion/runtime/AttributeCollection id usage_page_desc var ([Ljava/lang/Object;)V 
 setAttributecollection (Ljava/util/Map;)V  coldfusion/tagext/lang/ModuleTag

H 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; !
 " �The Usage page gives an analytical view of your license&rsquo;s usage in terms of number of instances used, units used, usage graph, and much more.$
Y _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;'(
 ) #javax/servlet/jsp/tagext/TagSupport+
,\
b
e usage_calendar_tip0 NTo view the usage data, choose the required date range, and click Track Usage.2 header_server_instance4 	Device ID6 header_cores8 Cores: header_units< 
Units Used> header_deployment@ Deployment TypeB header_dockerD Docker (Y/N)F header_act_statusH StatusJ header_act_dateL Activation/ Deactivation DateN getUsageLabelP Track UsageR exportPdfLabelT Export to PDFV activationGraphTitleX Total Activations as of Z dockerGraphTitle\ Docker Usage^ unitsGraphTitle` Total Units used as ofb 	noDataMsgd There is no data available.f offlineErrorMsgh BUnable to fetch data as the licensing endpoints are not reachable.j start_date_format_labell From Date(mm/dd/yyyy)n end_date_format_labelp To Date(mm/dd/yyyy)r 
start_datet start_date_labelv Fromx end_datez end_date_label| To~ usageTableTitle� License Usage Data� dates_invalid� .Please select a valid start date and end date.� invalid_end_date� ,End date cannot be less than the start date.� totalActivationCountLabel� Max Activations� totalUsageCountLabel� 	Max Units� yesLabel� YES� noLabel� NO� activatedLabel� 	Activated� deactivatedLabel� Deactivated� noUsageForEdition� <The Usage data does not apply to this edition of ColdFusion.� activated_on� Activated on� deactivated_on� Deactivated on� searchLabel� Search� emptyTableLabel� zeroRecordsLabel�  There are no records to display.� infoEmptyLabel� No entries to display.� previousLabel� Previous� 	nextLabel� Next� sortAscendingLabel� Sort Ascending� sortDescendingLabel� Sort Descending� _factor2 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;��
 � infoFilteredLabel� #(filtered from _MAX_ total entries)� 	infoLabel� +Showing _START_ to _END_ of _TOTAL_ entries� false� 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V��
 � ArrayNew (I)Ljava/util/List;��
 � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray;��
V� setArray !(Lcoldfusion/runtime/FastArray;)V�� coldfusion/runtime/Variable�
�� Now "()Lcoldfusion/runtime/OleDateTime;��
 � mm/dd/yy� LSDateFormat 8(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;��
 �  � HTTP� https� off� _compare '(Ljava/lang/Object;Ljava/lang/String;)D� 
  _Object (Z)Ljava/lang/Object;
V Len (Ljava/lang/Object;)I
 	 (I)Ljava/lang/Object;
V (Ljava/lang/Object;D)D�
  http:// 	http_host ./CFIDE/administrator/activation/activation.cfc set�
� https:// coldfusion/runtime/CFBoolean t_true Lcoldfusion/runtime/CFBoolean;	  *coldfusion/runtime/TransientVariableHolder" &(Lcoldfusion/runtime/NeoPageContext;)V $
#% _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;'(
 ) getDocumentService+ getNewGraphingService- unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;/0 coldfusion/runtime/NeoException2
31 t61 [Ljava/lang/String; any756	 9 findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I;<
3= e? bind '(Ljava/lang/String;Ljava/lang/Object;)VAB
#C f_falseE	F 
getMessageH 	getDetailJ unbindL 
#M isEditionValidForusageO 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;QR
 S licenseU isYearlySKUW $
<script type="text/javascript">
	Y 
		[ _autoscalarize](
 ^ activationCFCPath` ToScriptb�
 c serviceAvailablee ;
		g service_notavailablei showUsageDatak 
	mu
	function saveAsPDF() {
		if(validateDate()){
			var locationSubstring = window.location.href.substring(0,5);
			var protocol;
			if(locationSubstring === 'https'){
				protocol = 'https';
			} else {
				protocol = 'http';
			}
			var d1 = new Date($( "#Start_Date" ).val());
			var start_date = (d1.getTime() - d1.getTimezoneOffset()*60*1000);
			var d2 = new Date($( "#End_Date" ).val());
			var end_date = (d2.getTime() - d2.getTimezoneOffset()*60*1000);
			end_date = end_date + 86399000; // to include the data of current date, passing end timestamp as added 23h59m of that day.
			var url = protocol + '://o SERVER_NAMEq EncodeForHTMLAttributes�
 t :v SERVER_PORTx �/CFIDE/administrator/activation/usagePdfHelper.cfm?start_date='+start_date+'&end_date='+end_date;
			if(serviceAvailable)
				window.open(url);
			else
			{
				alert(service_notavailable);
			}
		}
	}
	
</script>
z 


	
	


| 
~ ../header.cfm� 

� ../include/margintop.cfm� 

<script src="� .ajaxtree/jquery.dataTables.min.js"></script>
� ../include/errors.cfm� )

	
	<div class="usage-container">
		� )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTag��+	 � #coldfusion/tagext/html/form/FormTag� usagePageMainForm�
�� HTML� 	setFormat�
�� cfform� action� Script_Name� 	setAction�
�� POST� 	setMethod�
��
�H O
	        <input type="hidden" name="csrftoken" id="license_csrftoken" value="� getCSRFToken� licensetabkeyname� 	">
	    �
�Y
�\
�b
�e _factor0��
 � ERRORMESSAGE� URL.ERRORMESSAGE�  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z��
 � 
			� errorMessage� 
			<ul><li class="errorText">� </li></ul>
		� MESSAGE� URL.MESSAGE� 
				� message� 
			<div>
				<img src="� thisURL� �/images/update.gif" height="16" width="16"></span>
				<span>&nbsp;&nbsp;</span>
				<span><p style="color:226600; display: inline-block">� </p></span>
			</div>
		� �
		<ul class="compiled-messages" id="compiled-messages" style="display: none;padding:0px;list-style: none">
    	</ul>
		<p class="page_desc">� 	<br>
			� 	
				<b>� 	</b>
			� 
		</p><br>
		
		� �
			<div class="section-buttons" style="margin-bottom: 10px;height: 30px;" >
				<span id="calendar_controls">
					<label for="Start_Date">� �</label>
					&nbsp;&nbsp;
					<input name="Start_Date" placeholder="MM/DD/YYYY" autocomplete="off" type="text" maxlength="30" size="8" title="� 	" value="� �" id="Start_Date" readonly="true">
					<div id="Start_Date_read" role="log" aria-live="assertive" aria-atomic="true" aria-relevant="additions"  style="position:absolute; left:-5000px"></div>
					&nbsp;&nbsp;
					<label for="End_Date">� �</label>
					&nbsp;&nbsp;
					<input name="End_Date" placeholder="MM/DD/YYYY" autocomplete="off" id="End_Date" type="text" title="� !" maxlength="30" size="8" value="�" readonly="true">
					<div id="End_Date_read" role="log" aria-live="assertive" aria-atomic="true" aria-relevant="additions"  style="position:absolute; left:-5000px"></div>
				</span>&nbsp;&nbsp;
		        <button class="buttn-blue-light" id="getUsageBtn" class="clearfix">� �
		        </button>
		        
		        <button class="buttn-blue-light" id="exportPdfBtn" class="clearfix" style="float: right;" 
		        onclick="saveAsPDF()">� n
		        </button>
		    </div>
		    <br>
		    
		    <div class="subheading usage-container-header">� W</div>
		    <div style="margin: 20px 0px 10px 0px">
		    	<span class="subheading">� }</span>&nbsp; :&nbsp;<span class="display-values" id="totalActCount" style="margin-left: 10px;"></span>
		    </div>
		    � 2
			    <div >
			    	<span class="subheading">� |</span>&nbsp; :&nbsp;<span class="display-values" id="totalUnitCount" style="margin-left: 10px;"></span>
			    </div>
			� �
			<table id="usagelist" class="usage-table cell-border" style="margin-top: 10px;">
				<thead>
					<tr style="background-color: #F4F5F5;">
						<th>� </th>
						<th> </th>
						 
							<th> 
						<th> Z</th>
					</tr>
				</thead>
			</table>
			<br><br>
		
			<div class="subheading">	 g &nbsp;&nbsp;<span id="as_of_date"></span></div><br>
			<div class="chart-no-data" id="usage_no_data"></div>
			<div class="chart-main usage-chart-portlet" id="usage_chart_portlet" style="display: none;">
				<svg class="linechartgraph" id="usage_linechartgraph" width="100%" height="100%"></svg>
				<div class="tooltip-html"></div><br>
			</div>
			<br><br>
			 
				<div class="subheading"> n &nbsp;&nbsp;<span id="units_as_of_date"></span></div><br>
				<div class="chart-no-data" id="units_no_data"></div>
				<div class="chart-main units-chart-portlet" id="units_chart_portlet" style="display: none;">
					<svg class="linechartgraph" id="units_linechartgraph" width="100%" height="100%"></svg>
					<div class="tooltip-html"></div><br>
				</div>
				<br><br>
			 
			<div class="subheading"> ></div><br>
			<div class="chart-no-data" id="docker_no_data"> </div>
			<div class="chart-main docker-chart-portlet" id="docker_chart_portlet" style="display: none;">
				<svg class="linechartgraph" id="docker_linechartgraph" width="100%" height="100%"></svg>
				<div class="tooltip-html"></div><br>
			</div>
		 _factor1�
  {
		
		<img src="../images/loader.svg" class="usage-loader-img" id="usage-loader-img" style="display: none;"/>
	</div>
	 ../include/marginbottom.cfm  ../footer.cfm" isYearly$�
</script>
<script type="text/javascript">
	var cToken = "";
	var table;
	var msgDiv = $('#compiled-messages');
	var date1 = $('#date1');
	var date2 = $('#date2');
	var today = new Date();
	var yesterday = new Date(new Date().setDate(new Date().getDate()-1));
	// var defaultEndDate = new Date();
	// var defaultStartDate = new Date(new Date().setDate(new Date().getDate()-7));
	$(document).ready(function(){
		cToken = document.forms['usagePageMainForm'].csrftoken.value;
		// initialize with empty data
		if(showUsageData){
			var columnsArr = [
		            { "data": "identifier", "width": "45%" },
		            { "data": "num_cores", "width": "10%"},
		            { "data": "deployment_type", "width": "10%" },
		            { "data": "status", "width": "10%" },
		            { "data": "timestampStr", "width": "15%"},
		            { "data": "is_docker", "width": "10%" }
				];
			if(isYearly){
				columnsArr = [
		            { "data": "identifier", "width": "40%" },
		            { "data": "num_cores", "width": "10%"},
		            { "data": "units_consumed", "width": "10%" },
		            { "data": "deployment_type", "width": "10%" },
		            { "data": "status", "width": "10%" },
		            { "data": "timestampStr", "width": "10%"},
		            { "data": "is_docker", "width": "10%" }
				];
			}
			table = $('#usagelist').DataTable({
				// "info":false,
				// "dom": '<"top"f>rt<"bottom"fp><"clear">',
				// "data":[],
				"columns": columnsArr,
				// "pagingType": "full_numbers"
				"language":{
					"infoEmpty": infoEmptyLabel,
					"emptyTable": emptyTableLabel,
					"search": searchLabel,
					"zeroRecords":zeroRecordsLabel,
					"paginate": {
				      	"previous": previousLabel,
				      	"next": nextLabel
				    },
				    "aria": {
				      	"sortAscending": sortAscendingLabel,
				      	"sortDescending": sortDescendingLabel
				    },
				    "infoFiltered" : infoFilteredLabel,
				    "info" : infoLabel
				}
			});
			setCalendarControls();
		}
		// $( "#Start_Date" ).datepicker( "setDate", defaultStartDate );
		// $( "#End_Date" ).datepicker( "setDate", defaultEndDate );
		// populateUsageData();
		// if(usageData.length > 0){
		// 	table.rows.add(usageData);
		// 	table.draw();
		// }
		// when clicked on get usage button
		$('#getUsageBtn').click(function(){
			if(showUsageData)
				populateUsageData();
		});
    
	});
	function getDate( element ) {
	    var date;
	    try {
	        date = $.datepicker.parseDate( 'mm/dd/yyyy', element.value );
	    } catch( error ) {
	    	date = null;
	    }
	 
	    return date;
    }
    function validateDate(){
    	var res = true;
    	if($( "#Start_Date" ).val() != '' && $( "#End_Date" ).val() != ''){
    		start_date = new Date($( "#Start_Date" ).val()).getTime();
    		end_date = new Date($( "#End_Date" ).val()).getTime();
    		if(end_date < start_date){
    			addErrorMsg('& B',true);
    			res = false;
    		}
		}else{
			addErrorMsg('(',true);
			res = false;
		}
		return res;
    }
	function populateUsageData(){
		if(validateDate()){
			var d1 = new Date($( "#Start_Date" ).val());
			start_date = (d1.getTime() - d1.getTimezoneOffset()*60*1000);
			var d2 = new Date($( "#End_Date" ).val());
			end_date = (d2.getTime() - d2.getTimezoneOffset()*60*1000);
			end_date = end_date + 86399000; // to include the data of current date, passing end timestamp as added 23h59m of that day.
			$.ajax({
				url:activationCFCPath+"?method=getUsageData",
					type:"POST",
					data:{token:cToken,startDate:start_date,endDate:end_date},
					dataType:"json",
					beforeSend: function(){
		                $("#usage-loader-img").css("display", "block");
		            },
					success: function(res,textStatus, xhr){
						try{
		                    // res = JSON.parse(res);
		                    if(!res.ACCESSERROR){
		                    	msgDiv.html('');
		                    	if(!res.OFFLINEERROR){
			                    	res.DATA = res.DATA || [];
			                    	// process docker column
			                    	var tableRows = [];
			                    	for (var i = 0; i < res.DATA.length; i++) {
			                    		res.DATA[i].is_docker = res.DATA[i].is_docker == true?'* ':', T';
			                    		res.DATA[i].status = res.DATA[i].is_activated == true?'.�';
			                    		var dateStr = '';
			                    		res.DATA[i].timestampStr = '';
			                    		if(res.DATA[i].is_activated == true){
			                    			if(res.DATA[i].timestamp != null && res.DATA[i].timestamp != ''){
			                    				var d = new Date(res.DATA[i].timestamp)
			               						dateStr = (d.getMonth()+1) + '/' + d.getDate() + '/' +  d.getFullYear();
			                    			}
			                    			res.DATA[i].timestampStr = '0�' + ' ' + dateStr;
			                    		}else{
			                    			if(res.DATA[i].deactivationTimestamp != null && res.DATA[i].deactivationTimestamp != ''){
			                    				var d = new Date(res.DATA[i].deactivationTimestamp)
			               						dateStr = (d.getMonth()+1) + '/' +d.getDate() + '/' + d.getFullYear();
			                    			}
			                    			res.DATA[i].timestampStr = '2�' + dateStr;
			                    		}
			                    	}
			                    	table.clear().draw();
									table.rows.add(res.DATA);
									table.columns.adjust().draw();
									$('#totalActCount').text(res.TOTALACTIVATIONCOUNT);
									if(isYearly)
										$('#totalUnitCount').text(res.TOTALUNITSCONSUMED);
									var chartData = res.TIMESERIESDATA || [];
									for (var i = 0; i < chartData.length; i++) {
										var d = new Date(chartData[i].timestamp);
										d_stamp = (d.getTime() + d.getTimezoneOffset()*60*1000);
										chartData[i].timestamp = d_stamp;
									}
									var usageLine = [{
										name: 'Activation count',
										key: 'activation_count'
									}]
									var dockerLine = [{
										name: 'Docker count',
										key: 'docker_count'
									}]

									$('#as_of_date').text($('#End_Date').val());
									$('#units_as_of_date').text($('#End_Date').val());
									// setCalendarControls();
									if(chartData.length > 0){
										$('#usage_no_data').css("display","none");
										$('#docker_no_data').css("display","none");
										$('#usage_chart_portlet').css("display","block");
										$('#docker_chart_portlet').css("display","block");
										$('#usage_chart_portlet').height(250);
										$('#docker_chart_portlet').height(250);
										var c1  = Object.create(DrawLinechartComponent);
										var c2 = Object.create(DrawLinechartComponent);
										c1.chartOnInit(chartData,usageLine,".usage-chart-portlet",noDataMsg);
										c2.chartOnInit(chartData,dockerLine,".docker-chart-portlet",noDataMsg);
										if(isYearly){
											var unitsLine = [{
												name: 'Units used',
												key: 'total_cores'
											}]
											$('#units_no_data').css("display","none");
											$('#units_chart_portlet').css("display","block");
											$('#units_chart_portlet').height(250);
											var c3 = Object.create(DrawLinechartComponent);
											c3.chartOnInit(chartData,unitsLine,".units-chart-portlet",noDataMsg);
										}
									}
								}else{
									$('#usage_no_data').css("display","block");
									$('#docker_no_data').css("display","block");
									$('#usage_chart_portlet').css("display","none");
									$('#docker_chart_portlet').css("display","none");
									$('#usage_no_data').text(offlineErrorMsg);
									$('#docker_no_data').text(offlineErrorMsg);
									if(isYearly){
										$('#units_no_data').css("display","block");
										$('#units_chart_portlet').css("display","none");
										$('#units_no_data').text(offlineErrorMsg);
									}
								}
		                    }else
		                        handleSecurityRedirect();
		                }
		                catch(err){
		                	console.log(err);
		                    if(err.message.indexOf('JSON') != -1 && err.name == "SyntaxError")
		                    window.location.href = "4 /CFIDE/administrator/index.cfm6B";
		                }
					},
					complete: function(){
	                $("#usage-loader-img").css("display", "none");
	            },
			})
		}
	}

	function setCalendarControls(){
		$('#usagelist_length').html('');
		// var newContent = $("#calendar_controls").html()
  		// $('#usagelist_length').html(newContent);
  		// $("#calendar_controls").html('');
		$( "#Start_Date" ).datepicker({
			maxDate: yesterday,
		    showOn: 'button',
		    buttonImage: '../images/calendar-color.png',
		    buttonText : 'Select Date',
		    onClose:function(selectedDate){
		    	if(selectedDate)
		    		$("#End_Date").datepicker("option", "minDate", new Date(new Date().setTime((new Date(selectedDate)).getTime() + 86400000)));
		    }
		});
        $( "#Start_Date" ).datepicker("option","showWeek",true);

        
		document.getElementById("Start_Date").addEventListener("keydown", function() {
		  	message = ' ' + $('.ui-state-hover').html() + 
			' ' + $('.ui-datepicker-month').html() + 
			' ' + $('.ui-datepicker-year').html();
			$("#Start_Date_read").html(message);
		});
					
		$( "#End_Date" ).datepicker({
			maxDate:today,
		    showOn: 'button',
		    buttonImage: '../images/calendar-color.png',
		    buttonText : 'Select Date'
		});
        $( "#End_Date" ).datepicker("option","showWeek",true);

        document.getElementById("End_Date").addEventListener("keydown", function() {
		  	message = ' ' + $('.ui-state-hover').html() + 
			' ' + $('.ui-datepicker-month').html() + 
			' ' + $('.ui-datepicker-year').html();
			$("#End_Date_read").html(message);
		});
	}

	function addErrorMsg(msg,clear){
        if(clear){
            msgDiv.html('');
        }
        msgDiv.append('<li class="errorText">'+ msg +'</li>')
        
        msgDiv.show();
    }

    function addSuccessMsg(msg,clear){
        if(clear){
            msgDiv.html('');
        }
        msgDiv.append('<li class="successText">'+ '<img src="../images/update.gif" height="16" width="16">&nbsp;&nbsp;'+msg+'</li>');
        msgDiv.show()
    }
</script>
8 Lcoldfusion/runtime/UDFMethod; 1cfusage2ecfm1296628650$funcISEDITIONVALIDFORUSAGE;
< 	O:	 > registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V@A
 B getEpochToDate )cfusage2ecfm1296628650$funcGETEPOCHTODATEE
F 	D:	 H GETEPOCHTODATEJ metaData Ljava/lang/Object;LM	 N 	FunctionsP	FN	<N 
PropertiesT getMetadata ()Ljava/lang/Object; this Lcfusage2ecfm1296628650; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; 	include61 #Lcoldfusion/tagext/lang/IncludeTag; 	include62 output63  Lcoldfusion/tagext/io/OutputTag; mode63 I t8 t9 Ljava/lang/Throwable; t10 t11 	include64 form65 %Lcoldfusion/tagext/html/form/FormTag; mode65 t15 t16 t17 t18 t19 t20 LineNumberTable java/lang/Throwablez registerUDFs runPage module48 $Lcoldfusion/tagext/lang/ImportedTag; mode48 t6 t7 module49 mode49 t14 ,Lcoldfusion/runtime/TransientVariableHolder; t21 #Lcoldfusion/runtime/AbortException; t22 Ljava/lang/Exception; __cfcatchThrowable0 t24 t25 output60 mode60 output59 mode59 t30 t31 t32 t33 t34 t35 t36 t37 output68 mode68 t40 t41 	include66 t43 	include67 t45 t46 t47 t48 t49 output69 mode69 t52 t53 t54 t55 output70 mode70 t58 t59 t60 output71 mode71 t64 t65 t66 t67 output72 mode72 t70 t71 t72 t73 output73 mode73 t76 t77 t78 t79 output74 mode74 t82 t83 t84 t85 output75 mode75 t88 t89 t90 t91 output76 mode76 t94 t95 t96 t97 output77 mode77 t100 t101 t102 t103 output78 mode78 t106 t107 t108 t109 !coldfusion/runtime/AbortException� java/lang/Exception� output0 mode0 output1 mode1 t12 t13 output2 mode2 cookie3 !Lcoldfusion/tagext/net/CookieTag; include4 abort5 !Lcoldfusion/tagext/lang/AbortTag; include6 module8 mode8 t28 t29 module9 mode9 t38 t39 module10 mode10 t44 module11 mode11 t56 t57 module12 mode12 t62 t63 module13 mode13 t68 t69 module14 mode14 t80 t81 module15 mode15 t86 t87 module16 mode16 t92 t93 module17 mode17 t104 t105 module18 mode18 t110 t111 t112 t113 module19 mode19 t116 t117 t118 t119 t120 t121 module20 mode20 t124 t125 t126 t127 t128 t129 module21 mode21 t132 t133 t134 t135 t136 t137 module22 mode22 t140 t141 t142 t143 t144 t145 module23 mode23 t148 t149 t150 t151 t152 t153 module24 mode24 t156 t157 t158 t159 t160 t161 module25 mode25 t164 t165 t166 t167 t168 t169 module26 mode26 t172 t173 t174 t175 t176 t177 module27 mode27 t180 t181 t182 t183 t184 t185 module28 mode28 t188 t189 t190 t191 t192 t193 module29 mode29 t196 t197 t198 t199 t200 t201 module30 mode30 t204 t205 t206 t207 t208 t209 module31 mode31 t212 t213 t214 t215 t216 t217 module32 mode32 t220 t221 t222 t223 t224 t225 module33 mode33 t228 t229 t230 t231 t232 t233 module34 mode34 t236 t237 t238 t239 t240 t241 module35 mode35 t244 t245 t246 t247 t248 t249 module36 mode36 t252 t253 t254 t255 t256 t257 module37 mode37 t260 t261 t262 t263 t264 t265 module38 mode38 t268 t269 t270 t271 t272 t273 module39 mode39 t276 t277 t278 t279 t280 t281 module40 mode40 t284 t285 t286 t287 t288 t289 module41 mode41 t292 t293 t294 t295 t296 t297 module42 mode42 t300 t301 t302 t303 t304 t305 module43 mode43 t308 t309 t310 t311 t312 t313 module44 mode44 t316 t317 t318 t319 t320 t321 module45 mode45 t324 t325 t326 t327 t328 t329 module46 mode46 t332 t333 t334 t335 t336 t337 module47 mode47 t340 t341 t342 t343 t344 t345 <clinit> 1     G                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �            *+   +   �+   �+   �+   56   �+   O:   D:   LM   	 VW [   "     �O�   Z       XY      [      �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� �**+,� �**+,� �	�   Z       �XY    �\]   �^_  �� [  !    7*,��*��=+�9��:* ��?����E��� �*,���*��>+�9��:* ��?����E��� �,��)*�5?+�9�;:* ��?�E�IY6� ",*��KYMS�Q�W�)�Z����_� :� #�� � #:		�c� � :
� 
�:�f�,��)*��@+�9��:* ��?����E��� �,��)*��A+�9��:*�?��������*��KY�S�Q�W��������E��Y6� q*,�#M,��),*�?**� ��*�*�tY*��KY�S�QS�T�W�),��)������ � :� �:*,�*M���� :� #�� � #:��� � :� �:���*�  � � �{ � � �{ � � �{ � � �{ � � �{ � � �{���{���{�	{{�	${${!${$)${ Z   �   7XY    7`   7ab   7�M   7cd   7ed   7fg   7hi   7jM   7kl 	  7ml 
  7nM   7od   7pq   7ri   7sl   7tM   7uM   7vl   7wl   7xM y   � #   �   �  � V � V � > � � � � � � � � � � � s � � � � �EEMM[[[[xx���������- � [  q    �*,\��*� ���*,\��**� ���� B*,Ķ�*� �*��KY�S�Q�,ȶ),**� ��_�W�),ʶ)� n**� ��ζ ]*,ж�*� �*��KY�S�Q�,Զ),*��KY�S�Q�W�),ض),**� ��_�W�),ڶ),ܶ),**� M�_�W�),޶)**� �_�~� %*,ж�,**� �_�W�)*,Ķ��  ,�),**� ��_�W�),�),�)**� �_�~��,�),**� ��_�W�),�),**� ��_�W�),�),*!�?**� Ѷ_�W�u�),�),**��_�W�),�),**� =�_�W�),�),*&�?**� )�_�W�u�),�),**� m�_�W�),��),**� ��_�W�),��),**� ��_�W�),��),**� ��_�W�),��)**� -�_�~�  ,��),**� U�_�W�),��), �),**� ]�_�W�),�),**� I�_�W�),�)**� -�_�~�  ,�),**� ��_�W�),�),�),**� Ͷ_�W�),�),**� ��_�W�),�),**� ݶ_�W�),�),**� q�_�W�),
�),**� i�_�W�),�),**� Q�_�W�),�)**� -�_�~� 6,�),**� A�_�W�),�),**� Q�_�W�),�),�),**� ��_�W�),�),**� Q�_�W�),�)*�   Z   *   �XY    �`   �ab   ��M y  Z �             " "   7 7 7 7 3 3 R	 R	 R	 R	 Q	 k
 k
 k
 k
 o
 o
 r
 r
 j
 j
 � � � � � � � � � � � � � � � � j
  � � � � � � �				****)" �FF\\\\[r!r!r!r!q!�!�!�!�!�!�!�!�!�!�$�$�$�$�$�&�&�&�&�&�&�&�&�&�&�&�&�&�&�)�)�)�)�)
4
4
4
4	4 9 9 9 996;6;6;6;5;K=K=a?a?a?a?`?K=~E~E~E~E}E�F�F�F�F�F�G�G�H�H�H�H�H�G�J�J�J�J�J�K�K�K�K�KLLLLLMMMMM4S4S4S4S3SJTJTJTJTIT_Z_Zu[u[u[u[t[�\�\�\�\�\_Z�c�c�c�c�c�d�d�d�d�dF |  [   2     *��?�C*K�I�C�   Z       XY   }W [  �  n  �*��L*�N*��"*-+��� �*�0-�9�:*T�?
��Y�tYSY�SYSY�S���E�Y6� 6*+�#L+ն)�&���� � :� �:*+�*L��-� :� #�� � #:		�.� � :
� 
�:�/�*�1-�9�:*U�?
��Y�tYSY�SYSY�S���E�Y6� 6*+�#L+ٶ)�&���� � :� �:*+�*L��-� :� #�� � #:�.� � :� �:�/�**�	۶�*� �*X�?*����**� �*Y�?**Y�?*������**� )���**� 9۶�**� �۶�**� -۶�*��KY�S�Q���~��Y�~� /W*a�?*��KY�S�Q�
����~���~� :*� �*��KYS�Q�W��*b�?*�ζ����� 7*� �*��KYS�Q�W��*d�?*�ζ����*� 1�!�*� ���#Y*��&:*�*j�?***� ��*,�tY�!S�z�*� u*k�?***� ��*.�tY�!S�z�� �� �:�:�4:�:�>�   j           @�D*� 1�G�*� *o�?***� y�*I�t�z�W*o�?***� y�*K�t�z�W���� �� � :� �:�N�*~�?**� ��*P*�t�T�~� *� �!�� *� �G�*� -* ��?**��KYVS��X�t�z�*�5<-�9�;:* ��?�E�IY6��+Z�)*�5;�9�;:* ��?�E�IY6� �*+\��+* ��?**� ��_a�d�)*+\��+* ��?**� Q�_e�d�)*+\��+* ��?**� 1�_f�d�)+h�)+* ��?**� �_j�d�)+h�)+* ��?**� �_l�d�)*+\��+* ��?**� �_i�d�)*+n���Z��/�_� :� &� ��� � #:�c� � : �  �:!�f�!+p�)+* ��?*��KYrS�Q�W�u�)+w�)+*��KYyS�Q�W�)+* ��?*�ζ)+{�)�Z��_�_� :"� #"�� � #:##�c� � :$� $�:%�f�%*+}��*�5D-�9�;:&* ��?&�E&�IY6'� �*&+��� :(� �(�*&+�� :)� �)�+�)*��B&�9��:**m�?*!��*�E*��� :+� �+�*+n��*��C&�9��:,*n�?,#��,�E,��� :-� E-�*+���&�Z��P&�_� :.� #.�� � #:/&/�c� � :0� 0�:1&�f�1+Z�)*�5E-�9�;:2*r�?2�E2�IY63�~*+\��+*s�?**� �_��d�)*+\��+*t�?**� ��_��d�)*+\��+*u�?**� ɶ_��d�)*+\��+*v�?**� e�_��d�)*+\��+*w�?**� a�_��d�)*+\��+*x�?**� 5�_ød�)*+\��+*y�?**� %�_Ǹd�)*+\��+*z�?**� ٶ_˸d�)*+\��+*{�?**� �_Ӹd�)*+\��+*|�?**� }�_׸d�)*+\��+*}�?**� -�_%�d�)*+n��2�Z���2�_� :4� #4�� � #:525�c� � :6� 6�:72�f�7+'�)*�5F-�9�;:8*ض?8�E8�IY69� +**� ��_�W�)8�Z���8�_� ::� #:�� � #:;8;�c� � :<� <�:=8�f�=+)�)*�5G-�9�;:>*ܶ?>�E>�IY6?� +**� Ŷ_�W�)>�Z���>�_� :@� #@�� � #:A>A�c� � :B� B�:C>�f�C++�)*�5H-�9�;:D*��?D�ED�IY6E� +**� E�_�W�)D�Z���D�_� :F� #F�� � #:GDG�c� � :H� H�:ID�f�I+-�)*�5I-�9�;:J*��?J�EJ�IY6K� +**� ��_�W�)J�Z���J�_� :L� #L�� � #:MJM�c� � :N� N�:OJ�f�O+/�)*�5J-�9�;:P*��?P�EP�IY6Q� +**� Y�_�W�)P�Z���P�_� :R� #R�� � #:SPS�c� � :T� T�:UP�f�U+-�)*�5K-�9�;:V*��?V�EV�IY6W� +**� ��_�W�)V�Z���V�_� :X� #X�� � #:YVY�c� � :Z� Z�:[V�f�[+1�)*�5L-�9�;:\*�?\�E\�IY6]� +**� ��_�W�)\�Z���\�_� :^� #^�� � #:_\_�c� � :`� `�:a\�f�a+3�)*�5M-�9�;:b*	�?b�Eb�IY6c� +**� !�_�W�)b�Z���b�_� :d� #d�� � #:ebe�c� � :f� f�:gb�f�g+5�)*�5N-�9�;:h*N�?h�Eh�IY6i� !+*N�?*�ζ)+7�)h�Z���h�_� :j� #j�� � #:khk�c� � :l� l�:mh�f�m+9�)� m � � �{ � � �{ u � �{ � � �{ u � �{ � � �{ � � �{ � � �{Hdg{glg{=��{���{=��{���{���{���{RU�RZ�R�{U��{���{���{���{���{���{���{���{j�1{�%1{+.1{j�@{�%@{+.@{1=@{@E@{u�K{��K{��K{�K{#?K{EHK{u�Z{��Z{��Z{�Z{#?Z{EHZ{KWZ{Z_Z{�	 	,{	&	)	,{�	 	;{	&	)	;{	,	8	;{	;	@	;{	o	�	�{	�	�	�{	o	�	�{	�	�	�{	�	�	�{	�	�	�{	�

&{
 
#
&{	�

5{
 
#
5{
&
2
5{
5
:
5{
i
�
�{
�
�
�{
i
�
�{
�
�
�{
�
�
�{
�
�
�{
� { {
�/{/{ ,/{/4/{c��{���{c��{���{���{���{�{{�){){&){).){]��{���{]��{���{���{���{�{{�#{#{ #{#(#{W��{���{W��{���{���{���{ Z  N n  �XY    �ab   ��M   �   �~   ��i   ��l   ��M   �jM   �kl 	  �ml 
  �nM   ��   ��i   ��l   �sM   �tM   �ul   �vl   �wM   �x�   ���   ���   ��l   ��l   ��M   ��g   ��i   ��g   ��i   ��M   ��l   ��l    ��M !  ��M "  ��l #  ��l $  ��M %  ��g &  ��i '  ��M (  ��M )  ��d *  ��M +  ��d ,  ��M -  ��M .  ��l /  ��l 0  ��M 1  ��g 2  ��i 3  ��M 4  ��l 5  ��l 6  ��M 7  ��g 8  ��i 9  ��M :  ��l ;  ��l <  �5M =  ��g >  ��i ?  ��M @  ��l A  ��l B  ��M C  ��g D  ��i E  ��M F  ��l G  ��l H  ��M I  ��g J  ��i K  ��M L  ��l M  ��l N  ��M O  ��g P  ��i Q  ��M R  ��l S  ��l T  ��M U  ��g V  ��i W  ��M X  ��l Y  ��l Z  ��M [  ��g \  ��i ]  ��M ^  ��l _  ��l `  ��M a  ��g b  ��i c  ��M d  ��l e  ��l f  ��M g  ��g h  ��i i  ��M j  ��l k  ��l l  ��M my  F� Y T Y T e T e T # T! U! U- U- U � U� � � � � W� W� � � � X� X� X� X� X� X� X� X� � � � � Y� Y� Y� Y� Y� Y� Y� Y� � � � � � � � Z� Z� � � � � � �  [ [� � � 	 	 	 	  \ \        ] ]    a a/ a/ a a a a aL aL aL aL ac ac aL aL aL aL a a a{ b{ b~ b~ b~ b~ b{ b{ b{ b{ b� b� b� b� b{ b{ b{ b{ b� b� b{ b{ b{ b{ bw bw b� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� d� c a� g� g� g� g� g� h� h� h� h� h j j j j j j j j j4 k4 kE kE k3 k3 k3 k3 k) k� n� n� n� n� n� o� o� o� o� o� o� o� o� o� o� o� o� o� o� o� o� o� i� f� ~� ~� ~� ~       � � � � � � �� ~0 �0 �0 �0 �% �% �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � �6 �6 �> �> �6 �6 �6 �6 �. �W �W �_ �_ �W �W �W �W �O �| �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � �� �N ��m�m�mnn�nY ��s�s�s�s�s�s�s�s�s�t�t�t�t�t�t�t�t�t�u�u�u�u�u�u�u�u�uvvvvvvvvv-w-w5w5w-w-w-w-w%wNxNxVxVxNxNxNxNxFxoyoywywyoyoyoyoygy�z�z�z�z�z�z�z�z�z�{�{�{�{�{�{�{�{�{�|�|�|�|�|�|�|�|�|�}�}�}�}�}�}�}�}�}rr	{�	{�	{�	{�	z�	S�	��	��	��	��	��	��
u�
u�
u�
u�
t�
M�
��
��
��
��
��
��o�o�o�o�n�G�������������iiiihA�	�	�	�	�	�	jNjNjNjNbN;N      [   #     *� 
�   Z       XY   �� [  A� 
Z  %,$�)*�5+�9�;:*�?�E�IY6� ",*��KYMS�Q�W�)�Z����_� :� #�� � #:�c� � :� �:	�f�	,h�)*�5+�9�;:
*�?
�E
�IY6� ",*��KYMS�Q�W�)
�Z���
�_� :� #�� � #:
�c� � :� �:
�f�,j�)*�5+�9�;:*�?�E�IY6� ",*��KYMS�Q�W�)�Z����_� :� #�� � #:�c� � :� �:�f�,l�)*�?**�?*�pr�tYvS�z�~� w*��+�9��:*�?�����*��KY�S�Q�W���������*�?*�p�������E��� �*,���,��)*�?**��KY�S����t�zY�~� %W*�?**��KY�S����t�z�~� �*�?**��KY�S����tY�S�z�~�� j*��+�9��:*�?��*�?*��ж������E��� �*��+�9��:* �?�E��� �*��+�9��:*$�?ܶ��E��� �**� �����*��KY�S��Y��*��KY�S�Q�W���������*�+�9�:*+�?
��Y�tYSYSYSYS���E�Y6� 6*,�#M,%�)�&���� � :� �:*,�*M��-� :� #�� � #:�.� � : �  �:!�/�!*�	+�9�:"*,�?"
�"�Y�tYSY1SYSY1S��"�E"�Y6#� 6*"#,�#M,3�)"�&���� � :$� $�:%*#,�*M�%"�-� :&� #&�� � #:'"'�.� � :(� (�:)"�/�)*�
+�9�:**-�?*
�*�Y�tYSY5SYSY5S��*�E*�Y6+� 6**+,�#M,7�)*�&���� � :,� ,�:-*+,�*M�-*�-� :.� #.�� � #:/*/�.� � :0� 0�:1*�/�1*�+�9�:2*.�?2
�2�Y�tYSY9SYSY9S��2�E2�Y63� 6*23,�#M,;�)2�&���� � :4� 4�:5*3,�*M�52�-� :6� #6�� � #:727�.� � :8� 8�:92�/�9*�+�9�::*/�?:
�:�Y�tYSY=SYSY=S��:�E:�Y6;� 6*:;,�#M,?�):�&���� � :<� <�:=*;,�*M�=:�-� :>� #>�� � #:?:?�.� � :@� @�:A:�/�A*�+�9�:B*0�?B
�B�Y�tYSYASYSYAS��B�EB�Y6C� 6*BC,�#M,C�)B�&���� � :D� D�:E*C,�*M�EB�-� :F� #F�� � #:GBG�.� � :H� H�:IB�/�I*�+�9�:J*1�?J
�J�Y�tYSYESYSYES��J�EJ�Y6K� 6*JK,�#M,G�)J�&���� � :L� L�:M*K,�*M�MJ�-� :N� #N�� � #:OJO�.� � :P� P�:QJ�/�Q*�+�9�:R*2�?R
�R�Y�tYSYISYSYIS��R�ER�Y6S� 6*RS,�#M,K�)R�&���� � :T� T�:U*S,�*M�UR�-� :V� #V�� � #:WRW�.� � :X� X�:YR�/�Y*�+�9�:Z*3�?Z
�Z�Y�tYSYMSYSYMS��Z�EZ�Y6[� 6*Z[,�#M,O�)Z�&���� � :\� \�:]*[,�*M�]Z�-� :^� #^�� � #:_Z_�.� � :`� `�:aZ�/�a*�+�9�:b*4�?b
�b�Y�tYSYQSYSYQS��b�Eb�Y6c� 6*bc,�#M,S�)b�&���� � :d� d�:e*c,�*M�eb�-� :f� #f�� � #:gbg�.� � :h� h�:ib�/�i*�+�9�:j*5�?j
�j�Y�tYSYUSYSYUS��j�Ej�Y6k� 6*jk,�#M,W�)j�&���� � :l� l�:m*k,�*M�mj�-� :n� #n�� � #:ojo�.� � :p� p�:qj�/�q*�+�9�:r*6�?r
�r�Y�tYSYYSYSYYS��r�Er�Y6s� 6*rs,�#M,[�)r�&���� � :t� t�:u*s,�*M�ur�-� :v� #v�� � #:wrw�.� � :x� x�:yr�/�y*�+�9�:z*7�?z
�z�Y�tYSY]SYSY]S��z�Ez�Y6{� 6*z{,�#M,_�)z�&���� � :|� |�:}*{,�*M�}z�-� :~� #~�� � #:z�.� � :�� ��:�z�/��*�+�9�:�*8�?�
���Y�tYSYaSYSYaS����E��Y6�� 6*��,�#M,c�)��&���� � :�� ��:�*�,�*M����-� :�� #��� � #:����.� � :�� ��:���/��*�+�9�:�*9�?�
���Y�tYSYeSYSYeS����E��Y6�� 6*��,�#M,g�)��&���� � :�� ��:�*�,�*M����-� :�� #��� � #:����.� � :�� ��:���/��*�+�9�:�*:�?�
���Y�tYSYiSYSYiS����E��Y6�� 6*��,�#M,k�)��&���� � :�� ��:�*�,�*M����-� :�� #��� � #:����.� � :�� ��:���/��*�+�9�:�*;�?�
���Y�tYSYmSYSYmS����E��Y6�� 6*��,�#M,o�)��&���� � :�� ��:�*�,�*M����-� :�� #��� � #:����.� � :�� ��:���/��*�+�9�:�*<�?�
���Y�tYSYqSYSYqS����E��Y6�� 6*��,�#M,s�)��&���� � :�� ��:�*�,�*M����-� :�� #��� � #:����.� � :�� ��:���/��*�+�9�:�*=�?�
���Y�tYSYuSYSYwS����E��Y6�� 6*��,�#M,y�)��&���� � :�� ��:�*�,�*M����-� :�� #��� � #:����.� � :�� ��:���/��*�+�9�:�*>�?�
���Y�tYSY{SYSY}S����E��Y6�� 6*��,�#M,�)��&���� � :�� ��:�*�,�*M����-� :�� #��� � #:����.� � :�� ��:���/��*�+�9�:�*?�?�
���Y�tYSY�SYSY�S����E��Y6�� 6*��,�#M,��)��&���� � :�� ��:�*�,�*M����-� :�� #��� � #:����.� � :�� ��:���/��*�+�9�:�*@�?�
�»Y�tYSY�SYSY�S����E¶Y6Ù 6*��,�#M,��)¶&���� � :Ĩ Ŀ:�*�,�*M��¶-� :ƨ #ư� � #:��Ƕ.� � :Ȩ ȿ:�¶/��*�+�9�:�*A�?�
�ʻY�tYSY�SYSY�S����EʶY6˙ 6*��,�#M,��)ʶ&���� � :̨ ̿:�*�,�*M��ʶ-� :Ψ #ΰ� � #:��϶.� � :Ш п:�ʶ/��*�+�9�:�*B�?�
�һY�tYSY�SYSY�S����EҶY6ә 6*��,�#M,��)Ҷ&���� � :Ԩ Կ:�*�,�*M��Ҷ-� :֨ #ְ� � #:��׶.� � :ب ؿ:�Ҷ/��*� +�9�:�*C�?�
�ڻY�tYSY�SYSY�S����EڶY6ۙ 6*��,�#M,��)ڶ&���� � :ܨ ܿ:�*�,�*M��ڶ-� :ި #ް� � #:��߶.� � :� �:�ڶ/��*�!+�9�:�*D�?�
��Y�tYSY�SYSY�S����E�Y6� 6*��,�#M,��)�&���� � :� �:�*�,�*M���-� :� #氨 � #:���.� � :� �:��/��*�"+�9�:�*E�?�
��Y�tYSY�SYSY�S����E�Y6� 6*��,�#M,��)�&���� � :� �:�*�,�*M���-� :� # � #:���.� � :� �:��/��*�#+�9�:�*F�?�
��Y�tYSY�SYSY�S����E�Y6� 6*��,�#M,��)�&���� � :�� ��:�*�,�*M���-� :�� #��� � #:����.� � :�� ��:��/��*�$+�9�:�*G�?�
���Y�tYSY�SYSY�S����E��Y6�� 6*��,�#M,��)��&���� � :�� ��:�*�,�*M����-� :�� '��� !� +:����.� � �: � � ��:��/ĩ*�%+�9��:*H�?�
���Y�tYSY�SYSY�S����E��Y�6� F*��,�#M,��)��&��� � !�:� ���:*�,�*Mĩ��-� �:� /��� '� 3�:���.� � �:� ���:	��/ĩ	*�&+�9��:
*I�?�

��
�Y�tYSY�SYSY�S���
�E�
�Y�6� F*�
�,�#M,��)�
�&��� � !�:� ���:*�,�*Mĩ�
�-� �:� /��� '� 3�:�
��.� � �:� ���:�
�/ĩ*�'+�9��:*J�?�
���Y�tYSY�SYSY�S����E��Y�6� F*��,�#M,��)��&��� � !�:� ���:*�,�*Mĩ��-� �:� /��� '� 3�:���.� � �:� ���:��/ĩ*�(+�9��:*L�?�
���Y�tYSY�SYSY�S����E��Y�6� F*��,�#M,��)��&��� � !�:� ���:*�,�*Mĩ��-� �:� /��� '� 3�:���.� � �: � � ��:!��/ĩ!*�)+�9��:"*M�?�"
��"�Y�tYSY�SYSY�S���"�E�"�Y�6#� F*�"�#,�#M,g�)�"�&��� � !�:$� �$��:%*�#,�*Mĩ%�"�-� �:&� /�&�� '� 3�:'�"�'�.� � �:(� �(��:)�"�/ĩ)*�*+�9��:**N�?�*
��*�Y�tYSY�SYSY�S���*�E�*�Y�6+� F*�*�+,�#M,��)�*�&��� � !�:,� �,��:-*�+,�*Mĩ-�*�-� �:.� /�.�� '� 3�:/�*�/�.� � �:0� �0��:1�*�/ĩ1*�++�9��:2*O�?�2
��2�Y�tYSY�SYSY�S���2�E�2�Y�63� F*�2�3,�#M,��)�2�&��� � !�:4� �4��:5*�3,�*Mĩ5�2�-� �:6� /�6�� '� 3�:7�2�7�.� � �:8� �8��:9�2�/ĩ9*�,+�9��::*P�?�:
��:�Y�tYSY�SYSY�S���:�E�:�Y�6;� F*�:�;,�#M,��)�:�&��� � !�:<� �<��:=*�;,�*Mĩ=�:�-� �:>� /�>�� '� 3�:?�:�?�.� � �:@� �@��:A�:�/ĩA*�-+�9��:B*Q�?�B
��B�Y�tYSY�SYSY�S���B�E�B�Y�6C� F*�B�C,�#M,Ŷ)�B�&��� � !�:D� �D��:E*�C,�*MĩE�B�-� �:F� /�F�� '� 3�:G�B�G�.� � �:H� �H��:I�B�/ĩI*�.+�9��:J*R�?�J
��J�Y�tYSY�SYSY�S���J�E�J�Y�6K� F*�J�K,�#M,ɶ)�J�&��� � !�:L� �L��:M*�K,�*MĩM�J�-� �:N� /�N�� '� 3�:O�J�O�.� � �:P� �P��:Q�J�/ĩQ*�/+�9��:R*S�?�R
��R�Y�tYSY�SYSY�S���R�E�R�Y�6S� F*�R�S,�#M,Ͷ)�R�&��� � !�:T� �T��:U*�S,�*MĩU�R�-� �:V� /�V�� '� 3�:W�R�W�.� � �:X� �X��:Y�R�/ĩY*�R   V b{ \ _ b{   V q{ \ _ q{ b n q{ q v q{ � � �{ � � �{ � � �{ � � �{ � � �{ � � �{&\h{beh{&\w{bew{htw{w|w{�{{�3?{9<?{�3N{9<N{?KN{NSN{���{���{��{{��{{{{���{���{y��{���{y��{���{���{���{Lhk{kpk{A��{���{A��{���{���{���{03{383{	S_{Y\_{	Sn{Y\n{_kn{nsn{���{� �{�'{!$'{�6{!$6{'36{6;6{���{���{���{���{���{���{���{�	�{	l	�	�{	�	�	�{	a	�	�{	�	�	�{	a	�	�{	�	�	�{	�	�	�{	�	�	�{
4
P
S{
S
X
S{
)
s
{
y
|
{
)
s
�{
y
|
�{

�
�{
�
�
�{
�{ {
�;G{ADG{
�;V{ADV{GSV{V[V{���{���{�{	{�{	{{#{���{���{���{���{���{���{���{���{Tps{sxs{I��{���{I��{���{���{���{8;{;@;{[g{adg{[v{adv{gsv{v{v{� {{�#/{),/{�#>{),>{/;>{>C>{���{���{���{���{��{��{�{{t��{���{i��{���{i��{���{���{���{<X[{[`[{1{�{���{1{�{���{���{���{ #{#(#{�CO{ILO{�C^{IL^{O[^{^c^{���{���{�{{�&{&{#&{&+&{���{���{���{���{���{���{���{���{\x{{{�{{Q��{���{Q��{���{���{���{$@C{CHC{co{ilo{c~{il~{o{~{~�~{�{{�+7{147{�+F{14F{7CF{FKF{���{���{���{���{��{��{�{{|��{���{q��{���{q��{���{���{���{D`c{chc{9��{���{9��{���{���{���{(+{+0+{KW{QTW{Kf{QTf{Wcf{fkf{���{���{�{{�.{.{+.{.5.{���{���{�{{�&{&{#&{&-&{���{���{��{{�� { { { ' {���{���{��{�{��{�{{!{���{���{���{���{��{��{�{{���{���{���{���{��{��{�{{���{���{���{���{�� {�� {�  {   { � � �{ � � �{ } � �{ � � �{ } �!{ � �!{ � �!{!!	!{!�!�!�{!�!�!�{!w!�!�{!�!�!�{!w!�!�{!�!�!�{!�!�!�{!�"!�{"�"�"�{"�"�"�{"q"�"�{"�"�"�{"q"�"�{"�"�"�{"�"�"�{"�"�"�{#z#�#�{#�#�#�{#k#�#�{#�#�#�{#k#�#�{#�#�#�{#�#�#�{#�#�#�{$t$�$�{$�$�$�{$e$�$�{$�$�$�{$e$�$�{$�$�$�{$�$�$�{$�$�$�{ Z  �Z  %XY    %`   %ab   %�M   %�g   %�i   %�M   %�l   %jl   %kM 	  %�g 
  %�i   %�M   %�l   %�l   %sM   %�g   %�i   %vM   %wl   %xl   %�M   %��   %�d   %��   %�d   %�   %�i   %�l   %�M   %�M   %�l   %�l    %�M !  %� "  %�i #  %�l $  %�M %  %�M &  %�l '  %�l (  %�M )  %� *  %�i +  %�l ,  %�M -  %�M .  %�l /  %�l 0  %�M 1  %� 2  %�i 3  %�l 4  %�M 5  %�M 6  %�l 7  % l 8  %M 9  % :  %i ;  %�l <  %5M =  %M >  %l ?  %�l @  %�M A  % B  %i C  %l D  %	M E  %�M F  %�l G  %�l H  %�M I  %
 J  %i K  %�l L  %�M M  %�M N  %�l O  %l P  %M Q  % R  %i S  %�l T  %�M U  %M V  %l W  %�l X  %�M Y  % Z  %i [  %l \  %M ]  %�M ^  %�l _  %�l `  %�M a  % b  %i c  %�l d  %�M e  %�M f  %�l g  %l h  %M i  % j  %i k  %�l l  %�M m  %M n  %l o  %l p  %M q  %  r  %!i s  %"l t  %#M u  %$M v  %%l w  %&l x  %'M y  %( z  %)i {  %*l |  %+M }  %,M ~  %-l   %.l �  %/M �  %0 �  %1i �  %2l �  %3M �  %4M �  %5l �  %6l �  %7M �  %8 �  %9i �  %:l �  %;M �  %<M �  %=l �  %>l �  %?M �  %@ �  %Ai �  %Bl �  %CM �  %DM �  %El �  %Fl �  %GM �  %H �  %Ii �  %Jl �  %KM �  %LM �  %Ml �  %Nl �  %OM �  %P �  %Qi �  %Rl �  %SM �  %TM �  %Ul �  %Vl �  %WM �  %X �  %Yi �  %Zl �  %[M �  %\M �  %]l �  %^l �  %_M �  %` �  %ai �  %bl �  %cM �  %dM �  %el �  %fl �  %gM �  %h �  %ii �  %jl �  %kM �  %lM �  %ml �  %nl �  %oM �  %p �  %qi �  %rl �  %sM �  %tM �  %ul �  %vl �  %wM �  %x �  %yi �  %zl �  %{M �  %|M �  %}l �  %~l �  %M �  %� �  %�i �  %�l �  %�M �  %�M �  %�l �  %�l �  %�M �  %� �  %�i �  %�l �  %�M �  %�M �  %�l �  %�l �  %�M �  %� �  %�i �  %�l �  %�M �  %�M �  %�l �  %�l �  %�M �  %� �  %�i �  %�l �  %�M �  %�M �  %�l �  %�l �  %�M �  %� �  %�i �  %�l �  %�M �  %�M �  %�l �  %�l �  %�M �  %� �  %�i �  %�l �  %�M �  %�M �  %�l �  %�l   %�M  %�  %�i  %�l  %�M  %�M  %�l  %�l  %�M	  %�
  %�i  %�l  %�M  %�M  %�l  %�l  %�M  %�  %�i  %�l  %�M  %�M  %�l  %�l  %�M  %�  %�i  %�l  %�M  %�M  %�l  %�l   %�M!  %�"  %�i#  %�l$  %�M%  %�M&  %�l'  %�l(  %�M)  %�*  %�i+  %�l,  %�M-  %�M.  %�l/  %�l0  %�M1  %�2  %�i3  %�l4  %�M5  %�M6  %�l7  %�l8  %�M9  %�:  %�i;  %�l<  %�M=  %�M>  %�l?  %�l@  %�MA  %�B  %�iC  %�lD  %�ME  %�MF  %�lG  %�lH  %�MI  %�J  %�iK  %�lL  %�MM  %�MN  %�lO  %�lP  %�MQ  % R  %iS  %lT  %MU  %MV  %lW  %lX  %MYy  �- ,  ,  ,  ,  +    �  �  �  �  �  � 2 2 2 2 1  � � � � � � � � � � � �         � � 2 ? ? ? ? h h h h ? ? � � � � � � � � � � � � � � � � � �  � ? 6 $6 $ $M M M M Q Q T T W &W &L L L n (n (t (t (t (t (� (� (j (j (j (j (] (] '� +� +� +� +� +� ,� ,� ,� ,_ ,] -] -i -i -' -% .% .1 .1 .� .� /� /� /� /� /� 0� 0� 0� 0 0} 1} 1� 1� 1G 1	E 2	E 2	Q 2	Q 2	 2
 3
 3
 3
 3	� 3
� 4
� 4
� 4
� 4
� 4� 5� 5� 5� 5g 5e 6e 6q 6q 6/ 6- 7- 79 79 7� 7� 8� 8 8 8� 8� 9� 9� 9� 9� 9� :� :� :� :O :M ;M ;Y ;Y ; ; < <! <! <� <� =� =� =� =� =� >� >� >� >o >m ?m ?y ?y ?7 ?5 @5 @A @A @� @� A� A	 A	 A� A� B� B� B� B� B� C� C� C� CW CU DU Da Da D D E E) E) E� E� F� F� F� F� F� G� G� G� Gw G� H� H� H� HG H} I} I� I� IA Iw Jw J� J� J; Jq Lq L} L} L5 Lk Mk Mw Mw M/ Me Ne Nq Nq N) N _ O _ O k O k O # O!Y P!Y P!e P!e P! P"S Q"S Q"_ Q"_ Q" Q#M R#M R#Y R#Y R# R$G S$G S$S S$S S$ S   [   � 	    �-�3�5��3��ø3��ָ3�� �3��KY8S�:��3���<Y�=�?�FY�G�I�Y�tYQSY�tY�RSY�SSSYUSY�tS��O�   Z       �XY  y     m � m � s r s r      
   