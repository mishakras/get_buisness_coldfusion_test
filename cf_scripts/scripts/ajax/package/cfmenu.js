/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Menu){
ColdFusion.Menu={};
}
ColdFusion.Menu.menuItemMouseOver=function(id,_8f1){
var _8f2=document.getElementById(id);
_8f2.tempfontcolor=_8f2.firstChild.style.color;
if(_8f1){
_8f2.firstChild.style.color=_8f1;
}
};
ColdFusion.Menu.menuItemMouseOut=function(id){
var _8f4=document.getElementById(id);
if(_8f4.tempfontcolor){
_8f4.firstChild.style.color=_8f4.tempfontcolor;
}else{
_8f4.firstChild.style.color="black";
}
};
ColdFusion.Menu.initMenu=function(_8f5,_8f6){
return new YAHOO.widget.Menu(_8f5,_8f6);
};
ColdFusion.Menu.initMenuBar=function(_8f7,_8f8){
return new YAHOO.widget.MenuBar(_8f7,_8f8);
};
