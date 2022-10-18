/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.MediaPlayer){
ColdFusion.MediaPlayer={};
}
var $MP=ColdFusion.MediaPlayer;
$MP.defaultSWFLocation=_cf_ajaxscriptsrc+"/resources/cf/assets/StrobeMediaPlayback.swf",$MP.defaultOptions={swf:$MP.defaultSWFLocation,width:480,height:275,src:"",javascriptControls:true,playButtonOverlay:true,loop:false,autoPlay:false,controlBarMode:"docked",javascriptCallbackFunction:"triggerHandler"};
$MP.playerMap={};
$MP.playerWrapperMap={};
$MP.playerOptionsMap={};
$MP.jsFunctionMap={};
$MP.titleDataMap={};
$MP.videoMonitorMap={};
$MP.bindInfoMap={};
$MP.bindElements={};
$MP.baseURI;
$MP.fancyBoxLeftBorderOffset=5;
$MP.fancyBoxBottonBorderOffset=6;
$MP.hasHTML5VideoPlaybackSupport=!!document.createElement("video").canPlayType;
String.prototype.trim=function(){
return this.replace(/^\s+|\s+$/g,"");
};
ColdFusion.MediaPlayer.init=function(_396){
var _397=$MP.defaultOptions;
_397.id=_396.id;
var _398={};
var _399={};
var _39a={};
var _39b=null;
var _39c={onStart:null,onComplete:null,onPause:null,onError:null,onLoad:null,onStartCallback:playbackStart,onPauseCallback:playbackPause};
if(_396.width!=null&&typeof (_396.width)!="undefined"){
_397.width=_396.width;
}else{
_397.width=480;
}
if(_396.height!=null&&typeof (_396.height)!="undefined"){
_397.height=_396.height;
}else{
_397.height=275;
}
if(_396.baseURI!=null){
$MP.baseURI=_396.baseURI;
}
if(_396.src!=null&&_396.src!=""){
_397.src=resolveSource(_396.src);
}else{
_397.src="";
}
if(_396.PosterImage!=null&&_396.PosterImage!=""){
_397.poster=resolveSource(_396.PosterImage);
}else{
_397.poster="";
}
if(_396.javascriptControls==null){
_397.javascriptControls=true;
}
if(_396.playButtonOverlay==null){
_397.playButtonOverlay=true;
}
if(_396.repeat!=null){
if(_396.repeat=="true"){
_397.loop=true;
}else{
_397.loop=false;
}
}else{
_397.loop=false;
}
if(_396.autoPlay!=null){
if(_396.autoPlay=="true"){
_397.autoPlay=true;
}else{
_397.autoPlay=false;
}
}else{
_397.autoPlay=false;
}
if(_396.bgcolor!=null){
_397.backgroundColor=_396.bgcolor;
_399.bgColor=_396.bgcolor;
}
if(_396.controlbar!=null){
if(_396.controlbar==false){
_397.controlBarMode="none";
}else{
_397.controlBarMode="docked";
}
}
if(_396.skin!=null){
_397.skin=resolveSource(_396.skin);
}else{
_397.skin="";
}
if(_396.onComplete!=null){
_39c.onComplete=_396.onComplete;
}
if(_396.onLoad!=null){
_39c.onLoad=_396.onLoad;
}
if(_396.onStart!=null){
_39c.onStart=_396.onStart;
}
if(_396.onPause!=null){
_39c.onPause=_396.onPause;
}
if(_396.onError!=null){
_39c.onError=_396.onError;
}
if(_396.onBind!=null){
_39c.onBind=_396.onBind;
}
if(_396.hideTitle!=null){
_398.hideTitle=_396.hideTitle;
}
if(_396.title!=null){
_398.title=_396.title;
}
if(_396.title_text_color!=null){
_398.title_text_color=_396.title_text_color;
}
if(_396.title_bgcolor!=null){
_398.title_bgcolor=_396.title_bgcolor;
}
if(_396.border_left!=null){
_399.border_left=_396.border_left;
}
if(_396.border_right!=null){
_399.border_right=_396.border_right;
}
if(_396.border_top!=null){
_399.border_top=_396.border_top;
}
if(_396.border_bottom!=null){
_399.border_bottom=_396.border_bottom;
}
if(_396.progress_color!=null){
_39a.progress_color=_396.progress_color;
}
if(_396.progress_bgcolor!=null){
_39a.progress_bgcolor=_396.progress_bgcolor;
}
if(_396.controls_color!=null){
_39a.controls_color=_396.controls_color;
}
if(_396.controlbar_bgcolor!=null){
_39a.controlbar_bgcolor=_396.controlbar_bgcolor;
}
if(!_397.javascriptControls){
$(".strobeMediaPlaybackControlBar,.smp-error,.playoverlay").show();
}
if(_396.bindData!=null&&_396.bindData!="undefined"){
_39b=$.extend(true,{},_397);
handleBindingMediaPlayer(_39b,_396.bindData,_396.type,_39c);
return;
}
handleWmode(_396,_397);
playerInitialization(_397,_396.type,_39c,_398,_399,_39a);
};
function handleWmode(_39d,_39e){
if(navigator.platform.indexOf("Linux")!=-1){
_39e.wmode="direct";
return;
}
if(_39d.wmode!=null){
_39e.wmode=_39d.wmode;
}else{
_39e.wmode="direct";
}
var _39f=document.getElementById(_39e.id+"_"+"videoTitle");
if((_39f!==null&&(_39d.hideTitle==null||_39d.hideTitle==false))||(_39e.backgroundColor!=null&&_39e.backgroundColor.trim()!="")){
_39e.wmode="transparent";
}
}
function isValidSourceElementExist(_3a0,type){
if(_3a0.src!=null&&_3a0.src!=""){
if(type=="html"&&$MP.hasHTML5VideoPlaybackSupport&&isHTMLFileFormatSupported(_3a0.src)){
return true;
}else{
if(type=="flash"&&isFlashSupported()&&isFlashFileFormatSupported(_3a0.src)){
return true;
}
}
}
var _3a2=document.getElementById(_3a0.id+"_extendData");
if(_3a2==null||_3a2.childNodes==null||!isFlashSupported()){
return false;
}
var _3a3=_3a2.getElementsByTagName("source");
for(var k=0;k<_3a3.length;k++){
var src=_3a3[k].getAttribute("src");
if(type=="html"&&$MP.hasHTML5VideoPlaybackSupport&&isHTMLFileFormatSupported(src)){
return true;
}else{
if(type=="flash"&&isFlashSupported()&&isFlashFileFormatSupported(src)){
return true;
}
}
}
return false;
}
function hideTitle(id){
var _3a7=document.getElementById(id+"_"+"videoTitle");
if(_3a7==null){
id=id.substring(0,id.indexOf("_strobemediaplayback-video"));
_3a7=document.getElementById(id+"_"+"videoTitle");
}
if(_3a7!=null){
$("#"+id+"_"+"videoTitle").fadeOut(600,null);
}
}
function playbackStart(id){
var _3a9=getFuncMap(id);
if(_3a9.onStart!=null){
_3a9.onStart();
}
var _3aa=getWrapper(id);
if(_3aa!=null){
_3aa.playOverlay.fadeOut(600);
}
hideTitle(id);
}
function showTitle(id){
var _3ac=document.getElementById(id+"_"+"videoTitle");
if(_3ac==null){
id=id.substring(0,id.indexOf("_strobemediaplayback-video"));
_3ac=document.getElementById(id+"_"+"videoTitle");
}
if(_3ac!=null){
$("#"+id+"_"+"videoTitle").fadeIn(1,null);
}
}
function playbackPause(id){
var _3ae=getFuncMap(id);
if(_3ae.onPause!=null){
_3ae.onPause();
}
var _3af=getWrapper(id);
if(_3af!=null){
_3af.playOverlay.fadeIn(600);
}
showTitle(id);
}
function playbackComplete(id){
var _3b1=getFuncMap(id);
if(_3b1.onComplete!=null){
_3b1.onComplete();
}
var _3b2=getWrapper(id);
if(_3b2!=null){
_3b2.playOverlay.fadeIn(600);
_3b2.slider.css("left",0+"px");
_3b2.currenttime.html("0:00");
}
showTitle(id);
}
function updateFlashVideoSource(_3b3){
if(_3b3.src!=null&&_3b3.src!=""){
if(isFlashSupported()&&isFlashFileFormatSupported(_3b3.src)){
return;
}
}
var _3b4=document.getElementById(_3b3.id+"_extendData");
if(_3b4==null||_3b4.childNodes==null||!isFlashSupported()){
return;
}
var _3b5=_3b4.getElementsByTagName("source");
for(var k=0;k<_3b5.length;k++){
var src=_3b5[k].getAttribute("src");
if(isFlashSupported()&&isFlashFileFormatSupported(src)){
_3b3.src=resolveSource(src);
return;
}
}
return;
}
function playerInitialization(_3b8,type,_3ba,_3bb,_3bc,_3bd){
var _3be=true;
var _3bf=isValidSourceElementExist(_3b8,"html");
var _3c0=isValidSourceElementExist(_3b8,"flash");
var _3c1=$MP.handleUserDefinedFlashParams(_3b8,type);
if(_3c1){
_3b8.favorFlashOverHtml5Video=true;
}else{
if(isFlashSupported()){
if(type==null||type=="flash"){
if(_3c0){
_3b8.favorFlashOverHtml5Video=true;
}else{
if(_3bf){
_3b8.favorFlashOverHtml5Video=false;
}else{
_3be=false;
}
}
}else{
if(_3bf){
_3b8.favorFlashOverHtml5Video=false;
}else{
if(_3c0){
_3b8.favorFlashOverHtml5Video=true;
}else{
_3be=false;
}
}
}
}else{
if($MP.hasHTML5VideoPlaybackSupport){
_3b8.favorFlashOverHtml5Video=false;
}else{
_3be=false;
}
}
}
if(_3b8.favorFlashOverHtml5Video){
updateFlashVideoSource(_3b8);
}
if(!_3be){
if($MP.hasHTML5VideoPlaybackSupport){
_3b8.favorFlashOverHtml5Video=false;
}else{
$(".playoverlay").hide();
ColdFusion.MediaPlayer.logError(_3b8.id,"The video could not be loaded");
return;
}
}
var _3c2={"tablet":{"startSize":{"width":+_3b8.width,"height":+_3b8.height},"name":_3b8.id+"_"+"strobemediaplayback-video"},"smartphone":{"startSize":{"width":+_3b8.width,"height":+_3b8.height},"name":_3b8.id+"_"+"strobemediaplayback-video"},"default":{"startSize":{"width":+_3b8.width,"height":+_3b8.height},"name":_3b8.id+"_"+"strobemediaplayback-video"}};
strobeMediaPlayback.draw(_3b8.id+"_"+"strobemediaplayback-video",_3c2,_3b8);
var _3c3=$("#"+_3b8.id+"_"+"strobemediaplayback-video");
var _3c4=$("#"+_3b8.id);
var _3c5=_3c4.get(0);
var _3c6;
if(_3c5==null){
_3b8.id=_3b8.id+"_strobemediaplayback-video";
$MP.playerOptionsMap[_3b8.id]=_3b8;
$MP.videoMonitorMap[_3b8.id]={paused:true,muted:false};
}else{
_3c6=$("#"+_3b8.id+"_"+"strobemediaplayback-video  .html5player").strobemediaplaybackhtml5(_3b8,_3ba);
$MP.playerMap[_3b8.id]=_3c5;
$MP.playerWrapperMap[_3b8.id]=_3c6;
$MP.playerOptionsMap[_3b8.id]=_3b8;
}
$MP.jsFunctionMap[_3b8.id]=_3ba;
$MP.titleDataMap[_3b8.id]=_3bb;
if(_3c5!=null&&_3c5.nodeName!=null&&_3c5.nodeName.toLowerCase()=="video"){
handleVolumeSlider(_3b8.id);
_3c5.volume=0.6;
handlePlayoverlay(_3b8.id,_3b8.width,_3b8.height);
handleErrorElement(_3b8.id,_3b8.width,_3b8.height);
var _3c7=$MP.playerWrapperMap[_3b8.id];
_3c7.playOverlay.css("display","block");
_3c3.css("width","100%");
_3c3.css("height","100%");
handlebackgroundColor(_3b8);
handleControlsStyle(_3b8.id,_3bd);
_3c6.useHTML5=true;
var _3c8=document.getElementById(_3b8.id+"_extendData");
if(_3c8!=null){
$MP.handleUserDefinedHTML5Element(_3c5,_3b8.id+"_extendData");
}else{
handleTitle(_3b8.id,_3b8.src,_3bb);
var _3c9=getFuncMap(_3b8.id);
var _3ca=document.getElementById(_3b8.id);
var _3cb=_3ca.getElementsByTagName("source");
if(_3cb!=null&&_3cb.length!=0){
_3cb[0].setAttribute("onerror","onError(event)");
}
}
}else{
handleTitle(_3b8.id,_3b8.src,_3bb);
}
handleBorderStyle(_3b8.id,_3bc);
if($MP.bindInfoMap[_3b8.id]==null){
var _3cc=document.getElementById(_3b8.id+"_extendData");
if(_3cc==null){
var id=_3b8.id.substring(0,_3b8.id.indexOf("_"));
_3cc=document.getElementById(id+"_extendData");
}
if(_3cc!=null&&_3cc.parentNode!=null){
_3cc.parentNode.removeChild(_3cc);
}
}
}
function handleVolumeChangeUI(_3ce,_3cf){
var _3d0=getWrapper(_3ce);
if(_3cf<=0){
_3d0.volumeHigh.css("background-position","0px -72px");
}else{
if(_3cf<=0.3){
_3d0.volumeHigh.css("background-position","-24px -72px");
}else{
if(_3cf<=0.7){
_3d0.volumeHigh.css("background-position","-48px -72px");
}else{
_3d0.volumeHigh.css("background-position","-72px -72px");
}
}
}
}
function handleVolumeSlider(_3d1){
var _3d2=getWrapper(_3d1);
var _3d3=_3d2.volumeSlider;
_3d3.slider({orientation:"vertical",range:"min",min:0,max:90,value:60,slide:function(_3d4,ui){
var _3d6=ui.value/100;
_3d2.currentVolume=_3d6;
handleChangeVolume(_3d1,_3d6);
}});
_3d2.volumeHigh.mouseover(function(){
var _3d7=getWrapper(_3d1);
var _3d8=_3d7.volumeSlider;
_3d8.css("display","block");
_3d7.volumeContainer.css("display","block");
});
_3d2.volumeHigh.mouseout(function(_3d9){
var _3da=getWrapper(_3d1);
var _3db=_3da.volumeSlider;
var _3dc=_3da.volumeContainer;
var _3dd=_3d9.relatedTarget;
if(_3dd.className!="controls"){
_3db.css("display","none");
_3dc.css("display","none");
}
});
_3d2.volumeHigh.click(function(_3de){
var _3df=getWrapper(_3d1);
if(_3df.currentVolume==null){
_3df.currentVolume=0.6;
}
var pos=_3d2.volumeHigh.css("background-position");
if(pos.indexOf("0px")!=0){
_3d2.volumeHigh.css("background-position","0px -72px");
_3d2.volumeSlider.slider("value",0);
handleChangeVolume(_3d1,0);
}else{
_3d2.volumeSlider.slider("value",_3df.currentVolume*100);
if(_3df.currentVolume<=0.1){
_3d2.volumeHigh.css("background-position","0px -72px");
}else{
if(_3df.currentVolume<=0.3){
_3d2.volumeHigh.css("background-position","-24px -72px");
}else{
if(_3df.currentVolume<=0.7){
_3d2.volumeHigh.css("background-position","-48px -72px");
}else{
_3d2.volumeHigh.css("background-position","-72px -72px");
}
}
}
handleChangeVolume(_3d1,_3df.currentVolume);
}
});
_3d2.controlbar.mouseout(function(_3e1){
if(_3e1.relatedTarget==null){
return;
}
var _3e2=_3e1.relatedTarget.className;
if(_3e1.relatedTarget.className!="controls"&&_3e2!="volume-container"&&_3e2.indexOf("ui-slider")==-1){
var _3e3=getWrapper(_3d1);
var _3e4=_3e3.volumeSlider;
var _3e5=_3e3.volumeContainer;
_3e4.css("display","none");
_3e5.css("display","none");
}
});
}
function handleBindingMediaPlayer(_3e6,_3e7,type,_3e9){
var _3ea=document.getElementById(_3e6.id+"_"+"html5MediaPlayback");
if(_3ea==null){
return;
}
var _3eb=_3ea.innerHTML;
if(_3eb==null){
return;
}
var _3ec={};
_3ec.videoContent=_3eb;
_3ec.type=type;
_3ec.player_options=_3e6;
_3ec.jsfunction=_3e9;
$MP.bindInfoMap[_3e6.id]=_3ec;
var _3ed=-1;
var _3ee=0;
var _3ef=_3e7;
do{
var _3f0;
_3ed=_3e7.indexOf(",",_3ee);
if(_3ed!=-1){
_3f0=_3e7.substring(_3ee,_3ed);
_3ee=_3ed+1;
_3ef=_3e7.substring(_3ed+1);
}else{
_3f0=_3ef;
}
var _3f1=_3f0;
var _3f2;
if(_3f0.indexOf("@")!=-1){
_3f1=_3f0.substring(0,_3f0.indexOf("@"));
_3f2=_3f0.substring(_3f0.indexOf("@")+1);
}else{
_3f1=_3f0;
_3f2="onClick";
}
var _3f3=document.getElementById(_3f1);
if(_3f3==null){
continue;
}
handleTitle(_3e6.id,_3e6.src);
var _3f4=getVideoTitle(_3e6.src);
if(_3f2==null||_3f2.toLowerCase()=="onclick"){
bindFancyBox(false,true,_3f1,_3f2,_3e6,type,_3e9,_3eb,_3f4);
}else{
var _3f5=document.getElementById(_3f1);
_3f2=_3f2.substring(2);
$("#"+_3f1).live(_3f2.toLowerCase(),function(e){
bindFancyBox(true,true,_3f1,_3f2,_3e6,type,_3e9,_3eb,_3f4);
});
}
}while(_3ed!=-1);
var _3f7=document.getElementById(_3e6.id+"_"+"mediacontainer");
_3f7.parentNode.removeChild(_3f7);
}
function bindFancyBox(fire,_3f9,_3fa,_3fb,_3fc,type,_3fe,_3ff,_400){
var _401=document.getElementById(_3fc.id+"_"+"videoTitle");
if(_401==null){
_400="";
}else{
if(_400==null||_400==""){
_400="video";
}
}
if(fire){
$("#"+_3fa).fancybox({content:_3ff,overlayShow:true,overlayOpacity:0.7,width:_3fc.width+$MP.fancyBoxLeftBorderOffset,height:_3fc.height+$MP.fancyBoxBottonBorderOffset,title:_400,autoDimensions:false,onComplete:function(){
var _402=$.extend(true,{},$MP.bindInfoMap[_3fc.id].player_options);
if(_3f9&&_3fe.onBind!=null){
_3fe.onBind(_3fa,_3fb);
}
var _403=$MP.bindInfoMap[_3fc.id].player_options;
playerInitialization(_403,type,_3fe);
handleBindEvents(_403,$MP.bindInfoMap[_3fc.id]);
$MP.bindInfoMap[_3fc.id].player_options=$.extend(true,{},_402);
}}).trigger("click");
}else{
$("#"+_3fa).fancybox({content:_3ff,overlayShow:true,overlayOpacity:0.7,width:_3fc.width+$MP.fancyBoxLeftBorderOffset,height:_3fc.height+$MP.fancyBoxBottonBorderOffset,title:_400,autoDimensions:false,onComplete:function(){
var _404=$.extend(true,{},$MP.bindInfoMap[_3fc.id].player_options);
if(_3f9&&_3fe.onBind!=null){
_3fe.onBind(_3fa,_3fb);
}
var _405=$MP.bindInfoMap[_3fc.id].player_options;
playerInitialization(_405,type,_3fe);
handleBindEvents(_405,$MP.bindInfoMap[_3fc.id]);
$MP.bindInfoMap[_3fc.id].player_options=$.extend(true,{},_404);
}});
}
}
function handleBindEvents(_406,_407){
var _408=$MP.getPlayer(_406.id);
if(_407.mute!=null){
_408.muted=mute;
}
if(_407.volume!=null){
handleChangeVolume(_406.id,_407.volume);
}
if(_407.startPlay!=null){
_408.start();
}
if(_407.stopPlay!=null){
_408.pause();
}
}
function updateVideoType(_409){
var _40a=_409.childNodes;
if(_40a==null){
return;
}
var _40b=_409.getElementsByTagName("source");
if(_40b==null||_40b.length===0){
return;
}
var _40c=_40b[0].getAttribute("src");
if(_40c==null){
return;
}
var type=_40b[0].getAttribute("type");
if(type!=null){
return;
}
if(_40c.lastIndexOf(".")==-1){
return;
}
var _40e=_40c.substring(_40c.lastIndexOf(".")+1);
_40e=_40e.toLowerCase();
if(_40e=="mp4"){
_40b[0].setAttribute("type","video/mp4");
}else{
if(_40e=="ogv"){
_40b[0].setAttribute("type","video/ogg");
}else{
if(_40e=="webm"){
_40b[0].setAttribute("type","video/webm");
}
}
}
}
$MP.handleUserDefinedHTML5Element=function(_40f,_410){
var _411=document.getElementById(_410);
var _412=_411.childNodes;
var _413=false;
updateVideoType(_40f);
if(_412!=null){
var _414=null;
for(var k=0;k<_412.length;k++){
var _416=_412[k];
if(_416.tagName!=null&&_416.tagName.toLowerCase()=="video"){
_414=_416;
break;
}
}
if(_414==null){
return;
}
_412=_414.childNodes;
var _417=null;
var _418;
for(var i=0;i<_412.length;i++){
var _416=_412[i];
if(_416.tagName!=null&&_416.tagName.toLowerCase()=="track"){
_40f.appendChild(_416);
}else{
if(_416.tagName!=null&&_416.tagName.toLowerCase()=="source"){
if(!_413){
var _41a=_40f.getAttribute("src");
if(_41a==null){
var _41b=_40f.childNodes;
if(_41b!=null){
for(var l=0;l<_41b.length;l++){
if(_41b[l].tagName.toLowerCase()=="source"){
var src=_41b[l].getAttribute("src");
if(src!=null&&src.trim()!=0&&isHTMLFileFormatSupported(src)){
_417=src;
break;
}
}
}
}
}
if(_41a!=null&&_41a!=""&&_41a.lastIndexOf(".")!=-1){
var _41e=document.createElement("source");
_41e.setAttribute("src",_41a);
var _41f=_41a.substring(_41a.lastIndexOf(".")+1);
if(_41f=="mp4"){
_41e.setAttribute("type","video/mp4");
}else{
if(_41f=="ogv"){
_41e.setAttribute("type","video/ogg");
}else{
if(_41f=="webm"){
_41e.setAttribute("type","video/webm");
}
}
}
_40f.appendChild(_41e);
}
if(_417==null&&isHTMLFileFormatSupported(_41a)){
_417=_41a;
}
_40f.removeAttribute("src");
}
var src=_416.getAttribute("src");
src=resolveSource(src);
_416.setAttribute("src",src);
_40f.appendChild(_416);
_413=true;
_418=_416;
if(_417==null&&isHTMLFileFormatSupported(src)){
_417=src;
}
}
}
}
if(_417!=null){
handleTitle(_40f.id,_417);
}
if(_418!=null){
_418.setAttribute("onerror","onError(event)");
}
}
_40f.load();
};
$MP.handleUserDefinedFlashParams=function(_420,type){
var _422=document.getElementById(_420.id+"_extendData");
if(_422==null||_422.childNodes==null||!isFlashSupported()){
return;
}
var _423=_422.childNodes;
var _424=false;
if(_423!=null){
var _425=null;
for(var k=0;k<_423.length;k++){
var _427=_423[k];
if(_427.tagName!=null&&(_427.tagName.toLowerCase()=="object"||_427.tagName.toLowerCase()=="video")){
_425=_427;
var _428=_425.childNodes;
for(var i=0;i<_428.length;i++){
var _427=_428[i];
if(_427.tagName!=null&&_427.tagName.toLowerCase()=="param"){
_424=true;
var _42a=_427.getAttribute("name");
if(_42a=="flashvars"){
var _42b=_427.getAttribute("value");
var _42c=0;
var _42d=_42b;
do{
var _42e=_42d.indexOf("&");
var _42f;
if(_42e>0){
_42f=_42d.substring(_42c,_42e);
}else{
_42f=_42d;
}
if(_42f.indexOf("=")>0){
var _430=_42f.substring(0,_42f.indexOf("="));
var _431=_42f.substring(_42f.indexOf("=")+1);
if(_430!=""||_431!=""){
_420[_430]=resolveSource(_431);
}
}
_42c=_42e+1;
_42d=_42d.substring(_42c);
}while(_42e>0);
}
}
}
}
}
return _424;
}
};
function isFlashSupported(){
return swfobject.hasFlashPlayerVersion("1");
}
function isFlashFileFormatSupported(_432){
if(_432.indexOf("rtmp")==0){
return true;
}
var _433=["flv","f4v","f4m","m3u","mp4","swf","mpeg-4","m4v","f4f","3gpp","mp3","3gpp2","pbg","gif","jpg","jpeg","aac","speex","nellymoser","QuickTime"];
var _434=_432.lastIndexOf(".");
var _435=_432.substring(_434+1,_432.length);
_435=_435.toLowerCase();
for(var i=0;i<_433.length;i++){
if(_433[i]==_435){
return true;
}
}
return false;
}
function isHTMLFileFormatSupported(_437){
if(_437==null){
return false;
}
var _438=["webm","mp4","ogv"];
var _439=_437.lastIndexOf(".");
var _43a=_437.substring(_439+1,_437.length);
_43a=_43a.toLowerCase();
var elem=document.createElement("video");
var ogg=elem.canPlayType("video/ogg; codecs=\"theora\"");
var h264="video/mp4; codecs=\"avc1.42E01E";
var mp4=elem.canPlayType(h264+"\"")||elem.canPlayType(h264+", mp4a.40.2\"");
var webm=elem.canPlayType("video/webm; codecs=\"vp8, vorbis\"");
for(var i=0;i<_438.length;i++){
if(_438[i]==_43a){
if(_43a=="ogv"){
return ogg;
}else{
if(_43a=="webm"){
return webm;
}else{
if(_43a=="mp4"){
return mp4;
}
}
}
}
}
return false;
}
function getWrapper(name){
var _442=$MP.playerWrapperMap[name];
if(_442==null||typeof (_442)=="undefined"){
return $MP.playerWrapperMap[name+"_strobemediaplayback-video"];
}
return _442;
}
function getFuncMap(name){
var _444=$MP.jsFunctionMap[name];
if(_444==null||typeof (_444)=="undefined"){
return $MP.jsFunctionMap[name+"_strobemediaplayback-video"];
}
return _444;
}
ColdFusion.MediaPlayer.setMute=function(name,mute){
if($MP.bindInfoMap[name]!=null){
var _447=getBindInfo(name);
if(_447==null){
return;
}
_447.mute=mute;
return;
}
var _448=$MP.getPlayer(name);
var _449=$MP.getType(name);
var _44a=getWrapper(name);
if(_449=="html"){
_448.muted=mute;
if(mute){
_44a.volumeHigh.css("background-position","0px -72px");
_44a.volumeSlider.slider("value",0);
}else{
handleChangeVolume(name,_448.volume);
}
}else{
if(_449=="flash"){
_448.setMuted(mute);
}
}
};
function resolveSource(src){
if(src==null){
return null;
}
if(src.charAt(0)!="/"&&src.indexOf("://")<0){
var _44c="";
var _44d=document.location.href;
if(_44d||_44d.indexOf("/")>-1){
_44c=_44d.substring(0,_44d.lastIndexOf("/")+1);
}
var _44e=_44c+src;
var _44f=_44e.split("/");
var _450=new Array();
var _451=0;
for(var i=0;i<_44f.length;i++){
if(_44f[i]==".."){
_450[--_451]="";
}else{
_450[_451++]=_44f[i];
}
}
src=_450[0];
for(var i=1;i<_451;i++){
src=src+"/"+_450[i];
}
}
if(src.indexOf("/")==0){
src=$MP.baseURI+src;
}
return src;
}
ColdFusion.MediaPlayer.getPlayer=function(name){
var _454=$MP.playerMap[name];
if(_454==null||typeof (_454)=="undefined"){
_454=$MP.playerMap[name+"_strobemediaplayback-video"];
if(_454==null||typeof (_454)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.getplayer.notfound","widget",[name],null,null,true);
}
}
return _454;
};
ColdFusion.MediaPlayer.setTitle=function(name,_456){
if(_456==null){
ColdFusion.handleError(null,"mediaplayer.settitle.invalidtitle","widget",[name],null,null,true);
}
var _457=$MP.titleDataMap[name];
if(_457==null){
_457={};
$MP.titleDataMap[name]=_457;
}
var _458=document.getElementById(name+"_videoTitle");
if(_458==null){
var _459="<div id=\""+name+"_videoTitle\">";
$("#"+name+"_videoContainer").prepend(_459);
}
_457.hideTitle=false;
_457.title=_456;
handleTitle(name,_456,_457);
};
ColdFusion.MediaPlayer.setSource=function(name,src){
if(src==null||src=="undefined"){
ColdFusion.handleError(null,"mediaplayer.setsource.invalidsource","widget",[name],null,null,true);
}
if($MP.bindInfoMap[name]!=null){
var _45c=getBindInfo(name);
if(_45c==null){
return;
}
_45c.player_options.src=resolveSource(src);
if(isFlashFileFormatSupported(src)&&isFlashSupported()){
_45c.player_options.favorFlashOverHtml5Video=true;
}else{
_45c.player_options.favorFlashOverHtml5Video=false;
}
_45c.videoTitle=getVideoTitle(src);
return;
}
var _45d=$MP.getPlayer(name);
var _45e=$MP.getType(name);
src=resolveSource(src);
var _45f=getWrapper(name);
var _460,jsFunctionMap;
if(_45f!=null&&_45f.errorwindow!=null){
_45f.errorwindow.html("");
_45f.errorwindow.hide();
_460=$MP.playerOptionsMap[_45f.options.id];
}else{
_460=$MP.playerOptionsMap[name+"_"+"strobemediaplayback-video"];
jsFunctionMap=$MP.jsFunctionMap[name+"_"+"strobemediaplayback-video"];
}
if(_460==null){
_460=$MP.defaultOptions;
}
var _461={"tablet":{"name":_460.id+"_"+"strobemediaplayback-video"},"smartphone":{"startSize":{"width":360,"height":200},"name":_460.id+"_"+"strobemediaplayback-video"},"default":{"startSize":{"width":+_460.width,"height":+_460.height},"name":_460.id+"_"+"strobemediaplayback-video"}};
if(_45e=="html"){
if(isHTMLFileFormatSupported(src)){
_45d.src=src;
_45d.load();
_45d.pause();
_45f.playOverlay.fadeIn(600);
_45f.playtoggle.removeClass("paused");
_45f.slider.css({"left":"0%"});
_45f.playedbar.css({"width":"0%"});
_45f.currenttime.html("0:00");
_45f.duration.html("0:00");
var css={"left":"0%","width":"0%"};
_45f.bufferbar.removeClass("done");
_45f.bufferbar.css(css);
var _463=$MP.titleDataMap[_460.id];
handleTitle(name,src,_463);
}else{
if(isFlashFileFormatSupported(src)&&isFlashSupported()){
_460.isHTML5=false;
_460.favorFlashOverHtml5Video=true;
_460.src=src;
var _463=$MP.titleDataMap[_460.id];
if(_463.hideTitle!=null&&!_463.hideTitle){
_460.wmode="opaque";
}
strobeMediaPlayback.draw(_460.id+"_"+"strobemediaplayback-video",_461,_460);
var _464=$("#"+_460.id+"_"+"strobemediaplayback-video");
var _465=_464.find("video");
var _466=_465.get(0);
var _467=$("#"+_460.id+"_"+"strobemediaplayback-video  .html5player").strobemediaplaybackhtml5(_460,_45f.jsCallbackFunctions);
$MP.playerMap[_460.id]=_466;
$MP.playerWrapperMap[_460.id]=_467;
handleTitle(_460.id,_460.src,_463);
}
}
}else{
if(_45e=="flash"){
if(isFlashFileFormatSupported(src)&&isFlashSupported()){
_45d.setMediaResourceURL(src);
handleTitle(name,src,$MP.titleDataMap[id]);
}else{
if(isHTMLFileFormatSupported(src)){
var id=_460.id+"_strobemediaplayback-video";
$("#"+id).replaceWith("<div  id=\""+id+"\"></div>");
$("#"+id).css("visibility","visible");
_460.isHTML5=true;
_460.favorFlashOverHtml5Video=false;
_460.src=src;
strobeMediaPlayback.draw(id,_461,_460);
var _464=$("#"+id);
var _465=_464.find("video");
var _466=_465.get(0);
if(_466==null){
return;
}
var _469=getFuncMap(id);
var _467=$("#"+id+"  .html5player").strobemediaplaybackhtml5(_460,_469);
$MP.playerMap[_460.id]=_466;
$MP.playerWrapperMap[_460.id]=_467;
handlePlayoverlay(_460.id,_460.width,_460.height);
handleErrorElement(_460.id,_460.width,_460.height);
_467.playOverlay.css("display","block");
handleTitle(_460.id,_460.src,$MP.titleDataMap[id]);
_466.load();
if(_460.autoPlay==false){
_466.pause();
}
}
}
}
}
};
function getBindInfo(name){
var _46b=$MP.bindInfoMap[name];
if(_46b!=null){
return _46b;
}
return;
}
function handleBindElements(_46c){
if(_46c!=null){
if(_46c.bindEvent==null||_46c.bindEvent.toLowerCase()=="onclick"){
bindFancyBox(false,false,_46c.bindElement,_46c.player_options,_46c.type,_46c.jsFuncc,_46c.videoContent,_46c.videoTitle);
}else{
var _46d=document.getElementById(_46c.bindElement);
var _46e=_46c.bindEvent.substring(2);
$("#"+_46c.bindElement).live(_46e.toLowerCase(),function(e){
bindFancyBox(true,false,_46c.bindElement,_46c.player_options,_46c.type,_46c.jsFuncc,_46c.videoContent,_46c.videoTitle);
});
}
}
}
function handleChangeVolume(name,_471){
var _472=$MP.getPlayer(name);
var _473=$MP.getType(name);
if(_473=="html"){
if(_472.muted){
_472.muted=false;
}
_472.volume=_471;
var _474=getWrapper(name);
var _475=_474.volumeSlider;
_475.slider("value",_471*100);
handleVolumeChangeUI(name,_471);
}else{
if(_473=="flash"){
_472.setVolume(_471);
}
}
}
ColdFusion.MediaPlayer.setVolume=function(name,_477){
if(_477<=0){
ColdFusion.handleError(null,"mediaplayer.setvolume.invalidvalue","widget",[name],null,null,true);
}
if($MP.bindInfoMap[name]!=null){
var _478=getBindInfo(name);
if(_478==null){
return;
}
_478.volume=_477;
return;
}
handleChangeVolume(name,_477);
};
ColdFusion.MediaPlayer.resize=function(name,_47a,_47b){
if(_47a<=0||_47b<=0){
ColdFusion.handleError(null,"mediaplayer.resize.invalidvalue","widget",[name],null,null,true);
}
if($MP.bindInfoMap[name]!=null){
var _47c=getBindInfo(name);
if(_47c==null){
return;
}
_47c.player_options.width=_47a;
_47c.player_options.height=_47b;
return;
}
var _47d=false;
var _47e=$MP.getPlayer(name);
var _47f=$MP.getType(name);
var _480=getWrapper(name);
_47e.width=_47a;
_47e.height=_47b;
if(_480!=null){
_480.options.width=_47a;
_480.options.height=_47b;
_480.controlbar.css("width",_47a-1.5);
if(_480.options.width>180){
_480.progressbar.css("width",_47a-180);
_480.trackswidth=_47a-180;
}else{
_480.progressbar.css("width","50%");
_480.trackswidth="50%";
}
handlePlayoverlay(name,_47a,_47b);
handleErrorElement(name,_47a,_47b);
}
$("#"+name+"_"+"videoContainer").css("width",_47a);
$("#"+name+"_"+"videoContainer").css("height",_47b);
if(_47e.paused==false){
_480.playOverlay.hide();
}
};
ColdFusion.MediaPlayer.getType=function(name){
var elem=document.getElementById(name);
if(elem==null||elem=="undefined"){
elem=document.getElementById(name+"_strobemediaplayback-video");
if(elem==null||typeof (elem)=="undefined"){
return "unknown";
}
}
var type=elem.nodeName;
if(type==null){
return "unknown";
}
type=type.toLowerCase();
if(type=="video"){
return "html";
}else{
if(type=="object"){
return "flash";
}else{
return "unknown";
}
}
};
ColdFusion.MediaPlayer.startPlay=function(name){
if($MP.bindInfoMap[name]!=null){
var _485=getBindInfo(name);
if(_485==null){
return;
}
_485.startPlay=true;
return;
}
var _486=$MP.getPlayer(name);
var _487=$MP.getType(name);
if(_487=="html"){
_486.play();
}else{
if(_487=="flash"){
_486.play2();
}
}
};
ColdFusion.MediaPlayer.stopPlay=function(name){
if($MP.bindInfoMap[name]!=null){
var _489=getBindInfo(name);
if(_489==null){
return;
}
_489.stopPlay=true;
return;
}
var _48a=$MP.getPlayer(name);
_48a.pause();
};
ColdFusion.MediaPlayer.logError=function(name,_48c){
if(name==null||_48c==null){
return;
}
var _48d=$MP.playerWrapperMap[name];
if(_48d==null){
_48d=$MP.playerWrapperMap[name+"_strobemediaplayback-video"];
if(_48d==null){
return;
}
}
_48d.errorwindow.html(_48c);
_48d.errorwindow.show();
_48d.playOverlay.hide();
};
function handlePlayoverlay(name,_48f,_490){
if(!isDesktop){
return;
}
var _491=getWrapper(name);
_491.playOverlay.css("left","");
_491.playOverlay.css("top","");
_491.playOverlay.css("left",(_48f-116)/2+"px");
_491.playOverlay.css("top",(_490-107)/2+"px");
}
function handleErrorElement(name,_493,_494){
var _495=getWrapper(name);
_495.playOverlay.css("display","none");
_495.errorwindow.css("left","");
_495.errorwindow.css("top","");
_495.errorwindow.css("display","none");
var _496=_495.controlbar;
var _497=0;
if(_496!=null){
_497=_496.css("height");
if(_497!=null&&_497.indexOf("px")!=-1){
_497=_497.substring(0,_497.indexOf("px"));
}else{
_497=0;
}
}
_495.errorwindow.css("margin-top",_494/2-_497+"px");
}
function handleTitleResize(id,_499,_49a){
$("#"+id+"_videoTitle").css("width","");
$("#"+id+"_videoTitle").css("width",_499+"px");
}
function handleTitle(_49b,_49c,_49d){
var _49e=document.getElementById(_49b+"_"+"videoTitle");
if(_49e==null){
_49b=_49b.substring(0,_49b.indexOf("_strobemediaplayback-video"));
_49e=document.getElementById(_49b+"_"+"videoTitle");
}
var _49f=document.getElementById("fancybox-title-float-main");
if(_49e!=null){
if(_49d==null){
_49d=$MP.titleDataMap[_49b];
if(_49d==null||_49d.hideTitle){
var _4a0=_49e.parentNode;
_4a0.removeChild(_49e);
return;
}
}else{
if(_49d.hideTitle){
var _4a0=_49e.parentNode;
_4a0.removeChild(_49e);
return;
}
}
var _4a1=_49d.title;
if(_49d==null||_49d.title==null||_49d.title.trim()==""){
_4a1=getVideoTitle(_49c);
}
if(_4a1!=""){
_49e.innerHTML=_4a1;
}else{
return;
}
$("#"+_49b+"_"+"videoTitle").css("position","absolute");
$("#"+_49b+"_"+"videoTitle").css("z-index",2);
if(_49d==null||_49d.title_text_color==null){
$("#"+_49b+"_"+"videoTitle").css("color","white");
}else{
$("#"+_49b+"_"+"videoTitle").css("color",_49d.title_text_color);
}
if(_49d!=null&&_49d.title_bgcolor!=null){
$("#"+_49b+"_"+"videoTitle").css("background-color",_49d.title_bgcolor);
}
$("#"+_49b+"_"+"videoTitle").css("font-weight","bold");
$("#"+_49b+"_"+"videoTitle").css("font-family","Arial,Helvetica,sans-serif");
$("#"+_49b+"_"+"videoTitle").css("font-size","13px");
$("#"+_49b+"_"+"videoTitle").css("word-wrap","break-word");
if(_49e.style.backgroundColor==null||_49e.style.backgroundColor==""){
$("#"+_49b+"_"+"videoTitle").css("margin-left","5px");
}
$("#"+_49b+"_"+"videoTitle").show();
$("#"+_49b+"_"+"strobemediaplayback").css("z-index",1);
}else{
if(_49f!=null&&_49c!=null){
$("#fancybox-title-float-main").text(_49c);
}
}
}
function getVideoTitle(_4a2){
var _4a3=null;
if(_4a2!=null&&_4a2!=""){
var _4a4=_4a2.lastIndexOf("/");
if(_4a4==-1){
_4a4=_4a2.lastIndexOf("\\");
}
if(_4a4==-1){
_4a3=_4a2;
}
if(_4a3==null){
_4a3=_4a2.substring(_4a4+1,_4a2.length);
}
}
if(_4a3==null||_4a3.indexOf(".")<0){
return _4a2;
}else{
return _4a3;
}
}
function handlebackgroundColor(_4a5){
if(_4a5.backgroundColor==null){
return;
}
var _4a6=document.getElementById(_4a5.id);
if(_4a6==null){
return;
}
_4a6.setAttribute("style","background-color:"+_4a5.backgroundColor+";");
}
function handleBorderStyle(_4a7,_4a8){
if(_4a8.hideBorder){
return;
}
var _4a9="#fff";
if(_4a8.bgColor){
_4a9=_4a8.bgColor;
}
var _4aa=document.getElementById(_4a7+"_"+"videoContainer");
if(_4aa==null){
_4a7=_4a7.substring(0,_4a7.indexOf("_"));
}
if(_4a8.border_left!=null){
$("#"+_4a7+"_"+"videoContainer").css("border-left",_4a8.border_left+"px"+" solid "+_4a9);
}
if(_4a8.border_right!=null){
$("#"+_4a7+"_"+"videoContainer").css("border-right",_4a8.border_right+"px"+" solid "+_4a9);
}
if(_4a8.border_top!=null){
$("#"+_4a7+"_"+"videoContainer").css("border-top",_4a8.border_top+"px"+" solid "+_4a9);
}
if(_4a8.border_bottom!=null){
$("#"+_4a7+"_"+"videoContainer").css("border-bottom",_4a8.border_bottom+"px"+" solid "+_4a9);
}
}
function handleControlsStyle(_4ab,_4ac){
var _4ad=getWrapper(_4ab);
if(_4ac.controlbar_bgcolor!=null){
_4ad.controlbar.css("background-color",_4ac.controlbar_bgcolor);
}
if(_4ac.controls_color!=null){
_4ad.playtoggle.css("background-color",_4ac.controls_color);
_4ad.slider.css("background-color",_4ac.controls_color);
_4ad.fullview.css("background-color",_4ac.controls_color);
_4ad.currenttime.css("color",_4ac.controls_color);
_4ad.duration.css("color",_4ac.controls_color);
_4ad.seekbar.css("background-color",_4ac.controls_color);
_4ad.volumeHigh.css("background-color",_4ac.controls_color);
}
if(_4ac.progress_bgcolor!=null){
_4ad.bufferbar.css("background-color",_4ac.progress_bgcolor);
}
if(_4ac.progress_color!=null){
_4ad.playedbar.css("background-color",_4ac.progress_color);
}
}
function triggerHandler(id,_4af,_4b0){
if(_4af=="onJavaScriptBridgeCreated"){
return;
}else{
if(_4af=="play"){
var _4b1=getFuncMap(id);
var _4b2=$MP.videoMonitorMap[id];
if(_4b1.onStartCallback!=null&&_4b2.paused){
_4b1.onStartCallback(id);
_4b2.paused=false;
}
hideTitle(id);
}else{
if(_4af=="pause"){
var _4b1=getFuncMap(id);
var _4b2=$MP.videoMonitorMap[id];
if(_4b1.onPauseCallback!=null&&!_4b2.paused){
_4b1.onPauseCallback(id);
_4b2.paused=true;
}
showTitle(id);
}else{
if(_4af=="complete"){
var _4b1=getFuncMap(id);
if(_4b1.onComplete!=null){
_4b1.onComplete();
}
var _4b2=$MP.videoMonitorMap[id];
_4b2.paused=true;
showTitle(id);
}else{
if(_4af=="loadedmetadata"){
var _4b1=getFuncMap(id);
if(_4b1.onLoad!=null){
_4b1.onLoad();
}
}else{
if(_4af=="error"){
var _4b1=getFuncMap(id);
if(_4b1.onError!=null){
_4b1.onError();
}
}else{
if(_4af=="volumechange"){
var _4b2=$MP.videoMonitorMap[id];
_4b2.muted=_4b0.muted;
}
}
}
}
}
}
}
}
function onError(_4b3){
var _4b4;
var _4b5;
var _4b6;
var _4b7;
if(_4b3.target!=null&&_4b3.target.tagName.toLowerCase()=="video"){
_4b6=getFuncMap(_4b3.target.id);
if(_4b3.target.error!=null){
_4b5=_4b3.target.error.code;
}
_4b7=getWrapper(_4b3.target.id);
}else{
if(_4b3.target!=null&&_4b3.target.tagName.toLowerCase()=="source"){
var _4b8=_4b3.target.getAttribute("src");
var _4b9=_4b3.target.getAttribute("onerror");
if(_4b8!=null&&_4b9!=null){
_4b5=4;
}else{
return;
}
}
var _4ba=_4b3.target.parentNode;
_4b6=getFuncMap(_4ba.id);
_4b7=getWrapper(_4ba.id);
}
if(_4b5==null){
return;
}
if(_4b6.onError!=null){
_4b6.onError(_4b5);
return;
}
switch(_4b5){
case 1:
_4b4="You aborted the video playback.";
break;
case 2:
_4b4="A network error caused the video download to fail part-way.";
break;
case 3:
_4b4="The video playback was aborted due to a corruption problem or because the video used features your browser did not support.";
break;
case 4:
_4b4="The video could not be loaded, either because the server or network failed or because the format is not supported.";
break;
default:
_4b4="An unknown error occurred.";
break;
}
_4b7.playOverlay.css("display","none");
_4b7.errorwindow.html(_4b4);
_4b7.errorwindow.show();
}
function onFlashEmbedComplete(_4bb){
var _4bc=$("#"+_4bb.id);
var _4bd=_4bc.get(0);
$MP.playerMap[_4bb.id]=_4bd;
}
function removejscssfile(_4be,_4bf){
var _4c0=(_4bf=="js")?"script":(_4bf=="css")?"link":"none";
var _4c1=(_4bf=="js")?"src":(_4bf=="css")?"href":"none";
var _4c2=document.getElementsByTagName(_4c0);
for(var i=_4c2.length;i>=0;i--){
if(_4c2[i]&&_4c2[i].getAttribute(_4c1)!=null&&_4c2[i].getAttribute(_4c1).indexOf(_4be)!=-1){
_4c2[i].parentNode.removeChild(_4c2[i]);
}
}
}
