/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Map){
ColdFusion.Map={};
}
var coldFusion_markerObjCache=new Array();
var $MAP=ColdFusion.Map;
$MAP.statusCodeObject={code200:"A directions request could not be successfully parsed. For example, the request may have been rejected if it contained more than the maximum number of waypoints allowed.",code400:"A directions request could not be successfully parsed. For example, the request may have been rejected if it contained more than the maximum number of waypoints allowed.",code500:"A geocoding or directions request could not be successfully processed, yet the exact reason for the failure is not known",code601:"The HTTP query parameter was either missing or had no value. For geocoding requests, this means that an empty address was specified as input. For directions requests, this means that no query was specified in the input",code602:"No corresponding geographic location could be found for the specified address. This may be due to the fact that the address is relatively new, or it may be incorrect",code603:"The geocode for the given address or the route for the given directions query cannot be returned due to legal or contractual reasons",code604:"The GDirections object could not compute directions between the points mentioned in the query. This is usually because there is no route available between the two points, or because we do not have data for routing in that region",code610:"This request was invalid.",code620:"The webpage has gone over the requests limit in too short a period of time."};
ColdFusion.Map._init=function(_47,_48,_49,_4a,_4b,_4c,_4d,_4e,_4f,_50,_51,_52,_53,_54,_55,_56,_57,_58,_59,_5a,_5b,_5c,_5d,_5e,_5f,_60,_61,_62,_63,_64,_65){
var _66=null;
if(navigator.geolocation){
navigator.geolocation.getCurrentPosition(function(_67){
if(_65<1){
_5a=_67.coords.latitude;
_5b=_67.coords.longitude;
_59=null;
}
if(_65!==0){
if(_65<0){
_65=_65*-1;
}
_5f[_65-1].latitude=_67.coords.latitude;
_5f[_65-1].longitude=_67.coords.longitude;
}
_66=ColdFusion.Map.init(_47,_48,_49,_4a,_4b,_4c,_4d,_4e,_4f,_50,_51,_52,_53,_54,_55,_56,_57,_58,_59,_5a,_5b,_5c,_5d,_5e,_5f,_60,_61,_62,_63,_64);
},function(_68){
_66=ColdFusion.Map.init(_47,_48,_49,_4a,_4b,_4c,_4d,_4e,_4f,_50,_51,_52,_53,_54,_55,_56,_57,_58,_59,_5a,_5b,_5c,_5d,_5e,_5f,_60,_61,_62,_63,_64);
});
}else{
_66=ColdFusion.Map.init(_47,_48,_49,_4a,_4b,_4c,_4d,_4e,_4f,_50,_51,_52,_53,_54,_55,_56,_57,_58,_59,_5a,_5b,_5c,_5d,_5e,_5f,_60,_61,_62,_63,_64);
}
return _66;
};
ColdFusion.Map.init=function(_69,_6a,_6b,_6c,_6d,_6e,_6f,_70,_71,_72,_73,_74,_75,_76,_77,_78,_79,_7a,_7b,_7c,_7d,_7e,_7f,_80,_81,_82,_83,_84,_85,_86){
var _87={divName:_69,type:_6c,layout:"fit",renderTo:_69,centerAddress:_7b,centerLatitude:_7c,centerLongitude:_7d,markerItems:_81,onLoad:_82,onError:_83,showCenterMarker:_76,showAllMarker:_77,markerColor:_7f,markerIcon:_80,markerBindListener:_85,initShow:_70};
if(_6b!=null&&typeof (_6b)!="undefined"){
_87.width=_6b;
}else{
_87.width=400;
}
if(_6a!=null&&typeof (_6a)!="undefined"){
_87.height=_6a;
}else{
_87.height=400;
}
if(_6d!=null&&typeof (_6d)!="undefined"){
_87.zoomLevel=_6d;
}else{
_87.zoomLevel=3;
}
_87.hideBorders=_6f;
if(!_6f){
if(_6e==null||typeof _6e==="undefined"||_6e.length==0){
_6e=" ";
}
_87.title=_6e;
_87.collapsible=_71;
}
if(_7f==null&&_80==null){
_87.markerColor="#00FF00";
}
var _88=new Ext.Panel(_87);
ColdFusion.objectCache[_69]=_87;
_87.mapPanel=_88;
var _89=["enableDragging"];
var swz=false;
if(_72){
swz=true;
}
if(_73){
_89.push("enableDoubleClickZoom");
}else{
_89.push("disableDoubleClickZoom");
}
if(_74){
_89.push("enableContinuousZoom");
}else{
_89.push("disableContinuousZoom");
}
var _8b=["NonExistantControl"];
if(_75){
_8b.push("scaleControl");
}
var mtc=false;
var _8d="";
if(_79&&_79.toUpperCase()=="BASIC"){
mtc=true;
_8d="google.maps.MapTypeControlStyle.HORIZONTAL_BAR";
}else{
if(_79&&_79.toUpperCase()=="ADVANCED"){
mtc="true";
_8d=google.maps.MapTypeControlStyle.DROPDOWN_MENU;
}
}
if(_78){
_8b.push("overviewMapControl");
}
var zc=false;
var zco="";
if(_7a!=null&&_7a!="undefined"){
_7a=_7a.toUpperCase();
switch(_7a){
case "SMALL":
zco=google.maps.ZoomControlStyle.SMALL;
zc=true;
break;
case "SMALL3D":
zco=google.maps.ZoomControlStyle.SMALL;
zc=true;
break;
case "LARGE":
zco=google.maps.ZoomControlStyle.LARGE;
zc=true;
break;
case "LARGE3D":
zco=google.maps.ZoomControlStyle.LARGE;
zc=true;
break;
}
}
var _90=[];
for(i=0;i<_87.markerItems.length;i++){
var _91=$MAP.parseMarker(_87.markerItems[i],_69);
_90.push(_91);
}
if(_7e==null||typeof _7e==="undefined"){
_7e="";
}
var _92={marker:{title:_7e,iscenter:true}};
if(_87.markerColor!=null&&typeof _87.markerColor!="undefined"){
_92.marker.markercolor=_87.markerColor;
}else{
if(_87.markerIcon!=null&&typeof _87.markerIcon!="undefined"){
_92.marker.markericon=_87.markerIcon;
}
}
if(_84===true){
_92.listeners={click:$MAP.markerOnClickHandler};
if(_86!=null){
_92.marker.markerwindowcontent=_86;
}else{
_92.marker.bindcallback=_85;
}
_92.marker.name=_69;
}
if(_87.centerAddress!=null&&typeof _87.centerAddress==="string"){
_92.geoCodeAddr=_87.centerAddress;
_92.marker.address=_87.centerAddress;
}else{
_92.lat=_87.centerLatitude;
_92.lng=_87.centerLongitude;
_92.marker.address=_87.centerAddress;
}
var _93=false;
if(_79!=null&&typeof _79=="string"&&_79.toUpperCase()=="ADVANCED"){
_93=true;
}
var _94=new Ext.ux.GMapPanel({xtype:"gmappanel",region:"center",zoomLevel:_87.zoomLevel,gmapType:_87.type,mapConfOpts:_89,mapControls:_8b,setCenter:_92,markers:_90,border:!_87.hideBorders,onLoadhandler:$MAP.onLoadCompleteHandler,onErrorhandler:_83,name:_87.divName,noCenterMarker:!_76,showAllMarker:_77,advanceMapTypeControl:_93,initShow:_70,zc:zc,zco:zco,mtc:mtc,mtco:_8d,swz:swz});
_88.add(_94);
_87.mapPanelObject=_94;
if(_70===false){
_88.hide();
}else{
_88.updateLayout();
}
ColdFusion.Log.info("map.initialized","widget",[_69]);
return _88;
};
$MAP.addMarker=function(_95,_96){
var _97=$MAP.getMapPanelObject(_95);
var _98=$MAP.parseMarker(_96,_95);
var _99=[];
_99.push(_98);
_97.addMarkers(_99);
ColdFusion.Log.info("map.addmarker.markeradded","widget",[_95,_99.length]);
};
$MAP.setCenter=function(_9a,_9b){
var _9c=$MAP.getMapPanelObject(_9a);
var lat;
var lng;
if(_9b.latitude&&_9b.longitude){
if(typeof _9b.latitude!="number"||typeof _9b.longitude!="number"){
ColdFusion.handleError(null,"map.setcenter.latlngnonnumeric","widget",[_9a,_9b.latitude,_9b.longitude],null,null,true);
}else{
lat=_9b.latitude;
lng=_9b.longitude;
}
var _9f=new google.maps.LatLng(lat,lng);
_9c.getMap().setCenter(_9f,_9c.zoomLevel);
var _a0={};
_a0.markercolor="#00FF00";
_9c.addMarker(new google.maps.LatLng(_9b.latitude,_9b.longitude),_a0,null,true);
}else{
if(_9b.address){
if(typeof _9b.address!="string"){
ColdFusion.handleError(null,"map.setcenter.addressnotstring","widget",[_9a,_9b.address],null,null,true);
}else{
_9c.geoCodeLookup(_9b.address,null,null,true);
}
}else{
ColdFusion.handleError(null,"map.setcenter.invalidcenter","widget",[_9a],null,null,true);
}
}
ColdFusion.Log.info("map.setcenter.centerset","widget",[_9a]);
};
$MAP.getLatitudeLongitude=function(_a1,_a2){
geocoder=new google.maps.Geocoder();
if(_a2==null||!typeof _a2==="function"){
_a2=$MAP.LatitudeLongitudeHandler;
}
geocoder.geocode({"address":_a1},_a2);
};
$MAP.addEvent=function(_a3,_a4,_a5,_a6){
if(_a4=="singlerightclick"){
_a4="rightclick";
}
if(_a4=="maptypechanged"){
_a4="maptypeid_changed";
}
var _a7=$MAP.getMapPanelObject(_a3);
_a7.addEventToMap(_a4,_a5,_a6);
};
$MAP.setZoomLevel=function(_a8,_a9){
var _aa=$MAP.getMapPanelObject(_a8);
_aa.zoomLevel=_a9;
_aa.getMap().setZoom(_a9);
};
$MAP.getMapObject=function(_ab){
var _ac=$MAP.getMapPanelObject(_ab);
if(_ac!=null){
return _ac.getMap();
}
};
$MAP.parseMarker=function(_ad,_ae){
var _af={};
if(_ad.latitude&&_ad.longitude){
if(typeof _ad.latitude!="number"||typeof _ad.longitude!="number"){
ColdFusion.handleError(null,"map.marker.latlngnonnumeric","widget",[_ad.latitude,_ad.longitude],null,null,true);
}else{
_af.lat=_ad.latitude;
_af.lng=_ad.longitude;
}
}else{
if(_ad.address!=null){
if(typeof _ad.address!="string"){
ColdFusion.handleError(null,"map.marker.addressnotstring","widget",[_ad.address],null,null,true);
}else{
_af.address=_ad.address;
}
}
}
var _b0={};
if(_ad.tip==null){
_b0.title="";
}else{
_b0.title=_ad.tip;
}
if(_ad.markercolor!=null&&typeof _ad.markercolor!="undefined"){
_b0.markercolor=_ad.markercolor;
}else{
if(_ad.markericon!=null&&typeof _ad.markericon!="undefined"){
_b0.markericon=_ad.markericon;
}
}
if(_ad.showmarkerwindow===true||_ad.markerwindowcontent!=null){
var _b1=ColdFusion.objectCache[_ae];
var _b2;
if(_b1!=null||typeof (_b1)!="undefined"){
_b2=_b1.markerBindListener;
}
if(_b2!=null||_ad.markerwindowcontent!=null){
_af.listeners={click:$MAP.markerOnClickHandler};
if(_ad.markerwindowcontent!=null){
_b0.markerwindowcontent=_ad.markerwindowcontent;
}else{
_b0.bindcallback=_b2;
}
_b0.name=_ad.name;
}
}
_af.marker=_b0;
return _af;
};
$MAP.onErrorHandler=function(_b3,_b4){
var _b5=ColdFusion.objectCache[_b3];
var _b6=$MAP.statusCodeObject;
var _b7=$MAP.retrieveStatueMessage(_b4);
var _b8=_b5.onError;
if(_b8!=null&&typeof _b8==="function"){
_b8.call(null,_b4,_b7);
}else{
alert("Error: "+_b7);
}
ColdFusion.handleError(null,"map.loadMap.error","map",[_b3,_b4,_b7],null,null,true);
};
$MAP.onLoadCompleteHandler=function(_b9){
var _ba=ColdFusion.objectCache[_b9];
var _bb=_ba.onLoad;
if(_bb!=null&&typeof _bb==="function"){
_bb.call();
}
};
$MAP.retrieveStatueMessage=function(_bc){
var _bd;
switch(_bc){
case "ZERO_RESULTS":
_bd=$MAP.statusCodeObject.code602;
break;
case "OVER_QUERY_LIMIT":
_bd=$MAP.statusCodeObject.code620;
break;
case "REQUEST_DENIED":
_bd=$MAP.statusCodeObject.code610;
break;
case "INVALID_REQUEST":
_bd=$MAP.statusCodeObject.code610;
break;
}
return _bd;
};
var currentopenwindow="";
$MAP.markerOnClickHandler=function(_be){
coldFusion_markerObjCache[this.name]=this.scope.marker;
if(this.bindcallback!=null&&typeof this.bindcallback=="function"){
var _bf=this.address;
if(_bf==null||typeof _bf=="undefined"){
_bf="";
}
this.bindcallback.call(null,this.name,_be.latLng.lat(),_be.latLng.lng(),_bf);
}else{
if(this.scope.statictext!=null&&typeof this.scope.statictext!="undefined"){
var me=this,infoWindow=new google.maps.InfoWindow({content:this.scope.statictext,position:this.scope.marker.position});
if(currentopenwindow!=""){
currentopenwindow.close();
}
infoWindow.open(this.scope.marker.map);
currentopenwindow=infoWindow;
}
}
};
ColdFusion.Map.loadMarkerWindowInfo=function(_c1,_c2){
var _c3=coldFusion_markerObjCache[_c2._cf_marker_name];
var me=this,infoWindow=new google.maps.InfoWindow({content:_c1,position:_c3.position});
if(currentopenwindow!=""){
currentopenwindow.close();
}
infoWindow.open(_c3.map);
currentopenwindow=infoWindow;
};
ColdFusion.Map.bindOnErrorHandler=function(_c5,_c6){
ColdFusion.handleError(null,"map.markerbind.binderror","widget",[_c5],null,null,true);
};
$MAP.getMapPanelObject=function(_c7){
var _c8=ColdFusion.objectCache[_c7];
if(_c8==null||typeof (_c8)=="undefined"){
ColdFusion.handleError(null,"map.getmappanelobject.notfound","widget",[_c7],null,null,true);
}
return _c8.mapPanelObject;
};
$MAP.refresh=function(_c9){
var _ca=ColdFusion.objectCache[_c9];
if(_ca==null||typeof (_ca)=="undefined"){
ColdFusion.handleError(null,"map.refresh.notfound","widget",[_c9],null,null,true);
}
_ca.mapPanel.updateLayout();
};
$MAP.hide=function(_cb){
var _cc=ColdFusion.objectCache[_cb];
if(_cc==null||typeof (_cc)=="undefined"){
ColdFusion.handleError(null,"map.hide.notfound","widget",[_cb],null,null,true);
}
_cc.mapPanel.hide();
};
$MAP.show=function(_cd){
var _ce=ColdFusion.objectCache[_cd];
if(_ce==null||typeof (_ce)=="undefined"){
ColdFusion.handleError(null,"map.show.notfound","widget",[_cd],null,null,true);
}
_ce.mapPanel.show();
_ce.mapPanel.updateLayout();
};
