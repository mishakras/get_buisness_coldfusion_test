/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Tooltip){
ColdFusion.Tooltip={};
}
ColdFusion.Tooltip.setToolTipOut=function(_8e0,_8e1){
var _8e2=_8e1.tooltip;
_8e2.tooltipout=true;
};
ColdFusion.Tooltip.getToolTip=function(_8e3,_8e4){
var _8e5=ColdFusion.objectCache[_8e4.context];
if(!_8e5){
if(_8e4.style){
_8e4.styleObj=ColdFusion.Tooltip.parseStyle(_8e4.style);
}
_8e5=new YAHOO.widget.Tooltip(_8e4.context+"_cf_tooltip",_8e4);
ColdFusion.objectCache[_8e4.context]=_8e5;
_8e5.doShow(_8e3,_8e4.context);
if(_8e4._cf_url){
var _8e6=function(req,_8e8){
_8e8.tooltip.cfg.setProperty("text",req.responseText);
if(_8e8.tooltip.tooltipout==false){
_8e8.tooltip.doShow(_8e8.event,_8e8.id);
}
};
YAHOO.util.Event.addListener(_8e4.context,"mouseout",ColdFusion.Tooltip.setToolTipOut,{"tooltip":_8e5});
_8e5.cfg.setProperty("text",_cf_loadingtexthtml);
_8e5.doShow(_8e3,_8e4.context);
try{
ColdFusion.Log.info("tooltip.gettooltip.fetch","widget",[_8e4.context]);
ColdFusion.Ajax.sendMessage(_8e4._cf_url,"GET",_8e4._cf_query,true,_8e6,{tooltip:_8e5,event:_8e3,id:_8e4.context});
}
catch(e){
tooltipdiv=ColdFusion.DOM.getElement(_8e4.context);
tooltipdiv.innerHTML="";
ColdFusion.globalErrorHandler(null,e,tooltipdiv);
}
}
}
_8e5.tooltipout=false;
};
ColdFusion.Tooltip.parseStyle=function(_8e9){
var _8ea={};
if(_8e9&&typeof _8e9==="string"){
var _8eb=_8e9.split(";");
for(var i=0;i<_8eb.length;i++){
var temp=_8eb[i];
tempArray=temp.split(":");
if(tempArray.length===2){
var key=tempArray[0];
key=key.toLowerCase();
var _8ef=tempArray[1];
switch(key){
case "width":
_8ea.width=_8ef;
break;
case "color":
_8ea.color=_8ef;
break;
case "background-color":
_8ea[key]=_8ef;
break;
case "padding":
_8ea.padding=_8ef;
break;
default:
_8ea[key]=_8ef;
}
}
}
}
return _8ea;
};
