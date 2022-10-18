/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Slider){
ColdFusion.Slider={};
}
var $SL=ColdFusion.Slider;
ColdFusion.Slider.init=function(_8f9,name,_8fb,_8fc,_8fd,_8fe,_8ff,_900,_901,_902,tip,_904,_905){
var _906={renderTo:_8f9,id:name};
if(_901!=null&&typeof (_901)!="undefined"){
_906.ClicktoChange=_901;
}else{
_906.ClicktoChange=false;
}
if(_902!=null&&typeof (_902)!="undefined"){
_906.increment=_902;
}else{
_906.increment=1;
}
if(_8ff!=null&&typeof (_8ff)!=undefined){
_906.minValue=_8ff;
}else{
_906.minValue=0;
}
if(_8fe!=null&&typeof (_8fe)!=undefined){
_906.value=_8fe;
}else{
_906.value=_906.minValue;
}
if(_8fc!=null&&typeof (_8fc)!=undefined){
_906.width=_8fc;
}else{
_906.width=200;
}
if(_8fd!=null&&typeof (_8fd)!="undefined"){
_906.height=_8fd;
}else{
_906.height=100;
}
if(_900!=null&&typeof (_900)!=undefined){
_906.maxValue=_900;
}else{
_906.maxValue=100;
}
if(_8fb!=null&&typeof (_8fb)!=undefined){
_906.vertical=_8fb;
}else{
_906.vertical=false;
}
if(_904!=null&&typeof (_904)=="function"){
_906.onChange=_904;
}
if(_905!=null&&typeof (_905)!="undefined"){
_906.onDrg=_905;
}
Ext.define("Ext.ux.ST",{extend:"Ext.slider.Tip",minWidth:25,minHeight:25,offsets:[0,-10],init:function(_907){
_907.on("dragstart",this.onSlide,this);
_907.on("drag",this.onSlide,this);
_907.on("dragend",this.hide,this);
_907.on("destroy",this.destroy,this);
},onSlide:function(_908,e,_90a){
this.show();
this.body.update(this.getText(_908));
this.el.alignTo(_90a.el,"b-t?",this.offsets);
this.doAutoRender();
},getText:function(_90b){
return _90b.getValue()==0?"0":_90b.getValue();
}});
if(tip!=null&&typeof (tip)!="undefined"){
if(tip){
_906.plugins=new Ext.ux.ST();
}else{
_906.useTips=false;
}
}
var _90c=Ext.create("Ext.slider.Single",_906);
_90c.on("drag",$SL.onDragHandler,_906);
_90c.on("changecomplete",$SL.onChangeHandler,_906);
_906.sliderComp=_90c;
ColdFusion.objectCache[name]=_906;
ColdFusion.Log.info("slider.initialized","widget",[name]);
};
$SL.onDragHandler=function(_90d,_90e){
var _90f=this.onDrg;
if(_90f!=null&&typeof (_90f)=="function"){
_90f.call(this,_90d,_90e);
}
};
$SL.onChangeHandler=function(_910,_911){
var _912=this.onChange;
if(_912!=null&&typeof (_912)=="function"){
_912.call(this,_910,_911);
}
};
$SL.getValue=function(_913){
var _914=ColdFusion.objectCache[_913];
if(_914!=null||typeof (_914)!="undefined"){
var _915=_914.sliderComp;
if(_915){
return _915.getValue();
}
}else{
ColdFusion.handleError(null,"slider.getvalue.notfound","widget",[_913],null,null,true);
}
};
$SL.getSliderObject=function(_916){
var _917=ColdFusion.objectCache[_916];
if(_917!=null||typeof (_917)!="undefined"){
return _917.sliderComp;
}else{
return null;
}
};
$SL.setValue=function(_918,_919){
var _91a=ColdFusion.objectCache[_918];
if(_91a!=null||typeof (_91a)!="undefined"){
var _91b=_91a.sliderComp;
if(_91b){
return _91b.setValue(_919,true);
}
}else{
ColdFusion.handleError(null,"slider.setvalue.notfound","widget",[_918],null,null,true);
}
};
$SL.show=function(_91c){
var _91d=ColdFusion.objectCache[_91c];
if(_91d!=null||typeof (_91d)!="undefined"){
var _91e=_91d.sliderComp;
if(_91e){
return _91e.show();
}
}else{
ColdFusion.handleError(null,"slider.show.notfound","widget",[_91c],null,null,true);
}
ColdFusion.Log.info("slider.show.shown","widget",[_91c]);
};
$SL.hide=function(_91f){
var _920=ColdFusion.objectCache[_91f];
if(_920!=null||typeof (_920)!="undefined"){
var _921=_920.sliderComp;
if(_921){
return _921.hide();
}
}else{
ColdFusion.handleError(null,"slider.hide.notfound","widget",[_91f],null,null,true);
}
ColdFusion.Log.info("slider.hide.hidden","widget",[_91f]);
};
$SL.enable=function(_922){
var _923=ColdFusion.objectCache[_922];
if(_923!=null||typeof (_923)!="undefined"){
var _924=_923.sliderComp;
if(_924){
return _924.enable();
}
}else{
ColdFusion.handleError(null,"slider.enable.notfound","widget",[_922],null,null,true);
}
ColdFusion.Log.info("slider.enable.enabled","widget",[_922]);
};
$SL.disable=function(_925){
var _926=ColdFusion.objectCache[_925];
if(_926!=null||typeof (_926)!="undefined"){
var _927=_926.sliderComp;
if(_927){
return _927.disable();
}
}else{
ColdFusion.handleError(null,"slider.disable.notfound","widget",[_925],null,null,true);
}
ColdFusion.Log.info("slider.disable.disabled","widget",[_925]);
};
