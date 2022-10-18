/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Tree){
ColdFusion.Tree={};
}
ColdFusion.Tree.AttributesCollection=function(){
this.cache=true;
this.fontname=null;
this.bold=false;
this.italic=false;
this.completepath=false;
this.appendkey=false;
this.delimiter=null;
this.formname=null;
this.fontsize=null;
this.formparamname=null;
this.prevspanid=null;
this.prevspanbackground=null;
this.images={};
this.images.folder=_cf_ajaxscriptsrc+"/resources/cf/images/FolderClose.gif";
this.images.cd=_cf_ajaxscriptsrc+"/resources/cf/images/Cd.png";
this.images.computer=_cf_ajaxscriptsrc+"/resources/cf/images/Computer.png";
this.images.document=_cf_ajaxscriptsrc+"/resources/cf/images/Document.gif";
this.images.element=_cf_ajaxscriptsrc+"/resources/cf/images/Elements.png";
this.images.floppy=_cf_ajaxscriptsrc+"/resources/cf/images/Floppy.png";
this.images.fixed=_cf_ajaxscriptsrc+"/resources/cf/images/HardDrive.png";
this.images.remote=_cf_ajaxscriptsrc+"/resources/cf/images/NetworkDrive.png";
this.imagesopen={};
this.imagesopen.folder=_cf_ajaxscriptsrc+"/resources/cf/images/FolderOpen.gif";
this.imagesopen.cd=_cf_ajaxscriptsrc+"/resources/cf/images/Cd.png";
this.imagesopen.computer=_cf_ajaxscriptsrc+"/resources/cf/images/Computer.png";
this.imagesopen.document=_cf_ajaxscriptsrc+"/resources/cf/images/Document.gif";
this.imagesopen.element=_cf_ajaxscriptsrc+"/resources/cf/images/Elements.png";
this.imagesopen.floppy=_cf_ajaxscriptsrc+"/resources/cf/images/Floppy.png";
this.imagesopen.fixed=_cf_ajaxscriptsrc+"/resources/cf/images/HardDrive.png";
this.imagesopen.remote=_cf_ajaxscriptsrc+"/resources/cf/images/NetworkDrive.png";
this.eventcount=0;
this.eventHandlers=new Array();
this.nodeCounter=0;
};
ColdFusion.Tree.refresh=function(_2d5){
var tree=ColdFusion.objectCache[_2d5];
var _2d7=ColdFusion.objectCache[_2d5+"collection"];
if(!tree||YAHOO.widget.TreeView.prototype.isPrototypeOf(tree)==false){
ColdFusion.handleError(null,"tree.refresh.notfound","widget",[_2d5],null,null,true);
return;
}
if(!_2d7.dynLoadFunction){
ColdFusion.Log.info("tree.refresh.statictree","widget");
return;
}
_2d7.dynLoadFunction.call(null,tree.getRoot());
ColdFusion.Log.info("tree.refresh.success","widget",[_2d5]);
};
ColdFusion.Tree.getTreeObject=function(_2d8){
if(!_2d8){
ColdFusion.handleError(null,"tree.gettreeobject.emptyname","widget",null,null,null,true);
return;
}
var _2d9=ColdFusion.objectCache[_2d8];
if(_2d9==null||YAHOO.widget.TreeView.prototype.isPrototypeOf(_2d9)==false){
ColdFusion.handleError(null,"tree.gettreeobject.notfound","widget",[_2d8],null,null,true);
return;
}
return _2d9;
};
ColdFusion.Tree.loadNodes=function(_2da,_2db){
var i=0;
var _2dd=ColdFusion.objectCache[_2db.treeid+"collection"];
var tree=ColdFusion.objectCache[_2db.treeid];
var _2df;
var _2e0=false;
if(_2da&&typeof (_2da.length)=="number"&&!_2da.toUpperCase){
if(_2da.length>0&&typeof (_2da[0])!="object"){
_2e0=true;
}
}else{
_2e0=true;
}
if(_2e0){
ColdFusion.handleError(tree.onbinderror,"tree.loadnodes.invalidbindvalue","widget",[_2db.treeid]);
return;
}
if(_2db.parent&&!_2db.parent.isRoot()){
tree.removeChildren(_2db.parent);
}else{
if(_2db.parent&&_2db.parent.hasChildren()){
tree.removeChildren(_2db.parent);
_2db.parent=tree.getRoot();
}
}
if(!_2db.parent.leafnode){
for(i=0;i<_2da.length;i++){
var _2e1=_2dd.nodeCounter++;
var node={};
node.id=_2da[i].VALUE;
if(typeof (_2da[i].DISPLAY)==undefined||_2da[i].DISPLAY==null){
node.label=_2da[i].VALUE;
}else{
node.label=_2da[i].DISPLAY;
}
node.expand=_2da[i].EXPAND;
node.appendkey=_2da[i].APPENDKEY;
node.href=_2da[i].HREF;
node.img=_2da[i].IMG;
node.imgOpen=_2da[i].IMGOPEN;
node.imgid="_cf_image"+_2e1;
node.spanid="_cf_span"+_2e1;
node.target=_2da[i].TARGET;
if(_2dd.appendkey&&_2dd.appendkey==true&&node.href){
var _2e3=new String(node.href);
_2e3=_2e3.toLowerCase();
if(_2e3.indexOf("javascript")<0){
if(_2e3.indexOf("?")>=0){
node.href=_2da[i].HREF+"&";
}else{
node.href=_2da[i].HREF+"?";
}
node.href=node.href+"CFTREEITEMKEY="+node.id;
}
}
var _2e4="";
if(node.img){
if(_2dd.images[node.img]){
_2e4="<img src='"+_2dd.images[node.img]+"' id='"+node.imgid+"' style='border:0'/>&nbsp;";
}else{
_2e4="<img src='"+node.img+"' id='"+node.imgid+"' style='border:0'/>&nbsp;";
}
}
if(_2dd.fontname||_2dd.italic==true||_2dd.bold==true||_2dd.fontsize){
_2e4=_2e4+"<span id='"+node.spanid+"' style='";
if(_2dd.fontname){
_2e4=_2e4+"font-family:"+_2dd.fontname+";";
}
if(_2dd.italic==true){
_2e4=_2e4+"font-style:italic;";
}
if(_2dd.bold==true){
_2e4=_2e4+"font-weight:bold;";
}
if(_2dd.fontsize){
_2e4=_2e4+"font-size:"+_2dd.fontsize+";";
}
_2e4=_2e4+"'>"+node.label+"</span>";
node.label=_2e4;
}else{
node.label=_2e4+"<span id='"+node.spanid+"'  >"+node.label+"</span>";
}
node.childrenFetched=false;
var _2e5=new YAHOO.widget.TextNode(node,_2db.parent,false);
var _2e6=false;
if(_2da[i].LEAFNODE&&_2da[i].LEAFNODE==true){
_2e6=true;
_2e5.leafnode=true;
_2e5.iconMode=1;
}
if(_2e6==true||(node.expand&&node.expand==true)){
_2e5.expand();
}
}
}
if(!_2db.parent.isRoot()){
_2db.parent.data.childrenFetched=true;
}
if(_2db.onCompleteCallBack){
_2db.onCompleteCallBack.call();
}else{
_2db.parent.tree.draw();
}
ColdFusion.Log.info("tree.loadnodes.success","widget",[_2db.treeid]);
};
ColdFusion.Tree.onExpand=function(node){
if(node.isRoot()){
return;
}
var _2e8=ColdFusion.objectCache[node.tree.id+"collection"];
if(node.data.imgOpen&&typeof (node.leafnode)=="undefined"){
var _2e9=ColdFusion.DOM.getElement(node.data.imgid,node.tree.id);
var src;
if(_2e8.imagesopen[node.data.imgOpen]){
src=_2e8.imagesopen[node.data.imgOpen];
}else{
src=node.data.imgOpen;
}
_2e9.src=src;
}
if(_2e8.cache==false&&node.data.childrenFetched==false&&_2e8.dynLoadFunction){
node.tree.removeChildren(node);
}
};
ColdFusion.Tree.onCollapse=function(node){
if(node.isRoot()){
return;
}
var _2ec=ColdFusion.objectCache[node.tree.id+"collection"];
if(node.data.img){
var _2ed=ColdFusion.DOM.getElement(node.data.imgid,node.tree.id);
var src;
if(_2ec.images[node.data.img]){
src=_2ec.images[node.data.img];
}else{
src=node.data.img;
}
_2ed.src=src;
}
node.data.childrenFetched=false;
};
ColdFusion.Tree.formPath=function(node,_2f0){
var _2f1=ColdFusion.objectCache[node.tree.id+"collection"];
if(_2f1.completepath==true&&node.isRoot()){
return "";
}else{
if(_2f1.completepath==false&&node.parent.isRoot()){
return "";
}
}
if(!_2f0){
_2f0=node;
}
var _2f2=ColdFusion.Tree.formPath(node.parent,_2f0);
_2f2=_2f2+node.data.id;
if(_2f0.data.id!=node.data.id){
_2f2=_2f2+_2f1.delimiter;
}
return _2f2;
};
ColdFusion.Tree.onLabelClick=function(node){
var _2f4="";
var _2f5=ColdFusion.objectCache[node.tree.id+"collection"];
var _2f4=ColdFusion.Tree.formPath(node);
if(_2f5.prevspanid){
var _2f6=ColdFusion.DOM.getElement(_2f5.prevspanid,node.tree.id);
if(_2f6.style){
_2f6.style.backgroundColor=_2f5.prevspanbackground;
}
}
var _2f7=ColdFusion.DOM.getElement(node.data.spanid,node.tree.id);
if(_2f7&&_2f7.style){
_2f5.prevspanbackground=_2f7.style.backgroundColor;
}
_2f7.style.backgroundColor="lightblue";
_2f5.prevspanid=node.data.spanid;
node.tree._cf_path=_2f4;
node.tree._cf_node=node.data.id;
var val="PATH="+_2f4+"; NODE="+node.data.id;
updateHiddenValue(val,_2f5.formname,_2f5.formparamname);
ColdFusion.Tree.fireSelectionChangeEvent(node.tree.id,_2f5.formname);
};
ColdFusion.Tree.fireSelectionChangeEvent=function(id,_2fa){
ColdFusion.Log.info("tree.fireselectionchangeevent.fire","widget",[id]);
ColdFusion.Event.callBindHandlers(id,_2fa,"change");
};
ColdFusion.Tree.getObject=function(_2fb){
var _2fc={};
_2fc.id=_2fb.value;
if(_2fb.href&&_2fb.href!="null"){
_2fc.href=_2fb.href;
}
_2fc.target=_2fb.target;
_2fc.label=_2fb.label;
_2fc.display=_2fb.display;
_2fc.img=_2fb.img;
_2fc.imgOpen=_2fb.imgOpen;
_2fc.imgid=_2fb.imgid;
_2fc.spanid=_2fb.spanid;
_2fc.childrenfetched=_2fb.childrenfetched;
return _2fc;
};
ColdFusion.Tree.initializeTree=function(_2fd,_2fe,_2ff,bold,_301,_302,_303,_304,_305,_306,_307,_308){
var _309=new YAHOO.widget.TreeView(_2fd);
_309.subscribe("expand",ColdFusion.Tree.onExpand);
_309.subscribe("collapse",ColdFusion.Tree.onCollapse);
_309.subscribe("labelClick",ColdFusion.Tree.onLabelClick);
_309._cf_getAttribute=function(_30a){
_30a=_30a.toUpperCase();
if(_30a=="PATH"){
return _309._cf_path;
}else{
if(_30a=="NODE"){
return _309._cf_node;
}else{
return null;
}
}
};
_309.onbinderror=_306;
ColdFusion.objectCache[_2fd]=_309;
var _30b=new ColdFusion.Tree.AttributesCollection();
_30b.cache=_2fe;
_30b.italic=_2ff;
_30b.bold=bold;
_30b.completepath=_301;
_30b.delimiter=_303;
_30b.appendkey=_302;
_30b.formname=_304;
_30b.formparamname=_305;
_30b.fontsize=_307;
_30b.fontname=_308;
ColdFusion.objectCache[_2fd+"collection"]=_30b;
ColdFusion.Log.info("tree.initializetree.success","widget",[_2fd]);
return _309;
};
