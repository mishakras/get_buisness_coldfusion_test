/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Layout){
ColdFusion.Layout={};
}
var ACCORDION_TITLE_ICON_CSS_TEMPLATE=".{0} { background-image:url({1}); }";
if(!ColdFusion.MapVsAccordion){
ColdFusion.MapVsAccordion={};
}
ColdFusion.Layout.initializeTabLayout=function(id,_81e,_81f,_820,_821){
Ext.QuickTips.init();
var _822;
if(_81f){
_822={renderTo:id,height:_81f};
}else{
_822={renderTo:id,autoHeight:true};
}
if(_820&&_820!="undefined"){
_822.width=_820;
}else{
_822.autoWidth=true;
}
if(_81e){
_822.tabPosition="bottom";
}else{
_822.enableTabScroll=true;
}
_822.plain=!_821;
var _823=new Ext.tab.Panel(_822);
ColdFusion.objectCache[id]=_823;
return _823;
};
ColdFusion.Layout.getTabLayout=function(_824){
var _825=ColdFusion.objectCache[_824];
if(!_825||!(_825 instanceof Ext.TabPanel)){
ColdFusion.handleError(null,"layout.gettablayout.notfound","widget",[_824],null,null,true);
}
return _825;
};
ColdFusion.Layout.onTabActivate=function(tab){
tab._cf_visible=true;
if(tab._cf_dirtyview){
var _827=ColdFusion.bindHandlerCache[tab._cf_body];
if(_827){
_827();
}
tab._cf_dirtyview=false;
}
};
ColdFusion.Layout.onTabDeactivate=function(tab){
tab._cf_visible=false;
if(tab._cf_refreshOnActivate){
tab._cf_dirtyview=true;
}
};
ColdFusion.Layout.onTabClose=function(tab){
tab._cf_visible=false;
};
ColdFusion.Layout.addTab=function(_82a,_82b,name,_82d,_82e,_82f,_830,_831,_832){
if(_82e!=null&&_82e.length==0){
_82e=null;
}
var _833=_82a.initialConfig.autoHeight;
if(typeof _833=="undefined"){
_833=false;
}
var _834=Ext.getCmp(name);
if(_834){
alert("Component with the name "+name+" already exists. Please use unique names for all the components. Layout will not be rendered");
return;
}
_834=new Ext.Panel({title:_82d,contentEl:_82b,_cf_body:_82b,id:name,closable:_82f,tabTip:_82e,autoScroll:_832,autoShow:true,autoHeight:_833});
var tab=_82a.add(_834);
if(_831){
_834.setDisabled(true);
}
tab._cf_visible=false;
tab._cf_dirtyview=true;
tab._cf_refreshOnActivate=_830;
tab.addListener("activate",ColdFusion.Layout.onTabActivate);
tab.addListener("deactivate",ColdFusion.Layout.onTabDeactivate);
tab.addListener("close",ColdFusion.Layout.onTabClose);
ColdFusion.objectCache[name]=tab;
var _836=tab.height;
if(_836&&_836>1){
var _837=document.getElementById(_82b);
_837.style.height=_836;
}
};
ColdFusion.Layout.enableTab=function(_838,_839){
var _83a=ColdFusion.objectCache[_838];
var _83b=ColdFusion.objectCache[_839];
if(_83a&&(_83a instanceof Ext.TabPanel)&&_83b){
_83b.setDisabled(false);
ColdFusion.Log.info("layout.enabletab.enabled","widget",[_839,_838]);
}else{
ColdFusion.handleError(null,"layout.enabletab.notfound","widget",[_838],null,null,true);
}
};
ColdFusion.Layout.disableTab=function(_83c,_83d){
var _83e=ColdFusion.objectCache[_83c];
var _83f=ColdFusion.objectCache[_83d];
if(_83e&&(_83e instanceof Ext.TabPanel)&&_83f){
_83f.setDisabled(true);
ColdFusion.Log.info("layout.disabletab.disabled","widget",[_83d,_83c]);
}else{
ColdFusion.handleError(null,"layout.disabletab.notfound","widget",[_83c],null,null,true);
}
};
ColdFusion.Layout.selectTab=function(_840,_841){
var _842=ColdFusion.objectCache[_840];
var tab=ColdFusion.objectCache[_841];
if(_842&&(_842 instanceof Ext.TabPanel)&&tab){
_842.setActiveTab(tab);
ColdFusion.Log.info("layout.selecttab.selected","widget",[_841,_840]);
}else{
ColdFusion.handleError(null,"layout.selecttab.notfound","widget",[_840],null,null,true);
}
};
ColdFusion.Layout.hideTab=function(_844,_845){
var _846=ColdFusion.objectCache[_844];
if(_846&&(_846 instanceof Ext.TabPanel)){
var _847=ColdFusion.objectCache[_845];
var _848=false;
if(_847){
if(_846.getActiveTab()&&_846.getActiveTab().getId()==_845){
var i;
for(i=0;i<_846.items.length;i++){
var _84a=_846.getComponent(i);
if(_84a.hidden==false){
_848=true;
_84a.show();
break;
}
}
if(_848==false){
document.getElementById(_845).style.display="none";
}
}
_847.tab.hide();
ColdFusion.Log.info("layout.hidetab.hide","widget",[_845,_844]);
}
}else{
ColdFusion.handleError(null,"layout.hidetab.notfound","widget",[_844],null,null,true);
}
};
ColdFusion.Layout.showTab=function(_84b,_84c){
var _84d=ColdFusion.objectCache[_84b];
var _84e=ColdFusion.objectCache[_84c];
if(_84d&&(_84d instanceof Ext.TabPanel)&&_84e){
_84e.tab.show();
ColdFusion.Log.info("layout.showtab.show","widget",[_84c,_84b]);
}else{
ColdFusion.handleError(null,"layout.showtab.notfound","widget",[_84b],null,null,true);
}
};
ColdFusion.Layout.disableSourceBind=function(_84f){
var _850=ColdFusion.objectCache[_84f];
if(_850==null||_850=="undefined"){
ColdFusion.handleError(null,"layout.disableSourceBind.notfound","widget",[_84f],null,null,true);
}
_850._cf_dirtyview=false;
};
ColdFusion.Layout.enableSourceBind=function(_851){
var _852=ColdFusion.objectCache[_851];
if(_852==null||_852=="undefined"){
ColdFusion.handleError(null,"layout.enableSourceBind.notfound","widget",[_851],null,null,true);
}
_852._cf_dirtyview=true;
};
ColdFusion.Layout.createTab=function(_853,_854,_855,_856,_857){
var _858=ColdFusion.objectCache[_853];
var _859=_854;
if(_853&&typeof (_853)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidname","widget",null,null,null,true);
return;
}
if(!_853||ColdFusion.trim(_853)==""){
ColdFusion.handleError(null,"layout.createtab.emptyname","widget",null,null,null,true);
return;
}
if(_854&&typeof (_854)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidareaname","widget",null,null,null,true);
return;
}
if(!_854||ColdFusion.trim(_854)==""){
ColdFusion.handleError(null,"layout.createtab.emptyareaname","widget",null,null,null,true);
return;
}
if(_855&&typeof (_855)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidtitle","widget",null,null,null,true);
return;
}
if(!_855||ColdFusion.trim(_855)==""){
ColdFusion.handleError(null,"layout.createtab.emptytitle","widget",null,null,null,true);
return;
}
if(_856&&typeof (_856)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidurl","widget",null,null,null,true);
return;
}
if(!_856||ColdFusion.trim(_856)==""){
ColdFusion.handleError(null,"layout.createtab.emptyurl","widget",null,null,null,true);
return;
}
_854="cf_layoutarea"+_854;
if(_858&&(_858 instanceof Ext.TabPanel)){
var _85a=null;
var ele=document.getElementById(_854);
if(ele!=null){
ColdFusion.handleError(null,"layout.createtab.duplicateel","widget",[_854],null,null,true);
return;
}
var _85c=false;
var _85d=false;
var _85e=false;
var _85f=false;
var _860=false;
var _861=null;
if((_858.items.length<=0)){
_85e=true;
}
if(_857!=null){
if(typeof (_857)!="object"){
ColdFusion.handleError(null,"layout.createtab.invalidconfig","widget",null,null,null,true);
return;
}
if(typeof (_857.closable)!="undefined"&&_857.closable==true){
_85c=true;
}
if(typeof (_857.disabled)!="undefined"&&_857.disabled==true){
_85d=true;
}
if(typeof (_857.selected)!="undefined"&&_857.selected==true){
_85e=true;
}
if(typeof (_857.inithide)!="undefined"&&_857.inithide==true){
_85f=true;
}
if(typeof (_857.tabtip)!="undefined"&&_857.tabtip!=null){
_861=_857.tabtip;
}
}
var _862=document.getElementById(_853);
if(_862){
var _863=document.getElementById(_853);
var _864=document.createElement("div");
_864.id=_854;
_864.className="ytab";
if(_857!=null&&typeof (_857.align)!="undefined"){
_864.align=_857.align;
}
var _865="display:none";
if(_858.tabheight){
_865="height:"+_858.tabheight+";";
}
if(_857!=null&&typeof (_857.style)!="undefined"){
var _866=new String(_857.style);
_866=_866.toLowerCase();
_865=_865+_866;
}
if(_857!=null&&typeof (_857.overflow)!="undefined"){
var _867=new String(_857.overflow);
_867=_867.toLowerCase();
if(_867!="visible"&&_867!="auto"&&_867!="scroll"&&_867!="hidden"){
ColdFusion.handleError(null,"layout.createtab.invalidoverflow","widget",null,null,null,true);
return;
}
if(_867.toLocaleLowerCase()==="hidden"){
_860=false;
}
_865=_865+"overflow:"+_867+";";
}else{
_865=_865+"; overflow:auto;";
}
_864.style.cssText=_865;
_863.appendChild(_864);
}
ColdFusion.Layout.addTab(_858,_854,_859,_855,_861,_85c,false,_85d,_860);
ColdFusion.Log.info("layout.createtab.success","http",[_854,_853]);
if(_85e==true){
ColdFusion.Layout.selectTab(_853,_859);
}
if(_85f==true){
ColdFusion.Layout.hideTab(_853,_859);
}
if(_856!=null&&typeof (_856)!="undefined"&&_856!=""){
if(_856.indexOf("?")!=-1){
_856=_856+"&";
}else{
_856=_856+"?";
}
var _868;
var _869;
if(_857){
_868=_857.callbackHandler;
_869=_857.errorHandler;
}
ColdFusion.Ajax.replaceHTML(_854,_856,"GET",null,_868,_869);
}
}else{
ColdFusion.handleError(null,"layout.createtab.notfound","widget",[_853],null,null,true);
}
};
ColdFusion.Layout.getBorderLayout=function(_86a){
var _86b=ColdFusion.objectCache[_86a];
if(!_86b){
ColdFusion.handleError(null,"layout.getborderlayout.notfound","widget",[_86a],null,null,true);
}
return _86b;
};
ColdFusion.Layout.showArea=function(_86c,_86d){
var _86e=ColdFusion.Layout.convertPositionToDirection(_86d);
var _86f=ColdFusion.objectCache[_86c];
var _870;
if(_86f){
var _871=_86f.items;
for(var i=0;i<_871.getCount();i++){
var _873=_871.items[i];
if(_873 instanceof Ext.Panel&&_873.region==_86e){
_870=_873;
break;
}
}
if(_870){
_870.show();
_870.expand();
ColdFusion.Log.info("layout.showarea.shown","widget",[_86d,_86c]);
}else{
ColdFusion.handleError(null,"layout.showarea.areanotfound","widget",[_86d],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.showarea.notfound","widget",[_86c],null,null,true);
}
};
ColdFusion.Layout.hideArea=function(_874,_875){
var _876=ColdFusion.Layout.convertPositionToDirection(_875);
var _877=ColdFusion.objectCache[_874];
var _878;
if(_877){
var _879=_877.items;
for(var i=0;i<_879.getCount();i++){
var _87b=_879.items[i];
if(_87b instanceof Ext.Panel&&_87b.region==_876){
_878=_87b;
break;
}
}
if(_878){
_878.hide();
ColdFusion.Log.info("layout.hidearea.hidden","widget",[_875,_874]);
}else{
ColdFusion.handleError(null,"layout.hidearea.areanotfound","widget",[_875],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.hidearea.notfound","widget",[_874],null,null,true);
}
};
ColdFusion.Layout.collapseArea=function(_87c,_87d){
var _87e=ColdFusion.Layout.convertPositionToDirection(_87d);
var _87f=ColdFusion.objectCache[_87c];
var _880;
if(_87f){
var _881=_87f.items;
for(var i=0;i<_881.getCount();i++){
var _883=_881.items[i];
if(_883 instanceof Ext.Panel&&_883.region==_87e){
_880=_883;
break;
}
}
if(_880){
_880.collapse();
ColdFusion.Log.info("layout.collpasearea.collapsed","widget",[_87d,_87c]);
}else{
ColdFusion.handleError(null,"layout.collpasearea.areanotfound","widget",[_87d],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.collpasearea.notfound","widget",[_87d],null,null,true);
}
};
ColdFusion.Layout.expandArea=function(_884,_885){
var _886=ColdFusion.Layout.convertPositionToDirection(_885);
var _887=ColdFusion.objectCache[_884];
var _888;
if(_887){
var _889=_887.items;
for(var i=0;i<_889.getCount();i++){
var _88b=_889.items[i];
if(_88b instanceof Ext.Panel&&_88b.region==_886){
_888=_88b;
break;
}
}
if(_888){
_888.expand();
ColdFusion.Log.info("layout.expandarea.expanded","widget",[_885,_884]);
}else{
ColdFusion.handleError(null,"layout.expandarea.areanotfound","widget",[_885],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.expandarea.notfound","widget",[_885],null,null,true);
}
};
ColdFusion.Layout.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
if(typeof (value)==Object){
value=$G.printObject(value);
}
str+=value;
}
return str;
};
ColdFusion.Layout.InitAccordion=function(_88e,_88f,_890,_891,_892,_893,_894,_895){
var _896=false;
if(_890.toUpperCase()=="LEFT"){
_896=true;
}
if(_893==null||typeof (_893)=="undefined"){
_892=false;
}
var _897={activeOnTop:_88f,collapseFirst:_896,titleCollapse:_891,fill:_892};
var _898={renderTo:_88e,layoutConfig:_897,items:_895,layout:"accordion"};
if(_893==null||typeof (_893)=="undefined"){
_898.autoHeight=true;
_898.height=600;
}else{
_898.height=_893;
}
_898.flex=1;
if(_894==null||typeof (_894)=="undefined"){
_898.autoWidth=true;
}else{
_898.width=_894;
}
_898.align="stretch";
_898.preventRegister=true;
var _899=new Ext.Panel(_898);
ColdFusion.objectCache[_88e]=_899;
ColdFusion.Log.info("layout.accordion.initialized","widget",[_88e]);
return _899;
};
ColdFusion.Layout.InitAccordionChildPanel=function(_89a,_89b,_89c,_89d,_89e,_89f,_8a0,_8a1){
if(_89c==null||typeof (_89c)==undefined||_89c.length==0){
_89c="  ";
}
var _8a2={contentEl:_89a,id:_89b,title:_89c,collapsible:_89d,closable:_89e,autoScroll:_89f,_cf_body:_89a};
if(_8a0&&typeof _8a0=="string"){
_8a2.iconCls=_8a0;
}
_8a2.preventRegister=true;
var _8a3=new Ext.Panel(_8a2);
_8a3._cf_visible=false;
_8a3._cf_dirtyview=true;
_8a3._cf_refreshOnActivate=_8a1;
_8a3.on("expand",ColdFusion.Layout.onAccordionPanelExpand,this);
_8a3.on("collapse",ColdFusion.Layout.onAccordionPanelCollapse,this);
_8a3.on("hide",ColdFusion.Layout.onAccordionPanelHide,this);
_8a3.on("show",ColdFusion.Layout.onAccordionPanelExpand,this);
ColdFusion.objectCache[_89b]=_8a3;
ColdFusion.Log.info("layout.accordion.childinitialized","widget",[_89b]);
return _8a3;
};
ColdFusion.Layout.getAccordionLayout=function(_8a4){
var _8a5=ColdFusion.objectCache[_8a4];
if(!_8a5||!(_8a5 instanceof Ext.Panel)){
ColdFusion.handleError(null,"layout.getaccordionlayout.notfound","widget",[_8a4],null,null,true);
}
return _8a5;
};
ColdFusion.Layout.onAccordionPanelExpand=function(_8a6){
_8a6._cf_visible=true;
if(_8a6._cf_dirtyview){
var _8a7=ColdFusion.bindHandlerCache[_8a6._cf_body];
if(_8a7){
_8a7();
}
_8a6._cf_dirtyview=false;
}
var el=Ext.get(_8a6.contentEl);
el.move("left",1);
el.move("right",1);
var _8a9=ColdFusion.MapVsAccordion[_8a6._cf_body];
if(_8a9!=undefined){
var _8aa=$MAP.getMapPanelObject(_8a9);
if(_8aa!=undefined){
if(_8aa.initShow===true){
$MAP.show(_8a9);
}
}
}
};
ColdFusion.Layout.onAccordionPanelCollapse=function(_8ab){
_8ab._cf_visible=false;
if(_8ab._cf_refreshOnActivate){
_8ab._cf_dirtyview=true;
}
};
ColdFusion.Layout.onAccordionPanelHide=function(_8ac){
_8ac._cf_visible=false;
};
ColdFusion.Layout.hideAccordion=function(_8ad,_8ae){
var _8af=ColdFusion.objectCache[_8ad];
var _8b0=ColdFusion.objectCache[_8ae];
if(!_8af||!_8af instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.hideaccordion.layoutnotfound","widget",[_8ad],null,null,true);
}
if(!_8b0||!_8b0 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.hideaccordion.panelnotfound","widget",[_8ae],null,null,true);
}
_8b0.hide();
ColdFusion.Log.info("layout.hideaccordion.hidden","widget",[_8ae,_8ad]);
};
ColdFusion.Layout.showAccordion=function(_8b1,_8b2){
var _8b3=ColdFusion.objectCache[_8b1];
var _8b4=ColdFusion.objectCache[_8b2];
if(!_8b3||!_8b3 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.showaccordion.layoutnotfound","widget",[_8b1],null,null,true);
}
if(!_8b4||!_8b4 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.showaccordion.panelnotfound","widget",[_8b2],null,null,true);
}
_8b4.show();
ColdFusion.Log.info("layout.showaccordion.shown","widget",[_8b2,_8b1]);
};
ColdFusion.Layout.expandAccordion=function(_8b5,_8b6){
var _8b7=ColdFusion.objectCache[_8b5];
var _8b8=ColdFusion.objectCache[_8b6];
if(!_8b7||!_8b7 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.expandaccordion.layoutnotfound","widget",[_8b5],null,null,true);
}
if(!_8b8||!_8b8 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.expandaccordion.panelnotfound","widget",[_8b6],null,null,true);
}
_8b8.expand();
ColdFusion.Log.info("layout.expandaccordion.expanded","widget",[_8b6,_8b5]);
};
ColdFusion.Layout.selectAccordion=function(_8b9,_8ba){
return ColdFusion.Layout.expandAccordion(_8b9,_8ba);
};
ColdFusion.Layout.collapseAccordion=function(_8bb,_8bc){
var _8bd=ColdFusion.objectCache[_8bb];
var _8be=ColdFusion.objectCache[_8bc];
if(!_8bd||!_8bd instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.collapseaccordion.layoutnotfound","widget",[_8bb],null,null,true);
}
if(!_8be||!_8be instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.collapseaccordion.panelnotfound","widget",[_8bc],null,null,true);
}
_8be.collapse();
ColdFusion.Log.info("layout.collapseaccordion.collapsed","widget",[_8bc,_8bb]);
};
ColdFusion.Layout.createAccordionPanel=function(_8bf,_8c0,_8c1,url,_8c3){
var _8c4=ColdFusion.objectCache[_8bf];
var _8c5=_8c0;
if(_8bf&&typeof (_8bf)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidname","widget",[_8bf],null,null,true);
return;
}
if(!_8bf||ColdFusion.trim(_8bf)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.emptyname","widget",[_8bf],null,null,true);
return;
}
if(_8c0&&typeof (_8c0)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidaccordionpanelname","widget",[_8c0],null,null,true);
return;
}
if(!_8c0||ColdFusion.trim(_8c0)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.emptyaccordionpanelname","widget",[_8c0],null,null,true);
return;
}
if(_8c1&&typeof (_8c1)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitle","widget",[_8c0],null,null,true);
return;
}
if(!_8c1||ColdFusion.trim(_8c1)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitle","widget",[_8c0],null,null,true);
return;
}
if(url&&typeof (url)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidurl","widget",[_8c0],null,null,true);
return;
}
if(!url||ColdFusion.trim(url)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidurl","widget",[_8c0],null,null,true);
return;
}
_8c0="cf_layoutarea"+_8c5;
if(_8c4&&(_8c4 instanceof Ext.Panel)){
var _8c6=null;
var ele=document.getElementById(_8c0);
if(ele!=null){
ColdFusion.handleError(null,"layout.createaccordionpanel.duplicateel","widget",[_8c0],null,null,true);
return;
}
var _8c8=true;
var _8c9;
var _8ca=false;
var _8cb=null;
if(_8c3!=null){
if(typeof (_8c3)!="object"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidconfig","widget",[_8c0],null,null,true);
return;
}
}
if(_8c3&&typeof (_8c3.selected)!="undefined"&&_8c3.selected==true){
_8ca=true;
}
if(_8c3&&_8c3.titleicon){
if(typeof _8c3.titleicon!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitleicon","widget",[_8c0],null,null,true);
return;
}
var _8cc=Ext.String.format(ACCORDION_TITLE_ICON_CSS_TEMPLATE,_8c0,_8c3.titleicon);
Ext.util.CSS.createStyleSheet(_8cc,_8c0+"_cf_icon");
_8cb=_8c0;
}
var _8cd=_8c4.layoutConfig;
var _8ce=true;
if(_8cd&&typeof _8cd.fill!="undefined"){
_8ce=_8cd.fill;
}
if(_8c3!=null&&typeof (_8c3.overflow)!="undefined"){
var _8c9=new String(_8c3.overflow);
_8c9=_8c9.toLowerCase();
if(_8c9!="visible"&&_8c9!="auto"&&_8c9!="scroll"&&_8c9!="hidden"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidoverflow","widget",[_8c0],null,null,true);
return;
}
if(!_8ce&&(_8c9=="auto"||_8c9=="scroll")){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidoverflowforfillheight","widget",[_8c0],null,null,true);
return;
}
if(_8c9=="hidden"){
_8c8=false;
}
}else{
_8c9="auto";
_8c8=true;
}
var _8cf=document.getElementById(_8bf);
if(_8cf){
var _8d0=document.getElementById(_8bf);
var _8d1=document.createElement("div");
_8d1.id=_8c0;
if(_8c3!=null&&typeof (_8c3.align)!="undefined"){
_8d1.align=_8c3.align;
}
var _8d2="";
if(_8c4.height){
_8d2="height:"+_8c4.height+";";
}
if(_8c3!=null&&typeof (_8c3.style)!="undefined"){
var _8d3=new String(_8c3.style);
_8d3=_8d3.toLowerCase();
_8d2=_8d2+_8d3;
}
_8d2=_8d2+"overflow:"+_8c9+";";
_8d1.style.cssText=_8d2;
_8d0.appendChild(_8d1);
}
var _8d4=true;
var _8d5=true;
itemobj=ColdFusion.Layout.InitAccordionChildPanel(_8c0,_8c5,_8c1,_8d5,_8d4,_8c8,_8cb,false);
_8c4.add(itemobj);
if(url!=null&&typeof (url)!="undefined"&&url!=""){
if(url.indexOf("?")!=-1){
url=url+"&";
}else{
url=url+"?";
}
var _8d6;
var _8d7;
if(_8c3){
_8d6=_8c3.callbackHandler;
_8d7=_8c3.errorHandler;
}
ColdFusion.Ajax.replaceHTML(_8c0,url,"GET",null,_8d6,_8d7);
}
_8c4.updateLayout();
if(_8ca){
ColdFusion.Layout.expandAccordion(_8bf,_8c5);
}
ColdFusion.Log.info("layout.createaccordionpanel.created","widget",[_8c0]);
}else{
ColdFusion.handleError(null,"layout.createaccordionpanel.layoutnotfound","widget",[_8bf],null,null,true);
}
};
ColdFusion.Layout.initViewport=function(_8d8,item){
var _8da=new Array();
_8da[0]=item;
var _8db={items:_8da,layout:"fit",name:_8d8};
var _8dc=new Ext.Viewport(_8db);
return _8dc;
};
ColdFusion.Layout.convertPositionToDirection=function(_8dd){
if(_8dd.toUpperCase()=="LEFT"){
return "west";
}else{
if(_8dd.toUpperCase()=="RIGHT"){
return "east";
}else{
if(_8dd.toUpperCase()=="CENTER"){
return "center";
}else{
if(_8dd.toUpperCase()=="BOTTOM"){
return "south";
}else{
if(_8dd.toUpperCase()=="TOP"){
return "north";
}
}
}
}
}
};
ColdFusion.Layout.addMapInAccordionMapping=function(_8de,map){
ColdFusion.MapVsAccordion[_8de]=map;
};
