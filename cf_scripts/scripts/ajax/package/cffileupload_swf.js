/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.FileUpload){
ColdFusion.FileUpload={};
}
var $FS=ColdFusion.FileUpload;
$FS.defaultSWFLocation=_cf_ajaxscriptsrc+"/resources/cf/assets/MultiFileUpload.swf";
var isIE=(navigator.appVersion.indexOf("MSIE")!=-1)?true:false;
var isWin=(navigator.appVersion.toLowerCase().indexOf("win")!=-1)?true:false;
var isOpera=(navigator.userAgent.indexOf("Opera")!=-1)?true:false;
var defaultAddButtonLabel="Add Files";
var defaultUploadButtonLabel="Upload";
var defaultClearButtonLabel="Clear All";
var defaultDeleteButtonLabel="Delete";
var defaultAddIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/addfile.png";
var defaultUploadIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/upload.png";
var defaultClearIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/clear.gif";
var defaultDeleteIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/delete.png";
var defaultUploadSize=10*1024*1024;
var fileUploadPrefix="cf_fileUpload_";
ColdFusion.FileUpload.create=function(_51c,_51d,_51e,_51f,_520,_521,_522,_523,_524,_525,_526,_527,_528,_529,_52a,_52b,_52c,_52d,_52e,_52f,_530,_531,_532,_533,_534,_535,_536,_537,_538,_539){
var _53a={};
_53a.uploadDivId=_51c;
_53a.fileUploadName=fileUploadPrefix+_51c;
_53a.url_withoutQuery=_51d;
_53a.url_queryString=_51e;
_53a.url_CF_cookie=_51f;
_53a.url=$FS.constructUrl(_51d,_51e,_51f);
_53a.onCompleteHandler=_527;
_53a.onUploadCompleteHandler=_528;
_53a.onErrorHandler=_529;
_53a.progressbar=_534;
if(_52c==null){
_52c="";
}
_53a.bgcolor=_52c;
if(_52d==null){
_52d="";
}
_53a.selectcolor=_52d;
if(_52e==null){
_52e="";
}
_53a.rollovercolor=_52e;
if(_52f==null){
_52f="";
}
_53a.textcolor=_52f;
if(_532==null){
_532="left";
}
_53a.titletextalign=_532;
if(_530==null){
_530="";
}
_53a.titletextcolor=_530;
if(_531==null){
_531="";
}
_53a.headercolor=_531;
_53a.bgcolor=_52c;
_53a.bgcolor=_52c;
if(_533==null){
_533="";
}
_53a.fileFilter=_533;
_53a.disableUploadButton=_536;
if(_538==null||typeof _538=="undefined"){
_538="window";
}
_53a.wmode=_538;
_53a.stopOnError=_537;
if(_520==null||typeof _520==="undefined"){
_520=defaultAddButtonLabel;
}
_53a.addIcon=defaultAddIcon;
_53a.addButtonLabel=_520;
if(_522==null||typeof _522==="undefined"){
_522=defaultUploadButtonLabel;
}
_53a.uploadButtonLabel=_522;
_53a.uploadIcon=defaultUploadIcon;
if(_524==null||typeof _524==="undefined"){
_524="File Upload ";
}
_53a.title=_524;
_53a.swfLocation=$FS.defaultSWFLocation;
if(_521==null||typeof _521==="undefined"){
_521=defaultClearButtonLabel;
}
_53a.clearButtonLabel=_521;
_53a.clearIcon=defaultClearIcon;
if(_523==null||typeof _523==="undefined"){
_523=defaultDeleteButtonLabel;
}
_53a.deleteButtonLabel=_523;
_53a.deleteIcon=defaultDeleteIcon;
if(_525==null||!typeof _525==="Number"){
_525=-1;
}
_53a.maxFileSelect=_525;
if(_526==null||!typeof _526==="number"){
_526=defaultUploadSize;
}
_53a.maxUploadSize=_526;
if(_52a==null||typeof _52a==="undefined"){
_52a=420;
}
_53a.widthInPx=_52a+"px";
_53a.width=_52a;
if(_52b==null||typeof _52b==="undefined"){
_52b=300;
}
_53a.heightInPx=_52b+"px";
_53a.height=_52b;
_53a.align=_539;
ColdFusion.objectCache[_51c]=_53a;
ColdFusion.objectCache[_53a.fileUploadName]=_53a;
var _53b=$FS.constructMarkup(_53a);
var _53c=document.getElementById(_51c);
_53c.innerHTML=_53b;
ColdFusion.Log.info("fileupload.initialized","widget",[_51c]);
};
$FS.constructMarkup=function(_53d){
var str="";
if(isIE&&isWin&&!isOpera){
str+="<object width=\""+_53d.width+"\" height=\""+_53d.height+"\"";
str+=" id=\""+_53d.fileUploadName+"\" name=\""+_53d.playerName+"\" type=\"application/x-shockwave-flash\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" ";
str+=" data=\""+_53d.swfLocation+"\">";
str+="<param name=\"movie\" value=\""+_53d.swfLocation+"\" />";
str+="<param name=\"quality\" value=\""+_53d.quality+"\" />";
str+="<param name=\"allowFullScreen\" value=\""+_53d.fullScreen+"\" />";
str+="<param name=\"allowScriptAccess\" value=\"sameDomain\" />";
str+="<param name=\"wmode\" value=\""+_53d.wmode+"\" />";
str+="<param name=\"flashvars\" value=\"uniqueid="+_53d.fileUploadName+"&url="+_53d.url+"&addLabel="+_53d.addButtonLabel+"&deleteLabel="+_53d.deleteButtonLabel;
str+="&clearLabel="+_53d.clearButtonLabel+"&uploadLabel="+_53d.uploadButtonLabel+"&maxUploadSize="+_53d.maxUploadSize+"&maxFileSelect="+_53d.maxFileSelect+"&progress="+_53d.progressbar;
str+="&stopOnError="+_53d.stopOnError+"&hideUpload="+_53d.disableUploadButton+"&bgcolor="+_53d.bgcolor+"&fileFilter="+_53d.fileFilter+"&deleteIcon="+_53d.deleteIcon+"&title="+_53d.title;
str+="&uploadIcon="+_53d.uploadIcon+"&textcolor="+_53d.textcolor+"&titletextcolor="+_53d.titletextcolor+"&headercolor="+_53d.headercolor+"&titletextalign="+_53d.titletextalign+"&rollovercolor="+_53d.rollovercolor+"&selectcolor="+_53d.selectcolor+"\" />";
str+="</object>";
}else{
str="<embed src=\""+_53d.swfLocation+"\" allowScriptAccess=\"samedomain\" pluginspage=\"http://www.adobe.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" wmode=\""+_53d.wmode+"\"";
str+=" name=\""+_53d.fileUploadName+"\" width=\""+_53d.width+"\" height=\""+_53d.height+"\" quality=\" "+_53d.quality+"\"";
str+=" flashvars=\"uniqueid="+_53d.fileUploadName+"&url="+_53d.url+"&addLabel="+_53d.addButtonLabel+"&deleteLabel="+_53d.deleteButtonLabel;
str+="&clearLabel="+_53d.clearButtonLabel+"&uploadLabel="+_53d.uploadButtonLabel+"&maxUploadSize="+_53d.maxUploadSize+"&maxFileSelect="+_53d.maxFileSelect+"&progress="+_53d.progressbar;
str+="&stopOnError="+_53d.stopOnError+"&hideUpload="+_53d.disableUploadButton+"&bgcolor="+_53d.bgcolor+"&fileFilter="+_53d.fileFilter+"&deleteIcon="+_53d.deleteIcon+"&title="+_53d.title;
str+="&uploadIcon="+_53d.uploadIcon+"&textcolor="+_53d.textcolor+"&titletextcolor="+_53d.titletextcolor+"&headercolor="+_53d.headercolor+"&titletextalign="+_53d.titletextalign+"&rollovercolor="+_53d.rollovercolor+"&selectcolor="+_53d.selectcolor+"\" />";
}
return str;
};
$FS.constructUrl=function(_53f,_540,_541){
var url=_53f;
if(_540!=null){
url+="?"+_540;
if(_541!=null){
url+="%26"+_541;
}
}else{
if(_541!=null){
url+="?"+_541;
}
}
return url;
};
coldfusion_FileUploadSwf_complete=function(name,_544){
var _545=$FS.getFileUploadComponent(name);
var _546=ColdFusion.objectCache[name];
var _547=_546.onCompleteHandler;
if(_547!=null&&typeof _547=="function"){
_547.call(this,_544);
}
$FS.addResultToArray(_544,_546);
};
coldfusion_FileUploadSwf_onError=function(name,_549){
var _54a=$FS.getFileUploadComponent(name);
var _54b=ColdFusion.objectCache[name];
var _54c=_54b.onErrorHandler;
if(_54c!=null&&typeof _54c=="function"){
_54c.call(this,_549);
}
$FS.addResultToArray(_549,_54b);
};
coldfusion_FileUploadSwf_UploadCompete=function(name){
var _54e=$FS.getFileUploadComponent(name);
var _54f=ColdFusion.objectCache[name];
var _550=_54f.onUploadCompleteHandler;
var _551=_54f.resultArray;
if(_550!=null&&typeof _550=="function"){
_550.call(this,_551);
}
_54f.resultArray=new Array();
};
$FS.addResultToArray=function(_552,_553){
var _554=_553.resultArray;
if(_554==null||typeof _554=="undefined"){
_554=_553.resultArray=new Array();
}
_554.push(_552);
};
$FS.cancelUpload=function(name){
var _556=fileUploadPrefix+name;
var _557=$FS.getFileUploadComponent(_556);
if(_557!=null){
_557.cancelFileUpload();
}else{
ColdFusion.handleError(null,"fileupload.cancelupload.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.cancelupload.cancelled","widget",[name]);
};
$FS.getSelectedFiles=function(name){
var _559=fileUploadPrefix+name;
var _55a=$FS.getFileUploadComponent(_559);
if(_55a!=null){
return _55a.getSelectedFileArray();
}else{
ColdFusion.handleError(null,"fileupload.getSelectedFiles.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.getSelectedFiles.selected","widget",[name]);
};
$FS.clearAllFiles=function(name){
var _55c=fileUploadPrefix+name;
var _55d=$FS.getFileUploadComponent(_55c);
if(_55d!=null){
_55d.clearAllUpload();
}else{
ColdFusion.handleError(null,"fileupload.clearallfiles.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.clearallfiles.cleared","widget",[name]);
};
$FS.setURL=function(name,src){
var _560=$FS.getFileUploadComponent(fileUploadPrefix+name);
var _561=ColdFusion.objectCache[name];
if(_561==null||typeof (_561)=="undefined"){
ColdFusion.handleError(null,"fileupload.setURL.notfound","widget",[name],null,null,true);
}
if(!src||src.length==0){
ColdFusion.handleError(null,"fileupload.setURL.invalidurl","widget",[name],null,null,true);
}
var _562=null;
if(src.indexOf("?")>0){
_562=src.substring(src.indexOf("?")+1);
_562=escape(_562);
src=src.substring(0,src.indexOf("?"));
}
if(src.charAt(0)!="/"&&src.indexOf("://")<0){
var _563=_561.url_withoutQuery;
_563=unescape(_563);
var _564="";
if(_563||_563.indexOf("/")>-1){
_564=_563.substring(0,_563.lastIndexOf("/")+1);
}
var _565=_564+src;
var _566=_565.split("/");
var _567=new Array();
var _568=0;
for(var i=0;i<_566.length;i++){
if(_566[i]==".."){
_567[--_568]="";
}else{
_567[_568++]=_566[i];
}
}
src=_567[0];
for(var i=1;i<_568;i++){
src=src+"/"+_567[i];
}
}
var _56a=$FS.constructUrl(src,_562,_561.url_CF_cookie);
_561.url=_56a;
_560.setSrc(_56a);
ColdFusion.Log.info("fileupload.setURL.urlset","widget",[name,_56a]);
};
$FS.startUpload=function(name){
var _56c=fileUploadPrefix+name;
var _56d=$FS.getFileUploadComponent(_56c);
if(_56d!=null){
_56d.submitUploadForm();
}else{
ColdFusion.handleError(null,"fileupload.startupload.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.startupload.started","widget",[name]);
};
$FS.getFileUploadComponent=function(name){
if(navigator.appName.indexOf("Microsoft")!=-1){
if(window[name]!=null){
return window[name];
}else{
return document[name];
}
}else{
return document[name];
}
};
