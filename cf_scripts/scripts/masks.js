/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
var KT_focusedEl=null;
KT_validateSingle=function(_979,_97a){
var _97b=_979.charCodeAt(0);
switch(_97a){
case "9":
if(_97b<58&&_97b>47){
return true;
}
break;
case "A":
if((_97b<91&&_97b>64)||(_97b<123&&_97b>96)){
return true;
}
break;
case "X":
if((_97b<91&&_97b>64)||(_97b<123&&_97b>96)||(_97b<58&&_97b>47)){
return true;
}
break;
case "?":
return true;
break;
default:
return true;
break;
}
};
KT_maskDefaultValue=function(_97c){
switch(_97c){
case "9":
return "0";
break;
case "A":
return "a";
break;
case "X":
return "0";
break;
case "?":
return "0";
break;
default:
return "0";
break;
}
};
KT_isSpecialChar=function(_97d){
if(_97d=="9"||_97d=="A"||_97d=="X"||_97d=="?"){
return true;
}else{
return false;
}
};
mask_onValueChanged=function(){
if((typeof window.getSelection=="undefined"&&typeof document.selection=="undefined")){
return;
}
if(KT_focusedEl==null||KT_focusedEl.mask==null||KT_focusedEl.mask==""){
return;
}
var mask=KT_focusedEl.mask;
var val=KT_focusedEl.value;
var i=0;
var _981=false;
if(val==KT_focusedEl.oldText){
return;
}
if(val.length>mask.length){
val=val.substr(0,mask.length);
_981=true;
}
for(;i<mask.length;i++){
if(val.charCodeAt(i).toString()!="NaN"){
if(KT_isSpecialChar(mask.charAt(i))){
if(KT_validateSingle(val.charAt(i),mask.charAt(i))){
continue;
}else{
val=KT_focusedEl.oldText;
i=mask.length;
break;
}
}else{
if(val.charAt(i)!=mask.charAt(i)){
if(i==val.length-1){
var _982=val.substr(val.length-1,val.length);
val=val.substr(0,val.length-1)+mask.charAt(i)+_982;
_981=true;
continue;
}else{
val=KT_focusedEl.oldText;
i=mask.length;
}
break;
}
}
}else{
if(val.length<KT_focusedEl.oldText.length){
break;
}
for(;i<mask.length;i++){
if(!KT_isSpecialChar(mask.charAt(i))){
val+=mask.charAt(i);
_981=true;
}else{
break;
}
}
break;
}
}
if(val.length>mask.length){
val=val.substr(0,mask.length);
_981=true;
}
if(KT_focusedEl.value!=val){
KT_focusedEl.value=val;
}
KT_focusedEl.oldText=val;
if(_981){
}
};
mask_parseFirstTime=function(_983,mask){
var _985="";
var _986="";
cond=1;
imask=0;
ival=0;
cnt=0;
while(cond==1){
cond=1;
if(!KT_isSpecialChar(mask.charAt(imask))){
if(_983.charCodeAt(ival).toString()!="NaN"){
if(mask.charAt(imask)==_983.charAt(ival)){
imask++;
ival++;
}else{
_983=_983.substr(0,ival)+mask.charAt(imask)+_983.substr(ival,_983.length);
imask=0;
ival=0;
cond=1;
}
}else{
_983+=KT_maskDefaultValue(mask.charAt(imask));
}
}else{
imask++;
ival++;
}
if(imask>=mask.length||ival>=_983.length){
cond=0;
}
}
for(i=0;i<mask.length;i++){
if(KT_isSpecialChar(mask.charAt(i))){
_985+=mask.charAt(i);
if(_983.charCodeAt(i).toString()!="NaN"){
_986+=_983.charAt(i);
}else{
_986+=KT_maskDefaultValue(mask.charAt(i));
}
}
}
oldvalue=_983;
_983=_986;
var _987="";
for(i=0;i<_985.length;i++){
if(!KT_validateSingle(_983.charAt(i),_985.charAt(i))){
_987+=KT_maskDefaultValue(_985.charAt(i));
}else{
_987+=_983.charAt(i);
}
}
var _988="";
var j=0;
for(i=0;i<mask.length;i++){
if(KT_isSpecialChar(mask.charAt(i))){
_988+=_987.charAt(j++);
}else{
_988+=mask.charAt(i);
}
}
return _988;
};
mask_onSetFocus=function(obj,mask){
if((typeof window.getSelection=="undefined"&&typeof document.selection=="undefined")){
return;
}
if(typeof obj.mask=="undefined"){
ret="";
if(obj.value!=""){
ret=mask_parseFirstTime(obj.value,mask);
}
obj.value=ret;
obj.mask=mask;
}
KT_focusedEl=obj;
if(typeof KT_focusedEl.oldText=="undefined"){
KT_focusedEl.oldText=obj.value;
mask_onValueChanged();
}
};
mask_onKillFocus=function(){
if((typeof window.getSelection=="undefined"&&typeof document.selection=="undefined")){
return;
}
mask_onValueChanged();
KT_focusedEl=null;
};
