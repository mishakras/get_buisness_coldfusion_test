/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
var _CF_error_messages=new Array();
var _CF_error_fields=new Object();
var _CF_FirstErrorField=null;
var _CF_submit_status=new Array();
_CF_signalLoad=function(){
_CF_loaded=1;
};
_CF_onError=function(_928,_929,_92a,_92b){
if(_CF_error_fields[_929]==null){
if(_CF_FirstErrorField==null){
_CF_FirstErrorField=_929;
}
_CF_error_exists=true;
_CF_error_fields[_929]=_92b;
_CF_error_messages[_CF_error_messages.length]=_92b;
}
};
_CF_onErrorAlert=function(_92c){
var _92d="";
for(var i=0;i<_92c.length;i++){
_92d+=_92c[i]+"\n";
}
alert(_92d);
return false;
};
updateHiddenValue=function(val,form,name){
if(form==null||form==""){
form=0;
}
if(document.forms[form]==null||document.forms[form][name]==null){
return;
}
document.forms[form][name].value=val;
};
_CF_hasValue=function(obj,_933,_934){
if(_933=="TEXT"||_933=="FILE"||_933=="PASSWORD"||_933=="CFTEXTAREA"||_933=="TEXTAREA"||_933=="CFTEXTINPUT"||_933=="DATEFIELD"){
if(obj.value.length==0){
return false;
}else{
if(_934){
str=obj.value.replace(/^\s+/,"").replace(/\s+$/,"");
if(str.length==0){
return false;
}
}
}
return true;
}else{
if(_933=="SELECT"){
for(i=0;i<obj.length;i++){
if(obj.options[i].selected&&obj.options[i].value.length>0){
return true;
}
}
return false;
}else{
if(_933=="SINGLE_VALUE_RADIO"||_933=="SINGLE_VALUE_CHECKBOX"){
if(obj.checked){
return true;
}else{
return false;
}
}else{
if(_933=="RADIO"||_933=="CHECKBOX"){
if(obj.length==undefined&&obj.checked){
return true;
}else{
for(i=0;i<obj.length;i++){
if(obj[i].checked){
return true;
}
}
}
return false;
}else{
if(_933=="CFTREE"){
if(obj["value"].length>0){
return true;
}else{
return false;
}
}else{
if(_933=="RICHTEXT"){
var _935=FCKeditorAPI.GetInstance(obj.id);
var val=_935.GetXHTML();
if(val.length==0){
return false;
}else{
if(_934){
str=val.replace(/^\s+/,"").replace(/\s+$/,"");
if(str.length==0){
return false;
}
}
return true;
}
}else{
return true;
}
}
}
}
}
}
};
_CF_checkdate=function(_937,_938){
_937=_937.replace(/^\s+/,"").replace(/\s+$/,"");
_937=_937=_937.replace(/{d \'/,"").replace(/'}/,"");
if(_938){
if(_937.length==0){
return false;
}
}else{
if(_937.length==0){
return true;
}
}
if(_937.length==0){
return true;
}
isplit=_937.indexOf("/");
splitchr="/";
if(isplit==-1){
isplit=_937.indexOf(".");
splitchr=".";
}
if(isplit==-1){
isplit=_937.indexOf("-");
splitchr="-";
}
if(isplit==-1||isplit==_937.length){
return false;
}
var _939=_937.substring(0,isplit);
if(_939.length==4){
sYear=_937.substring(0,isplit);
isplit=_937.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_937.length){
return false;
}
sMonth=_937.substring((sYear.length+1),isplit);
sDay=_937.substring(isplit+1);
}else{
sMonth=_937.substring(0,isplit);
isplit=_937.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_937.length){
return false;
}
sDay=_937.substring((sMonth.length+1),isplit);
sYear=_937.substring(isplit+1);
}
if((sDay.length==0)||(sMonth.length==0)||(sYear.length==0)){
return false;
}
if(!_CF_checkinteger(sMonth)){
return false;
}else{
if(!_CF_checkrange(sMonth,1,12)){
return false;
}else{
if(!_CF_checkinteger(sYear)){
return false;
}else{
if(sYear.length!=1&&sYear.length!=2&&sYear.length!=4){
return false;
}else{
if(!_CF_checkrange(sYear,0,9999)){
return false;
}else{
if(!_CF_checkinteger(sDay)){
return false;
}else{
if(!_CF_checkday(sYear,sMonth,sDay)){
return false;
}else{
return true;
}
}
}
}
}
}
}
};
_CF_checkeurodate=function(_93a,_93b){
_93a=_93a.replace(/^\s+/,"").replace(/\s+$/,"");
_93a=_93a=_93a.replace(/{d \'/,"").replace(/'}/,"");
if(_93b){
if(_93a.length==0){
return false;
}
}else{
if(_93a.length==0){
return true;
}
}
isplit=_93a.indexOf("/");
splitchr="/";
if(isplit==-1){
isplit=_93a.indexOf(".");
splitchr=".";
}
if(isplit==-1){
isplit=_93a.indexOf("-");
splitchr="-";
}
if(isplit==-1||isplit==_93a.length){
return false;
}
var _93c=_93a.substring(0,isplit);
if(_93c.length==4){
sYear=_93a.substring(0,isplit);
isplit=_93a.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_93a.length){
return false;
}
sMonth=_93a.substring((sYear.length+1),isplit);
sDay=_93a.substring(isplit+1);
}else{
sDay=_93a.substring(0,isplit);
isplit=_93a.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_93a.length){
return false;
}
sMonth=_93a.substring((sDay.length+1),isplit);
sYear=_93a.substring(isplit+1);
}
if(!_CF_checkinteger(sMonth)){
return false;
}else{
if(!_CF_checkrange(sMonth,1,12)){
return false;
}else{
if(!_CF_checkinteger(sYear)){
return false;
}else{
if(!_CF_checkrange(sYear,0,null)){
return false;
}else{
if(!_CF_checkinteger(sDay)){
return false;
}else{
if(!_CF_checkday(sYear,sMonth,sDay)){
return false;
}else{
return true;
}
}
}
}
}
}
};
_CF_checkday=function(_93d,_93e,_93f){
maxDay=31;
if(_93e==4||_93e==6||_93e==9||_93e==11){
maxDay=30;
}else{
if(_93e==2){
if(_93d%4>0){
maxDay=28;
}else{
if(_93d%100==0&&_93d%400>0){
maxDay=28;
}else{
maxDay=29;
}
}
}
}
return _CF_checkrange(_93f,1,maxDay);
};
_CF_checkinteger=function(_940,_941){
_940=_940.replace(/^\s+/,"").replace(/\s+$/,"");
_940=_940.replace(/[$Â£Â¥â‚¬,~+]?/g,"");
if(_941){
if(_940.length==0){
return false;
}
}else{
if(_940.length==0){
return true;
}
}
var _942=".";
var _943=_940.indexOf(_942);
if(_943==-1){
return _CF_checknumber(_940);
}else{
return false;
}
};
_CF_numberrange=function(_944,_945,_946,_947){
if(_947){
if(_944.length==0){
return false;
}
}else{
if(_944.length==0){
return true;
}
}
if(_945!=null){
if(_944<_945){
return false;
}
}
if(_946!=null){
if(_944>_946){
return false;
}
}
return true;
};
_CF_checknumber=function(_948,_949){
var _94a=" .+-0123456789";
var _94b=" .0123456789";
var _94c;
var _94d=false;
var _94e=false;
var _94f=false;
_948=_948.replace(/^\s+/,"").replace(/\s+$/,"");
_948=_948.replace(/[$Â£Â¥â‚¬,~+]?/g,"");
if(_949){
if(_948.length==0){
return false;
}
}else{
if(_948.length==0){
return true;
}
}
_94c=_94a.indexOf(_948.charAt(0));
if(_94c==1){
_94d=true;
}else{
if(_94c<1){
return false;
}
}
for(var i=1;i<_948.length;i++){
_94c=_94b.indexOf(_948.charAt(i));
if(_94c<0){
return false;
}else{
if(_94c==1){
if(_94d){
return false;
}else{
_94d=true;
}
}else{
if(_94c==0){
if(_94d||_94f){
_94e=true;
}
}else{
if(_94e){
return false;
}else{
_94f=true;
}
}
}
}
}
return true;
};
_CF_checkrange=function(_951,_952,_953,_954){
_951=_951.replace(/^\s+/,"").replace(/\s+$/,"");
if(_954){
if(_951.length==0){
return false;
}
}else{
if(_951.length==0){
return true;
}
}
if(!_CF_checknumber(_951)){
return false;
}else{
return (_CF_numberrange((eval(_951)),_952,_953));
}
return true;
};
_CF_checktime=function(_955,_956){
_955=_955.replace(/^\s+/,"").replace(/\s+$/,"");
_955=_955.replace(/\s+:\s+/,":");
_955=_955=_955.replace(/{t \'/,"").replace(/'}/,"");
if(_956){
if(_955.length==0){
return false;
}
}else{
if(_955.length==0){
return true;
}
}
var _957=_CF_checkregex(_955,/^((([0-1]?\d)|(2[0-3])):[0-5]?\d)?(:[0-5]?\d)? ?([AP]M|[AP]m|[ap]m|[ap]M)?$/,_956);
return _957;
};
_CF_checkphone=function(_958,_959){
_958=_958.replace(/^\s+/,"").replace(/\s+$/,"");
if(_959){
if(_958.length==0){
return false;
}
}else{
if(_958.length==0){
return true;
}
}
if(_958.length==0){
return true;
}
return _CF_checkregex(_958,/^(((1))?[ ,\-,\.]?([\\(]?([1-9][0-9]{2})[\\)]?))?[ ,\-,\.]?([^0-1]){1}([0-9]){2}[ ,\-,\.]?([0-9]){4}(( )((x){0,1}([0-9]){1,5}){0,1})?$/,_959);
};
_CF_checkzip=function(_95a,_95b){
_95a=_95a.replace(/^\s+/,"").replace(/\s+$/,"");
if(_95b){
if(_95a.length==0){
return false;
}
}else{
if(_95a.length==0){
return true;
}
}
return _CF_checkregex(_95a,/^([0-9]){5,5}$|(([0-9]){5,5}(-| ){1}([0-9]){4,4}$)/,_95b);
};
_CF_checkcreditcard=function(_95c,_95d){
_95c=_95c.replace(/^\s+/,"").replace(/\s+$/,"");
if(_95d){
if(_95c.length==0){
return false;
}
}else{
if(_95c.length==0){
return true;
}
}
if(_95c.length==0){
return true;
}
var _95e=" -";
var _95f="";
var _960;
for(var i=0;i<_95c.length;i++){
_960=_95e.indexOf(_95c.charAt(i));
if(_960<0){
_95f+=_95c.substring(i,(i+1));
}
}
if(_95f.length<13||_95f.length>19){
return false;
}
if(_95f.charAt(0)=="+"){
return false;
}
if(!_CF_checkinteger(_95f)){
return false;
}
var _962=_95f.length%2==1?false:true;
var _963=0;
var _964;
for(var i=0;i<_95f.length;i++){
_964=eval(_95f.charAt(i));
if(_962){
_964*=2;
_963+=(_964%10);
if((_964/10)>=1){
_963++;
}
_962=false;
}else{
_963+=_964;
_962=true;
}
}
return (_963%10)==0?true:false;
};
_CF_checkssn=function(_965,_966){
_965=_965.replace(/^\s+/,"").replace(/\s+$/,"");
if(_966){
if(_965.length==0){
return false;
}
}else{
if(_965.length==0){
return true;
}
}
return _CF_checkregex(_965,/^[0-9]{3}(-| )[0-9]{2}(-| )[0-9]{4}$/,_966);
};
_CF_checkEmail=function(_967,_968){
_967=_967.replace(/^\s+/,"").replace(/\s+$/,"");
if(_968){
if(_967.length==0){
return false;
}
}else{
if(_967.length==0){
return true;
}
}
return _CF_checkregex(_967,/^[a-zA-Z_0-9-'\+~]+(\.[a-zA-Z_0-9-'\+~]+)*@([a-zA-Z_0-9-]+\.)+[a-zA-Z]*$/,_968);
};
_CF_checkURL=function(_969,_96a){
_969=_969.replace(/^\s+/,"").replace(/\s+$/,"");
if(_96a){
if(_969.length==0){
return false;
}
}else{
if(_969.length==0){
return true;
}
}
return _CF_checkregex(_969.toLowerCase(),/^((http|https|ftp|file)\:\/\/([a-zA-Z0-0]*:[a-zA-Z0-0]*(@))?[a-zA-Z0-9-\.]+(\.[a-zA-Z]{2,3})?(:[a-zA-Z0-9]*)?\/?([a-zA-Z0-9-\._\?\,\'\/\+&amp;%\$#\=~])*)|((mailto)\:[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]*)|((news)\:[a-zA-Z0-9\.]*)$/,_96a);
};
_CF_checkUUID=function(_96b,_96c){
_96b=_96b.replace(/^\s+/,"").replace(/\s+$/,"");
if(_96c){
if(_96b.length==0){
return false;
}
}else{
if(_96b.length==0){
return true;
}
}
return _CF_checkregex(_96b,/[A-Fa-f0-9]{8,8}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{16,16}/,_96c);
};
_CF_checkGUID=function(_96d,_96e){
_96d=_96d.replace(/^\s+/,"").replace(/\s+$/,"");
if(_96e){
if(_96d.length==0){
return false;
}
}else{
if(_96d.length==0){
return true;
}
}
return _CF_checkregex(_96d,/[A-Fa-f0-9]{8,8}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{12,12}/,_96e);
};
_CF_checkBoolean=function(_96f,_970){
_96f=_96f.replace(/^\s+/,"").replace(/\s+$/,"");
if(_970){
if(_96f.length==0){
return false;
}
}else{
if(_96f.length==0){
return true;
}
}
if(_96f.toUpperCase()=="TRUE"||_96f.toUpperCase()=="YES"||(_CF_checknumber(_96f)&&_96f!="0")){
return true;
}else{
if(_96f.toUpperCase()=="FALSE"||_96f.toUpperCase()=="NO"||_96f=="0"){
return true;
}else{
return false;
}
}
};
_CF_setFormParam=function(_971,_972,_973){
var _974="document['"+_971+"']['"+_972+"']";
var obj=eval(_974);
if(obj==undefined){
return false;
}else{
obj.value=_973;
return true;
}
};
_CF_checkregex=function(_976,_977,_978){
if(_978){
if(_976.length==0){
return false;
}
}else{
if(_976.length==0){
return true;
}
}
return _977.test(_976);
};
