����  - � 
SourceFile )/CFIDE/administrator/settings/caching.cfm 7cfcaching2ecfm993131511$func_CF_ANONYMOUSCLOSURE_ELVIS1  coldfusion/runtime/Closure  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/Variable  _CF_EVAR$INTERNAL  (Ljava/lang/String;)V  
   coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / _setCurrentLineNo (I)V 1 2
 " 3 REQUEST 5 java/lang/String 7 runtime 9 _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; ; <
 " = getRedisCacheStoragePassword ? java/lang/Object A _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; C D
 " E set (Ljava/lang/Object;)V G H
  I getValue ()Ljava/lang/Object; K L
  M _autoscalarize &(Ljava/lang/Object;)Ljava/lang/Object; O P
 " Q _isDefinedElvis S P coldfusion/runtime/CFPage U
 V T _boolean (Ljava/lang/Object;)Z X Y coldfusion/runtime/Cast [
 \ Z   ^ _CF_ANONYMOUSCLOSURE_ELVIS1 ` metaData Ljava/lang/Object; b c	  d &coldfusion/runtime/AttributeCollection f elvisClosure h true j closure l Name n 
Parameters p ([Ljava/lang/Object;)V  r
 g s getMetadata this 9Lcfcaching2ecfm993131511$func_CF_ANONYMOUSCLOSURE_ELVIS1; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       b c     u L  y   "     � e�    x        v w    z {  y   !     a�    x        v w    | }  y   #     � 8�    x        v w    ~   y  *     x+� � :+� ,� :	� Y�  :
-� &� ,:-� 0:
-� 4--6� 8Y:S� >@� B� F� J--
� N� R� W� ]� _� -
� N� R��    x   p    x v w     x � �    x � c    x � �    x � �    x � �    x � c    x - .    x  �    x  � 	   x  � 
 �   * 
 8 8 8 8 g g T T T T     y   #     *� 
�    x        v w    �   y   Z     <� gY� BYiSYkSYmSYkSYoSYaSYqSY� BS� t� e�    x       < v w        ����  -	4 
SourceFile )/CFIDE/administrator/settings/caching.cfm cfcaching2ecfm993131511  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   SORTLIST Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   MEMCACHEDSERVERMAXOBJECTS   	   SERVICEFACTORY   	    ITM " " 	  $ VERIFYSSCONNECTION & & 	  ( DYNAMODB * * 	  , BROWSE_SERVER . . 	  0  CACHING_CLEAR_FOLDER_CACHE_TITLE 2 2 	  4 INVALID_REDIS_PORT 6 6 	  8 TRUSTEDCACHE : : 	  < REDISSERVERUSERNAME > > 	  @ ERROR_LICENSE B B 	  D CFCATCH F F 	  H REDISSERVERMAXLIFE J J 	  L CLUSTERENABLED N N 	  P TOKEN R R 	  T DSN V V 	  X JCSSERVERMAXLIFE Z Z 	  \ JCSDSNVALUE ^ ^ 	  ` L10N_MEMCACHED b b 	  d CACHING_CREATETABLES_DESC f f 	  h MAX_CACHED_QUERIES_ERROR j j 	  l DYNAMO_PURGE_CACHE_VISIBILITY n n 	  p MEMCACHEDSERVERMAXLIFE r r 	  t REDISISCLUSTER v v 	  x TABLESCREATED z z 	  | TEMPLATE_CACHE_SIZE_ERROR ~ ~ 	  �  QUERY_CACHING_CLEAR_CACHE_BUTTON � � 	  � 	LOGACTION � � 	  � JCSSERVERMAXOBJECTS � � 	  � DATA � � 	  � 
REDISISSSL � � 	  � SESSIONSTORAGE � � 	  � TRIMMEDSERVER � � 	  � ERROR_EMPTY_MC � � 	  � MEMCACHEDSERVER � � 	  � STDATASOURCES � � 	  � SESSION_STORAGE_VERIFY_FAILURE � � 	  � "COMPONENT_CACHING_CLEAR_CACHE_DESC � � 	  � SAVECLASSFILES � � 	  � DYNAMODBSERVICE � � 	  � REDISSERVERMAXIDLE � � 	  � COMPONENTCACHE � � 	  � L10N_EHCACHE � � 	  � I � � 	  � FOLDER_NOT_SPECIFIED_ERROR � � 	  � $COMPONENT_CACHING_CLEAR_CACHE_BUTTON � � 	  � CHECKCSRFTOKEN � � 	  � VERIFY � � 	  � REDISSERVERETERNAL � � 	  � 	PAGELABEL � � 	  � 	REDISPORT � � 	  � SETREDIS � � 	  � !CACHING_CLEAR_FOLDER_CACHE_BUTTON � � 	  � BENT � � 	  � CACHING_CLEAR_CACHE_DESC � � 	  � SESSIONSTORAGECONNECTIONSTATUS � � 	  � 
L10N_REDIS � � 	  � SERVERCACHETYPE � � 	   GETCSRFTOKEN 	  
RUNTIMECFC 	  
GETEDITION

 	  CURCACHE 	  CACHEREALPATH 	  REDISSERVERPASSWORD 	  INTERNALQUERYCACHEENABLED 	  FORM 	   ERROR_EMPTY_REDIS_HOSTNAME"" 	 $ NUMERIC_REDIS_PORT&& 	 ( CACHING_CLEAR_CACHE_BUTTON** 	 , REDISSERVERMAXOBJECTS.. 	 0 INREQTRUSTEDCACHE22 	 4 AERRORMESSAGES66 	 8 !DYNAMO_CACHING_CLEAR_CACHE_BUTTON:: 	 < 
JCSDSNNAME>> 	 @ LOGAUDITLOGBB 	 D TEMPLATECACHESIZEFF 	 H MEMCACHEDSERVERMAXIDLEJJ 	 L MCCONNECTIONSTATUSNN 	 P JCSSERVERETERNALRR 	 T ADMINSUBMITVV 	 X REDISSERVERZZ 	 \ MAXCACHEDQUERIES^^ 	 ` L10N_JCSbb 	 d REQUESTff 	 h MC_VERIFY_FAILUREjj 	 l 	SERVERARYnn 	 p JCSSERVERMAXIDLErr 	 t CACHING_CLEAR_FOLDER_CACHE_DESCvv 	 x MEMCACHEDSERVERETERNALzz 	 | BERRORSEXIST~~ 	 � ERROR_TABLES�� 	 � MC_VERIFY_FALSE�� 	 � ___IMPLICITARRYSTRUCTVAR4� createImplicitVariable S(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;)Lcoldfusion/runtime/Variable;��
 �� 	 � ___IMPLICITARRYSTRUCTVAR5�� 	 � ___IMPLICITARRYSTRUCTVAR2�� 	 � ___IMPLICITARRYSTRUCTVAR3�� 	 � ___IMPLICITARRYSTRUCTVAR0�� 	 � ___IMPLICITARRYSTRUCTVAR1�� 	 � ___IMPLICITARRYSTRUCTVAR6�� 	 � ___IMPLICITARRYSTRUCTVAR7�� 	 � com.macromedia.SourceModTime  {��� pageContext #Lcoldfusion/runtime/NeoPageContext;��	 � getOut ()Ljavax/servlet/jsp/JspWriter;�� javax/servlet/jsp/JspContext�
�� parent Ljavax/servlet/jsp/tagext/Tag;��	 � Cp1252� setPageEncoding (Ljava/lang/String;)V�� !coldfusion/runtime/NeoPageContext�
�� F
<script language="Javascript" src="../scripts/util.js"></script>

� write�� java/io/Writer�
�� _setCurrentLineNo (I)V��
 � GetAuthUser ()Ljava/lang/String;��
 � matches� java/lang/Object� ^\w$� _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;��
 � _boolean (Ljava/lang/Object;)Z�� coldfusion/runtime/Cast�
�� %class$coldfusion$tagext$net$CookieTag Ljava/lang/Class; coldfusion.tagext.net.CookieTag� forName %(Ljava/lang/String;)Ljava/lang/Class;�� java/lang/Class�
����	 � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag;��
 � coldfusion/tagext/net/CookieTag� 30� 
setExpires (Ljava/lang/Object;)V��
�� cfcookie� value  CGI java/lang/String script_name _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;	
 
 _String &(Ljava/lang/Object;)Ljava/lang/String;
� _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  setValue�
� setHttpOnly (Z)V
� name cfadmin_lastpage_ concat &(Ljava/lang/String;)Ljava/lang/String; 
! setName#�
�$ 	hasEndTag& coldfusion/tagext/GenericTag(
)' _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z+,
 - $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag0/�	 2 coldfusion/tagext/io/SilentTag4 
doStartTag ()I67
58 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;:;
 < LOCALE> REQUEST.LOCALE@ enB checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)VDE
 F falseH 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)VDJ
 K 	componentM CFIDE.adminapi.runtimeO CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;QR
 S setU� coldfusion/runtime/VariableW
XV hiddenZ java\  coldfusion.server.ServiceFactory^  ` 86400b 10000d FORM.MEMCACHEDSERVERETERNALf FORM.REDISSERVERETERNALh FORM.JCSSERVERETERNALj _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;lm
 n FORM.JCSSERVERMAXIDLEp FORM.JCSSERVERMAXLIFEr FORM.JCSSERVERMAXOBJECTSt _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;vw
 x getDynamoDBServicez coldfusion/runtime/CFBoolean| f_false Lcoldfusion/runtime/CFBoolean;~	}� isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z��
 � 
localeFile� java/lang/StringBuilder� resources/settings_� �
�� locale� append -(Ljava/lang/String;)Ljava/lang/StringBuilder;��
�� .cfm� toString��
�� _structSetAt ;(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;Z)V��
 � 
runtimecfc� cfide.adminapi.runtime� 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag���	 � !coldfusion/tagext/lang/IncludeTag� ../auditlog.cfm� setTemplate��
�� ArrayNew (I)Ljava/util/List;��
 � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray;��
�� setArray !(Lcoldfusion/runtime/FastArray;)V��
X� 
getEdition� 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;��
 � Standard� _compare '(Ljava/lang/Object;Ljava/lang/String;)D��
 � _Object (Z)Ljava/lang/Object;��
�� (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag���	 � "coldfusion/tagext/lang/ImportedTag� l10n� 
../cftags/� admin� :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V#�
�� &coldfusion/runtime/AttributeCollection� id� template_cache_size_error� var� ([Ljava/lang/Object;)V �
�� setAttributecollection (Ljava/util/Map;)V��  coldfusion/tagext/lang/ModuleTag�
��
�8 GThe template cache size must be a number greater than or equal to zero.� doAfterBody�7
�� _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � doEndTag�7 #javax/servlet/jsp/tagext/TagSupport�
�� doCatch (Ljava/lang/Throwable;)V��
�� 	doFinally� 
�� _factor1 m
  max_cached_queries_error TThe maximum number of cached queries must be a number greater than or equal to zero. caching_clear_cache_submit Template Cache Cleared.	 folder_not_specified_error :Specify folder for clearing folder specific trusted cache. error_empty_redis_hostname ,Enter a valid hostname for the Redis Server. mc_verify_false 5Connection to memcached server can not be established _factor2m
  error_empty_mc 0Enter a valid hostname for the Memcached Server. error_license ^Distributed caching(Redis and Memcached) is only available with an Enterprise edition license.  numeric_redis_port" *Redis server port value should be numeric.$ invalid_redis_port& >Redis server port number must be in the range from 1 to 65535.(
)�
)�
)� sqlexecutive- MaxQueryCount/ 	CSRFTOKEN1 FORM.CSRFTOKEN3  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z56
 7 	csrftoken9 checkCSRFToken; _autoscalarize=w
 > settingstabkeyname@ FORM.VERIFYSSCONNECTIONB verifyssconnectionD (Ljava/lang/Object;D)D�F
 G USEJ2EESESSIONI FORM.USEJ2EESESSIONK SESSIONSTOREM FORM.SESSIONSTOREO memoryQ FORM.REDISSERVERS FORM.REDISPORTU 6379W FORM.REDISSERVERPASSWORDY FORM.REDISISCLUSTER[ FORM.REDISISSSL] RedisServer_ Trima 
 b t_trued	}e ArrayLen (Ljava/lang/Object;)Igh
 i (D)Ljava/lang/Object;�k
�l _arraySetAt F(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;Z)Vno
 p 	RedisPortr 	IsNumerict�
 u  �� _factor4xm
 y *coldfusion/runtime/TransientVariableHolder{ &(Lcoldfusion/runtime/NeoPageContext;)V }
|~ staticpassword� redisServerPassword� Compare '(Ljava/lang/String;Ljava/lang/String;)I��
 � (I)Ljava/lang/Object;��
�� !verifyRedisCacheStorageConnection� null� JavaCast 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;��
 � redisIsCluster� 
redisIsSSL� unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;�� coldfusion/runtime/NeoException�
�� t101 [Ljava/lang/String; any���	 � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I��
�� bind '(Ljava/lang/String;Ljava/lang/Object;)V��
|� true� $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag���	 � coldfusion/tagext/io/OutputTag�
�8 
						� _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V��
 � session_storage_verify_failure� =
							Redis Connection Verification Failed.<br />
							� Message� D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object;�
 � EncodeForHTML� 
 � <br />
							� Detail� <br />
						� 
					�
�� coldfusion/tagext/QueryLoop�
��
��
�� 
					
					� unbind� 
|� _factor3�m
 � redis� redisServer� 	redisPort� VERIFYMCCONNECTION� FORM.VERIFYMCCONNECTION� verifymcconnection� FORM.MEMCACHEDSERVER� memcachedServer� ,� ListToArray 6(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;��
 � _List $(Ljava/lang/Object;)Ljava/util/List;��
�� java/util/List� size�7�� P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; �
 � get���  Lenh
  _int (D)I
� Left '(Ljava/lang/String;I)Ljava/lang/String;	

  runtime _resolve	
  verifyMemcachedConnection t102�	  mc_verify_failure A
							Memcached Connection Verification Failed.<br />
							 _factor5m
  CLEARTRUSTEDCACHENOW FORM.CLEARTRUSTEDCACHENOW  cleartrustedcachenow" clearTrustedCache$ 	logaction& cleared the template cache( CLEARCOMPONENTCACHENOW* FORM.CLEARCOMPONENTCACHENOW, ClearComponentCacheNow. clearComponentCache0 cleared the component cache2 	_factor124m
 5 templatecachesize7 Val (Ljava/lang/String;)D9:
 ; _double (Ljava/lang/Object;)D=>
�? Round (D)DAB
 C '(Ljava/lang/Object;Ljava/lang/Object;)D�E
 FU�
XH MaxCachedQueriesJ CachingL Template cache sizeN getTemplateCacheSizeP 2(Lcoldfusion/runtime/Variable;I)Ljava/lang/Object;=R
 S Trusted CacheU isTrustedCacheW ASSUMETEMPLATECACHEISNOTDIRTYY "FORM.ASSUMETEMPLATECACHEISNOTDIRTY[ Component Cache] isComponentCache_ ENABLECOMPONENTCACHEa FORM.ENABLECOMPONENTCACHEc _factor6em
 f Cache Template In Requesth isInRequestTemplateCacheEnabledj INREQUESTTEMPLATECACHEl FORM.INREQUESTTEMPLATECACHEn Save class filesp getSaveClassFilesr FORM.SAVECLASSFILESt Cache web server pathsv isCachePathsx FORM.CACHEREALPATHz  Maximum number of cached queries| getMaxQueryCount~ _factor7�m
 � $Use internal cache to store queries � isInternalCacheForQueryEnabled� USEINTERNALCACHE� FORM.USEINTERNALCACHE� logauditlog� 	_factor13�m
 � t103��	 � _factor8�m
 � 	_factor14�m
 � select� CREATETABLES� FORM.CREATETABLES� setJCSClusterDsnName� Max (DD)D��
 � setMaxQueryCount� setTemplateCacheSize� int�@�i�     Min��
 � setTrustedCache� t_TRUE�	}� f_FALSE�	}�  setInRequestTemplateCacheEnabled� setComponentCache� _factor9�m
 � setSaveClassFiles� setInternalCacheForQueryEnabled� setCachePaths� setRuntimeProperty� redisCacheStorageHost� redisCacheStoragePort� setSessionStorageCluster� setRedisCacheStorageIsSSL� redisCacheStoragePassword� setMemcachedServer� setMemcachedServerMaxIdle� memcachedServerMaxIdle� setMemcachedServerMaxLife� memcachedServerMaxLife� setMemcachedServerEternal� memcachedServerEternal� setMemcachedServerMaxObjects� memcachedServerMaxObjects� setRedisServerMaxIdle� redisServerMaxIdle� setRedisServerMaxLife� redisServerMaxLife� setRedisServerMaxObjects� redisServerMaxObjects� setRedisServerEternal� redisServerEternal� 	_factor10�m
 � setJCSServerMaxIdle� jcsServerMaxIdle� setJCSServerMaxLife� jcsServerMaxLife� setJCSServerMaxObjects� jcsServerMaxObjects  setJCSServerEternal jcsServerEternal getServerCacheType servercachetype setServerCacheType
 t104 Any�	  update_caching_error error_tables 8
						Unable to update caching settings.<br />
						 <br />
					 
				 
				
				 	_factor11m
  CLEARTRUSTEDFOLDERCACHENOW  FORM.CLEARTRUSTEDFOLDERCACHENOW" cleartrustedfoldercachenow$ foldertrustedcache& clearTemplateFolderFromCache( *cleared the template cache for the folder * CLEARQUERYCACHENOW, FORM.CLEARQUERYCACHENOW. clearquerycachenow0 purgeQueryCache2 cleared the query cache4 CLEARDYNAMOCACHENOW6 FORM.CLEARDYNAMOCACHENOW8 ClearDynamoCacheNow: getCFDynamoDBClientImpl< 
purgeCache> cleared the dyamo cache@ 	_factor34Bm
 C TemplateCacheSizeE getRuntimePropertyG getMemcachedServerI getMemcachedServerMaxIdleK getMemcachedServerMaxLifeM getMemcachedServerMaxObjectsO getMemcachedServerEternalQ getRedisServerMaxIdleS getRedisServerMaxLifeU getRedisServerMaxObjectsW getRedisServerEternalY getJCSServerMaxIdle[ getJCSServerMaxLife] getJCSServerMaxObjects_ getJCSServerEternala getRedisCacheStorageIsSSLc 	_factor15em
 f getSessionStorageIsClusterh 7cfcaching2ecfm993131511$func_CF_ANONYMOUSCLOSURE_ELVIS1j _invokeElvisUDF A(Ljava/lang/String;Lcoldfusion/runtime/CFPage;)Ljava/lang/Object;lm
 n 	_factor16pm
 q caching_pagenames pagenameu ../header.cfmw ?
<table width="100%" style="overflow-x: hidden">
<tr>
<td>
y 
{ )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTag~}�	 � #coldfusion/tagext/html/form/FormTag� editForm�
�$ cfform� action� Script_Name� 	setAction��
�� post� 	setMethod��
��
�8 ../include/margintop.cfm� ../include/errors.cfm� 1<b style='color:green'>Table has been created</b>� WriteOutput (Ljava/lang/String;)Z��
 � /
<input type="hidden" name="csrftoken" value="� getCSRFToken� ">

<h2 class="pageHeader">� pageHeader_caching� 	
Caching� .
</h2>


<br>
<span style="color:green;">�  memcached_storage_verify_success�  Memcached Connection Successful.� <br><Br>� 	_factor22�m
 � &</span>

<span style="color:green;">� redis_verify_success� Redis Connection Successful� <Br><Br>� </span>

<b><label for="tcs">� template_cache_size� "Maximum number of cached templates� g</label>&nbsp;</b>
<input name="TemplateCacheSize" id="tcs" type="text" maxlength="5" size="6" value="� " class="number">
<br>

� caching_template_cacheSize_desc��
Limits the number of templates cached using template caching. If the cache is set to a small value, ColdFusion might re-process your templates. If your server has a sufficient amount of memory, you can achieve optimum performance by setting this value to the total number of all of your ColdFusion templates. Setting the cache to a high value does not automatically reduce available memory because ColdFusion caches templates incrementally.
� 

� getJCSClusterDsnName� isJCSClusterTablesCreated� datasources� _Map #(Ljava/lang/Object;)Ljava/util/Map;��
�� j2eeDatasources� StructAppend "(Ljava/util/Map;Ljava/util/Map;Z)Z��
 � t105��	 � ex� 	_factor23�m
 � 


<br><br>
� l10n_ehcache� EHCache� l10n_jcs� JCS� 
l10n_redis� Redis� l10n_memcached� 	Memcached� �

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td>
		<b class="subheading" onClick=toggleClass("serverCacheType")>� ServerCacheTypeTitle� Server wide cache engine� 	_factor24�m
 � v</b>
	</td>
</tr>
<tr class="serverCacheType"><td height="10px"></td></tr>
<tr class="serverCacheType"> 
  <td>
  server_cache_type_desc v
Default server wide caching engine to be used. <i>Switching cache engine will result in loss of old cached data.</i> �
</td></tr>
<tr class="serverCacheType"><td height="10px"></td></tr>
<tr class="serverCacheType"><td>
<select name="servercachetype" id="servercachetype" >
  <option value='0'  selected >
  </option>
  <option value='1'   !</option>
   <option value='2'   "</option>
    <option value='3'   2</option>
</select>
</td></tr>

</table>


 !(Lcoldfusion/runtime/CFBoolean;)Z�
� �

<hr class="line">


<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td>
		<b class="subheading" onClick=toggleClass("memcachedCacheSettings")> MemcachedStorageTitle Memcached Cache Settings �</b>
	</td>
</tr>
<tr class="memcachedCacheSettings"><td height="10px"></td></tr>
</table>
		<span class="memcachedCacheSettings">
		 defaultedisStorageDescription b
		Specify comma separated IP addresses of memcached servers like localhost:11211,localhost:11212! �</span>
	<table class="memcachedCacheSettings">
	<tr><td height="10px"></td></tr>
	<tr>
	                <td>
				<label for="MemcachedServer" class="labelbold"># memcachedserver% Memcached Servers' �</label>
			</td>
			<td>
				<input type="text" maxlength="550" style="width:400px; margin-left: 10px;" name="memcachedserver" size="25" value=") EncodeForHTMLAttribute+ 
 , K" id="memcachedserver">
			</td>
			<td align="left" class="redis">
				. Verify Connection0 �
				<input type="hidden" name="verifymcconnection" id="verifymcconnection" value="0">
                               
				<input type="button" name="verifymcconnection" value="2 �" class="buttn-grey" onClick="document.getElementById('verifymcconnection').value=1;form.submit()">
				
				
			</td>
		</tr>
	</table>
<br>	
	<b class="subheading">
		4 memcachedExtraSettings6 lSpecify server level cache properties for Memcached. Changing these settings requires restarting ColdFusion.8 	_factor17:m
 ; �
	</b>
	<Br><br>
	<table>
		<tr>

                        <td>
				<label for="MemcachedServerMaxIdle" class="labelbold">= memcachedservermaxidle? Max idle time(seconds)A �</label>
			</td>
			<td>
				<input type="text" maxlength="250" style="width:200px; margin-left: 10px;" name="memcachedservermaxidle" size="25" value="C �" id="memcachedservermaxidle">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr>

                        <td>
				<label for="MemcachedServerMaxLife" class="labelbold">E memcachedservermaxlifeG Max life span(seconds)I �</label>
			</td>
			<td>
				<input type="text" maxlength="250" style="width:200px; margin-left: 10px;" name="memcachedservermaxlife" size="25" value="K �" id="memcachedservermaxlife">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr>

                        <td>
				<label for="MemcachedServerMaxObjects" class="labelbold">M memcachedservermaxobjectsO Max elementsQ �</label>
			</td>
			<td>
				<input type="text" maxlength="250" style="width:200px; margin-left: 10px;" name="memcachedservermaxobjects" size="25" value="S �" id="memcachedservermaxobjects">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr>

                        <td>
				<label for="MemcachedServerEternal" class="labelbold">U memcachedservereternalW EternalY �</label>
			</td>
			<td>
				 <input style='margin-left:10px' name="memcachedservereternal" type="checkbox" value="1" title="memcachedservereternal "  [ checked] �
				id="memcachedservereternal">
			</td>
		</tr>
</table>
<hr class="line">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td>
		<b class="subheading" onClick=toggleClass("redisCacheSettings")>_ RedisStorageTitlea Redis Cache Settingsc 	_factor18em
 f �</b>
	</td>
</tr>
<tr class="redisCacheSettings"><td height="10px"></td></tr>
<tr class="redisCacheSettings">
	<td>
		<div class="description">
		h defaultedisStorageDescription2j �
		Specify Redis server settings for caching. These settings for caching only applies when Redis is chosen as default cache engine at the server level, or you specify Redis as cache engine at the application level.
		l v
		</div>
	</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" class="redisCacheSettings">
		n �
		<tr class="redis"><td height="10px"></td></tr>
		<tr class="redis">
			<td width="150px">
				<label class="label-bold" for="RedisServer">p redisserverr Redis Servert h</label>
			</td>
			<td>
				<input type="text" maxlength="550" name="RedisServer" size="25" value="v �" id="redisserver">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr class="redis">
			<td>
				<label class="label-bold" for="RedisPort">x 	_factor19zm
 { redis_server_port} Redis Server Port c</label>
			</td>
			<td>
				<input type="text" maxlength="5" name="RedisPort" size="3" value="� �" id="redisport" class="number">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr class="redis">
			<td>
				<label class="label-bold" for="RedisServerPassword">� RedisServerPassword� Password� �</label>
			</td>
			<td>
                <input type="password" maxlength="100" name="RedisServerPassword" size="25" value="� �" autocomplete="off" id="redispassword">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
        <tr class="redis">
			<td>
				<label class="label-bold" for="RedisIsCluster">� RedisIsCluster� 
Is Cluster� n</label>
			</td>
			<td>
			   <input name="redisiscluster" type="checkbox" value=1 id="redisiscluster"   � CHECKED� k>
                        </td>
		</tr>
		
</table>
<div class="redis spacer10 redisCacheSettings">
	� �
				<input type="hidden" name="verifyssconnection" id="verifyssconnection" value="0">
                               
				<input type="button" name="verifyssconnection" value="� y" class="buttn-grey" onClick="document.getElementById('verifyssconnection').value=1;form.submit()">
				
</div>
<br>
� redisExtraSettings� �
		<b class="subheading">Specify server level cache properties for Redis. Changing these settings requires restarting ColdFusion.</b>
		� 	_factor20�m
 � �<Br><br>

<table border="0" cellpadding="0" cellspacing="0" class="redisCacheSettings">
<tr class="redis">

                        <td>
				<label for="redisServerMaxIdle" class="labelbold">� �</label>
			</td>
			<td>
				<input type="text" maxlength="250" style="width:200px; margin-left: 10px;" name="redisservermaxidle" size="25" value="� �" id="redisservermaxidle">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr class="redis">

                        <td>
				<label for="redisServerMaxLife" class="labelbold">� �</label>
			</td>
			<td>
				<input type="text" maxlength="250" style="width:200px; margin-left: 10px;" name="redisservermaxlife" size="25" value="� �" id="redisservermaxlife">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr class="redis">

                        <td>
				<label for="redisServerMaxObjects" class="labelbold">� �</label>
			</td>
			<td>
				<input type="text" maxlength="250" style="width:200px; margin-left: 10px;" name="redisservermaxobjects" size="25" value="� �" id="redisservermaxobjects">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr class="redis">

                        <td>
				<label for="RedisServerEternal" class="labe-lbold">� �</label>
			</td>
			<td>
				 <input style='margin-left:10px' name="redisservereternal" type="checkbox" value="1" title="redisservereternal "  � =
				id="redisservereternal">
			</td>
		</tr>
</table>
� 	_factor25�m
 � �

<hr class="line">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td>
		<b class="subheading" onClick=toggleClass("configureJCSCluster")>� JCSStorageTitle� JCS Cache Settings� e</b>
	</td>
</tr>
<tr class="configureJCSCluster"><td height="10px"></td></tr>
</table>

    
� StructIsEmpty (Ljava/util/Map;)Z��
 �	
               
   <table border="0" cellpadding="0" cellspacing="0" id = "jcsdsntable" class="configureJCSCluster">
   		<tr><td height="10px"></td></tr>
		              <tr>
			       <td  id="schd_dsn" style="display: ;">
                                <label for="schd_dsn">� schd_dsn� fChoose the data source in which you want to create a table to be used by the JCS JDBC auxiliary cache.� �&nbsp;</label>
	                       </td>
			       <td nowrap id="jcsdsnname" style="display: block;">
						<select name="jcsdsnname" >
								� StructKeyList #(Ljava/util/Map;)Ljava/lang/String;��
 � 
textnocase� asc� ListSort J(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;��
 � ,
							   <option value='select' selected>� select_datasource� Select data source� T</option>                                                         
							
							� java/util/StringTokenizer� '(Ljava/lang/String;Ljava/lang/String;)V �
�� 	nextToken��
�� 
							
								� -MySQL5,MSSQLServer,MySQL_DD,OracleThin,Oracle� _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object;��
 � DRIVER� 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object;�
 � ListContainsNoCase��
 � (J)Z��
��  
								 <option value="� " 
								   >� *</option>
								  
								 
								� 	
							  CFLOOP checkRequestTimeout�
  hasMoreTokens ()Z
�	
							
						</select>
			       </td>
			     </tr>
				<tr><td height="10px"></td></tr>
			     <tr>
	
	                       <td>
                                   <input name="createtables" type="checkbox" value="1" id="createtables"><b> <label for="createtables_"> caching_wscreatetables  Override table if already exists �</label></b><br />
              
                               </td>
                             </tr>
                <tr><td height="10px"></td></tr>
     </table>
       caching_createtables_desc4The JDBC disk cache uses a relational database such as MySQL as a persistent store. The cache elements are serialized and written into a BLOB. You can find more details here : <a target='blank' href='https://commons.apache.org/proper/commons-jcs/JDBCDiskCache.html'>JCS JDBC Disk Cache</a>
		                	_factor21m
  %
	<span class="configureJCSCluster"> </span>

	<br><BR>
	 JCSExtraSettings �
		<b class="subheading">Specify server level cache properties for JCS. Changing these settings requires restarting ColdFusion.</b>
		  p<Br><br>
	<table>
		<tr>

                        <td>
				<label for="jcsServerMaxIdle" class="labelbold">" �</label>
			</td>
			<td>
				<input type="text" maxlength="250" style="width:200px; margin-left: 10px;" name="jcsservermaxidle" size="25" value="$ �" id="jcsservermaxidle">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr>

                        <td>
				<label for="jcsServerMaxLife" class="labelbold">& �</label>
			</td>
			<td>
				<input type="text" maxlength="250" style="width:200px; margin-left: 10px;" name="jcsservermaxlife" size="25" value="( �" id="jcsservermaxlife">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr>

                        <td>
				<label for="jcsServerMaxObjects" class="labelbold">* 	_factor26,m
 - �</label>
			</td>
			<td>
				<input type="text" maxlength="250" style="width:200px; margin-left: 10px;" name="jcsservermaxobjects" size="25" value="/ �" id="jcsservermaxobjects">
			</td>
		</tr>
		<tr class="redis"><td height="10px"></td></tr>
		<tr>

                        <td>
				<label for="jcsServerEternal" class="labelbold">1 �</label>
			</td>
			<td>
				 <input style='margin-left:10px' name="jcsservereternal" type="checkbox" value="1" title="jcsservereternal "  3 �
				id="jcsservereternal">
			</td>
		</tr>
</table>

<hr class="line">

<table width="100%">
<tr>
<td class="px350">
<table><tr><td width="15px">
<input name="AssumeTemplateCacheIsNotDirty" id="atc" type="checkbox" value="1"
	5 %
	>
</td><td>
<b><label for="atc">7 caching_trusted_cache9 Trusted cache; F</label></b>
</td></tr><tr><td></td><td>
<div class="description">
= caching_trusted_cache_desc?*
	When checked, any requested files found to currently reside in the template cache will not be inspected for potential updates. For sites where
	templates are not updated during the life of the server, this minimizes
	file system overhead. This setting does not require restarting the server.
A �
</div>
</td></tr></table>
</td>

<td class="px350">
<table><tr><td width="15px">
<input name="inRequestTemplateCache" id="artc" type="checkbox" value="1"
	C &
	>
</td><td>
<b><label for="artc">E in_request_template_cacheG Cache template in requestI in_request_template_cache_textK�
   When checked, any requested files will be inspected only once for potential updates within a request. If unchecked,
   requested file will be inspected for changes each and everytime when its accessed within the same request. For application where
   templates/components are not expected to reflect updates within the same request, this minimizes file system overhead. This setting does not require restarting the server.
M 	_factor27Om
 P �
</div>
</td></tr></table>
</td>

<td class="px350">
<table><tr><td width="15px">
<input name="enablecomponentcache" id="acc" type="checkbox" value="1"
	R %
	>
</td><td>
<b><label for="acc">T caching_component_cacheV Component cacheX caching_component_cache_descZ �
	When checked, component path resolution is cached and not resolved again. This setting does not require restarting the server.
\ �
</div>
</td></tr></table>
</td>
</tr>
</table>

<table width="100%">
<tr><td height="15px"></td></tr>
<tr>
<td class="px350">
<table><tr><td width="15px">
<input name="SaveClassFiles" id="scf" type="checkbox" value="1"
	^ %
	>
</td><td>
<b><label for="scf">` save_class_filesb save_class_files_descd �
	When you select this option, the class files generated by ColdFusion are saved to disk for reuse after the server restarts.
	Adobe recommends this for production systems.  During development, Adobe recommends that you do not select this option.	f �
</div>
</td></tr></table>
</td>

<td class="px350">
<table><tr><td width="15px">
<input name="cacheRealPath" id="cacheRealPath" type="checkbox" value="1"
	h /
	>
</td><td>
<b><label for="cacheRealPath">j cacheRealPathl 	_factor28nm
 o cacheRealPath_descq q
	Caches page paths on embedded & multiple site web server installations, which provides improved performance.
s �
</div>
</td></tr></table>
</td>

<td class="px350">
<table><tr><td width="15px">
	<input name="useinternalcache" id="useinternalcache" type="checkbox" value="1"
		u &
		>
</td><td>
<b><label for="uic">w use_internal_cachey #Use internal cache to store queries{ use_internal_cache_desc}
	When checked, a server level internal cache is used to store cached queries. By default, cached queries are stored in QUERY region supported by currently selected caching engine at server level. You must restart the server for this change to take effect
 j
</div>
</td></tr></table>
</td>
</tr>
</table>

<div class="spacer10"></div>
<b><label for="mcq">� caching_Max_cachedQueries� `</label></b>
<input name="MaxCachedQueries" id="mcq" type="text" maxlength="6" size="3" value="� ." class="number">
<div class="description">
� caching_Max_cachedQueries_desc�
	Limits the maximum number of cached queries that the server will maintain.
	Cached queries allow for retrieval of result sets from memory rather
	than through a database transaction. Since the queries reside in memory,
	and query result set sizes differ, there must be some user-imposed limit
	to the number of queries that are cached. When this value is exceeded,
	the oldest query is dropped from the cache and is replaced with the
	specified query. This setting does not apply to Application-specific caching.
� 	_factor29�m
 � 
</div>
<br><br>
� caching_clear_cache_button� Clear Template Cache Now� caching_clear_cache_desc� �Click the button below to clear the template cache. ColdFusion will reload templates into memory the next time they are requested and recompile them if they have been modified.� caching_clear_cache_title� Clear template cache� �

<div class="grey-background-div">
<input type="hidden" name="ClearTrustedCacheNow" value="0">
<input name="ClearTrustedCache" id="ctc" class="buttn-grey"  type="button" value="� d" onClick="document.forms[0].ClearTrustedCacheNow.value=1;form.submit()" style="margin-left: 0px">
� 2
</div>

<div class="spacer20bottom"></div>

� !caching_clear_folder_cache_button� 'Clear Template Cache of Specific Folder� caching_clear_folder_cache_desc� �Click Clear Template Cache of Specific Folder to clear the template cache of the selected folder. ColdFusion reloads templates into the memory, next time they are requested and recompiles them if they have been modified.� 	_factor30�m
 �  caching_clear_folder_cache_title� $Clear folder specific template cache� 

<b>� !</b>
<div class="description">
� �</div>


<div class="grey-background-div spacer10">
<table>
<tr>
	<td width="120">
		<b><label for="foldertrustedcachelabel">� foldertrustedcachelabel� Select folder� �</label></b>
		&nbsp;&nbsp;
	</td>
	<td>
		<input name="foldertrustedcache" id="foldertrustedcache" type="text" maxlength="550" value="" size="65" id="foldertrustedcache" >
				&nbsp;&nbsp;
				� button_browse� browse_server� Browse Server� 5
				<input type="button" class="buttn-grey" title="� "  name="browsesubmit" value="� �" onclick='wopentype("foldertrustedcache","dir");'>

	</td>
	<td>
		<input type="hidden" name="ClearTrustedFolderCacheNow" value="0">
		<input name="ClearTrustedFolderCache" id="ctfc" class="buttn-grey"  type="button" value="� �" onClick="document.forms[0].ClearTrustedFolderCacheNow.value=1;form.submit()">
	</td>
</tr>
</table>
</div>

<br><br>

� $component_caching_clear_cache_button� Clear Component Cache Now�  query_caching_clear_cache_button� Clear Query Cache Now� 	_factor31�m
 � !dynamo_caching_clear_cache_button� Clear Dynamo Cache Now� "component_caching_clear_cache_desc� �Click the button to clear the component cache. ColdFusion will ignore the resolved path for components and try the resolution again.� #component_caching_clear_cache_title� Clear component cache� �



<div class="grey-background-div">
<input type="hidden" name="ClearComponentCacheNow" value="0">
<input name="ClearComponentCache" id="ctc" class="buttn-grey"  type="button" value="� M" onClick="document.forms[0].ClearComponentCacheNow.value=1;form.submit()">
� �
</div>


<br><br>

<div class="grey-background-div">
<input type="hidden" name="ClearQueryCacheNow" value="0">
<input name="ClearQueryCache" id="ctc" class="buttn-grey"  type="button" value="� K" onClick="document.forms[0].ClearQueryCacheNow.value=1;form.submit()">

� clear_query_cache_desc� -
	Click the button to clear the query cache.� 9
</div>

<br><br>

<div class="grey-background-div" � �>
<input type="hidden" name="ClearDynamoCacheNow" value="0">
<input name="ClearDynamoCache" id="ctc" class="buttn-grey"  type="button" value="� L" onClick="document.forms[0].ClearDynamoCacheNow.value=1;form.submit()">

� .
	Click the button to clear the dynamo cache.� 	_factor32�m
 � "
</div>

<table width="100%">
� ../include/buttonbar.cfm� 
</table>
� ../include/marginbottom.cfm
��
��
��
�� 	_factor33m
  	_factor35
m
  
</td>
</tr>
</table>

 ../footer.cfm metaData Ljava/lang/Object;	  	Functions 
Properties this Lcfcaching2ecfm993131511; __factorParent out Ljavax/servlet/jsp/JspWriter; module87 $Lcoldfusion/tagext/lang/ImportedTag; mode87 t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module88 mode88 t14 t15 t16 t17 t18 t19 module89 mode89 t22 t23 t24 t25 t26 t27 module90 mode90 t30 t31 t32 t33 t34 t35 module91 mode91 t38 t39 t40 t41 t42 t43 LocalVariableTable LineNumberTable java/lang/ThrowableJ Code module97 mode97 module98 mode98 t20 Ljava/lang/String; t21 Ljava/util/StringTokenizer; module99 mode99 t28 t29 	module100 mode100 t36 t37 	include59 #Lcoldfusion/tagext/lang/IncludeTag; 	include60 module61 mode61 t12 t13 output63  Lcoldfusion/tagext/io/OutputTag; mode63 module62 mode62 output65 mode65 module64 mode64 module66 mode66 module67 mode67 ,Lcoldfusion/runtime/TransientVariableHolder; #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable4 !coldfusion/runtime/AbortExceptionu java/lang/Exceptionw module69 mode69 module70 mode70 module71 mode71 module72 mode72 module73 mode73 module74 mode74 module92 mode92 module93 mode93 module94 mode94 module95 mode95 module96 mode96 	module101 mode101 	module102 mode102 	module103 mode103 	module104 mode104 	module105 mode105 	module106 mode106 	module107 mode107 	module108 mode108 	module109 mode109 	module110 mode110 	module111 mode111 	module112 mode112 	module113 mode113 	module114 mode114 	module115 mode115 	module116 mode116 	module117 mode117 	module118 mode118 	module119 mode119 runPage ()Ljava/lang/Object; 
include139 getMetadata varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; registerUDFs 	module120 mode120 	module121 mode121 	module122 mode122 	module123 mode123 	module124 mode124 	module125 mode125 	module126 mode126 	module127 mode127 	module128 mode128 	module129 mode129 	module130 mode130 	module131 mode131 	module132 mode132 	module133 mode133 	module134 mode134 t4 t5 __cfcatchThrowable3 output56 mode56 module55 mode55 form137 %Lcoldfusion/tagext/html/form/FormTag; mode137 
include135 
include136 cookie0 !Lcoldfusion/tagext/net/CookieTag; silent35  Lcoldfusion/tagext/io/SilentTag; mode35 module31 mode31 module32 mode32 module33 mode33 module34 mode34 t44 t45 t46 t47 Ljava/util/List; __cfcatchThrowable2 output54 mode54 module53 mode53 module57 mode57 	include58 	output138 mode138 module75 mode75 module76 mode76 module77 mode77 module78 mode78 module79 mode79 module80 mode80 module81 mode81 module82 mode82 module83 mode83 module84 mode84 module85 mode85 module86 mode86 	include23 module25 mode25 __cfcatchThrowable1 output47 mode47 module46 mode46 module26 mode26 module27 mode27 module28 mode28 module29 mode29 module30 mode30 <clinit> __cfcatchThrowable0 output44 mode44 module43 mode43 1     q                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �            
                        "    &    *    .    2    6    :    >    B    F    J    N    R    V    Z    ^    b    f    j    n    r    v    z    ~    �    �    �    �    �    �    �    �    �    �    ��   /�   ��   ��   ��   ��   �   ��   �   }�   ��      * �m L  �  ,  C*��W+����:*���������Y��Y�SY~S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,���,*��**� �?��-��,���*��X+����:*����������Y��Y�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���,**��?���,���*��Y+����:*����������Y��Y�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���**� y�?�� 
,���,���*��Z+����:*���������Y��Y�SYESY�SYES����*��Y6� 6*,�=M,1������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,���,**� )�?���,���*��[+����:$*��$�����$��Y��Y�SY�S���$�*$��Y6%� 6*$%,�=M,���$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( R n qK q v qK G � �K � � �K G � �K � � �K � � �K � � �K6RUKUZUK+u�K{~�K+u�K{~�K���K���K,/K/4/KO[KUX[KOjKUXjK[gjKjojK�K K�;GKADGK�;VKADVKGSVKV[VK���K���K�!K!K�0K0K!-0K050K H  � ,  C    C�   C   C    C   C  �   C!"   C#   C$   C%" 	  C&" 
  C'   C(   C) �   C*"   C+   C,   C-"   C."   C/   C0   C1 �   C2"   C3   C4   C5"   C6"   C7   C8   C9 �   C:"   C;   C<    C=" !  C>" "  C? #  C@ $  CA � %  CB" &  CC '  CD (  CE" )  CF" *  CG +I   � ' 7� 7�  � �� �� �� �� �� �� �� �� ���� ������������������� � � �����o	o	o	o	n	��� m L  �  )  6,Ķ�*��a+����:*W���������Y��Y�SY�S����*��Y6� 6*,�=M,ȶ������ � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,ʶ�*� *[��*[��***� ��?�ֶ��ҸֶY,ض�*��b+����:*\���������Y��Y�SY�S����*��Y6� 6*,�=M,ܶ������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,޶�**� �?�:�:6*W��:��Y��:� ���N-�Y`6*,��*`���***� �**� Y�?����Y�S�������� J,���,*a��**� Y�?��-��,���,*b��**� Y�?��ƶ�,���*,����
��T,��*��c+����:*o���������Y��Y�SYS����*��Y6� 6*,�=M,������� � :� �:*,��M���� :� #�� � #:��� � :� �: ��� ,��*��d+����:!*u��!�����!��Y��Y�SYSY�SYS���!�*!��Y6"� 6*!",�=M,��!����� � :#� #�:$*",��M�$!��� :%� #%�� � #:&!&��� � :'� '�:(!���(*�   Y u xK x } xK N � �K � � �K N � �K � � �K � � �K � � �KQmpKpupKF��K���KF��K���K���K���K�KK�8DK>ADK�8SK>ASKDPSKSXSK���K���K�KK�#K#K #K#(#K H  � )  6    6�   6   6    6M   6N �   6!"   6#   6$   6%" 	  6&" 
  6'   6O   6P �   6*"   6+   6,   6-"   6."   6/   6QR   6SR   62 �   63    64T   6U   6V �   67"   6W   6X   6:"   6;"   6<    6Y !  6Z � "  6?" #  6[ $  6\ %  6B" &  6C" '  6D (I   C >W >W W �[ �[ �[ �[ �[ �[ �[ �[ �[ �[ �[ �[ �[ �[ �[ �[ �[ �[6\6\ �\�^�^�^�^``````````RaRaRaRaRaRaRaRaJarbrbrbrbrbrbrbrbjb`�^�^�o�o�o�u�u�u�uku �m L  �    �*,|��*��;+����:*������*�.� �*,|��*��<+����:*������*�.� �*,|��**�A����Y�� W**�A�?����~���ȸ� *��*���W,���,*��**��y�*��Y*g�YAS�S�����,���*��=+����:*���������Y��Y�SY�S����*��Y6� 6*,�=M,�������� � :� �:	*,��M�	��� :
� #
�� � #:��� � :� �:���,���**�Q�?��2*��?+����:*"���*��Y6� �*��>����:*"���������Y��Y�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� &� j�� � #:��� � :� �:���,����Ϛ�3��� :� #�� � #:�Ө � :� �:�ԩ*� JfiKiniK?��K���K?��K���K���K���KD`cKchcK9��K���K9��K���K���K���K���K���K���K���K���K���K���K���K H     �    ��   �   �    �]^   �_^   �`   �a �   �$"   �% 	  �& 
  �'"   �b"   �c   �de   �f �   �g   �h �   �."   �/   �Q   �S"   �2"   �3   �4   �5"   �6"   �7 I   � 6      V V > u u u u t t t t � � � � � � � � � � � � t t � � � � � t t � � � � � � � � �// ��"�")")"�"�"�" �m L  �  (  -,���**� ��?��2*��A+����:*$���*��Y6� �*��@����:*$���������Y��Y�SY�S����*��Y6� 6*,�=M,�������� � :� �:	*,��M�	��� :
� &� j
�� � #:��� � :� �:���,����Ϛ�3��� :� #�� � #:�Ө � :� �:�ԩ,���*��B+����:*&���������Y��Y�SY�S����*��Y6� 6*,�=M,¶������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,Ķ�,**�I�?���,ƶ�*��C+����:**���������Y��Y�SY�S����*��Y6� 6*,�=M,ʶ������ � :� �:*,��M���� :� #�� � #:��� � : �  �:!���!*,|��**� aa�L*,̶�*�*0��**g�YS��ٶ߶Y*� a*1��**g�YS���ٶ߶Y*� }*2��**g�YS���ٶ߶Y*� �*g�Y.SY�S��Y�|Y*���:"*7��**� ��?��*g�Y.SY�S�����W� K� Q:##�:$$��:%%�߸��              "�%��� $�� � :&� &�:'"�٩'*� % � � �K � � �K � � �K � � �K � � �K � � �K � � �K � � �K 1 �$K �$K!$K 1 �3K �3K!3K$03K383K���K���K���K���K���K���K���K���Kw��K���Kl��K���Kl��K���K���K���K���v���x��K�KK H  � (  -    -�   -   -    -ie   -j �   -k   -l �   -$"   -% 	  -& 
  -'"   -b"   -c   -*   -+"   -,"   --   -m   -n �   -Q"   -S   -2   -3"   -4"   -5   -o   -p �   -W"   -X   -:   -;"   -<"    -= !  ->q "  -?r #  -[s $  -t" %  -B" &  -C 'I   � > $ $ t$ t$ <$ $ $�&�&K&'''''\*\*%*�����-�-���0000�021212121'1\2\2\2\2Q25555{5�7�7�7�7�7�7�7�7�7�7�7�7�7�6�/ �m L  y  ,  	,��*��E+����:*>���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���*,|��*��F+����:*?���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,������� � :� �:*,��M���� :� #�� � #:��� � :� �:���*,|��*��G+����:*@���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,������� � :� �:*,��M���� :� #�� � #:��� � :� �:���*,|��*��H+����:*A���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,���*��I+����:$*F��$�����$��Y��Y�SY�S���$�*$��Y6%� 6*$%,�=M,���$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( e � �K � � �K Z � �K � � �K Z � �K � � �K � � �K � � �K6RUKUZUK+u�K{~�K+u�K{~�K���K���K#&K&+&K�FRKLORK�FaKLOaKR^aKafaK���K���K�#K #K�2K 2K#/2K272K���K���K���K���K���K���K���K���K H  � ,  	    	�   	   	    	y   	z �   	!"   	#   	$   	%" 	  	&" 
  	'   	{   	| �   	*"   	+   	,   	-"   	."   	/   	}   	~ �   	2"   	3   	4   	5"   	6"   	7   	   	� �   	:"   	;   	<    	=" !  	>" "  	? #  	� $  	� � %  	B" &  	C '  	D (  	E" )  	F" *  	G +I   ^  >> >> J> J> >???? �?�@�@�@�@�@�A�A�A�AzA�F�FJF �m L  	�  ,  q,��*��J+����:*L���������Y��Y�SYS����*��Y6� 6*,�=M,������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,��**��?��H�� 
,	��,��,**� Ŷ?���,��**��?��H�� 
,	��,��,**�e�?���,��**��?��H�� 
,	��,��,**� ��?���,��**��?��H�� 
,	��,��,**� e�?���,�Ͳ����*+,�<� �*+,�g� �*+,�|� �*+,��� �,���*��\+����:*���������Y��Y�SY@S����*��Y6� 6*,�=M,B������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���,*��**� ��?��-��,���*��]+����:*���������Y��Y�SYHS����*��Y6� 6*,�=M,J������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���,*"��**� M�?��-��,���*��^+����:*)���������Y��Y�SYPS����*��Y6� 6*,�=M,R������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,���,*,��**�1�?��-��,���*��_+����:$*3��$�����$��Y��Y�SYXS���$�*$��Y6%� 6*$%,�=M,Z��$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+,���**� ݶ?�� 
,^��,���*� ( Y u xK x } xK N � �K � � �K N � �K � � �K � � �K � � �K5QTKTYTK*t�Kz}�K*t�Kz}�K���K���K58K8=8KXdK^adKXsK^asKdpsKsxsK�K!K�<HKBEHK�<WKBEWKHTWKW\WK�� K  K� ,K&),K� ;K&);K,8;K;@;K H  � ,  q    q�   q   q    q�   q� �   q!"   q#   q$   q%" 	  q&" 
  q'   q�   q� �   q*"   q+   q,   q-"   q."   q/   q�   q� �   q2"   q3   q4   q5"   q6"   q7   q�   q� �   q:"   q;   q<    q=" !  q>" "  q? #  q� $  q� � %  qB" &  qC '  qD (  qE" )  qF" *  qG +I  b X >L >L L �R �R �R �R �R �R �R �R �R �RSS	S	SS"S"S"S"S!S7T7T?T?T7TXTXTXTXTWTmUmUuUuUmU�U�U�U�U�U�g�g��������������"�"�"�"�"�"�"�"�"�)�)�)w,w,w,w,w,w,w,w,o,�3�3�3S6S6S6�g ,m L  :  ,  b,���*��`+����:*B���������Y��Y�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,���*Q��***� ��?�ֶ��� ,*+,�� �,��,**� i�?���,��*,|��*��e+����:*{���������Y��Y�SYS����*��Y6� 6*,�=M,!������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,#��*��f+����:*����������Y��Y�SY@S����*��Y6� 6*,�=M,B������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,%��,*���**�u�?��-��,'��*��g+����:*����������Y��Y�SYHS����*��Y6� 6*,�=M,J������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,)��,*���**� ]�?��-��,+��*��h+����:$*���$�����$��Y��Y�SYPS���$�*$��Y6%� 6*$%,�=M,R��$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( Y u xK x } xK N � �K � � �K N � �K � � �K � � �K � � �Ki��K���K^��K���K^��K���K���K���K-ILKLQLK"lxKruxK"l�Kru�Kx��K���K-0K050KP\KVY\KPkKVYkK\hkKkpkK�KK�4@K:=@K�4OK:=OK@LOKOTOK H  � ,  b    b�   b   b    b�   b� �   b!"   b#   b$   b%" 	  b&" 
  b'   b�   b� �   b*"   b+   b,   b-"   b."   b/   b�   b� �   b2"   b3   b4   b5"   b6"   b7   b�   b� �   b:"   b;   b<    b=" !  b>" "  b? #  b� $  b� � %  bB" &  bC '  bD (  bE" )  bF" *  bG +I   � 1 >B >B B �Q �Q �Q �Q �Q �Q �Q �Q �Q �Q �w �w �w �w �w �QN{N{{���������������������������������������������������� Om L  �  ,  J,0��,*���**� ��?��-��,2��*��i+����:*����������Y��Y�SYXS����*��Y6� 6*,�=M,Z������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,4��**�U�?�� 
,^��,6��**� =�?�� 
,���,8��*��j+����:*����������Y��Y�SY:S����*��Y6� 6*,�=M,<������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,>��*��k+����:*����������Y��Y�SY@S����*��Y6� 6*,�=M,B������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,D��**�5�?�� 
,���,F��*��l+����:*Ŷ��������Y��Y�SYHS����*��Y6� 6*,�=M,J������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,>��*��m+����:$*ȶ�$�����$��Y��Y�SYLS���$�*$��Y6%� 6*$%,�=M,N��$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( y � �K � � �K n � �K � � �K n � �K � � �K � � �K � � �Ku��K���Kj��K���Kj��K���K���K���K9UXKX]XK.x�K~��K.x�K~��K���K���K58K8=8KXdK^adKXsK^asKdpsKsxsK���K��K�(K"%(K�7K"%7K(47K7<7K H  � ,  J    J�   J   J    J�   J� �   J!"   J#   J$   J%" 	  J&" 
  J'   J�   J� �   J*"   J+   J,   J-"   J."   J/   J�   J� �   J2"   J3   J4   J5"   J6"   J7   J�   J� �   J:"   J;   J<    J=" !  J>" "  J? #  J� $  J� � %  JB" &  JC '  JD (  JE" )  JF" *  JG +I   � ! � � � � � � � � � ^� ^� '� �� �� �����Z�Z�#����������������������� nm L  �  ,  *,S��**� ��?�� 
,���,U��*��n+����:*׶��������Y��Y�SYWS����*��Y6� 6*,�=M,Y������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,>��*��o+����:*ڶ��������Y��Y�SY[S����*��Y6� 6*,�=M,]������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,_��**� ��?�� 
,���,a��*��p+����:*���������Y��Y�SYcS����*��Y6� 6*,�=M,q������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,>��*��q+����:*���������Y��Y�SYeS����*��Y6� 6*,�=M,g������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,i��**��?�� 
,���,k��*��r+����:$*���$�����$��Y��Y�SYmS���$�*$��Y6%� 6*$%,�=M,w��$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( u � �K � � �K j � �K � � �K j � �K � � �K � � �K � � �K9UXKX]XK.x�K~��K.x�K~��K���K���K58K8=8KXdK^adKXsK^asKdpsKsxsK���K��K�(K"%(K�7K"%7K(47K7<7K���K���K��KK��KKKK H  � ,  *    *�   *   *    *�   *� �   *!"   *#   *$   *%" 	  *&" 
  *'   *�   *� �   **"   *+   *,   *-"   *."   */   *�   *� �   *2"   *3   *4   *5"   *6"   *7   *�   *� �   *:"   *;   *<    *=" !  *>" "  *? #  *� $  *� � %  *B" &  *C '  *D (  *E" )  *F" *  *G +I   b  � � � Z� Z� #��� ��������������������O�O�O�����k� �m L  x  ,  ,>��*��s+����:*����������Y��Y�SYrS����*��Y6� 6*,�=M,t������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,v��**��?�� 
,���,x��*��t+����:*���������Y��Y�SYzS����*��Y6� 6*,�=M,|������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,>��*��u+����:*���������Y��Y�SY~S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���*��v+����:*���������Y��Y�SY�S����*��Y6� 6*,�=M,}������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,���,**�a�?���,���*��w+����:$*��$�����$��Y��Y�SY�S���$�*$��Y6%� 6*$%,�=M,���$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( Y u xK x } xK N � �K � � �K N � �K � � �K � � �K � � �K9UXKX]XK.x�K~��K.x�K~��K���K���K�K!K�<HKBEHK�<WKBEWKHTWKW\WK���K���K� K	K� K	KK K���K���K���K���K���K���K���K���K H  � ,      �          �   � �   !"   #   $   %" 	  &" 
  '   �   � �   *"   +   ,   -"   ."   /   �   � �   2"   3   4   5"   6"   7   �   � �   :"   ;   <    =" !  >" "  ? #  � $  � � %  B" &  C '  D (  E" )  F" *  G +I   ^  >� >� � �	 �	 �	 ������o44443��I �� L   �     o*����L*��N*�����*-+�D� �*-+�� �+��*�� �-����:*������*�.� �*+|���   H   4    o     o    o     o��    o�^ I     O� O� 6�   �� L   "     ��   H             L      �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� �**+,� �**+,� �	**+,� �**+,� �**+,� �**+,� �**+,� �**+,� �!**#+,� �%**'+,� �)**++,� �-**/+,� �1**3+,� �5**7+,� �9**;+,� �=**?+,� �A**C+,� �E**G+,� �I**K+,� �M**O+,� �Q**S+,� �U**W+,� �Y**[+,� �]**_+,� �a**c+,� �e**g+,� �i**k+,� �m**o+,� �q**s+,� �u**w+,� �y**{+,� �}**+,� ��**�+,� ��**�+,� ��**�+����**�+����**�+����**�+����**�+����**�+����**�+����**�+�����   H       �    ���   ���  �  L         �   H           �m L  �  ,  A,���*��x+����:*'���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���*,|��*��y+����:*(���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���*,|��*��z+����:*)���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���,**�-�?���,���,**� ��?���,���*��{+����:*3���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*,|��*��|+����:$*4��$�����$��Y��Y�SY�SY�SY�S���$�*$��Y6%� 6*$%,�=M,���$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( e � �K � � �K Z � �K � � �K Z � �K � � �K � � �K � � �K6RUKUZUK+u�K{~�K+u�K{~�K���K���K#&K&+&K�FRKLORK�FaKLOaKR^aKafaK"K"'"K�BNKHKNK�B]KHK]KNZ]K]b]K���K���K�KK�.K.K+.K.3.K H  � ,  A    A�   A   A    A�   A� �   A!"   A#   A$   A%" 	  A&" 
  A'   A�   A� �   A*"   A+   A,   A-"   A."   A/   A�   A� �   A2"   A3   A4   A5"   A6"   A7   A�   A� �   A:"   A;   A<    A=" !  A>" "  A? #  A� $  A� � %  AB" &  AC '  AD (  AE" )  AF" *  AG +I   � # >' >' J' J' '(((( �(�)�)�)�)�)z-z-z-z-y-�.�.�.�.�.�3�3�3�3�3�4�4�4�4v4    L   #     *� 
�   H          �m L  L  ,  x*,|��*��}+����:*5���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,���,**� 5�?���,���,**�y�?���,���*��~+����:*@���������Y��Y�SY�S����*��Y6� 6*,�=M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,���*��+����:*F���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,Ķ������ � :� �:*,��M���� :� #�� � #:��� � :� �:���,ƶ�,**� 1�?���,ȶ�,**� 1�?���,ʶ�,**� ��?���,̶�*�� �+����:*T���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,ж������ � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*,|��*�� �+����:$*U��$�����$��Y��Y�SY�SY�SY�S���$�*$��Y6%� 6*$%,�=M,Զ�$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( f � �K � � �K [ � �K � � �K [ � �K � � �K � � �K � � �KVruKuzuKK��K���KK��K���K���K���K&BEKEJEKeqKknqKe�Kkn�Kq}�K���K9UXKX]XK.x�K~��K.x�K~��K���K���K'*K*/*K JVKPSVK JeKPSeKVbeKejeK H  � ,  x    x�   x   x    x�   x� �   x!"   x#   x$   x%" 	  x&" 
  x'   x�   x� �   x*"   x+   x,   x-"   x."   x/   x�   x� �   x2"   x3   x4   x5"   x6"   x7   x�   x� �   x:"   x;   x<    x=" !  x>" "  x? #  x� $  x� � %  xB" &  xC '  xD (  xE" )  xF" *  xG +I   � 0 ?5 ?5 K5 K5 5 �7 �7 �7 �7 �7 �9 �9 �9 �9 �9;@;@@�F�FFF�F�G�G�G�G�G�G�G�G�G�G�L�L�L�L�LTTTT�T�U�U�U�U�U �m L  t    t**�!�u�8� 7*r��**g�YS����Y��S��W� -*t��**g�YS����Y��S��W**�!���8� 7*y��**g�YS����Y��S��W� -*{��**g�YS����Y��S��W**�!{�8� 7*���**g�YS����Y�fS��W� -*���**g�YS����Y��S��W*���***�	�y���Y�SY**�]�?S��W**� �?a���� *� ��I*���***�	�y���Y�SY**� �?S��W*���**g�YS����Y**� y�?S��W*���**g�YS����Y**� ��?S��W*���*g�Y�S��**��?�������H�� /*���***�	�y���Y�SY**��?S��W**�!��8��*���**g�YS����Y*�Y�S�S��W*���**g�YS����Y*�Y�S�S��W*���**g�YS����Y*�Y�S�S��W*���**g�YS����Y*�Y�S�S��W*���**g�YS����Y*�Y�S�S��W*���**g�YS����Y*�Y�S�S��W*���**g�YS����Y*�Y�S�S��W*���**g�YS����Y*�Y�S�S��W*���**g�YS����Y*�Y�S�S��W*�   H   *   t    t�   t   t  I  � � p p p p p p p p  p  p 2r 2r r r r _t _t Dt Dt Dt  p hw hw hw hw lw lw ow ow gw gw �y �y y y y �{ �{ �{ �{ �{ gw �~ �~ �~ �~ �~ �~ �~ �~ �~ �~�� �� �� ��/�/���� �~?�?�P�P�V�V�>�>�>�c�c�k�k�v�c�������������������������������������������#�#�#�#���4�4�F�F�W�W�]�]�E�E�E��k�k�k�k�o�o�q�q�j�j�����������������������������D�D�)�)�)�|�|�a�a�a���������������������$�$�	�	�	�\�\�A�A�A�j� �m L  <  ,  p*,|��*�� �+����:*V���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,۶������ � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���*,|��*�� �+����:*W���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,߶������ � :� �:*,��M���� :� #�� � #:��� � :� �:���*,|��*�� �+����:*X���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,��,**� Ѷ?���,��,**� ��?���,��,**� ��?���,��*�� �+����:*i���������Y��Y�SY�S����*��Y6� 6*,�=M,������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,��,**� q�?���,��,**�=�?���,���*�� �+����:$*s��$�����$��Y��Y�SY�S���$�*$��Y6%� 6*$%,�=M,���$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( g � �K � � �K \ � �K � � �K \ � �K � � �K � � �K � � �K9UXKX]XK.x�K~��K.x�K~��K���K���K'*K*/*K JVKPSVK JeKPSeKVbeKejeK.1K161KQ]KWZ]KQlKWZlK]ilKlqlK"K"'"K�BNKHKNK�B]KHK]KNZ]K]b]K H  � ,  p    p�   p   p    p�   p� �   p!"   p#   p$   p%" 	  p&" 
  p'   p�   p� �   p*"   p+   p,   p-"   p."   p/   p�   p� �   p2"   p3   p4   p5"   p6"   p7   p�   p� �   p:"   p;   p<    p=" !  p>" "  p? #  p� $  p� � %  pB" &  pC '  pD (  pE" )  pF" *  pG +I   � . @V @V LV LV VWWWW �W�X�X�X�X�X~^~^~^~^}^�_�_�_�_�_�g�g�g�g�g�i�i�i�o�o�o�o�o�q�q�q�q�q�s�s�s m L  �    ��|Y*���:*+,��� :�m�*+,��� :�Z�*���**g�YS����Y*�Y�S�S��W*���**g�YS����Y*�Y�S�S��W*���**g�YS����Y*�YS�S��W*���**g�YS���Y*�YS�S��W*�*���**g�YS��ٶ߶Y*� �f�Y**��?*�Y	S��G�~� �**� �?�����Y�� JW*�Y	S���H�~���Y�� #W*�Y	S���H�~��ȸ� G*���f�Y**�9��Y*���**�9�?�j�c�mS**� E�?�q� \*���**g�YS���Y*���*�*����*�Y	S��@���m��S��W�#�):�:��:		����     �           G	��*���f�Y*��8+����:
*���
�*
��Y6�5*,ζ�*��7
����:*����������Y��Y�SYSY�SYS����*��Y6� �*,�=M,��,*���**� I�?��ƶ�,̶�,*���**� I�Y�S�ø�ƶ�,������� � :� �:*,��M���� :� )� q� ��� � #:��� � :� �:���*,��
�Ϛ��
��� :� &� x�� � #:
�Ө � :� �:
�ԩ*,��**�9��Y*���**�9�?�j�c�mS**���?�q� �� � :� �:�٩*� 5��K���K*��K���K*��K���K���K���K��K�KK��*K�*K*K'*K*/*K  jv   -jv 3gjv  ox   -ox 3gox  K   -K 3gKj�K�K|K�K H     �    ��   �   �    ��q   ��   �!   �#r   �$s   ��" 	  ��e 
  �� �   ��   �� �   �*"   �+   �,   �-"   �."   �/   �Q   �S"   �2"   �3   �4"   �5 I  b � U� U� :� :� :� �� �� r� r� r� �� �� �� �� �� �� �� �� �� �������A�A�A�A�=�G�G�O�O�G�G�j�j�j�j�j�j�j�j�����������������������������������������j�j�����������������������������������������5�5�?�?�B�B�B�B�?�?�4�4�����j�G� G����������������N�N�N�N�N�N�N�N�F�n�n�n�n�n�n�n�n�f�����U�U�U�U�U�U�a�a�U�U�g�g�g�g�C�C�  E m L  . 	   P*,|��*�� �+����:*�������*�Y�S���������*��Y6��*,�=M*,��� :�����*,��� :�x���*,��� :�a���*,��� :	�J��	�*,�.� :
�3�k
�*,�Q� :��T�*,�p� :��=�*,��� :� �&�*,��� :� ר�*,��� :� �� ��*,��� :� �� ��,���*�� �����:*x������*�.� :� h� ��, ��*�� �����:*z�����*�.� :� '� _�*,|�����t� � :� �:*,��M��� :� #�� � #:�� � :� �:��*� / c ~K � �K � �K � �K � �K � �K �KK%6K<MKSdKj�K��K��KK X ~.K � �.K � �.K � �.K � �.K � �.K �.K.K%6.K<M.KSd.Kj�.K��.K�".K(+.K X ~=K � �=K � �=K � �=K � �=K � �=K �=K=K%6=K<M=KSd=Kj�=K��=K�"=K(+=K.:=K=B=K H     P    P�   P   P    P��   P� �   P!   P#   P$   P% 	  P& 
  P'   Pb   Pc   P*   P+   P,   P�^   P.   P�^   PQ   PS"   P2   P3   P4"   P5"   P6 I   >  ! ! / / / / L L�x�xqx�z�z�z  Bm L  �  0  
�,ȶ�*��**��*�����Y�S�߸� w*��+����:*������*�YS������*��*�ն"��%�*�.� �*�3#+���5:*���*�9Y6��*,�=M*,�o� :�����*,�� :�r���*,�� :	�[��	�*������:
*W��
�����
��Y��Y�SYSY�SYS���
�*
��Y6� 6*
,�=M,��
����� � :� �:*,��M�
��� :� )������ � #:
��� � :� �:
���*�� ����:*X���������Y��Y�SYSY�SYS����*��Y6� 6*,�=M,!������� � :� �:*,��M���� :� )���� � #:��� � :� �:���*��!����:*[���������Y��Y�SY#SY�SY#S����*��Y6� 6*,�=M,%������� � :� �:*,��M���� :� )��L�� � #:��� � : �  �:!���!*��"����:"*\��"�����"��Y��Y�SY'SY�SY'S���"�*"��Y6#� 6*"#,�=M,)��"����� � :$� $�:%*#,��M�%"��� :&� )� E� }&�� � #:'"'��� � :(� (�:)"���)�*��z� � :*� *�:+*,��M�+��� :,� #,�� � #:--�+� � :.� .�:/�,�/*�a*g�Y.SY0S��Y**�Y��� o*� Ua�Y**�!24�8� *� U*�Y:S��Y*l��**� նy<*��Y**� U�?SY*g�YAS�S��W**�!'C�8��Y�� #W*�YES���H�~��ȸ� �*+,�z� �**���?���� *+,��� �*� �޶Y*�]*�Y�S��Y*� �*�Y�S��Y*� y*�Y�S��Y*� �*�Y�S��Y**�!��8��Y�� #W*�Y�S���H�~��ȸ� �**�!��a�G* ���*�Y�S���ca���� =*���f�Y**�9��Y* ���**�9�?�j�c�mS**� ��?�q**���?���� '*+,�� �*� �*�Y�S��Y**�!!�8��Y�� "W*�Y#S��H�~��ȸ� K* ֶ�**g�YS�%�ٶ�W* ׶�**� ��y'*��Y)S��W�'**�!+-�8��Y�� "W*�Y/S��H�~��ȸ� K* ��**g�YS�1�ٶ�W* ��**� ��y'*��Y3S��W��**�Y��� F*+,�6� �*+,��� �*+,��� �**���?���� *+,�� ��T**�!!#�8��Y�� "W*�Y%S��H�~��ȸ� �*���*�Y'S������H�� ;*���I**�9��Y*¶�**�9�?�j�c�mS**� Ͷ?�q**���?���� s*ƶ�**g�Y�S�)��Y*�Y'S�S��W*Ƕ�**� ��y'*��Y+*�Y'S���"S��W�4**�!-/�8��Y�� "W*�Y1S��H�~��ȸ� K*Ͷ�**g�Y.S�3�ٶ�W*ζ�**� ��y'*��Y5S��W� �**�!79�8��Y�� "W*�Y;S��H�~��ȸ� r*� -*Ӷ�**Ӷ�***� !�y{�ٶ�=�ٶ߶Y*Զ�***� -�y?�ٶ�W*ն�**� ��y'*��YAS��W*� =u��K���Kj��K���Kj��K���K���K���KD`cKchcK9��K���K9��K���K���K���K/2K272KXdK^adKXsK^asKdpsKsxsK��KK�'3K-03K�'BK-0BK3?BKBGBK � �aK � �aK aK�aK��aK�XaK^'aK-^aKafaK � ��K � ��K �K��K���K�X�K^'�K-��K���K � ��K � ��K �K��K���K�X�K^'�K-��K���K���K���K H  � 0  
�    
��   
�   
�    
���   
���   
�� �   
�#   
�$   
�% 	  
�� 
  
�� �   
�b"   
�c   
�*   
�+"   
�,"   
�-   
��   
�� �   
�Q"   
�S   
�2   
�3"   
�4"   
�5   
��   
�� �   
�W"   
�X   
�:   
�;"   
�<"    
�= !  
�� "  
�� � #  
�[" $  
�\ %  
�B &  
�C" '  
�D" (  
�E )  
�F" *  
�G +  
�� ,  
��" -  
��" .  
�� /I  :�        !  !      D  D  R  R  R  R  {  {  �  �  �  �  {  {  .   N WN WZ WZ W W X X) X) X� X� [� [� [� [� [� \� \� \� \� \ � � d� d� d� d� d� e� e� e� e� e� e� g� g� g� g� g� h� h� h� h� h� h� h� h� h� h� j� j� j� j� j� h l l! l! l, l, l l l l� e� aC pC pC pC pG pG pI pI pB pB pB pB pZ pZ pk pk pZ pZ pZ pZ pB pB p� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �B p � � � � � � � � � � � �* �* �; �; �* �* �* �* � � �P �P �P �P �T �T �V �V �Y �Y �O �O �O �f �f �f �f �f �f �} �} �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �f �� �� �� �� �� �� �� �� �� �� �� �� �� � �� �� �� �� �� �� �� �� �� �� �� �� � � �  �  � � � � �� �� �: �: �: �^ �^ �p �p �^ �^ �^ �: �| �| �| �| �� �� �� �� �{ �{ �{ �{ �� �� �� �� �� �� �� �� �{ �{ �� �� �� �� �� �� �� �� �� �� �� � � � � �  �  �/D/D/D/D/D/D/DO�O�O�O�S�S�V�V�N�N�N�N�g�g�x�x�g�g�g�g�N�N���������������������������������������������������������������	�	�	�	�	�	:�	:�	L�	L�	O�	O�	O�	O�	L�	L�	:�	:�	:�	���	o�	o�	o�	o�	s�	s�	v�	v�	n�	n�	n�	n�	��	��	��	��	��	��	��	��	n�	n�	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��
�
�
�
�
�
�
�
�	��	��
D�
D�
C�
C�
;�
;�
;�
;�
0�
k�
k�
j�
j�
j�
��
��
��
��
��
��
��
0�	��	n�N�  �{ �� � 4m L  _  	  q**�![Ta�G**�!�VX�G**�!Za�G**�!w\I�G**�!�^I�G**�!��8��Y�� =W* ��* ��*�Y�S���c�����H�t|�ȸ��*�q* ���*�Y�S�������*� �a�Y**�q�?��:66�� 6*#��:� �� N-�Y-� d*� %* ��**� %�?��c�Y* ��**� %�?�����H�� )*� �**� ��?�**� %�?��"�"�Y`6��*� �* ���**� ��?�* ���**� ��?��g���Y*�Y�S**� ��?��*� �* ���**g�YS���Y*�Y�S�S�߶Y* ���**� ٶ?�����H�� =**�9��Y* ���**�9�?�j�c�mS**���?�q*���f�Y*�   H   \ 	  q    q�   q   q    q��   q� �   q! �   q# �   q$  I  z �  �  �  �  �  �  �  �  �  �  �   �   �   �  �  �  �  �  �  �  �  �  �  �  �  �  � " � " � " � " � & � & � ) � ) � , � , � ! � ! � ! � 3 � 3 � 3 � 3 � 7 � 7 � 9 � 9 � < � < � 2 � 2 � 2 � C � C � C � C � G � G � I � I � L � L � B � B � B � S � S � S � S � W � W � Y � Y � R � R � R � R � x � x � x � x � x � x � x � x � � � � � x � x � x � x � R � R � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �& �& �& �& �& �& �& �& � � �> �> �> �> �L �L �Z �Z �Z �Z �e �e �e �e �Z �Z �Z �Z �s �s �Z �Z �Z �Z �V �V �> �� � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � �+ �+ �G �G �G �G �G �G �S �S �G �G �Y �Y �Y �Y �Y �Y �5 �5 �i �i �i �i �e �e � � R � �m L  � 
   �* ���*�Y8S��v���Y�� 2W* ���*�Y8S���<�m��H�|��Y�� @W* ���*�Y8S��@�D�m*�Y8S��G�~�ȸ� ;*���I**�9��Y*��**�9�?�j�c�mS**� ��?�q*��*�YKS��v���Y�� 2W*��*�YKS���<�m��H�|��Y�� @W*��*�YKS��@�D�m*�YKS��G�~�ȸ� ;*���I**�9��Y*��**�9�?�j�c�mS**� m�?�q*+,�g� �*+,��� �**� ���Y**� � �T�@�mS**���y�q*��*������**����Y��S��q**����Y��S*��**g�YS���ٶ��q**����Y��S**�!���8���q**� ���Y**� � �T�@�mS**���y�q*��**�E�y�*��Y**� ��?SY**� �?S��W*�   H   *   �    ��   �   �  I  � �  �  �  �  �  �  �  �  �  �  � / � / � / � / � / � / � I � I � / � / � / � / �  �  �  �  � e � e � e � e � e � e �  �  � e � e � e � e �  �  � �  �  � � � � � � � � � � � � � � � �  � � � � � � � � � � �!! � � � �======WW==== � �xx���������������� ��������������� ....____ccff^^^^N�~~~~~~s����������
 �m L  �    ��|Y*���:*.��*g�Y�S��*�Y�S��������H�� �*/��***�	�y���Y*�Y`S�SY*�YsS�SY*/��*�a��SY*�Y�S�SY*�Y�S�S��W� �*1��***�	�y���Y*�Y`S�SY*�YsS�SY*�Y�S�SY*�Y�S�SY*�Y�S�S��W�,�2:�:��:�����    �           G��*����Y*��6+����:*5���*��Y6	�?*,���*��5����:
*6��
�����
��Y��Y�SY�SY�SY�S���
�*
��Y6� �*
,�=M,���,*8��**� I�Y�S�ø�ƶ�,ȶ�,*9��**� I�Y�S�ø�ƶ�,̶�
����� � :� �:*,��M�
��� :� )� q� ��� � #:
��� � :� �:
���*,ζ��Ϛ����� :� &� x�� � #:�Ө � :� �:�ԩ*,ֶ�**�9��Y*=��**�9�?�j�c�mS**� ��?�q� �� � :� �:�٩*� ��K���K��K���K��K���K���K���K��K�K
K��K�K
KK!K PSv PXx PqKS�qK�qKnqKqvqK H   �   �    ��   �   �    ��q   ��r   �!s   ��"   ��e   �� � 	  �� 
  �� �   �b"   �c   �*   �+"   �,"   �-   �.   �/"   �Q"   �S   �2"   �3 I  � c . . . . (. (. (. (. . . B. B. T/ T/ e/ e/ y/ y/ �/ �/ �/ �/ �/ �/ �/ �/ �/ �/ S/ S/ S/ S/ �1 �1 �1 �1 �1 �111#1#17171 �1 �1 �1 �1 �0 .�4�4�4�4�4�4�6�6666868686868686868.8`9`9`9`9`9`9`9`9X9�6�5G=G=G=G=G=G=S=S=G=G=Y=Y=Y=Y=Y=Y=5=5=  - 
m L      �*+,�r� �*��9+����:*���������Y��Y�SYtSY�SYvS����*��Y6� 6*,�=M,M������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���*��:+����:*��x���*�.� �,z��*�� �+����:*���*��Y6� '*,�	� :� E�*,|���Ϛ����� :� #�� � #:�Ө � :� �:�ԩ*�  j � �K � � �K _ � �K � � �K _ � �K � � �K � � �K � � �K'@nKFbnKhknK'@}KFb}Khk}Knz}K}�}K H   �   �    ��   �   �    ��   �	  �   �!"   �#   �$   �%" 	  �&" 
  �'   �	^   �	e   �	 �   �+   �,   �-"   �."   �/ I   * 
  � C C O O  � � �
 �m L  ( 	   �*��*��*�Y`S���c�����H���*��*�Y`S���ca���� G*���f�Y*� �f�Y**�9��Y*!��**�9�?�j�c�mS**�%�?�q*#��*�YsS��v�� J*���f�Y*� �f�Y**�9��Y*&��**�9�?�j�c�mS**�)�?�q� �*�YsS���H�|��Y�� %W*�YsS�w��H�t|�ȸ� G*���f�Y*� �f�Y**�9��Y**��**�9�?�j�c�mS**� 9�?�q**���?���� *+,��� �*�   H   *   �    ��   �   �  I  . �         + + < < < < < < S S b b b b ^ ^ l  l  l  l  h  h  �! �! �! �! �! �! �! �! �! �! �! �! �! �! r! r! < �# �# �# �# �# �# �# �# �$ �$ �$ �$ �$ �$ �% �% �% �% �% �% �& �& �& �& �& �& �& �& �& �& �& �& �& �& �& �&	'	'''	'	'	'	'/'/'@'@'/'/'/'/'	'	'Z(Z(Z(Z(V(V(d)d)d)d)`)`)|*|*|*|*|*|*�*�*|*|*�*�*�*�*j*j*	' �#�,�,�,�,�,�,�,  �m L  �    �**�A����Y�� W**�A�?����~���ȸ� �**�!���8� B*K��**g�YS����Y**�A�?SY�S��W� 8*M��**g�YS����Y**�A�?SYIS��W**�a�?*R��*R��*�YKS���<���m�G�~� n*S��**g�Y.S����Y*S��*S��*�YKS���<���mS��W*�a*�YKS��Y*W��**g�YS����Y*W��*�*W���*�Y8S��@���m��S��W**�!Z\�8� 7*[��**g�YS����Y��S��W� -*]��**g�YS����Y��S��W**�!mo�8� 7*b��**g�YS����Y��S��W� -*d��**g�YS����Y��S��W**�!bd�8� 7*j��**g�YS����Y��S��W� -*l��**g�YS����Y��S��W*�   H   *   �    ��   �   �  I  � � H H H H  H  H  H  H H H H H H H H H H H H H  H  H 3I 3I 3I 3I 7I 7I :I :I 2I 2I eK eK pK pK JK JK JK �M �M �M �M �M �M �M 2I  H �R �R �R �R �R �R �R �R �R �R �R �R �R �R �R �RSSSSSSSS5S5SSS �S �S �SETETETETAT �R�W�W�W�W�W�W�W�W�W�W�W�W`W`W`W�Y�Y�Y�Y�Y�Y�Y�Y�Y�Y�[�[�[�[�[]]�]�]�]�Y``````"`"```MbMb2b2b2bzdzd_d_d_d`�h�h�h�h�h�h�h�h�h�h�j�j�j�j�j�l�l�l�l�l�h em L    
   `**� Q����Y�� W**�A����ȸ� ;*���I**�9��Y*��**�9�?�j�c�mS**� m�?�q*� �M�Y*� �*��*������*� ��I*��*������**����Y��SO�q**����Y��S*��**g�YS�Q�ٶ��q**����Y��S*�Y8S��q**� ���Y**� � �T�@�mS**���y�q*��*������**����Y��SV�q**����Y��S*��**g�YS�X�ٶ��q**����Y��S**�!Z\�8���q**� ���Y**� � �T�@�mS**���y�q*��*������**����Y��S^�q**����Y��S*��**g�YS�`�ٶ��q**����Y��S**�!bd�8���q*�   H   *   `    `�   `   `  I  ^ �                             & @ @ @ @ @ @ L L @ @ R R R R .   b b b b ^ t t s s s s h ~ � � � � � � � � � � � � � � � � � � � � � � �6655551PPPP@nnnnW�������������1�������������������JJJJNNQQIIII9� em L  S    *�]*��***�	�yH��Y�S�߶Y*� �*��***�	�yH��Y�S�߶Y**� �?��H�� *� �a�Y*� �*��**g�YS�J�ٶ߶Y*�M*��**g�YS�L�ٶ߶Y*� u*��**g�YS�N�ٶ߶Y*� *���**g�YS�P�ٶ߶Y*�}*��**g�YS�R�ٶ߶Y**�}�?a���� *�}���Y*� �*��**g�YS�T�ٶ߶Y*� M*��**g�YS�V�ٶ߶Y*�1*���**g�YS�X�ٶ߶Y*� �*���**g�YS�Z�ٶ߶Y**� ݶ?a���� *� ݲ��Y*�u*���**g�YS�\�ٶ߶Y*� ]*���**g�YS�^�ٶ߶Y*� �*���**g�YS�`�ٶ߶Y*�U*���**g�YS�b�ٶ߶Y**�U�?a���� *�U���Y*� �* ��**g�YS�d�ٶ߶Y*�   H   *       �        I   � � � � � � � � �  � 3� 3� D� D� 2� 2� 2� 2� '� N� N� V� V� d� d� d� d� `� N� u� u� u� u� j� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �������<�<�D�D�S�S�S�S�O�<�d�d�d�d�Y���������������������������������	�	�������)�)�)�)��S�S�S�S�H�}�}�}�}�r�������������������������������� � � � �  �m L  1 
   �**� ���Y**� � �T�@�mS**���y�q*��*������**����Y��Si�q**����Y��S*��**g�YS�k�ٶ��q**����Y��S**�!mo�8���q**� ���Y**� � �T�@�mS**���y�q*��*������**����Y��Sq�q**����Y��S*��**g�YS�s�ٶ��q**����Y��S**�!�u�8���q**� ���Y**� � �T�@�mS**���y�q*��*������**����Y��Sw�q**����Y��S*��**g�YS�y�ٶ��q**����Y��S**�!{�8���q**� ���Y**� � �T�@�mS**���y�q*��*������**����Y��S}�q**����Y��S*��**g�Y.S��ٶ��q**����Y��S*�YKS��q*�   H   *   �    ��   �   �  I  B �         . . - - - - ) H H H H 8 f f f f O � � � � � � � � � � � � � ) � � � � � � � � � � � � � � � � � � � �BBBBFFHHAAAA1 �``````U������~�����������������������~ ..----)HHHH8ffffO�����) pm L  �    �*�I*g�YSYFS��Y*� =*߶�**g�YS�X�ٶ߶Y*�5*��**g�YS�k�ٶ߶Y*� �*��**g�YS�`�ٶ߶Y*� �*��**g�YS�s�ٶ߶Y*�*��**g�YS���ٶ߶Y*�*��**g�YS�y�ٶ߶Y**�!'C�8���Y�� W**�!��8��ȸ� �*+,�g� �*� y*��**g�YS�i�ٶ߶Y*�k*�o�Y*��**��?�����H�� *�*g�Y�S��Y� *�a�Y*�   H   *   �    ��   �   �  I  z ^ � � � �  � )� )� )� )� � S� S� S� S� H� }� }� }� }� r� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��������!�!���������5�5�5�5�9�9�<�<�4�4�4�4�4�4�4�4���ddddY�������������������� :m L  �  ,  ,��*��K+����:*o���������Y��Y�SYS����*��Y6� 6*,�=M,������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,��*��L+����:*u���������Y��Y�SY S����*��Y6� 6*,�=M,"������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,$��*��M+����:*{���������Y��Y�SY&S����*��Y6� 6*,�=M,(������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,*��,*~��**� ��?��-��,/��*��N+����:*����������Y��Y�SYESY�SYES����*��Y6� 6*,�=M,1������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,3��,**� )�?���,5��*��O+����:$*���$�����$��Y��Y�SY7S���$�*$��Y6%� 6*$%,�=M,9��$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( Y u xK x } xK N � �K � � �K N � �K � � �K � � �K � � �K9<K<A<K\hKbehK\wKbewKhtwKw|wK�� K  K� ,K&),K� ;K&);K,8;K;@;K���K���K�KK�+K+K(+K+0+K���K���K���K���K��K��K�K
K H  � ,      �          	   	 �   !"   #   $   %" 	  &" 
  '   	   	 �   *"   +   ,   -"   ."   /   	   		 �   2"   3   4   5"   6"   7   	
   	 �   :"   ;   <    =" !  >" "  ? #  	 $  	 � %  B" &  C '  D (  E" )  F" *  G +I   ~  >o >o ouu �u�{�{�{[~[~[~[~[~[~[~[~S~��������s�D�D�D�D�C�����Y� em L    ,  R,>��*��P+����:*����������Y��Y�SY@S����*��Y6� 6*,�=M,B������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,D��,*���**�M�?��-��,F��*��Q+����:*����������Y��Y�SYHS����*��Y6� 6*,�=M,J������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,L��,*���**� u�?��-��,N��*��R+����:*����������Y��Y�SYPS����*��Y6� 6*,�=M,R������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,T��,*���**� �?��-��,V��*��S+����:*����������Y��Y�SYXS����*��Y6� 6*,�=M,Z������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,\��**�}�?�� 
,^��,`��*��T+����:$*���$�����$��Y��Y�SYbS���$�*$��Y6%� 6*$%,�=M,d��$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( Y u xK x } xK N � �K � � �K N � �K � � �K � � �K � � �K=Y\K\a\K2|�K���K2|�K���K���K���K!=@K@E@K`lKfilK`{Kfi{Klx{K{�{K!$K$)$K�DPKJMPK�D_KJM_KP\_K_d_K�K	K�$0K*-0K�$?K*-?K0<?K?D?K H  � ,  R    R�   R   R    R	   R	 �   R!"   R#   R$   R%" 	  R&" 
  R'   R	   R	 �   R*"   R+   R,   R-"   R."   R/   R	   R	 �   R2"   R3   R4   R5"   R6"   R7   R	   R	 �   R:"   R;   R<    R=" !  R>" "  R? #  R	 $  R	 � %  RB" &  RC '  RD (  RE" )  RF" *  RG +I   � - >� >� � �� �� �� �� �� �� �� �� ��"�"� ������������������������������������������������w�w�w������� zm L      �,i��*��U+����:*Ŷ��������Y��Y�SYkS����*��Y6� 6*,�=M,m������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,o��**�]���� *,���*�]a�Y*,ζ�*,ζ�**� ���� *,���*� �a�Y*,ζ�*,ζ�**� A���� *,���*� Aa�Y*,ζ�*,ζ�**����� *,���*�a�Y*,ζ�*,ζ�**� y���� *,���*� yI�Y*,ζ�*,ζ�**� ����� *,���*� �I�Y*,ζ�,q��*��V+����:*���������Y��Y�SYsS����*��Y6� 6*,�=M,u������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,w��,*��**�]�?��-��,y��*�  Y u xK x } xK N � �K � � �K N � �K � � �K � � �K � � �K6RUKUZUK+u�K{~�K+u�K{~�K���K���K H   �   �    ��   �   �    �	   �	 �   �!"   �#   �$   �%" 	  �&" 
  �'   �	   �	 �   �*"   �+   �,   �-"   �."   �/ I  � u >� >� � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �������� ��*�*�*�*�)�)�)�)�)�)�B�B�B�B�>�>�)�Y�Y�Y�Y�X�X�X�X�X�X�q�q�q�q�m�m�X������������������������������������������������������������������������������������������� lm L  -    **�i?AC�G**� �I�L**�QI�L*�	*#��*NP�T�Y*� q[�Y*� !*%��*]_�T�Y**� �a�L**�Mc�L**� uc�L**� e�L**�}I�L**�!{gI�G**�!�iI�G**�!SkI�G**� �c�L**� Mc�L**�1e�L**� �I�L**�uc�L*�   H   *       �        I  � �                                         !  !               ! " ! "       2 # 2 # 5 # 5 # 1 # 1 # 1 # 1 # ' # ' # B $ B $ B $ B $ > $ > $ S % S % V % V % R % R % R % R % H % H % `  `  `  `  d & d & _  _  _  k  k  k  k  o ' o ' j  j  j  v  v  v  v  z ( z ( u  u  u  �  �  �  �  � ) � ) �  �  �  �  �  �  �  � * � * �  �  �  �  �  �  �  �  �  �  �  � + � + �  �  �  �  �  �  �  �  �  �  �  � , � , �  �  �  �  �  �  �  �  �  �  �  � - � - �  �  �  �  �  �  �  � / � / �  �  �  �  �  �  �  � 0 � 0 �  �  �  �  �  �  �  � 1 � 1 �  �  �  �  �  �  �  � 2 � 2 �  �  �  �  �  �  �  � 4 � 4 �  �  �   m L  ] 
   /**� ]c�L**� �e�L**�UI�L**�!sqc�G**�![sc�G**�!�ue�G*� �*?��***� !�y{��Y��S�߶Y**� ���� *� qa�Y*g�Y�S��Y���*g�Y�S�����������*g�Y�S*F��*N��T��*��+����:*I������*�.� �**��I�L*�9*M��*������*� �*N��**��y�*�ٸ�����~�ȶY*��+����:*Q���������Y��Y�SY�SY�SY�S����*��Y6� 6*,�=M,������� � :� �:*,��M���� :	� #	�� � #:

��� � :� �:���*� ���K���K�K
K�K
KK!K H   �   /    /�   /   /    /	^   /	   /	 �   /#"   /$   /% 	  /&" 
  /'"   /b I  R �          5  5                   6  6                7  7       "  "  "  "  &  &  )  )  , 9 , 9 !  !  !  3  3  3  3  7  7  9  9  < : < : 2  2  2  C  C  C  C  G  G  I  I  L ; L ; B  B  B  ] ? ] ? n ? n ? \ ? \ ? \ ? \ ? R ? y @ y @ y @ y @ x @ x @ � A � A � A � A � A x @ R > � E � E � E � E � E � E � E � E � E � E � E � E � E � F � F � F � F � F � F � F � F � F � D I I � I     L L   . M. M- M- M- M- M# M# MB NB NB NB NU NU NB NB NB NB N8 N8 N� Q� Q� Q� Qe Q xm L  l 	   �**�!JLI�G**�!NPR�G**�![TR�G**�!�VX�G**�!Za�G**�!w\I�G**�!�^I�G*x��*�Y`S���ca���� F*���f�Y*� �f�Y**�9��Y*{��**�9�?�j�c�mS**�%�?�q*}��*�YsS��v�� J*���f�Y*� �f�Y**�9��Y* ���**�9�?�j�c�mS**�)�?�q� �*�YsS���H�|��Y�� %W*�YsS�w��H�t|�ȸ� G*���f�Y*� �f�Y**�9��Y* ���**�9�?�j�c�mS**� 9�?�q*�   H   *   �    ��   �   �  I  R �  p  p  p  p  p  p  p  p  q  q   p   p   p  p  p  p  p  p  p  p  p  r  r  p  p  p # p # p # p # p ' p ' p * p * p - s - s " p " p " p 4 p 4 p 4 p 4 p 8 p 8 p : p : p = t = t 3 p 3 p 3 p D p D p D p D p H p H p K p K p N u N u C p C p C p U p U p U p U p Y p Y p [ p [ p ^ v ^ v T p T p T p e p e p e p e p i p i p k p k p n w n w d p d p d p z x z x z x z x z x z x � x � x � y � y � y � y � y � y � z � z � z � z � z � z � { � { � { � { � { � { � { � { � { � { � { � { � { � { � { � { z x � } � } � } � } � } � } � } � } ~ ~ ~ ~ � ~ � ~      $ �$ �$ �$ �$ �$ �0 �0 �$ �$ �6 �6 �6 �6 � � �E �E �V �V �E �E �E �E �k �k �| �| �k �k �k �k �E �E �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �E � � } m L  	     �|Y*���:*�q* ���*�Y�S�������*� �a�Y**�q�?��:66�� 6*#��:	� �� N	-�Y-� d*� %* ���**� %�?��c�Y* ���**� %�?�����H�� )*� �**� ��?�**� %�?��"�"�Y`6��*� �* ���**� ��?�* ���**� ��?��g���Y*�Y�S**� ��?��*� �* ���**g�YS���Y*�Y�S�S�߶Y* ���**� ٶ?�����H�� J**�9��Y* ���**�9�?�j�c�mS**���?�q*���f�Y*�Q���Y� *�Q�f�Y�+�1:

�:��:����   �           G��*����Y*��/+����:* Ķ��*��Y6�?*,���*��.����:* Ŷ��������Y��Y�SYSY�SYS����*��Y6� �*,�=M,��,* Ƕ�**� I�Y�S�ø�ƶ�,ȶ�,* ȶ�**� I�Y�S�ø�ƶ�,̶������ � :� �:*,��M���� :� )� q� ��� � #:��� � :� �:���*,ζ��Ϛ����� :� &� x�� � #:�Ө � :� �:�ԩ*,ֶ�**�9��Y* ̶�**�9�?�j�c�mS**�m�?�q� �� � :� �:�٩*� �),K,1,K�R^KX[^K�RmKX[mK^jmKmrmKGR�KX��K���KGR�KX��K���K���K���K ��v ��x �K�RKX�K�
KK H  $         �             �q    ��    ! �    # �    $ �    %  	   &r 
   's    	"    	 e    	! �    	"    	# �    -"    .    /    Q"    S"    2    3    4"    5"    6    7"    W I  � �  �  �  �  � , � , �  �  �  �  �  �  � < � < � < � < � 8 � 8 � B � B � B � B � � � � � � � � � � � � � � � � �  �  � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � B � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �0 �0 �0 �0 �" �" �b �b �G �G �G �G �< �< �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �% �% �% �% �! �! �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �Z �+ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �   � m L  b  ,  �*��+����:*R���������Y��Y�SYSY�SYS����*��Y6� 6*,�=M,������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���*��+����:*S���������Y��Y�SYSY�SYS����*��Y6� 6*,�=M,
������� � :� �:*,��M���� :� #�� � #:��� � :� �:���*��+����:*T���������Y��Y�SYSY�SYS����*��Y6� 6*,�=M,������� � :� �:*,��M���� :� #�� � #:��� � :� �:���*��+����:*U���������Y��Y�SYSY�SYS����*��Y6� 6*,�=M,������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*��+����:$*V��$�����$��Y��Y�SYSY�SYS���$�*$��Y6%� 6*$%,�=M,��$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( ] y |K | � |K R � �K � � �K R � �K � � �K � � �K � � �K%ADKDIDKdpKjmpKdKjmKp|K�K�	KK�,8K258K�,GK25GK8DGKGLGK���K���K�� K�� K��K��K KK}��K���Kr��K���Kr��K���K���K���K H  � ,  �    ��   �   �    �	$   �	% �   �!"   �#   �$   �%" 	  �&" 
  �'   �	&   �	' �   �*"   �+   �,   �-"   �."   �/   �	(   �	) �   �2"   �3   �4   �5"   �6"   �7   �	*   �	+ �   �:"   �;   �<    �=" !  �>" "  �? #  �	, $  �	- � %  �B" &  �C '  �D (  �E" )  �F" *  �G +I   f  6 R 6 R B R B R   R � S � S
 S
 S � S� T� T� T� T� T� U� U� U� UX UV VV Vb Vb V  V 	.  L   �     ����1��3����˸���Y�S�������Y�S��Y�S���YS�����Y�S�߻�Y��YSY��SYSY��S���   H       �   �m L  �    ��|Y*���:* ���*g�Y�S��*�Y�S��������H�� �* ���***�	�y���Y*�Y`S�SY*�YsS�SY* ���*�a��SY*�Y�S�SY*�Y�S�S��W� �* ���***�	�y���Y*�Y`S�SY*�YsS�SY*�Y�S�SY*�Y�S�SY*�Y�S�S��W*� ��f�Y�*�0:�:��:�����  �           G��*����Y*��,+����:* ����*��Y6	�?*,���*��+����:
* ���
�����
��Y��Y�SY�SY�SY�S���
�*
��Y6� �*
,�=M,���,* ���**� I�Y�S�ø�ƶ�,ȶ�,* ���**� I�Y�S�ø�ƶ�,̶�
����� � :� �:*,��M�
��� :� )� q� ��� � #:
��� � :� �:
���*,ζ��Ϛ����� :� &� x�� � #:�Ө � :� �:�ԩ*,ֶ�**�9��Y* ���**�9�?�j�c�mS**� ��?�q� �� � :� �:�٩*� %��K���K��K���K��K���K���K���K��K�	KK��$K�	$K$K!$K$)$K Z]v Zbx ZyK]�yK�	yKvyKy~yK H   �   �    ��   �   �    ��q   ��r   �!s   �	/"   �	0e   �	1 � 	  �	2 
  �	3 �   �b"   �c   �*   �+"   �,"   �-   �.   �/"   �Q"   �S   �2"   �3 I  � i  �  �  �  � ( � ( � ( � ( �  �  � B � B � T � T � e � e � y � y � � � � � � � � � � � � � � � � � � � � � S � S � S � S � � � � � � � � � � � � � � �# �# �7 �7 � � � � � � � � � � �  �Q �Q �Q �Q �M �M �� �� �� �� �� �� �� �� �
 �
 �> �> �> �> �> �> �> �> �6 �h �h �h �h �h �h �h �h �` �� �� �O �O �O �O �O �O �[ �[ �O �O �a �a �a �a �a �a �= �= �   �      �   �