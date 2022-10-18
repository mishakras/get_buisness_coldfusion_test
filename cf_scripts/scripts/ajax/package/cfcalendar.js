/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Calendar){
ColdFusion.Calendar={};
}
ColdFusion.Calendar.monthNamesShort=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
ColdFusion.Calendar.monthNamesLong=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
ColdFusion.Calendar.dayNamesShort=new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
ColdFusion.Calendar.dayNamesLong=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
ColdFusion.Calendar.calTableIdCounter=0;
if(navigator.userAgent.toLowerCase().indexOf("safari")>-1){
var set_month=Date.prototype.setMonth;
Date.prototype.setMonth=function(num){
if(num<=-1){
var n=Math.ceil(-num);
var _d1=Math.ceil(n/12);
var _d2=(n%12)?12-n%12:0;
this.setFullYear(this.getFullYear()-_d1);
return set_month.call(this,_d2);
}else{
return set_month.apply(this,arguments);
}
};
}
if(!String.escape){
String.escape=function(_d3){
return _d3.replace(/('|\\)/g,"\\$1");
};
}
ColdFusion.Calendar.setUpCalendar=function(_d4,_d5,_d6,_d7,_d8,_d9,_da){
var _db=ColdFusion.DOM.getElement(_d4+_d9+"_cf_button",_d9);
var _dc=ColdFusion.DOM.getElement(_d4,_d9);
var _dd=null;
var _de=null;
if(_dc.value!=""){
_dd=_dc.value;
_de=_dd.split("/");
}
var _df=_d4+"_cf_calendar"+ColdFusion.Calendar.calTableIdCounter;
ColdFusion.Calendar.calTableIdCounter++;
var _e0=ColdFusion.DOM.getElement(_d4+_d9+"_cf_container",_d9);
var _e1=_dc.offsetLeft;
ColdFusion.DOM.getElement(_d4+_d9+"_cf_container",_d9).style.left=_e1;
YAHOO.widget.Calendar.IMG_ROOT=_cf_ajaxscriptsrc+"/resources/yui/";
var _e2;
if(_de&&_de[0]&&_de[2]){
_e2=new YAHOO.widget.Calendar(_df,_d4+_d9+"_cf_container",{close:true,pagedate:_de[0]+"/"+_de[2]});
}else{
_e2=new YAHOO.widget.Calendar(_df,_d4+_d9+"_cf_container",{close:true});
}
_e2.calendarinputid=_d4;
_e2.calendarinput=_dc;
_e2.mask=_d5;
_e2.formname=_d9;
_e2.cfg.setProperty("MONTHS_LONG",_d8);
_e2.cfg.setProperty("WEEKDAYS_SHORT",_d7);
_e2.cfg.setProperty("START_WEEKDAY",_d6);
ColdFusion.objectCache[_df+_d9]=_e2;
_e2.select(_dd);
_e2.render();
_e2.hide();
_e2.selectEvent.subscribe(ColdFusion.Calendar.handleDateSelect,_e2,true);
YAHOO.util.Event.addListener(_d4+_d9+"_cf_button","click",ColdFusion.Calendar.handleCalendarLinkClick,_e2,true);
if(_da!=null){
var _e3=_da.year;
var _e4=_da.month;
var day=_da.day;
var _e6=new Date(_e3,_e4.valueOf()-1,day);
_dc.value=ColdFusion.Calendar.createFormattedOutput(_d4,_d5,_e3,_e4,day,_e6);
}
};
ColdFusion.Calendar.openedCalendarInstance=null;
ColdFusion.Calendar.handleCalendarLinkClick=function(_e7,_e8){
var _e9=_e8;
if(ColdFusion.Calendar.openedCalendarInstance){
ColdFusion.Calendar.openedCalendarInstance.hide();
}
if(!_e9.extMask){
var _ea=ColdFusion.Calendar.convertToExtMask(_e9.mask);
_e9.extMask=_ea;
}
var _eb=ColdFusion.DOM.getElement(_e8.calendarinputid,_e9.formname).value;
var _ec=null;
if(typeof (_eb)!="undefined"&&ColdFusion.trim(_eb)!=""){
_ec=Ext.Date.parse(_eb,_e9.extMask);
}
if(_ec!=null){
_e9.setMonth(_ec.getMonth());
_e9.setYear(_ec.getFullYear());
_e9.select(_ec);
_e9.render();
}
ColdFusion.Calendar.openedCalendarInstance=_e9;
_e9.show();
};
ColdFusion.Calendar.handleDateSelect=function(_ed,_ee,_ef){
var _f0=_ee[0];
var _f1=_f0[0];
var _f2=_f1[0],month=_f1[1],day=_f1[2];
var _f3=new Date(_f2,month.valueOf()-1,day);
var _f4=_ef.calendarinput.value;
_ef.calendarinput.value=ColdFusion.Calendar.createFormattedOutput(_ef.calendarinputid,_ef.mask,_f2,month,day,_f3);
ColdFusion.Event.callBindHandlers(_ef.calendarinputid,null,"change");
_ef.hide();
var _f5=document.getElementById(_ef.calendarinputid);
if(_f5){
if(_f5.onchange){
if(_f5.value!=_f4){
_f5.onchange();
}
}
}
};
ColdFusion.Calendar.convertToExtMask=function(_f6){
_f6=_f6.toUpperCase();
if(_f6.indexOf("DD")!=-1){
_f6=_f6.replace(/DD/g,"d");
}
if(_f6.indexOf("D")!=-1){
_f6=_f6.replace(/D/g,"d");
}
if(_f6.indexOf("MMMM")!=-1){
_f6=_f6.replace(/MMMM/g,"F");
}else{
if(_f6.indexOf("MMM")!=-1){
_f6=_f6.replace(/MMM/g,"M");
}else{
if(_f6.indexOf("MM")!=-1){
_f6=_f6.replace(/MM/g,"m");
}else{
if(_f6.indexOf("M")!=-1){
_f6=_f6.replace(/M/g,"m");
}
}
}
}
if(_f6.indexOf("YYYY")!=-1){
_f6=_f6.replace(/YYYY/g,"Y");
}
if(_f6.indexOf("YY")!=-1){
_f6=_f6.replace(/YY/g,"y");
}
if(_f6.indexOf("EEEE")!=-1){
_f6=_f6.replace(/EEEE/g,"l");
}
if(_f6.indexOf("EEE")!=-1){
_f6=_f6.replace(/EEE/g,"D");
}
if(_f6.indexOf("E")!=-1){
_f6=_f6.replace(/E/g,"w");
}
return _f6;
};
ColdFusion.Calendar.createFormattedOutput=function(_f7,_f8,_f9,_fa,day,_fc){
_f8=_f8.toUpperCase();
_f9=new String(_f9);
_fa=new String(_fa);
day=new String(day);
var _fd=_fc.getDay();
if(_f8.indexOf("DD")!=-1){
if(day.length==1){
day="0"+day;
}
_f8=_f8.replace(/DD/g,day);
}
if(_f8.indexOf("D"!=-1)){
if(day.length!=-1&&day.charAt(0)=="0"){
day=day.charAt(1);
}
_f8=_f8.replace(/D/g,day);
}
if(_f8.indexOf("MMMM")!=-1){
_fa=ColdFusion.Calendar.monthNamesLong[_fa.valueOf()-1];
_f8=_f8.replace(/MMMM/g,_fa);
}else{
if(_f8.indexOf("MMM")!=-1){
_fa=ColdFusion.Calendar.monthNamesShort[_fa.valueOf()-1];
_f8=_f8.replace(/MMM/g,_fa);
}else{
if(_f8.indexOf("MM")!=-1){
if(_fa.length==1){
_fa="0"+_fa;
}
_f8=_f8.replace(/MM/g,_fa);
}else{
if(_f8.indexOf("M")!=-1){
if(_fa.length!=-1&&_fa.charAt(0)=="0"){
_fa=_fa.charAt(1);
}
_f8=_f8.replace(/M/g,_fa);
}
}
}
}
if(_f8.indexOf("YYYY")!=-1){
_f8=_f8.replace(/YYYY/g,_f9);
}
if(_f8.indexOf("YY")!=-1){
_f9=_f9.substring(2);
_f8=_f8.replace(/YY/g,_f9);
}
if(_f8.indexOf("EEEE")!=-1){
_fd=ColdFusion.Calendar.dayNamesLong[_fd.valueOf()];
_f8=_f8.replace(/EEEE/g,_fd);
}
if(_f8.indexOf("EEE")!=-1){
_fd=ColdFusion.Calendar.dayNamesShort[_fd.valueOf()];
_f8=_f8.replace(/EEE/g,_fd);
}
if(_f8.indexOf("E")!=-1){
_fd=_fd.valueOf();
_fd=new String(_fd);
if(_fd.length!=-1&&_fd.charAt(0)=="0"&&_fd.charAt(1)){
_fd=_fd.charAt(1);
}
_f8=_f8.replace(/E/g,_fd);
}
return _f8;
};
