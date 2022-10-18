/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Autosuggest){
ColdFusion.Autosuggest={};
}
var staticgifpath=_cf_ajaxscriptsrc+"/resources/cf/images/static.gif";
var dynamicgifpath=_cf_ajaxscriptsrc+"/resources/cf/images/loading.gif";
ColdFusion.Autosuggest.loadAutoSuggest=function(_2c,_2d){
var _2e=ColdFusion.objectCache[_2d.autosuggestid];
if(typeof (_2c)=="string"){
_2c=_2c.split(",");
}else{
var _2f=false;
if(_2c&&ColdFusion.Util.isArray(_2c)){
_2f=true;
if(_2c.length>0&&(typeof (_2c[0])!="string"&&typeof (_2c[0])!="number")){
_2f=false;
}
}
if(!_2f){
ColdFusion.handleError(_2e.onbinderror,"autosuggest.loadautosuggest.invalidvalue","widget",[_2d.autosuggestid]);
return;
}
}
var _30=document.getElementById(_2d.autosuggestid).value;
if(_30.length==1&&_2c.length==0){
var _31=new Array();
_2e.dataSource.flushCache();
_2e.dataSource=new YAHOO.widget.DS_JSArray(_31);
_2e.autosuggestitems=_31;
}
if(_2c.length>0){
var i=0;
var _33=false;
var _31=new Array();
for(i=0;i<_2c.length;i++){
if(_2c[i]){
if(typeof (_2c[i])=="string"){
_31[i]=_2c[i];
}else{
if(typeof (_2c[i])=="number"){
_31[i]=_2c[i]+"";
}else{
_31[i]=new String(_2c[i]);
}
}
if(_31[i].indexOf(_30)==0){
_33=true;
}
}
}
if(_33==false&&_2e.showloadingicon==true){
document.getElementById(_2d.autosuggestid+"_cf_button").src=staticgifpath;
}
_2e.dataSource.flushCache();
_2e.dataSource=new YAHOO.widget.DS_JSArray(_31);
_2e.autosuggestitems=_31;
if(_2e.queryMatchContains){
_2e.dataSource.queryMatchContains=_2e.queryMatchContains;
}
_2e._sendQuery(_30);
}else{
if(_2e.showloadingicon==true){
document.getElementById(_2d.autosuggestid+"_cf_button").src=staticgifpath;
_2e.showloadingicon==false;
}
}
};
ColdFusion.Autosuggest.checkToMakeBindCall=function(arg,_35,_36,_37,_38){
var _37=document.getElementById(_35).value;
if(!_36.isContainerOpen()&&_37.length>0&&arg.keyCode!=39&&(arg.keyCode>31||(arg.keyCode==8&&_36.valuePresent==true))){
_36.valuePresent=false;
if(_36.showloadingicon==true){
document.getElementById(_35+"_cf_button").src=dynamicgifpath;
}
ColdFusion.Log.info("autosuggest.checktomakebindcall.fetching","widget",[_35,_37]);
if(_36.cfqueryDelay>0){
var _39=setTimeout(_38,_36.cfqueryDelay*1000,this);
if(_36._nDelayID!=-1){
clearTimeout(_36._cf_nDelayID);
}
_36._cf_nDelayID=_39;
}else{
_38.call(this);
}
}
};
ColdFusion.Autosuggest.checkValueNotInAutosuggest=function(_3a,_3b){
if(_3a.autosuggestitems){
for(var i=0;i<_3a.autosuggestitems.length;i++){
if(_3b==_3a.autosuggestitems[i]){
return false;
}
}
}
return true;
};
ColdFusion.Autosuggest.triggerOnChange=function(_3d,_3e){
var _3f=_3e[0];
var _40=document.getElementById(_3f.id);
ColdFusion.Event.callBindHandlers(_3f.id,null,"change");
};
ColdFusion.Autosuggest.init=function(_41,_42,_43){
return new YAHOO.widget.AutoComplete(_41,_42,_43);
};
ColdFusion.Autosuggest.getAutosuggestObject=function(_44){
var _45=ColdFusion.objectCache[_44];
if(_45==null||typeof (_45)=="undefined"){
ColdFusion.handleError(null,"autosuggest.getAutosuggestObject.notfound","widget",[_44],null,null,true);
}
return _45;
};
ColdFusion.Autosuggest.initJS_ARRAY=function(_46){
return new YAHOO.widget.DS_JSArray(_46);
};
