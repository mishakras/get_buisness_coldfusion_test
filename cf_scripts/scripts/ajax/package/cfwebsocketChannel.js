/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
ColdFusion.WebSocket={NS:"coldfusion.websocket.channels",WELCOME:"welcome",AUTHENTICATE:"authenticate",SUBSCRIBE:"subscribe",UNSUBSCRIBE:"unsubscribe",PUBLISH:"publish",INVOKE_AND_PUBLISH:"invokeAndPublish",GET_CHANNELS:"getChannels",GET_SUBSCRIBER_COUNT:"getSubscriberCount",GET_SUBSCRIPTIONS:"getSubscriptions",SEND_MESSAGE:"sendMessage",INVOKE_AND_MESSAGE:"invokeAndSend",INVOKE:"invoke",STOP:"stop",init:function(id,_30d,_30e,_30f,_310,_311,_312,_313,_314,_315,_316){
if(cf_ws.isWebSocketSupported()){
lWSC=new cf_ws.CFWebSocketWrapper();
ColdFusion.WebSocket[id]=lWSC;
lWSC.options={OnWelcome:this.cfonOpencallBk,OnMessage:this.cfMessageHandlerCallBk,OnClose:_313,onError:_314,appName:_30d,cfauth:_30f,subscribeTo:_310,referrer:_315};
var _317=self.location.hostname;
if(!(self.WebSocket||self.MozWebSocket)&&_30e==true){
var _318={ns:ColdFusion.WebSocket.NS,reqType:ColdFusion.WebSocket.WELCOME,code:-1,msg:"WebSocket over SSL will not work as your browser does not have native WebSockets support."};
var _319=_314!=null?_314:_311;
_319(_318);
return;
}
if(_30e==false&&_317&&_317=="localhost"){
_317="127.0.0.1";
}
var _31a;
var port;
if(_316){
if(self.location.port!=""){
port=self.location.port;
}else{
if(self.location.protocol!=""&&self.location.protocol=="https:"){
port=443;
}else{
port=80;
}
}
if(self.location.protocol!=""&&self.location.protocol=="https:"){
protocol="wss://";
}else{
protocol="ws://";
}
_31a="/cfws";
}else{
port=_30e?_cf_websocket_ssl_port:_cf_websocket_port;
_31a="/cfusion"+"/cfusion";
protocol=_30e?"wss://":"ws://";
}
var lURL=protocol+(_317)+":"+port+_31a;
lWSC.options.url=lURL;
var lRes=lWSC.open(lURL,lWSC.options);
lWSC.isOpen=true;
lWSC.processConnected=function(_31e){
};
lWSC.processDisconnected=function(_31f){
};
lWSC.defaultMessageHandler=_311;
if(_312){
lWSC.appOnOpenHandler=_312;
}
lWSC.channelSpecificResHandlers={};
lWSC.subscribercount_callbackHandlers={};
return lWSC;
}else{
var _318={ns:ColdFusion.WebSocket.NS,reqType:ColdFusion.WebSocket.WELCOME,code:-1,msg:"Browser neither have native WebSocket support nor a flash player for the fallback."};
var _319=_314!=null?_314:_311;
_319(_318);
}
},welcome:function(_320,_321,_322){
var lRes=this.isConnected();
if(lRes==true){
this.sendToken({ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.WELCOME,authKey:_320,subscribeTo:_321,appName:_322});
}
return lRes;
},authenticate:function(_324,_325){
var lRes=this.isConnected();
if(lRes==true){
this.sendToken({ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.AUTHENTICATE,username:_324,password:_325,appName:this.options.appName});
}
return lRes;
},subscribe:function(_327,_328,_329){
var lRes=this.isConnected();
if(lRes==true){
var _32b={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.SUBSCRIBE,channel:_327,appName:this.options.appName};
if(_328!=null&&(typeof _328=="object")){
_32b.customOptions=_328;
}
this.sendToken(_32b);
if(_329){
this.channelSpecificResHandlers[_327]=_329;
this.channelName_subscriptionInProcess=_327;
}
}
return lRes;
},unsubscribe:function(_32c){
var lRes=this.isConnected();
if(lRes==true){
var _32e={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.UNSUBSCRIBE,channel:_32c,appName:this.options.appName};
this.sendToken(_32e);
delete this.channelSpecificResHandlers[_32c];
}
return lRes;
},publish:function(_32f,_330,_331){
var lRes=this.isConnected();
if(lRes==true){
var _333={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.PUBLISH,channel:_32f,data:_330,appName:this.options.appName};
if(_331!=null&&(typeof _331=="object")){
_333.customOptions=_331;
}
this.sendToken(_333);
}
return lRes;
},invokeAndPublish:function(_334,_335,_336,_337,_338){
var lRes=this.isConnected();
if(lRes==true){
var _33a={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.INVOKE_AND_PUBLISH,channel:_334,cfcName:_335,cfcMethod:_336,methodArguments:_337,appName:this.options.appName,referrer:this.options.referrer};
if(_338!=null&&(typeof _338=="object")){
_33a.customOptions=_338;
}
this.sendToken(_33a);
}
return lRes;
},getSubscriberCount:function(_33b,_33c){
var lRes=this.isConnected();
if(lRes==true){
var _33e={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.GET_SUBSCRIBER_COUNT,channel:_33b,appName:this.options.appName};
this.sendToken(_33e);
}
if(_33c){
if(!this.subscribercount_callbackHandlers){
this.subscribercount_callbackHandlers={};
}
this.subscribercount_callbackHandlers[_33b]=_33c;
}
return lRes;
},getSubscriptions:function(_33f){
var lRes=this.isConnected();
if(lRes==true){
var _341={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.GET_SUBSCRIPTIONS,appName:this.options.appName};
this.sendToken(_341);
}
if(_33f){
this.subscriptions_callbackHandler=_33f;
}
return lRes;
},sendMessage:function(_342,_343,_344){
var lRes=this.isConnected();
if(lRes==true){
var _346={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.SEND_MESSAGE,targetId:_342,data:_343,appName:this.options.appName};
if(_344!=null&&(typeof _344=="object")){
_346.customOptions=_344;
}
this.sendToken(_346);
}
return lRes;
},invokeAndSend:function(_347,_348,_349,_34a,_34b){
var lRes=this.isConnected();
if(lRes==true){
var _34d={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.INVOKE_AND_MESSAGE,target:_347,cfcName:_348,cfcMethod:_349,methodArguments:_34a,appName:this.options.appName};
if(_34b!=null&&(typeof _34b=="object")){
_34d.customOptions=_34b;
}
this.sendToken(_34d);
}
return lRes;
},invoke:function(_34e,_34f,_350,_351){
var lRes=this.isConnected();
if(lRes==true){
var _353={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.INVOKE,cfcName:_34e,cfcMethod:_34f,methodArguments:_350,appName:this.options.appName,referrer:this.options.referrer};
if(_351!=null&&(typeof _351=="object")){
_353.customOptions=_351;
}
this.sendToken(_353);
}
return lRes;
},openConnection:function(){
var lURL=lWSC.options.url;
this.open(lURL,this.options);
},isConnectionOpen:function(){
var _355=this.isConnected();
return _355;
},closeConnection:function(){
this.close({fireClose:true});
},cfonOpencallBk:function(_356){
if(this.cfauth!=null||this.susbcribeTo!=null){
_356.welcome(this.cfauth,this.subscribeTo,this.appName);
}
if(_356.appOnOpenHandler){
_356.appOnOpenHandler(_356);
}
},cfMessageHandlerCallBk:function(_357,_358){
var _359=_358.defaultMessageHandler;
if((_357.type=="event")&&(_357.name=="connect"||_357.name=="disconnect")){
return;
}
if((_357.reqType=="subscribe")&&_358.channelName_subscriptionInProcess!=null){
if(_357.code==-1){
delete _358.channelSpecificResHandlers[_358.channelName_subscriptionInProcess];
}
delete _358.channelName_subscriptionInProcess;
}
if((_357.reqType=="getSubscriberCount")&&_358.subscribercount_callbackHandlers[_357.channel]!=null){
_358.subscribercount_callbackHandlers[_357.channel].call(this,_357);
delete _358.subscribercount_callbackHandlers[_357.channelname];
return;
}
if((_357.reqType=="getSubscriptions")&&_358.subscriptions_callbackHandler!=null){
_358.subscriptions_callbackHandler(_357);
delete _358.subscriptions_callbackHandler;
return;
}
if(_357.type=="data"&&_357.channelname){
var _35a=_357.channelname;
var _35b=_358.channelSpecificResHandlers[_35a];
while(_35b==null){
var lPos=_35a.lastIndexOf(".");
if(lPos>0){
_35a=_35a.substr(0,lPos);
_35b=_358.channelSpecificResHandlers[_35a];
}else{
break;
}
}
if(_35b){
_359=_35b;
}
}
_359.call(this,_357);
}};
function cfwebsocketinit(){
var _35d=ColdFusion.WebSocket;
ns=cf_ws;
for(var _35e in _35d){
ns["CFWebSocketWrapper"].prototype[_35e]=_35d[_35e];
}
}
cfwebsocketinit();
