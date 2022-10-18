/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.MessageBox){
ColdFusion.MessageBox={};
}
var $MB=ColdFusion.MessageBox;
var DEFAULT_OK="Ok";
var DEFAULT_NO="No";
var DEFAULT_CANCEL="Cancel";
var DEFAULT_YES="Yes";
var DEFAULT_ALERT_BUTTON_TYPE=1;
var DEFAULT_CONFIRM_BUTTON_TYPE=6;
var DEFAULT_PROMPT_BUTTON_TYPE=9;
var CF_BEFORE_SHOW_HANDLER_ADDED=false;
var CURRENT_MESSAGEBOX_ID;
var $XB={};
Ext.onReady(function(){
$XB=Ext.MessageBox;
DEFAULT_OK=$XB.buttonText.ok;
DEFAULT_NO=$XB.buttonText.no;
DEFAULT_CANCEL=$XB.buttonText.cancel;
DEFAULT_YES=$XB.buttonText.yes;
DEFAULT_ALERT_BUTTON_TYPE=$XB.OK;
DEFAULT_CONFIRM_BUTTON_TYPE=$XB.YESNO;
DEFAULT_PROMPT_BUTTON_TYPE=$XB.OKCANCEL;
});
ColdFusion.MessageBox.init=function(_fe,_ff,_100,_101,_102,_103,_104,_105,_106,_107,_108,icon,_10a,x,y,_10d,_10e){
var _10f={messageBoxId:_fe,type:_ff,callBack_Fn:_108,multiline:_106,modal:_107,width:_10a,bodyStyle:_10e};
if(_100==null||typeof (_100)=="undefined"){
_100="";
}
_100=ColdFusion.Util.replaceAll(_100,"\n","<br>");
_10f.messageText=_100;
if(_102!=null&&typeof (_102)!="undefined"){
_10f.label_OK=_102;
}
if(_103!=null&&typeof (_103)!="undefined"){
_10f.label_NO=_103;
}
if(_105!=null&&typeof (_105)!="undefined"){
_10f.label_YES=_105;
}
if(_104!=null&&typeof (_104)!="undefined"){
_10f.label_CANCEL=_104;
}
if(_101==null||typeof (_101)=="undefined"){
_ff=_ff.toLowerCase();
if(_ff=="alert"){
_101="Alert";
}else{
if(_ff=="confirm"){
_101="Confirm";
}else{
if(_ff=="prompt"){
_101="Prompt";
}
}
}
}
_10f.title=_101;
if(_10d&&typeof (_10d)=="string"){
_10f.buttonType=_10d;
}
if(icon&&typeof (icon)=="string"){
_10f.icon=icon;
}
if(typeof x=="number"&&x>=0){
_10f.x=x;
}
if(typeof y=="number"&&y>=0){
_10f.y=y;
}
ColdFusion.objectCache[_fe]=_10f;
};
$MB.show=function(_110){
var _111=$MB.getMessageBoxObject(_110);
var type=_111.type;
type=(new String(type)).toLowerCase();
if(!CF_BEFORE_SHOW_HANDLER_ADDED){
var _113=Ext.MessageBox;
_113.addListener("show",$MB.beforeShowHandler,_111);
CF_BEFORE_SHOW_HANDLER_ADDED=true;
}
CURRENT_MESSAGEBOX_ID=_110;
var _114=_111.buttonType;
var _115={ok:DEFAULT_OK,no:DEFAULT_NO,cancel:DEFAULT_CANCEL,yes:DEFAULT_YES};
if(_111.label_OK){
_115.ok=_111.label_OK;
}
if(_111.label_YES){
_115.yes=_111.label_YES;
}
if(_111.label_NO){
_115.no=_111.label_NO;
}
if(_111.label_CANCEL){
_115.cancel=_111.label_CANCEL;
}
Ext.MessageBox.buttonText=_115;
if(typeof _114!="undefined"){
_114=_114.toUpperCase();
if(_114&&_114!=="OKCANCEL"&&_114!=="OK"&&_114!=="YESNOCANCEL"&&_114!=="YESNO"){
ColdFusion.handleError(null,"messagebox.show.invalidbuttontype","widget",[messagebox,_114],null,null,true);
}
switch(_114){
case "OK":
_114=$XB.OK;
break;
case "OKCANCEL":
_114=$XB.OKCANCEL;
break;
case "YESNOCANCEL":
_114=$XB.YESNOCANCEL;
break;
case "YESNO":
_114=$XB.YESNO;
break;
}
}
var icon=_111.icon;
var _117="";
if(icon&&typeof (icon)==="string"){
icon=icon.toUpperCase();
switch(icon){
case "ERROR":
_117=$XB.ERROR;
break;
case "INFO":
_117=$XB.INFO;
break;
case "QUESTION":
_117=$XB.QUESTION;
break;
case "WARNING":
_117=$XB.WARNING;
break;
}
}
var _118={title:_111.title,msg:_111.messageText,fn:_111.callBack_Fn,modal:_111.modal,icon:_117,scope:null};
if(_111.width){
_118.width=_111.width;
if(_118.width>600){
_118.maxWidth=_118.width;
}
if(_118.width<100){
_118.minWidth=_118.width;
}
}
if(type==="alert"){
if(!_114){
_114=DEFAULT_ALERT_BUTTON_TYPE;
}
_118.buttons=_114;
$XB.show(_118);
}
if(type==="confirm"){
if(!_114){
_114=DEFAULT_CONFIRM_BUTTON_TYPE;
}
_118.buttons=_114;
$XB.show(_118);
}
if(type==="prompt"){
if(!_114){
_114=DEFAULT_PROMPT_BUTTON_TYPE;
}
_118.buttons=_114;
_118.prompt=true;
_118.multiline=_111.multiline;
_118.value="",$XB.show(_118);
}
ColdFusion.Log.info("messagebox.show.shown","widget",[_110]);
};
$MB.create=function(_119,type,_11b,_11c,_11d,_11e){
if(_119&&typeof _119!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidname","widget",null,null,null,true);
return;
}
if(!_119||ColdFusion.trim(_119)==""){
ColdFusion.handleError(null,"messagebox.create.invalidname","widget",null,null,null,true);
return;
}
var _11f=ColdFusion.objectCache[_119];
if(_11f!=null||typeof _11f!="undefined"){
ColdFusion.handleError(null,"messagebox.create.duplicatename","widget",[_119],null,null,true);
return;
}
if(_11c&&typeof _11c!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidmessage","widget",[_119],null,null,true);
return;
}
if(!_11c||ColdFusion.trim(_11c)==""){
ColdFusion.handleError(null,"messagebox.create.invalidmessage","widget",[_119],null,null,true);
return;
}
if(_11b&&typeof _11b!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidtitle","widget",[_119],null,null,true);
return;
}
if(type&&typeof type!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidtype","widget",[_119],null,null,true);
return;
}
if(!type||ColdFusion.trim(type)==""){
ColdFusion.handleError(null,"messagebox.create.emptytype","widget",[_119],null,null,true);
return;
}
if(_11d&&typeof _11d!=="function"){
ColdFusion.handleError(null,"messagebox.create.invalidcallback","widget",[_119],null,null,true);
return;
}
var _120=DEFAULT_CANCEL;
var _121=DEFAULT_NO;
var _122=DEFAULT_OK;
var _123=DEFAULT_YES;
var _124=true;
var _125=null;
var _126=false;
var icon;
var _128;
var x;
var y;
var _12b;
if(_11e&&_11e.labelok){
_122=_11e.labelok;
}
if(_11e&&_11e.labelno){
_121=_11e.labelno;
}
if(_11e&&_11e.labelyes){
_123=_11e.labelyes;
}
if(_11e&&_11e.labelcancel){
_120=_11e.labelcancel;
}
if(_11e&&typeof _11e.multiline==="boolean"){
_126=_11e.multiline;
}
if(_11e&&typeof _11e.modal==="boolean"){
_124=_11e.modal;
}
if(_11e&&_11e.buttontype){
_125=_11e.buttontype;
if(type.toUpperCase()!=="CONFIRM"){
ColdFusion.handleError(null,"messagebox.create.invalidtypeandbuttontypecombination","widget",[_119],null,null,true);
}else{
if(_125.toUpperCase()!="YESNO"&&_125.toUpperCase()!="YESNOCANCEL"){
ColdFusion.handleError(null,"messagebox.create.invalidbuttontype","widget",[_119,_125],null,null,true);
}
}
}
if(_11e&&_11e.width){
_128=_11e.width;
if(_128&&typeof _128!="number"){
ColdFusion.handleError(null,"messagebox.create.widthnotnumeric","widget",[_119,_128],null,null,true);
}
}
if(_11e&&typeof _11e.x!="undefined "){
if(_11e.x&&typeof _11e.x!="number"){
ColdFusion.handleError(null,"messagebox.create.xnotnumeric","widget",[_119,_11e.x],null,null,true);
return;
}
x=_11e.x;
}
if(_11e&&typeof _11e.y!="undefined"){
if(_11e.y&&typeof _11e.y!="number"){
ColdFusion.handleError(null,"messagebox.create.ynotnumeric","widget",[_119,_11e.y],null,null,true);
return;
}
y=_11e.y;
}
if(_11e&&_11e.icon){
icon=_11e.icon;
if(icon){
icon=icon.toUpperCase();
if(icon!="ERROR"&&icon!="INFO"&&icon!="QUESTION"&&icon!="WARNING"){
ColdFusion.handleError(null,"messagebox.create.invalidicon","widget",[_119,icon],null,null,true);
}
}
}
if(_11e&&_11e.bodystyle){
_12b=_11e.bodystyle;
}
$MB.init(_119,type,_11c,_11b,_122,_121,_120,_123,_126,_124,_11d,icon,_128,x,y,_125,_12b);
ColdFusion.Log.info("messagebox.create.created","widget",[_119,type]);
};
$MB.updateMessage=function(_12c,_12d){
var _12e=$MB.getMessageBoxObject(_12c);
_12e.messageText=_12d;
ColdFusion.Log.info("messagebox.updatemessage.updated","widget",[_12c]);
};
$MB.updateTitle=function(_12f,_130){
var _131=$MB.getMessageBoxObject(_12f);
_131.title=_130;
ColdFusion.Log.info("messagebox.updatetitle.updated","widget",[_12f]);
};
$MB.update=function(_132,_133){
var _134=$MB.getMessageBoxObject(_132);
var _135={};
if(!_133||typeof _133!="object"){
ColdFusion.handleError(null,"messagebox.update.invalidconfigobject","widget",[_132],null,null,true);
return;
}
if(_133.name&&typeof _133.name=="string"){
ColdFusion.handleError(null,"messagebox.update.nameupdatenotallowed","widget",[_132],null,null,true);
return;
}
if(_133.type&&typeof _133.type=="string"){
ColdFusion.handleError(null,"messagebox.update.typeupdatenotallowed","widget",[_132],null,null,true);
return;
}
if(_133.message){
if(typeof _133.message==="string"||typeof _133.message=="object"){
_135.messageText=_133.message;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidmessage","widget",[_132],null,null,true);
return;
}
}
if(_133.title){
if(typeof _133.title==="string"||typeof _133.title=="object"){
_135.title=_133.title;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidtitle","widget",[_132],null,null,true);
return;
}
}
if(_133.labelok!=null||typeof _133.labelok!="undefined"){
if(typeof _133.labelok==="string"||typeof _133.labelok=="object"){
_135.label_OK=_133.labelok;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelok","widget",[_132],null,null,true);
return;
}
}
if(_133.labelno!=null||typeof _133.labelno!="undefined"){
if(typeof _133.labelno==="string"||typeof _133.labelno=="object"){
_135.label_NO=_133.labelno;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelno","widget",[_132],null,null,true);
return;
}
}
if(_133.labelyes!=null||typeof _133.labelyes!="undefined"){
if(typeof _133.labelyes==="string"||typeof _133.labelyes=="object"){
_135.label_YES=_133.labelyes;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelyes","widget",[_132],null,null,true);
return;
}
}
if(_133.labelcancel!=null||typeof _133.labelcancel!="undefined"){
if(typeof _133.labelcancel==="string"||typeof _133.labelcancel=="object"){
_135.label_CANCEL=_133.labelcancel;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelcancel","widget",[_132],null,null,true);
return;
}
}
if(typeof _133.modal=="boolean"){
_135.modal=_133.modal;
}
if(typeof _133.multiline==="boolean"){
if(_134.type.toLowerCase()!="prompt"){
ColdFusion.handleError(null,"messagebox.update.invalidtypeformultiline","widget",[_132],null,null,true);
return;
}
_135.multiline=_133.multiline;
}
if(_133&&_133.width){
if(typeof _133.width==="number"||typeof _133.width=="object"){
_135.width=_133.width;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidwidth","widget",[_132],null,null,true);
return;
}
}
if(_133.icon!=null||typeof _133.icon!="undefined"){
if(typeof _133.icon==="string"){
icon=_133.icon.toUpperCase();
if(icon!="ERROR"&&icon!="INFO"&&icon!="QUESTION"&&icon!="WARNING"){
ColdFusion.handleError(null,"messagebox.update.invalidicon","widget",[_132],null,null,true);
return;
}
_135.icon=_133.icon;
}else{
if(typeof _133.icon=="object"&&_133.icon==null){
_135.icon=null;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidicon","widget",[_132],null,null,true);
return;
}
}
}
if(_133.callbackhandler!=null||typeof _133.callbackhandler!="undefined"){
if(typeof _133.callbackhandler==="function"||typeof _133.callbackhandler==="object"){
_135.callBack_Fn=_133.callbackhandler;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidcallbackhandler","widget",[_132],null,null,true);
return;
}
}
if(_133.x!=null||typeof _133.x!="undefined"){
if(typeof _133.x==="number"||typeof _133.x=="object"){
_135.x=_133.x;
}else{
ColdFusion.handleError(null,"messagebox.update.xnotnumeric","widget",[_132,_133.x],null,null,true);
return;
}
}
if(_133.y!=null||typeof _133.y!="undefined"){
if(typeof _133.y==="number"||typeof _133.y=="object"){
_135.y=_133.y;
}else{
ColdFusion.handleError(null,"messagebox.update.ynotnumeric","widget",[_132,_133.y],null,null,true);
return;
}
}
if(_133.bodystyle!=null||typeof _133.bodystyle!="undefined"){
if(typeof _133.bodystyle==="string"||typeof _133.bodystyle=="object"){
_135.bodyStyle=_133.bodystyle;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidbodystyle","widget",[_132],null,null,true);
return;
}
}
if(_133.buttontype!=null||typeof _133.buttontype!="undefined"){
if(typeof _133.buttontype==="string"||typeof _133.buttontype==="object"){
buttonType=_133.buttontype;
if(_134.type.toUpperCase()!=="CONFIRM"){
ColdFusion.handleError(null,"messagebox.update.invalidtypeandbuttontypecombination","widget",[_132],null,null,true);
return;
}else{
if(buttonType.toUpperCase()!="YESNO"&&buttonType.toUpperCase()!="YESNOCANCEL"){
ColdFusion.handleError(null,"messagebox.update.invalidbuttontype","widget",[_132],null,null,true);
return;
}
}
_135.buttonType=_133.buttontype;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidbuttontype","widget",[_132],null,null,true);
return;
}
}
for(key in _135){
_134[key]=_135[key];
}
ColdFusion.Log.info("messagebox.update.updated","messagebox",[_132]);
};
$MB.getMessageBoxObject=function(_136){
var _137=ColdFusion.objectCache[_136];
if(_137==null||typeof (_137)=="undefined"){
ColdFusion.handleError(null,"messagebox.getmessageboxobject.missingmessageboxid","widget",[_136],null,null,true);
}
return _137;
};
$MB.isMessageBoxDefined=function(_138){
var _139=ColdFusion.objectCache[_138];
if(_139==null||typeof (_139)=="undefined"){
return false;
}else{
return true;
}
};
$MB.beforeShowHandler=function(_13a){
var _13b=$MB.getMessageBoxObject(CURRENT_MESSAGEBOX_ID);
var _13c=_13b.x;
var _13d=_13b.y;
var _13e=_13b.bodyStyle;
var _13f=_13a.body.parent();
var id=_13f.id;
var ele=document.getElementById(id);
if(null!=_13e){
ele.style.cssText=_13e;
}
if(_13c&&_13d&&typeof _13c=="number"&&typeof _13d=="number"&&_13c>=0&&_13d>=0){
_13a.setPosition(_13c,_13d);
}else{
_13a.center();
}
};
