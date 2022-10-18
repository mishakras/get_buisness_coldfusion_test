/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
ColdFusion.RichText||(ColdFusion.RichText={});
ColdFusion.RichText.editorState={};
ColdFusion.RichText.buffer=null;
ColdFusion.RichText.registerAfterSet=function(_1){
if(ColdFusion.RichText.editorState[_1]){
var _2=function(){
ColdFusion.RichText.fireChangeEvent(_1);
};
var _3=CKEDITOR.instances[_1];
_3.on("OnAfterSetHTML",_2);
}else{
setTimeout(function(){
ColdFusion.RichText.registerAfterSet(_1);
},1000);
}
};
ColdFusion.RichText.getEditorObject=function(_4){
if(!_4){
ColdFusion.handleError(null,"richtext.geteditorobject.missingtextareaname","widget",null,null,null,true);
return;
}
var _5=ColdFusion.objectCache[_4];
if(_5==null||CKEDITOR.editor.prototype.isPrototypeOf(_5)==false){
ColdFusion.handleError(null,"richtext.geteditorobject.notfound","widget",[_4],null,null,true);
return;
}
return CKEDITOR.instances[_5.richtextid];
};
ColdFusion.RichText.setValue=function(_6,_7){
if(ColdFusion.RichText.editorState[_6]){
var _8=CKEDITOR.instances[_6];
_8.setData(_7);
_8.fire("onAfterSetHTML");
}else{
setTimeout(function(){
ColdFusion.RichText.setValue(_6,_7);
},1000);
}
};
ColdFusion.RichText.getValue=function(_9){
if(ColdFusion.RichText.editorState[_9]){
return CKEDITOR.instances[_9].getData();
}else{
ColdFusion.Log.error("richtext.initialize.getvalue.notready","widget",[_9]);
return null;
}
};
ColdFusion.RichText.fireChangeEvent=function(_a){
var _b=ColdFusion.objectCache[_a];
ColdFusion.Log.info("richtext.firechangeevent.firechange","widget",[_b._cf_name]);
var _c=document.getElementById(_a);
if(_c){
if(_c.fireEvent){
_c.fireEvent("onchange");
}
if(document.createEvent){
var _d=document.createEvent("HTMLEvents");
if(_d.initEvent){
_d.initEvent("change",true,true);
}
if(_c.dispatchEvent){
_c.dispatchEvent(_d);
}
}
}
ColdFusion.Event.callBindHandlers(_a,null,"change");
};
ColdFusion.RichText.editor_onfocus=function(e){
document.getElementById(e.editor.id+"_top").style.display="block";
};
ColdFusion.RichText.editor_onblur=function(e){
document.getElementById(e.editor.id+"_top").style.display="none";
};
ColdFusion.RichText.setChangeBuffer=function(e){
ColdFusion.RichText.buffer=CKEDITOR.instances[e.editor.name].getData();
};
ColdFusion.RichText.resetChangeBuffer=function(e){
if(ColdFusion.RichText.buffer!=CKEDITOR.instances[e.editor.name].getData()){
ColdFusion.RichText.fireChangeEvent(e.editor.name);
}
ColdFusion.RichText.buffer=null;
};
var parameters={};
CKEDITOR.on("instanceCreated",function(e){
var _13=e.editor.name;
if(parameters[_13].Id){
ColdFusion.RichText.editorState[parameters[_13].Id]=false;
e.editor.richtextid=parameters[_13].Id;
ColdFusion.objectCache[parameters[_13].Id]=e.editor;
}
if(parameters[_13].Name){
e.editor._cf_name=parameters[_13].Name;
ColdFusion.objectCache[parameters[_13].Name]=e.editor;
}
if(parameters[_13].Val){
e.editor.Value=parameters[_13].Val;
}
e.editor._cf_setValue=function(_14){
ColdFusion.RichText.setValue(_13,_14);
};
e.editor._cf_getAttribute=function(){
return ColdFusion.RichText.getValue(_13);
};
e.editor._cf_register=function(_15,_16,_17){
var _18=document.getElementById(_13);
if(_18){
ColdFusion.Event.addListener(_18,_15,_16,_17);
}
};
});
ColdFusion.RichText.initialize=function(Id,_1a,Val,_1c,_1d,_1e,_1f,_20,_21,_22,_23,_24,_25,_26,_27){
parameters[Id]={};
parameters[Id].Id=Id;
parameters[Id].Name=_1a;
parameters[Id].Val=Val;
var _28=function(evt){
if(_23==true){
evt.editor.on("focus",ColdFusion.RichText.editor_onfocus);
evt.editor.on("blur",ColdFusion.RichText.editor_onblur);
document.getElementById(evt.editor.id+"_top").style.display="none";
}
evt.editor.on("focus",ColdFusion.RichText.setChangeBuffer);
evt.editor.on("blur",ColdFusion.RichText.resetChangeBuffer);
ColdFusion.RichText.editorState[evt.editor.name]=true;
if(ColdFusion.RichText.OnComplete){
ColdFusion.RichText.OnComplete(evt.editor);
}
};
var _2a={on:{"instanceReady":_28}};
_2a["toolbar"]="Default";
if(_1e!=null){
_2a["height"]=_1e;
}
if(_1d!=null){
_2a["width"]=_1d;
}
if(_1f!=null){
_2a["font_names"]=_1f;
}
if(_20!=null){
_2a["fontSize_sizes"]=_20;
}
if(_21!=null){
_2a["format_tags"]=_21;
}
if(_22!=null){
_2a["skin"]=_22;
}
if(_23==true){
_2a["toolbarCanCollapse"]=false;
}
if(_24!=null){
_2a["toolbar"]=_24;
}
var _2b=CKEDITOR.replace(Id,_2a);
};
