/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.ProgressBar){
ColdFusion.ProgressBar={};
}
var $P=ColdFusion.ProgressBar;
ColdFusion.ProgressBar.create=function(_35f,_360,_361,_362,_363,_364,_365,_366,_367,_368){
var _369={renderTo:_35f,interval:_362,onComplete:_366,autodisplay:_365,onError:_368};
var _36a={renderTo:_35f};
if(_364!=null&&typeof (_364)!=undefined){
_369.width=_364;
_36a.width=_364;
}else{
_36a.width=400;
}
if(_363!=null&&typeof (_363)!=undefined){
_369.height=_363;
_36a.height=_363;
}else{
_369.autoHeight=true;
_36a.autoHeight=true;
}
if(_360!=null){
_369.manual=true;
_369.status_retrieval_fn=_360;
}else{
_369.manual=false;
_369.duration=_361;
}
_369.hidden=!_365;
_36a.hidden=_369.hidden;
if(_367!=null&&typeof _367!="undefined"){
_369.cls=_367;
_36a.cls=_367;
}
var _36b=new Ext.ProgressBar(_36a);
_369.progressBarComp=_36b;
ColdFusion.objectCache[_35f]=_369;
ColdFusion.Log.info("progressbar.create.created","widget",[_35f]);
};
$P.start=function(_36c){
var _36d=$P.getProgressBarObject(_36c);
var _36e=ColdFusion.objectCache[_36c];
if(!_36d.isVisible()){
_36d=_36d.show();
}
_36e.started=true;
if(_36e.manual==false){
var _36f=_36e.interval;
var _370=_36e.duration;
var _371=_370/_36f;
_36d.wait({interval:_36f,duration:_370,increment:_371,fn:$P.automaticPBCompleteHandler,scope:_36e});
}else{
var _372=setInterval(_36e.status_retrieval_fn,_36e.interval);
_36e.processId=_372;
}
ColdFusion.Log.info("progressbar.start.started","widget",[_36c]);
};
$P.stop=function(_373,_374){
var pBar=$P.getProgressBarObject(_373);
var _376=ColdFusion.objectCache[_373];
var _377=_376.processId;
if(typeof _376.started!="undefined"&&_376.started==true){
_376.started=false;
}else{
ColdFusion.Log.info("progressbar.stop.nonrunning","widget",[_373]);
return;
}
if(_377!=null&&typeof (_377)!="undefined"){
clearInterval(_377);
}
if(typeof _376.manual!="undefined"&&_376.manual==false){
pBar.reset();
}
if(_374&&_374==true){
var _378=_376.onComplete;
if(_378!=null&&_378.call){
_378.call();
}
}
ColdFusion.Log.info("progressbar.stop.stopped","widget",[_373]);
};
$P.hide=function(_379){
var pBar=$P.getProgressBarObject(_379);
if(pBar.isVisible()){
pBar.hide();
}
ColdFusion.Log.info("progressbar.hide.hidden","widget",[_379]);
};
$P.show=function(_37b){
var pBar=$P.getProgressBarObject(_37b);
if(!pBar.isVisible()){
pBar.show();
}
ColdFusion.Log.info("progressbar.show.shown","widget",[_37b]);
};
$P.reset=function(_37d){
var pBar=$P.getProgressBarObject(_37d);
if(typeof pBar!="undefined"){
pBar.reset();
}
ColdFusion.Log.info("progressbar.reset.reset","widget",[_37d]);
};
$P.updateStatus=function(_37f,_380,_381){
var pBar=$P.getProgressBarObject(_37f);
if(typeof (_380)=="undefined"||typeof (_380)!="number"){
ColdFusion.handleError(null,"progressbar.updatestatus.invalidstatus","widget",[_37f,_380],null,null,true);
return;
}
if(typeof pBar!="undefined"){
pBar.updateProgress(_380,_381);
}
ColdFusion.Log.info("progressbar.updatestatus.updated","widget",[_37f]);
};
$P.update=function(_383,_384){
var _385={};
var _386=ColdFusion.objectCache[_383];
if(_386==null||typeof (_386)=="undefined"){
ColdFusion.handleError(null,"progressbar.update.notfound","widget",[_383],null,null,true);
return;
}
if(_384.duration){
if(typeof _384.duration==="number"||typeof _384.duration=="object"){
_385.duration=_384.duration;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidduration","widget",[_383],null,null,true);
return;
}
}
if(_384.interval){
if(typeof _384.interval==="number"||typeof _384.interval=="object"){
_385.interval=_384.interval;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidinterval","widget",[_383],null,null,true);
return;
}
}
if(_384.oncomplete){
if(typeof _384.oncomplete==="function"||typeof _384.oncomplete=="object"){
_385.onComplete=_384.oncomplete;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidoncomplete","widget",[_383],null,null,true);
return;
}
}
for(key in _385){
_386[key]=_385[key];
}
ColdFusion.Log.info("progressbar.update.updated","widget",[_383]);
};
$P.loadStatus=function(data,_388){
var _389=ColdFusion.AjaxProxy.JSON.decode(data);
var _38a=_389.MESSAGE;
var _38b=_389.STATUS;
var pBar=$P.getProgressBarObject(_388._cf_progressbarid);
pBar.updateProgress(_38b,_38a);
if(_38b&&(_38b===1||_38b==1||_38b>1)){
$P.stop(_388._cf_progressbarid,true);
}
};
$P.automaticPBCompleteHandler=function(){
var _38d=this.progressBarComp;
_38d.updateProgress(1);
if(this.onComplete&&typeof this.onComplete=="function"){
this.onComplete.call(_38d,_38d);
}
};
$P.errorHandler=function(_38e,_38f,_390){
var pbId=_390.bindToParams._cf_progressbarid;
var _392=ColdFusion.objectCache[pbId];
var _393=_392.onError;
if(_393!=null&&typeof _393==="function"){
_393.call(null,_38e,_38f);
}
$P.stop(pbId);
};
$P.getProgressBarObject=function(_394){
var _395=ColdFusion.objectCache[_394];
if(_395==null||typeof (_395)=="undefined"){
ColdFusion.handleError(null,"progressbar.getProgressBarObject.missingprogressbarid","widget",[_394],null,null,true);
return;
}
if(_395.progressBarComp&&typeof _395.progressBarComp!="undefined"){
return _395.progressBarComp;
}else{
ColdFusion.handleError(null,"progressbar.getProgressBarObject.missingprogressbarcomponent","widget",[_394],null,null,true);
return;
}
};
