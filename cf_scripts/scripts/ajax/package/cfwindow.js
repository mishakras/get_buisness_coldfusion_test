/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Window){
ColdFusion.Window={};
}
ColdFusion.Window.windowIdCounter=1;
ColdFusion.Window.TITLE_BGCOLOR_TEMPLATE="WINDOW_DIV_ID .x-window-tc , WINDOW_DIV_ID .x-window-tl, WINDOW_DIV_ID .x-window-tr, WINDOW_DIV_ID .x-window-bc, WINDOW_DIV_ID .x-window-br, WINDOW_DIV_ID"+" .x-window-bl, WINDOW_DIV_ID  .x-window-ml, WINDOW_DIV_ID .x-window-mr { background-image: none; background-color: COLOR_ID; }";
ColdFusion.Window.create=function(_4c4,_4c5,url,_4c7){
if(_4c4==null){
ColdFusion.handleError(null,"window.create.nullname","widget",null,null,null,true);
return;
}
if(_4c4==""){
ColdFusion.handleError(null,"window.create.emptyname","widget",null,null,null,true);
return;
}
var _4c8=ColdFusion.objectCache[_4c4];
var _4c9=false;
if(typeof (_4c8)!="undefined"&&_4c8!=null){
if(_4c8.callfromtag){
ColdFusion.handleError(null,"window.create.duplicatename","widget",[_4c4]);
}
if(typeof (_4c8.isConfObj)!="undefined"&&_4c8.isConfObj==true){
_4c9=true;
if(_4c7!=null&&typeof (_4c7.initshow)!="undefined"){
if(_4c7.initshow==false){
return;
}
}
}else{
if(!_4c7||(_4c7&&_4c7.initshow!==false)){
ColdFusion.Window.show(_4c4);
}
return;
}
}
if(!_4c8){
ColdFusion.Log.info("window.create.creating","widget",[_4c4]);
}
var _4ca=ColdFusion.Window.createHTML(_4c4,_4c5,url,_4c7,_4c9);
var _4cb=ColdFusion.objectCache[_4c4];
if(_4cb!=null&&typeof (_4cb.isConfObj)!="undefined"&&_4cb.isConfObj==true){
return;
}
return ColdFusion.Window.createJSObj(_4c4,url,_4ca);
};
ColdFusion.Window.createHTML=function(_4cc,_4cd,url,_4cf,_4d0){
var _4d1=null;
var _4d2=null;
if(_4cf&&_4cf.divid){
_4d1=document.getElementById(_4cf.divid);
}
if(_4d1==null){
_4d1=document.createElement("div");
_4d2="cf_window"+ColdFusion.Window.windowIdCounter;
ColdFusion.Window.windowIdCounter++;
_4d1.id=_4d2;
_4d1.className="x-hidden";
}
var _4d3=false;
var _4d4=null;
if(_4cf!=null&&typeof (_4cf.headerstyle)!="undefined"&&_4cf.headerstyle!=null){
var _4d5=new String(_4cf.headerstyle);
_4d5=_4d5.toLowerCase();
var _4d6=_4d5.indexOf("background-color");
if(_4d6>=0){
_4d3=true;
var _4d7=_4d5.indexOf(";",_4d6+17);
if(_4d7<0){
_4d7=_4d5.length;
}
_4d4=_4d5.substring(_4d6+17,_4d7);
}
}
var _4d8=document.getElementById(_4cc+"_title-html");
if(_4d3==true&&_4d4){
var _4d9="#"+_4cf.divid;
var _4da="NAME_ID .x-window-tc , NAME_ID .x-window-tl, NAME_ID .x-window-tr, NAME_ID .x-window-bc, NAME_ID .x-window-br, NAME_ID .x-window-bl,NAME_ID .x-window-ml, NAME_ID .x-window-mr { background-image: none; background-color: COLOR_ID; }";
var _4db=ColdFusion.Util.replaceAll(ColdFusion.Window.TITLE_BGCOLOR_TEMPLATE,"WINDOW_DIV_ID",_4d9);
var _4db=ColdFusion.Util.replaceAll(_4db,"COLOR_ID",_4d4);
Ext.util.CSS.createStyleSheet(_4db);
}
if(_4d8==null){
_4d8=document.createElement("div");
_4d8.id=_4cc+"_title-html";
var _4dc="x-window-header";
_4d8.className=_4dc;
if(_4cd){
_4d8.innerHTML=_4cd;
}else{
_4d8.innerHTML="&nbsp;";
}
}
var _4dd=document.getElementById(_4cc+"-body");
if(_4dd==null){
_4dd=document.createElement("div");
_4dd.id=_4cc+"-body";
_4d1.appendChild(_4dd);
}
var _4de;
_4de=ColdFusion.Window.getUpdatedConfigObj(_4cf,_4cc);
if(_4cf){
_4de.header={style:_4cf.headerstyle};
}
if(typeof (_4de)=="undefined"){
_4d1.innerHTML="";
return;
}
if(_4d2){
_4de.divid=_4d2;
}
_4de.title=_4cd;
if(typeof (_4de.initshow)!="undefined"&&_4de.initshow===false){
_4de.url=url;
ColdFusion.objectCache[_4cc]=_4de;
ColdFusion.objectCache[_4cc+"-body"]=_4de;
}
_4de.items=[{html:_4d1.innerHTML}];
return _4de;
};
ColdFusion.Window.createJSObj=function(_4df,url,_4e1){
var _4e2;
var _4e3=false;
if(typeof (_4e1.childlayoutid)&&_4e1.childlayoutid!=null){
_4e3=true;
_4e1.layout="border";
_4e1.items=ColdFusion.objectCache[_4e1.childlayoutid];
}else{
var elem=document.getElementById(_4df+"-body");
if(elem){
elem.parentNode.removeChild(elem);
}
_4e1.layout="fit";
}
if(typeof (_4e1.autoScroll)=="undefined"){
_4e1.autoScroll=true;
}
if(_4e1.onShow){
_4e1._cf_onShow=_4e1.onShow;
_4e1.onShow=null;
}
if(_4e1.onHide){
_4e1._cf_onHide=_4e1.onHide;
_4e1.onHide=null;
}
_4e2=new Ext.Window(_4e1);
_4e2.show();
_4e2.hide();
_4e2.cfwindowname=_4df;
_4e2.tempx=_4e1.tempx;
_4e2.tempy=_4e1.tempy;
_4e2.divid=_4e1.divid;
if(typeof (_4e1.headerstyle)!="undefined"&&_4e1.headerstyle!=null){
var _4e5=document.getElementById(_4df+"_title");
_4e5=_4e5||document.getElementById(_4e2.id+"_header_hd-textEl");
if(_4e5!=null){
_4e5.style.cssText="background:none;"+_4e1.headerstyle;
}
}
if(typeof (_4e1.bodystyle)!="undefined"&&_4e1.bodystyle!=null){
var _4e6=document.getElementById(_4df+"-body");
if(_4e6){
var _4e7=_4e6.parentNode;
}
if(_4e7!=null){
_4e7.style.cssText=_4e1.bodystyle;
}
}
_4e2.isConfObj=false;
_4e2._cf_body=_4df+"-body";
ColdFusion.objectCache[_4df]=_4e2;
if(_4e3){
var _4e8=_4e2.getLayout();
var _4e9=ColdFusion.objectCache[_4e1.childlayoutid];
}
_4e2.addListener("beforeclose",ColdFusion.Window.beforeCloseHandler);
var _4ea=null;
if(typeof (url)!="undefined"&&url!=""){
_4ea=url;
}
if(_4ea==null){
if(typeof (_4e1.initshow)=="undefined"||_4e1.initshow==true){
_4e2.addListener("beforeshow",ColdFusion.Window.beforeShowHandler);
ColdFusion.Window.showandhide(_4e2,_4e1);
}
return;
}
ColdFusion.objectCache[_4df+"-body"]=_4e2;
if(typeof (_4e1.callfromtag)=="undefined"){
var _4eb;
var _4ec;
_4e2._cf_visible=false;
_4e2._cf_dirtyview=true;
_4e2.addListener("show",ColdFusion.Window.showHandler);
_4e2.addListener("hide",ColdFusion.Window.hideHandler);
_4e2.url=_4ea;
if(_4e1){
if(typeof (_4e1.initshow)=="undefined"||_4e1.initshow==true){
ColdFusion.Window.showandhide(_4e2,_4e1);
}
_4eb=_4e1.callbackHandler;
_4ec=_4e1.errorHandler;
}
}else{
_4e2.callfromtag=true;
_4e2._cf_visible=false;
_4e2._cf_dirtyview=true;
_4e2.addListener("show",ColdFusion.Window.showHandler);
_4e2.addListener("beforeshow",ColdFusion.Window.beforeShowHandler);
_4e2.addListener("hide",ColdFusion.Window.hideHandler);
if(typeof (_4e1.initshow)=="undefined"||_4e1.initshow==true){
ColdFusion.Window.showandhide(_4e2,_4e1);
}
}
var body=document.getElementById(_4df+"-body");
if(body){
body.style.width="100%";
body.style.height="100%";
}
var _4ee=body.parentNode.parentNode.parentNode;
if(_4ee){
_4ee.style.overflow="auto";
}
var _4ef=document.getElementsByClassName("x-window-bodywrap");
if(typeof (_4ef)!="undefined"){
for(var i=0;i<_4ef.length;i++){
var elem=_4ef[i].firstChild;
elem.style.overflow="hidden";
}
}
};
ColdFusion.Window.showandhide=function(_4f1,_4f2){
if(typeof (_4f2.tempinitshow)!="undefined"&&_4f2.tempinitshow==false){
var _4f3=Ext.Element.get(_4f1.divid);
if(typeof _4f3!="undefined"&&_4f3){
_4f3.show();
_4f3.hide();
}
}else{
if(_4f1){
_4f1.show();
}
}
};
ColdFusion.Window.destroy=function(_4f4,_4f5){
if(_4f4){
var _4f6=ColdFusion.Window.getWindowObject(_4f4);
if(_4f6){
if(_4f5===true){
_4f6.destroy(true);
}else{
_4f6.destroy();
}
ColdFusion.objectCache[_4f4]=null;
}
}
};
ColdFusion.Window.resizeHandler=function(_4f7,_4f8,_4f9){
if(typeof (_4f7.fixedcenter)!="undefined"&&_4f7.fixedcenter==true){
_4f7.center();
}
};
ColdFusion.Window.beforeShowHandler=function(_4fa){
if(typeof (_4fa.fixedcenter)!="undefined"&&_4fa.fixedcenter==true){
_4fa.center();
}
};
ColdFusion.Window.beforeCloseHandler=function(_4fb){
if(_4fb.destroyonclose!="undefined"&&_4fb.destroyonclose==true){
ColdFusion.objectCache[_4fb.cfwindowname]=null;
return true;
}else{
_4fb.hide();
return false;
}
};
ColdFusion.Window.showHandler=function(_4fc){
_4fc._cf_visible=true;
if(_4fc._cf_dirtyview){
if(typeof (_4fc.callfromtag)=="undefined"){
ColdFusion.Ajax.replaceHTML(_4fc._cf_body,_4fc.url,"GET",null,_4fc.callbackHandler,_4fc.errorHandler);
}else{
var _4fd=ColdFusion.bindHandlerCache[_4fc._cf_body];
if(_4fd){
_4fd();
}
}
_4fc._cf_dirtyview=false;
}
};
ColdFusion.Window.hideHandler=function(_4fe){
_4fe._cf_visible=false;
if(_4fe._cf_refreshOnShow){
_4fe._cf_dirtyview=true;
}
};
ColdFusion.Window.xPosition=50;
ColdFusion.Window.yPosition=50;
ColdFusion.Window.resetHTML=function(_4ff){
var _500=document.getElementById(_4ff);
if(_500){
_500.innerHTML="";
}
};
ColdFusion.Window.getUpdatedConfigObj=function(_501,_502){
var _503={};
if(_501!=null){
if(typeof (_501)!="object"){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidconfig","widget",[_502],null,null,true);
return;
}
for(var key in _501){
if(key=="center"&&ColdFusion.Util.isBoolean(_501["center"])){
_503["fixedcenter"]=_501["center"];
}else{
_503[key]=_501[key];
}
}
}
if(typeof (_503.initshow)!="undefined"){
if(ColdFusion.Util.isBoolean(_503.initshow)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidinitshow","widget",[_502],null,null,true);
return;
}else{
_503.initshow=ColdFusion.Util.castBoolean(_503.initshow);
_503._cf_visible=_503.initshow;
}
}
_503.tempcenter=null;
if(typeof (_503.fixedcenter)!="undefined"){
if(ColdFusion.Util.isBoolean(_503.fixedcenter)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidcenter","widget",[_502],null,null,true);
return;
}else{
_503.fixedcenter=ColdFusion.Util.castBoolean(_503.fixedcenter);
}
}
if(typeof (_503.resizable)!="undefined"){
if(ColdFusion.Util.isBoolean(_503.resizable)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidresizable","widget",[_502],null,null,true);
return;
}else{
_503.resizable=ColdFusion.Util.castBoolean(_503.resizable);
}
}
if(typeof (_503.draggable)!="undefined"){
if(ColdFusion.Util.isBoolean(_503.draggable)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invaliddraggable","widget",[_502],null,null,true);
return;
}else{
_503.draggable=ColdFusion.Util.castBoolean(_503.draggable);
}
}
if(typeof (_503.closable)!="undefined"){
if(ColdFusion.Util.isBoolean(_503.closable)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidclosable","widget",[_502],null,null,true);
return;
}else{
_503.closable=ColdFusion.Util.castBoolean(_503.closable);
}
}
if(typeof (_503.modal)!="undefined"){
if(ColdFusion.Util.isBoolean(_503.modal)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidmodal","widget",[_502],null,null,true);
return;
}else{
_503.modal=ColdFusion.Util.castBoolean(_503.modal);
}
}
if(typeof (_503.refreshonshow)!="undefined"){
if(ColdFusion.Util.isBoolean(_503.refreshonshow)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidrefreshonshow","widget",[_502],null,null,true);
return;
}else{
_503._cf_refreshOnShow=ColdFusion.Util.castBoolean(_503.refreshonshow);
}
}
_503.shadow=true;
if(!_503.height){
_503.height=300;
}else{
if(ColdFusion.Util.isInteger(_503.height)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidheight","widget",[_502],null,null,true);
return;
}
}
if(!_503.width){
_503.width=500;
}else{
if(ColdFusion.Util.isInteger(_503.width)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidwidth","widget",[_502],null,null,true);
return;
}
}
var _505=false;
if(_503.minwidth){
if(ColdFusion.Util.isInteger(_503.minwidth)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminwidth","widget",[_502],null,null,true);
return;
}
var _506=_503.minwidth;
var _507=_503.width;
if(typeof (_506)!="number"){
_506=parseInt(_506);
}
if(typeof (_507)!="number"){
_507=parseInt(_507);
}
if(_506>_507){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminwidth","widget",[_502],null,null,true);
return;
}
_503.minWidth=_503.minwidth;
_505=true;
}
if(_503.minheight){
if(ColdFusion.Util.isInteger(_503.minheight)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminheight","widget",[_502],null,null,true);
return;
}
var _508=_503.minheight;
var _509=_503.height;
if(typeof (_508)!="number"){
_508=parseInt(_508);
}
if(typeof (_509)!="number"){
_509=parseInt(_509);
}
if(_508>_509){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidheightvalue","widget",[_502],null,null,true);
return;
}
_503.minHeight=_503.minheight;
_505=true;
}
if(_503.x){
if(ColdFusion.Util.isInteger(_503.x)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidx","widget",[_502],null,null,true);
return;
}
}
if(_503.y){
if(ColdFusion.Util.isInteger(_503.y)==false){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidy","widget",[_502],null,null,true);
return;
}
}
if(typeof (_503.x)=="undefined"&&(typeof (_503.fixedcenter)=="undefined"||_503.fixedcenter==false)){
_503.x=ColdFusion.Window.xPosition;
ColdFusion.Window.xPosition+=15;
}
if(typeof (_503.y)=="undefined"&&(typeof (_503.fixedcenter)=="undefined"||_503.fixedcenter==false)){
_503.y=ColdFusion.Window.yPosition;
ColdFusion.Window.yPosition+=15;
}
if(typeof (_503.initshow)!="undefined"&&_503.initshow===false){
_503.tempinitshow=false;
if(typeof (_503.fixedcenter)!="undefined"&&_503.fixedcenter===true){
_503.tempcenter=_503.fixedcenter;
_503.fixedcenter=null;
}else{
_503.tempx=_503.x;
_503.tempy=_503.y;
}
_503.x=-10000;
_503.y=-10000;
}
_503.constraintoviewport=true;
_503.initshow=true;
if(_503.resizable!=null&&_503.resizable==false&&_505==true){
ColdFusion.Window.resetHTML(_502);
ColdFusion.handleError(null,"window.getupdatedconfigobject.minhwnotallowed","widget",[_502],null,null,true);
return;
}
_503.collapsible=false;
_503.shadow=true;
_503.isConfObj=true;
return _503;
};
ColdFusion.Window.show=function(_50a){
var _50b=ColdFusion.objectCache[_50a];
if(typeof (_50b)!="undefined"&&_50b!=null){
if(typeof (_50b.isConfObj)!="undefined"&&_50b.isConfObj==true){
_50b.initshow=true;
var _50c=ColdFusion.Window.createHTML(_50a,null,_50b.url,_50b,true);
ColdFusion.Window.createJSObj(_50a,_50b.url,_50c);
}else{
if(_50b.isVisible()==false){
_50b.show();
ColdFusion.Log.info("window.show.shown","widget",[_50a]);
}
if(_50b.tempcenter!=null){
_50b.center();
_50b.tempcenter=null;
}else{
if(_50b.getEl()&&_50b.getEl().getX()>0&&_50b.getEl().getY()>0){
_50b.tempx=null;
_50b.tempy=null;
}else{
if(_50b.tempx!=null&&_50b.tempy!=null){
_50b.setPosition(_50b.tempx,_50b.tempy);
_50b.tempx=null;
_50b.tempy=null;
}else{
var x=_50b.getEl().getX();
var y=_50b.getEl().getY();
_50b.setPosition(x+1,y+1);
_50b.setPosition(x,y);
}
}
}
}
}else{
ColdFusion.handleError(null,"window.show.notfound","widget",[_50a],null,null,true);
}
};
ColdFusion.Window.hide=function(_50f){
var _510=ColdFusion.objectCache[_50f];
if(_510){
if(_510.isVisible&&_510.isVisible()==true){
_510.hide();
ColdFusion.Log.info("window.hide.hidden","widget",[_50f]);
}
}else{
ColdFusion.handleError(null,"window.hide.notfound","widget",[_50f],null,null,true);
}
};
ColdFusion.Window.onShow=function(_511,_512){
var _513=ColdFusion.objectCache[_511];
if(typeof (_513)!="undefined"&&_513!=null){
_513._cf_onShow=_512;
if(_513.addListener){
_513.addListener("show",ColdFusion.Window.onShowWrapper);
}
}else{
ColdFusion.handleError(null,"window.onshow.notfound","widget",[_511],null,null,true);
}
};
ColdFusion.Window.onShowWrapper=function(_514){
_514._cf_onShow.call(null,_514.cfwindowname);
};
ColdFusion.Window.onHide=function(_515,_516){
var _517=ColdFusion.objectCache[_515];
if(typeof (_517)!="undefined"&&_517!=null){
_517._cf_onHide=_516;
if(_517.addListener){
_517.addListener("hide",ColdFusion.Window.onHideWrapper);
}
}else{
ColdFusion.handleError(null,"window.onhide.notfound","widget",[_515],null,null,true);
}
};
ColdFusion.Window.onHideWrapper=function(_518){
_518._cf_onHide.call(null,_518.cfwindowname);
};
ColdFusion.Window.getWindowObject=function(_519){
if(!_519){
ColdFusion.handleError(null,"window.getwindowobject.emptyname","widget",null,null,null,true);
return;
}
var _51a=ColdFusion.objectCache[_519];
if(_51a==null||(typeof (_51a.isConfObj)=="undefined"&&Ext.Window.prototype.isPrototypeOf(_51a)==false)){
ColdFusion.handleError(null,"window.getwindowobject.notfound","widget",[_519],null,null,true);
return;
}
if(typeof (_51a.isConfObj)!="undefined"&&_51a.isConfObj==true){
_51a.initshow=true;
var _51b=ColdFusion.Window.createHTML(_519,null,_51a.url,_51a,true);
ColdFusion.Window.createJSObj(_519,_51a.url,_51b);
ColdFusion.Window.hide(_519);
_51a=ColdFusion.objectCache[_519];
}
return _51a;
};
