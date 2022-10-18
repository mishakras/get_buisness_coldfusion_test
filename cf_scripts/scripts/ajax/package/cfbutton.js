/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Button){
ColdFusion.Button={};
}
var $BT=ColdFusion.Button;
ColdFusion.Button.init=function(_2b8,_2b9,icon,tips,_2bc,_2bd,_2be,_2bf,_2c0){
var _2c1={renderTo:_2b8,enableToggle:_2c0,text:_2b9,onClick:_2bc,onToggle:_2bd,onMouseOver:_2be,onMouseout:_2bf,tooltip:tips,icon:icon};
var _2c2={renderTo:_2b8,enableToggle:_2c0,text:_2b9};
if(tips!=null&&typeof tips!="undefined"){
_2c2.tooltip=tips;
Ext.QuickTips.init();
}
if(icon!=null&&typeof icon!="undefined"){
_2c2.icon=icon;
}
if(icon&&_2b9){
_2c2.iconCls="x-btn-text-icon";
}else{
if(icon&&!_2b9){
_2c2.iconCls="x-btn-icon";
}
}
var _2c3=new Ext.Button(_2c2);
if(_2bc!=null&&typeof _2bc=="function"){
_2c3.on("click",_2bc,_2c1);
}
if(_2bd!=null&&typeof _2bd=="function"){
_2c3.on("toggle",_2bd,_2c1);
}
if(_2be!=null&&typeof _2be=="function"){
_2c3.on("mouseover",_2be,_2c1);
}
if(_2bf!=null&&typeof _2bf=="function"){
_2c3.on("mouseout",_2bf,_2c1);
}
_2c1.buttonComp=_2c3;
ColdFusion.objectCache[_2b8]=_2c1;
ColdFusion.Log.info("button.initialized","widget",[_2b8]);
};
$BT.show=function(_2c4){
var _2c5=$BT.getButtonObject(_2c4);
if(_2c5!=null){
_2c5.show();
}
ColdFusion.Log.info("button.show.shown","widget",[_2c4]);
};
$BT.hide=function(_2c6){
var _2c7=$BT.getButtonObject(_2c6);
if(_2c7!=null){
_2c7.hide();
}
ColdFusion.Log.info("button.hide.hidden","widget",[_2c6]);
};
$BT.disable=function(_2c8){
var _2c9=$BT.getButtonObject(_2c8);
if(_2c9!=null){
_2c9.disable();
}
ColdFusion.Log.info("button.disable.disabled","widget",[_2c8]);
};
$BT.enable=function(_2ca){
var _2cb=$BT.getButtonObject(_2ca);
if(_2cb!=null){
_2cb.enable();
}
ColdFusion.Log.info("button.enable.enabled","widget",[_2ca]);
};
$BT.getButtonObject=function(_2cc){
var _2cd=$BT.getButtonConfigObj(_2cc);
if(_2cd!=null){
return _2cd.buttonComp;
}else{
ColdFusion.handleError(null,"button.component.notFound","widget",[_2cc],null,null,true);
}
};
$BT.setLabel=function(_2ce,_2cf){
var _2d0=$BT.getButtonObject(_2ce);
if(_2d0!=null){
_2d0.text=_2cf;
}
};
$BT.getButtonConfigObj=function(_2d1){
var _2d2=ColdFusion.objectCache[_2d1];
if(_2d2==null||typeof (_2d2)=="undefined"){
ColdFusion.handleError(null,"button.component.notFound","widget",[_2d1],null,null,true);
}
return _2d2;
};
$BT.toggle=function(_2d3){
var _2d4=$BT.getButtonObject(_2d3);
if(_2d4!=null){
_2d4.toggle();
}
};
