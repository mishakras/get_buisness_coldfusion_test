/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
cfinitgrid=function(){
Ext.override(Ext.form.field.Number,{decimalPrecision:6});
if(!ColdFusion.Grid){
ColdFusion.Grid={};
}
var $G=ColdFusion.Grid;
if(!$G.GridBindelementsMap){
$G.GridBindelementsMap={};
}
var $L=ColdFusion.Log;
$G.init=function(id,name,_146,_147,edit,_149,_14a,_14b,_14c,_14d,_14e,_14f,_150,_151,_152,_153,_154,_155,_156,_157,_158,_159,_15a,_15b,_15c,_15d,_15e,_15f,_160,_161){
var grid;
var _163;
var _164=false;
if(_155&&typeof (_155)!="undefined"){
_163=_155;
_164=true;
}else{
_163="rowmodel";
_163=new Ext.selection.RowModel({mode:"SINGLE"});
}
var _165=_14c;
var _166={store:_14d,columns:_14c,selModel:_163,autoSizeColumns:_14a,autoSizeHeaders:_14a,stripeRows:_150,autoExpandColumnId:_14b};
if(_15f!=null&&typeof _15f!="undefined"){
_166.plugins=_15f;
}
var _167=ColdFusion.objectCache[id];
var _168=document.getElementById(_167.gridId);
if(_168!=null){
var _169=_168.style.cssText;
if(typeof _169=="undefined"){
_169="";
}
_169="width:"+_14e+"px;"+_169;
_168.style.cssText=_169;
}
_166.width=_14e;
if(_14a===true){
_166.viewConfig={forceFit:true};
_166.forceFit=true;
}else{
if(_155&&typeof (_155)!="undefined"){
_166.autoExpandColumn=_14b;
}else{
_166.autoExpandColumn=_14b;
}
}
if(_14f){
_166.height=_14f;
}else{
_166.autoHeight=true;
var _16a=".x-grid3-header {position: relative;}";
Ext.util.CSS.createStyleSheet(_16a,"_cf_grid"+id);
}
if(_157&&typeof (_157)!="undefined"){
_166.features={ftype:"grouping",groupHeaderTpl:"{columnName}: {groupValue} ({rows.length} items)"};
}
_166.title=_158;
_166.collapsible=_156;
if(_156&&_158==null){
_166.title="  ";
}
var _16b=ColdFusion.objectCache[id];
_16b.bindOnLoad=_149;
_16b.dynamic=_147;
_16b.styles=_151;
_16b.grouping=_157;
_16b.onLoadFunction=_15e;
_16b.multiRowSelection=_164;
_166.renderTo=_16b.gridId;
Ext.onReady(function(){
_166.dockedItems={xtype:"toolbar",dock:"top"};
_166.tbar=new Ext.Toolbar({hidden:true});
if(_147){
_166.bbar=new Ext.PagingToolbar({pageSize:_152,store:_14d});
if(_15c&&(_159||_15a)){
var _16c=_166.bbar;
if(_159){
_16c.add({xtype:"button",text:_159,handler:$G.insertRow,scope:_16b});
_16c.add({xtype:"button",text:" save ",handler:$G.saveNewRecord,scope:_16b});
_16c.add({xtype:"button",text:" cancel ",handler:$G.cancelNewRecord,scope:_16b});
}
if(_15a){
_16c.add({xtype:"button",text:_15a,handler:$G.deleteRow,scope:_16b});
}
}
}
if(edit&&!_147){
var bbar=new Ext.Toolbar();
if(_159||_15a){
if(_159){
bbar.add({xtype:"button",text:_159,handler:$G.insertRow,scope:_16b});
}
if(_15a){
bbar.add({xtype:"button",text:_15a,handler:$G.deleteRow,scope:_16b});
}
}else{
var bbar=new Ext.Toolbar({hidden:true});
}
_166.bbar=bbar;
}
_14d.pageSize=_152;
var fn=function(){
grid=Ext.create("Ext.grid.Panel",_166);
$G.Ext_caseInsensitive_sorting();
_14d.addListener("load",$G.Actions.onLoad,_16b,{delay:50});
grid.view.addListener("beforeshow",function(menu){
var _170=_165.getColumnCount();
for(var i=0;i<_170;i++){
if("CFGRIDROWINDEX"==_165.getDataIndex(i)){
menu.remove(menu.items["items"][i]);
break;
}
}
},this);
_16b.grid=grid;
if(!_147){
_14d.addListener("load",$G.Actions.onLoad,_16b,{delay:50});
_14d.load();
}
if(_147){
_14d._cf_errorHandler=_15d;
_14d.proxy._cf_actions=_16b;
if(_16b.bindOnLoad){
_14d.load({params:{start:0,limit:_152}});
}else{
_16b.bindOnLoad=true;
}
}else{
$G.applyStyles(_16b);
}
if(_160){
ColdFusion.Bind.register(_160,{actions:_16b},$G.bindHandler,false);
}
$L.info("grid.init.created","widget",[id]);
_16b.init(id,name,_146,_15b,_147,edit,_15c,_15d,_154,_152,_153,_157);
};
if(_147&&_161){
setTimeout(fn,0);
}else{
fn();
}
});
};
$G.applyStyles=function(_172){
Ext.util.CSS.createStyleSheet(_172.styles);
_172.stylesApplied=true;
};
$G.bindHandler=function(e,_174){
$G.refresh(_174.actions.id,_174.actions.preservePageOnSort);
};
$G.bindHandler._cf_bindhandler=true;
$G.refresh=function(_175,_176){
var _177=ColdFusion.objectCache[_175];
if(_177&&$G.Actions.prototype.isPrototypeOf(_177)==true){
var _178=_177.grid.getStore();
if(_177.dynamic){
_177.editOldValue=null;
_177.selectedRow=-1;
var bind=$G.GridBindelementsMap[_175];
if(bind){
var url=_178.proxy.url;
var _17b=bind.split(";");
for(i=0;i<_17b.length;i++){
var _17c=_17b[i].split(",");
indx=url.indexOf(_17c[0]+"=");
url1=url.substring(0,indx);
nxtindx=url.indexOf("&",indx);
url2=url.substring(nxtindx);
var val=_17c[2];
var eval="";
if(_17c[2]&&_17c[2].endsWith("()")){
val=_17c[2].substring(0,val.length-2);
eval=window[val]();
}else{
eval=ColdFusion.Bind.getBindElementValue(_17c[1],val,_17c[3]);
}
url=url1+"&"+_17c[0]+"="+eval+url2;
}
_178.proxy.url=url;
}
if(_176){
_178.lastOptions.page=1;
_178.currentPage=1;
_178.reload();
}else{
if(_178.lastOptions){
_178.lastOptions.page=1;
}
_178.currentPage=1;
_178.reload({params:{start:0,limit:_177.pageSize}});
}
}
}else{
ColdFusion.handleError(null,"grid.refresh.notfound","widget",[_175],null,null,true);
return;
}
if(_177.multiRowSelection){
}
$L.info("grid.refresh.success","widget",[_175]);
};
$G.Ext_caseInsensitive_sorting=function(){
Ext.data.Store.prototype.sortData=function(f,_180){
_180=_180||"ASC";
var st=this.fields.get(f).sortType;
var fn=function(r1,r2){
var v1=st(r1.data[f]),v2=st(r2.data[f]);
if(v1.toLowerCase){
v1=v1.toLowerCase();
v2=v2.toLowerCase();
}
return v1>v2?1:(v1<v2?-1:0);
};
this.data.sort(_180,fn);
if(this.snapshot&&this.snapshot!=this.data){
this.snapshot.sort(_180,fn);
}
};
};
$G.getTopToolbar=function(_186){
var _187=ColdFusion.objectCache[_186];
if(!_187){
ColdFusion.handleError(null,"grid.getTopToolbar.notfound","widget",[_186],null,null,true);
return;
}
return _187.grid.getDockedItems()[1];
};
$G.showTopToolbar=function(_188){
var _189=ColdFusion.objectCache[_188];
if(!_189){
ColdFusion.handleError(null,"grid.showTopToolbar.notfound","widget",[_188],null,null,true);
return;
}
var tbar=_189.grid.getDockedItems()[1];
if(!tbar){
ColdFusion.handleError(null,"grid.showTopToolbar.toolbarNotDefined","widget",[_188],null,null,true);
return;
}
tbar.show();
};
$G.hideTopToolbar=function(_18b){
var _18c=ColdFusion.objectCache[_18b];
if(!_18c){
ColdFusion.handleError(null,"grid.hideTopToolbar.notfound","widget",[_18b],null,null,true);
return;
}
var tbar=_18c.grid.getDockedItems()[1];
if(!tbar){
ColdFusion.handleError(null,"grid.hideTopToolbar.toolbarNotDefined","widget",[_18b],null,null,true);
return;
}
tbar.hide();
};
$G.refreshTopToolbar=function(_18e){
var _18f=ColdFusion.objectCache[_18e];
if(!_18f){
ColdFusion.handleError(null,"grid.refreshTopToolbar.notfound","widget",[_18e],null,null,true);
return;
}
var tbar=_18f.grid.getDockedItems()[1];
if(!tbar){
ColdFusion.handleError(null,"grid.refreshTopToolbar.toolbarNotDefined","widget",[_18e],null,null,true);
return;
}
tbar.doLayout();
if(tbar.isVisible()==false){
tbar.show();
}
};
$G.getBottomToolbar=function(_191){
var _192=ColdFusion.objectCache[_191];
if(!_192){
ColdFusion.handleError(null,"grid.getBottomToolbar.notfound","widget",[_191],null,null,true);
return;
}
return _192.grid.getDockedItems()[_192.grid.getDockedItems().length-1];
};
$G.showBottomToolbar=function(_193){
var _194=ColdFusion.objectCache[_193];
if(!_194){
ColdFusion.handleError(null,"grid.showBottomToolbar.notfound","widget",[_193],null,null,true);
return;
}
var tbar=_194.grid.getDockedItems()[_194.grid.getDockedItems().length-1];
if(!tbar){
ColdFusion.handleError(null,"grid.showBottomToolbar.toolbarNotDefined","widget",[_193],null,null,true);
return;
}
tbar.show();
};
$G.hideBottomToolbar=function(_196){
var _197=ColdFusion.objectCache[_196];
if(!_197){
ColdFusion.handleError(null,"grid.hideBottomToolbar.notfound","widget",[_196],null,null,true);
return;
}
var tbar=_197.grid.getDockedItems()[_197.grid.getDockedItems().length-1];
if(!tbar){
ColdFusion.handleError(null,"grid.hideBottomToolbar.toolbarNotDefined","widget",[_196],null,null,true);
return;
}
tbar.hide();
};
$G.refreshBottomToolbar=function(_199){
var _19a=ColdFusion.objectCache[_199];
if(!_19a){
ColdFusion.handleError(null,"grid.refreshBottomToolbar.notfound","widget",[_199],null,null,true);
return;
}
var tbar=_19a.grid.getDockedItems()[_19a.grid.getDockedItems().length-1];
if(!tbar){
ColdFusion.handleError(null,"grid.refreshBottomToolbar.toolbarNotDefined","widget",[_199],null,null,true);
return;
}
tbar.doLayout();
if(tbar.isVisible()==false){
tbar.show();
}
};
$G.sort=function(_19c,_19d,_19e){
var _19f=ColdFusion.objectCache[_19c];
if(!_19f){
ColdFusion.handleError(null,"grid.sort.notfound","widget",[_19c],null,null,true);
return;
}
_19d=_19d.toUpperCase();
var _1a0=-1;
var _1a1=_19f.grid.columns;
for(var i=0;i<_1a1.length-1;i++){
if(_19d==_1a1[i].colName){
_1a0=i;
break;
}
}
if(_1a0==-1){
ColdFusion.handleError(null,"grid.sort.colnotfound","widget",[_19d,_19c],null,null,true);
return;
}
if(!_19e){
_19e="ASC";
}
_19e=_19e.toUpperCase();
if(_19e!="ASC"&&_19e!="DESC"){
ColdFusion.handleError(null,"grid.sort.invalidsortdir","widget",[_19e,_19c],null,null,true);
return;
}
var _1a3=_19f.grid.getStore();
_1a3.sort(_19d,_19e);
};
$G.getGridObject=function(_1a4){
if(!_1a4){
ColdFusion.handleError(null,"grid.getgridobject.missinggridname","widget",null,null,null,true);
return;
}
var _1a5=ColdFusion.objectCache[_1a4];
if(_1a5==null||$G.Actions.prototype.isPrototypeOf(_1a5)==false){
ColdFusion.handleError(null,"grid.getgridobject.notfound","widget",[_1a4],null,null,true);
return;
}
return _1a5.grid;
};
$G.getSelectedRows=function(_1a6){
if(!_1a6){
ColdFusion.handleError(null,"grid.getSelectedRowData.missinggridname","widget",null,null,null,true);
return;
}
var _1a7=ColdFusion.objectCache[_1a6];
var _1a8=new Array();
var _1a9=_1a7.grid.getSelectionModel();
var _1aa=_1a9.selected;
var _1ab=_1a7.grid.columns;
var _1ac=0;
if(_1a7.multiRowSelection===true&&_1a7.dynamic===false){
_1ac++;
}
for(i=0;i<_1aa.length;i++){
var _1ad=_1aa.items[i].data;
var _1ae={};
for(var _1af=_1ac;_1af<_1ab.length-1;_1af++){
var key=_1ab[_1af].dataIndex;
_1ae[key]=_1ad[key];
}
_1a8[i]=_1ae;
}
return _1a8;
};
$G.clearSelectedRows=function(_1b1){
if(!_1b1){
ColdFusion.handleError(null,"grid.getSelectedRowData.missinggridname","widget",null,null,null,true);
return;
}
var _1b2=ColdFusion.objectCache[_1b1];
var _1b3=_1b2.grid.getSelectionModel();
_1b3.deselectAll();
if(_1b2.multiRowSelection){
}
};
$G.Actions=function(_1b4){
this.gridId=_1b4;
this.init=$G.Actions.init;
this.onChangeHandler=$G.Actions.onChangeHandler;
this.onChangeHandler_MultiRowsDelete=$G.Actions.onChangeHandler_MultiRowsDelete;
this.selectionChangeEvent=new ColdFusion.Event.CustomEvent("cfGridSelectionChange",_1b4);
this.fireSelectionChangeEvent=$G.fireSelectionChangeEvent;
this._cf_getAttribute=$G.Actions._cf_getAttribute;
this._cf_register=$G.Actions._cf_register;
this.loaded=false;
};
$G.Actions.init=function(id,_1b6,_1b7,_1b8,_1b9,edit,_1bb,_1bc,_1bd,_1be,_1bf,_1c0){
this.id=id;
this.gridName=_1b6;
this.formId=_1b7;
this.form=document.getElementById(_1b7);
this.cellClickInfo=_1b8;
this.edit=edit;
this.onChangeFunction=_1bb;
this.onErrorFunction=_1bc;
this.preservePageOnSort=_1bd;
this.pageSize=_1be;
this.selectedRow=-1;
this.selectOnLoad=_1bf;
this.grouping=_1c0;
this.grid.addListener("cellclick",$G.cellClick,this,true);
this.editField=document.createElement("input");
this.editField.setAttribute("name",_1b6);
this.editField.setAttribute("type","hidden");
this.form.appendChild(this.editField);
if(edit){
if(!_1b9){
var _1c1=this.grid.columns;
this.editFieldPrefix="__CFGRID__EDIT__=";
var i=0;
var _1c3=_1c1.length-1;
if(this.multiRowSelection===true&&this.dynamic===false){
i++;
_1c3--;
}
this.editFieldPrefix+=_1c3+$G.Actions.fieldSep;
var _1c4=true;
for(i;i<_1c1.length-1;i++){
if(!_1c4){
this.editFieldPrefix+=$G.Actions.fieldSep;
}
this.editFieldPrefix+=_1c1[i].colName;
this.editFieldPrefix+=$G.Actions.valueSep;
if(_1c1[i].getEditor()){
this.editFieldPrefix+="Y";
}else{
this.editFieldPrefix+="N";
}
_1c4=false;
}
this.editFieldPrefix+=$G.Actions.fieldSep;
}
this.editFieldState=[];
this.editFieldState.length=this.grid.getStore().getTotalCount();
$G.Actions.computeEditField(this);
this.insertInProgress=false;
this.insertEvent=null;
this.grid.addListener("beforeedit",$G.Actions.beforeEdit,this);
this.grid.addListener("edit",$G.Actions.afterEdit,this,true);
}
if(_1b9){
this.grid.getStore().addListener("beforeload",$G.Actions.beforeLoad,this,true);
}
this.grid.getSelectionModel().addListener("select",$G.rowSelect,this,true);
this.grid.getSelectionModel().addListener("beforerowselect",$G.beforeRowSelect,this,true);
};
$G.Actions.beforeLoad=function(_1c5,_1c6){
var _1c7=_1c5.sortInfo;
var _1c8=(_1c6.sorters&&_1c6.sorters[0]&&_1c6.sorters[0].property!=this.sortCol);
if(_1c8&&!this.preservePageOnSort){
_1c6.start=0;
_1c6.page=1;
_1c5.currentPage=1;
}
if(_1c6.sorters&&_1c6.sorters[0]){
this.sortCol=_1c6.sorters[0].property;
this.sortDir=_1c6.sorters[0].direction;
}
};
$G.Actions.onLoad=function(_1c9){
this.editOldValue=null;
this.selectedRow=-1;
this.insertInProgress=false;
var _1ca=0;
if((this.bindOnLoad||!this.dynamic)&&this.selectOnLoad&&!this.grouping){
this.grid.getSelectionModel().select(_1ca,false);
}
if(!this.gridRendered&&this.onLoadFunction&&typeof this.onLoadFunction=="function"){
this.gridRendered=true;
this.onLoadFunction.call(null,this.grid);
}
$G.applyStyles(_1c9);
try{
var _1cb=Ext.ComponentQuery.query("tabpanel");
if(_1cb&&this.grid&&this.loaded==false){
for(var i=0;i<_1cb.length;i++){
if(_1cb[i].body.dom.innerHTML.indexOf(this.grid.id)>0){
_1cb[i].updateLayout();
this.loaded=true;
}
}
}
}
catch(exception){
}
};
$G.Actions._cf_getAttribute=function(_1cd){
_1cd=_1cd.toUpperCase();
var _1ce=this.selectedRow;
var _1cf=null;
if(_1ce!=0&&(!_1ce||_1ce==-1)){
return _1cf;
}
var ds=this.grid.getStore();
var _1d1=(this.dynamic)?ds.getAt(_1ce):ds.getById(_1ce);
_1cf=_1d1.get(_1cd);
return _1cf;
};
$G.Actions._cf_register=function(_1d2,_1d3,_1d4){
this.selectionChangeEvent.subscribe(_1d3,_1d4);
};
$G.rowSelect=function(_1d5,_1d6,row){
var _1d8="";
var _1d9=_1d5.selected.items;
if(_1d9.length==0){
return;
}
var _1da=_1d9[0].get("CFGRIDROWINDEX")||row;
if(_1da&&(_1da+"").indexOf("cf_gridmodel")==0){
_1da=row;
}
if(this.selectedRow!=_1da){
this.selectedRow=_1da;
var _1db=true;
for(col in _1d9[0].data){
if(col=="CFGRIDROWINDEX"){
continue;
}
if(typeof col=="undefined"||col=="undefined"){
continue;
}
if(!_1db){
_1d8+="; ";
}
_1d8+="__CFGRID__COLUMN__="+col+"; ";
_1d8+="__CFGRID__DATA__="+_1d9[0].data[col];
_1db=false;
}
this.fireSelectionChangeEvent();
this.insertInProgress=false;
}
};
$G.beforeRowSelect=function(_1dc,row){
var ds=this.grid.getStore();
var _1df=ds.getAt(row);
return !$G.isNullRow(_1df.data);
};
$G.isNullRow=function(data){
var _1e1=true;
for(col in data){
if(data[col]!=null){
_1e1=false;
break;
}
}
return _1e1;
};
$G.fireSelectionChangeEvent=function(){
$L.info("grid.fireselectionchangeevent.fire","widget",[this.id]);
this.selectionChangeEvent.fire();
};
$G.cellClick=function(grid,td,_1e4,_1e5,tr,_1e7,e,_1e9){
var _1ea=this.cellClickInfo.colInfo[_1e4];
if(_1ea){
var _1eb=grid.getSelectionModel().selected;
var url;
if(_1eb.items.length>0&&_1eb.items[0].data){
url=_1eb.items[0].data[_1ea.href.toUpperCase()];
}
if(!url){
url=_1ea.href;
}
var _1ed=_1ea.hrefKey;
var _1ee=_1ea.target;
var _1ef=this.appendKey;
if(this.cellClickInfo.appendKey){
var _1f0;
if(_1ed||_1ed==0){
var _1f1=grid.getStore().getAt(_1e7);
var _1f2=grid.panel.columns[_1ed].dataIndex;
_1f0=_1f1.get(_1f2);
}else{
var _1f3=this.grid.columns;
_1f0=_1eb.items[0].get(_1f3[0].dataIndex);
for(var i=1;i<_1f3.length-1;i++){
_1f0+=","+_1eb.items[0].get(_1f3[i].dataIndex);
}
}
if(url.indexOf("?")!=-1){
url+="&CFGRIDKEY="+_1f0;
}else{
url+="?CFGRIDKEY="+_1f0;
}
}
if(_1ee){
_1ee=_1ee.toLowerCase();
if(_1ee=="_top"){
_1ee="top";
}else{
if(_1ee=="_parent"){
_1ee="parent";
}else{
if(_1ee=="_self"){
_1ee=window.name;
}else{
if(_1ee=="_blank"){
window.open(encodeURI(url));
return;
}
}
}
}
if(!parent[_1ee]){
ColdFusion.handleError(null,"grid.cellclick.targetnotfound","widget",[_1ee]);
return;
}
parent[_1ee].location=encodeURI(url);
}else{
window.location=encodeURI(url);
}
}
};
$G.insertRow=function(){
if(this.insertInProgress&&this.dynamic){
ColdFusion.handleError(null,"Multiple row insert is not supported","Grid",[this.gridId],null,null,true);
return;
}
var _1f5={action:"I",values:[]};
var _1f6=this.grid.columns;
var _1f7=this.grid.getStore();
var _1f8={};
var _1f9="{";
for(var i=0;i<_1f6.length-1;i++){
var _1fb="";
_1f5.values[i]=[_1fb,_1fb];
_1f8[_1f6[i].dataIndex]=_1fb;
_1f9=_1f9+"\""+_1f6[i].colName+"\":\""+_1fb+"\",";
}
_1f8["CFGRIDROWINDEX"]=_1f7.getCount()+1;
_1f9=_1f9+"\"CFGRIDROWINDEX\":\""+(_1f7.getCount()+1)+"\"}";
_1f7.add(JSON.parse(_1f9));
_1f7.getAt(_1f7.getCount()-1).data["CFGRIDROWINDEX"]=_1f7.getCount();
if(this.dynamic==true){
this.selectedRow=_1f7.getCount();
}
this.editFieldState.push(_1f5);
this.grid.getSelectionModel().select(_1f7.getCount()-1);
this.insertInProgress=true;
$G.Actions.computeEditField(this);
};
$G.saveNewRecord=function(){
if(!this.insertInProgress){
return;
}
var _1fc=this.selectedRow;
var _1fd=this.insertEvent;
if(_1fc==-1){
return;
}
if(this.onChangeFunction){
this.onChangeHandler("I",_1fc-1,_1fd,$G.insertRowCallback);
}else{
if(this.dynamic==false){
var _1fe=this.grid.getStore();
var _1ff=_1fd.record;
var _200=new Array(1);
_200[0]=_1ff;
var _201=_1fe.getAt(this.selectedRow-1);
_1fe.remove(_201);
_1fe.add(_200);
}
}
this.insertInProgress=false;
this.insertEvent=null;
};
$G.cancelNewRecord=function(){
if(!this.insertInProgress){
return;
}
this.editFieldState.pop();
var _202=this.grid.getStore();
var _203=_202.getAt(this.selectedRow-1);
_202.remove(_203);
this.insertInProgress=false;
this.insertEvent=null;
this.selectedRow=this.selectedrow-1;
};
$G.deleteRow=function(){
var _204=null;
var _205;
if(this.multiRowSelection===true){
var _206=this.grid.getSelectionModel();
_204=_206.selected;
}
_204=this.grid.getSelectionModel().getSelection();
if(_204!=null&&_204.length<2){
_204=null;
}
if(_204==null){
_205=this.selectedRow;
}
if(_205==-1&&_204==null){
return;
}
if(this.onChangeFunction){
if(_204!=null){
this.onChangeHandler_MultiRowsDelete("D",_204,null,$G.deleteRowCallback);
}else{
this.onChangeHandler("D",_205,null,$G.deleteRowCallback);
}
}else{
if(!this.dynamic){
var _207=this.grid.getStore();
if(_204!=null){
for(i=0;i<_204.length;i++){
var _208=_207.indexOf(_204[i]);
var _209=this.editFieldState[_208];
if(_209){
_209.action="D";
}else{
_209=$G.Actions.initEditState(this,"D",_204[i],_208+1);
}
}
for(i=0;i<_204.length;i++){
_207.remove(_204[i]);
}
}else{
var _209=this.editFieldState[_205-1];
if(_209){
_209.action="D";
}else{
var _20a=this.grid.getStore().getById(_205);
_209=$G.Actions.initEditState(this,"D",_20a,_205);
}
_207.remove(this.grid.getSelectionModel().getSelection());
}
$G.Actions.computeEditField(this);
this.grid.editingPlugin.completeEdit();
this.selectedRow=-1;
}
}
};
$G.deleteRowCallback=function(_20b,_20c){
var _20d=_20c._cf_grid.getStore();
var _20e=_20c._cf_grid_properties;
var _20c=_20d.lastOptions;
var key="start";
if(_20d.getCount()==1){
if(_20c.start>=_20c.limit){
_20c.start=_20c.start-_20c.limit;
}
_20c.page=_20c.page-1;
_20d.reload(_20c);
}else{
_20d.reload();
}
if(_20e.multiRowSelection){
var _210=_20e.grid.getView().headerCt(0);
if(_210!=null){
var _211=Ext.Element.get(_210).first();
if(_211){
_211.replaceClass("x-grid3-hd-checker-on");
}
}
}
};
$G.insertRowCallback=function(_212,_213){
var _214=_213._cf_grid.getStore();
var _215=_213._cf_grid.actions;
_214.reload();
};
$G.Actions.beforeEdit=function(_216,e,_218){
if($G.isNullRow(e.record.data)){
return false;
}
this.editColumn=e.column;
this.editOldValue=e.value;
};
$G.Actions.afterEdit=function(_219,_21a,_21b){
var _21c=_21a.value;
if(_21c==this.editOldValue){
return;
}
if(this.insertInProgress==false&&this.onChangeFunction){
this.onChangeHandler("U",this.selectedRow,_21a);
}else{
if(!this.dynamic){
rowidx=_21a.rowIdx;
if(!rowidx&&rowidx!=0){
rowidx=_21a.row;
}
var _21d=$G.computeActualRow_editField(this.editFieldState,_21a.record.data.CFGRIDROWINDEX);
var _21e=this.editFieldState[_21d-1];
var _21f=_21a.colIdx;
if(!_21f&&_21f!=0){
_21f=_21a.column;
}
var cols=_219.grid.columns;
var _221=_21a.field;
for(i=0;i<cols.length;i++){
var col=cols[i];
if(_221==col.colName){
_21f=i;
}
}
if(_21e){
if(this.multiRowSelection===true&&this.insertInProgress==true){
_21f=_21f-1;
}
_21e.values[_21f][1]=_21c;
}else{
var _223=this.grid.getStore().getById(_21a.record.data.CFGRIDROWINDEX);
_21e=$G.Actions.initEditState(this,"U",_223,_21d);
var _224=this.editOldValue+"";
if(_21a.column.type=="date"){
if(_224&&typeof _224=="string"){
_224=new Date(_224);
}
var _225="F, j Y H:i:s";
if(_21a.column&&_21a.column.format){
_225=_21a.column.format;
}
_21e.values[_21f][1]=Ext.Date.format(_21c,_225);
_21e.values[_21f][0]=_224?Ext.Date.format(_224,_225):_224;
}else{
_21e.values[_21f][0]=_224;
_21e.values[_21f][1]=_21c;
}
}
$G.Actions.computeEditField(this);
}
}
this.editOldValue=null;
this.fireSelectionChangeEvent();
};
$G.computeActualRow_editField=function(_226,_227){
if(_226.length==_227){
return _227;
}
var _228=0;
var _229=0;
for(;_229<_226.length&&_228<_227;_229++){
var _22a=_226[_229];
if(!_22a||_22a.action!="D"){
_228++;
}
}
return _229;
};
$G.Actions.onChangeHandler=function(_22b,_22c,_22d,_22e){
var _22f={};
var _230={};
var data="";
if(null==_22d){
data=this.grid.getStore().getAt(_22c).data;
}else{
data=_22d?_22d.record.data:this.grid.getStore().getAt(_22c).data;
}
for(col in data){
_22f[col]=data[col];
}
if(_22b=="U"){
if((_22d.value==null||_22d.value=="")&&(_22d.originalValue==null||_22d.originalValue=="")){
return;
}
if(_22d.value&&_22d.column.type=="date"){
if(typeof _22d.originalValue=="string"){
var _232=new Date(_22d.originalValue);
}
if(_232!=null&&_232.getElapsed(_22d.value)==0){
return;
}else{
_22f[_22d.field]=_22d.originalValue;
var _233="F, j Y H:i:s";
if(_22d.column.format){
_233=_22d.column.format;
}
_230[_22d.field]=Ext.Date.format(_22d.value,_233);
}
}else{
_22f[_22d.field]=_22d.originalValue;
_230[_22d.field]=_22d.value;
}
}
this.onChangeFunction(_22b,_22f,_230,_22e,this.grid,this.onErrorFunction,this);
};
$G.Actions.onChangeHandler_MultiRowsDelete=function(_234,_235,_236,_237){
var _238=new Array();
var _239={};
for(i=0;i<_235.length;i++){
_238[i]=_235.items[i].data;
}
this.onChangeFunction(_234,_238,_239,_237,this.grid,this.onErrorFunction,this);
};
$G.Actions.initEditState=function(_23a,_23b,_23c,_23d){
var _23e={action:_23b,values:[]};
var _23f=_23a.grid.columns;
var _240=_23f.length-1;
_23e.values.length=_240;
var i=0;
if(_23a.multiRowSelection===true&&_23a.dynamic===false){
i=i++;
}
for(i;i<_240;i++){
var _242=_23c.get(_23f[i].colName);
_23e.values[i]=[_242,_242];
}
_23a.editFieldState[_23d-1]=_23e;
return _23e;
};
$G.Actions.fieldSep=eval("'\\u0001'");
$G.Actions.valueSep=eval("'\\u0002'");
$G.Actions.nullValue=eval("'\\u0003'");
$G.Actions.computeEditField=function(_243){
if(_243.dynamic){
return;
}
var _244=_243.editFieldPrefix;
var _245=_243.editFieldState;
var _246=_243.grid.columns;
var _247=0;
var _248="";
for(var i=0;i<_245.length;i++){
var _24a=_245[i];
if(_24a){
_247++;
_248+=$G.Actions.fieldSep;
_248+=_24a.action+$G.Actions.valueSep;
var _24b=_24a.values;
if(_243.multiRowSelection===true&&_243.dynamic===false&&_24a.action!="I"){
_24b=_24b.slice(1,_24b.length);
}
for(var j=0;j<_24b.length;j++){
if(j>0){
_248+=$G.Actions.valueSep;
}
var _24d=($G.Actions.isNull(_24b[j][0]))?$G.Actions.nullValue:_24b[j][0];
var _24e=($G.Actions.isNull(_24b[j][1]))?$G.Actions.nullValue:_24b[j][1];
var _24f=j;
if(_243.multiRowSelection===true){
_24f++;
}
if(_246[_24f].getEditor()&&_24e==$G.Actions.nullValue&&_246[_24f].getEditor().xtype=="checkbox"){
_24e="0";
}
if(_24a.action!="I"||(_24a.action=="I"&&_246[_24f].getEditor())){
_248+=_24e;
if(_24a.action=="U"&&_246[_24f].getEditor()){
_248+=$G.Actions.valueSep+_24d;
}
}
}
}
}
_244+=_247+_248;
_243.editField.setAttribute("value",_244);
};
$G.Actions.isNull=function(val){
var ret=(val==null||typeof (val)=="undefined"||val.length==0);
return ret;
};
$G.loadData=function(data,_253){
_253._cf_gridDataProxy.loadResponse(data,_253);
var _254=ColdFusion.objectCache[_253._cf_gridname];
$G.applyStyles(_254);
$L.info("grid.loaddata.loaded","widget",[_253._cf_gridname]);
if($G.Actions.isNull(data.TOTALROWCOUNT)==false&&data.TOTALROWCOUNT==0){
_254.fireSelectionChangeEvent();
}
};
$G.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
str+=value;
}
return str;
};
$G.formatBoolean=function(v,p,_259){
return "<div class=\"x-grid3-check-col"+(v?"-on":"")+" x-grid3-cc-"+this.id+"\">&#160;</div>";
};
$G.formatDate=function(_25a,p,_25c){
if(_25a&&!_25a.dateFormat){
_25a=new Date(_25a);
}
var _25d=this.dateFormat?this.dateFormat:"m/d/y";
return _25a?Ext.Date.dateFormat(_25a,_25d):"";
};
$G.convertDate=function(_25e,p,_260){
if(_25e&&!_25e.dateFormat){
_25e=new Date(_25e);
}
var _261=this.dateFormat?this.dateFormat:"m/d/y";
return _25e;
};
$G.ExtProxy=function(_262,_263){
this.api={load:true,create:undefined,save:undefined,destroy:undefined};
$G.ExtProxy.superclass.constructor.call(this);
this.bindHandler=_262;
this.errorHandler=_263;
};
Ext.extend($G.ExtProxy,Ext.data.DataProxy,{_cf_firstLoad:true,load:function(_264,_265,_266,_267,arg){
if(!this._cf_actions.bindOnLoad){
var _269={"_cf_reader":_265,"_cf_grid_errorhandler":this.errorHandler,"_cf_scope":_267,"_cf_gridDataProxy":this,"_cf_gridname":this._cf_gridName,"_cf_arg":arg,"_cf_callback":_266,"ignoreData":true};
var data=[];
for(i=0;i<_264.limit;i++){
data.push(new Ext.data.Record({}));
}
this.loadResponse(data,_269);
this._cf_actions.bindOnLoad=true;
}else{
var _26b=(_264.start/_264.limit)+1;
if(!_264.sort){
_264.sort="";
}
if(!_264.dir){
_264.dir="";
}
this.bindHandler(this,_26b,_264.limit,_264.sort,_264.dir,this.errorHandler,_266,_267,arg,_265);
}
},loadResponse:function(data,_26d){
var _26e=null;
if(_26d.ignoreData){
_26e={success:true,records:data,totalRecords:data.length};
}else{
var _26f;
if(!data){
_26f="grid.extproxy.loadresponse.emptyresponse";
}else{
if(!data.TOTALROWCOUNT&&data.TOTALROWCOUNT!=0){
_26f="grid.extproxy.loadresponse.totalrowcountmissing";
}else{
if(!ColdFusion.Util.isInteger(data.TOTALROWCOUNT)){
_26f="grid.extproxy.loadresponse.totalrowcountinvalid";
}else{
if(!data.QUERY){
_26f="grid.extproxy.loadresponse.querymissing";
}else{
if(!data.QUERY.COLUMNS||!ColdFusion.Util.isArray(data.QUERY.COLUMNS)||!data.QUERY.DATA||!ColdFusion.Util.isArray(data.QUERY.DATA)||(data.QUERY.DATA.length>0&&!ColdFusion.Util.isArray(data.QUERY.DATA[0]))){
_26f="grid.extproxy.loadresponse.queryinvalid";
}
}
}
}
}
if(_26f){
ColdFusion.handleError(_26d._cf_grid_errorHandler,_26f,"widget");
this.fireEvent("loadexception",this,_26d,data,e);
return;
}
_26e=_26d._cf_reader.readRecords(data);
}
this.fireEvent("load",this,_26d,_26d._cf_arg);
_26d._cf_callback.call(_26d._cf_scope,_26e,_26d._cf_arg,true);
},update:function(_270){
},updateResponse:function(_271){
}});
$G.ExtReader=function(_272){
this.recordType=Ext.data.Record.create(_272);
};
Ext.extend($G.ExtReader,Ext.data.DataReader,{readRecords:function(_273){
var _274=[];
var cols=_273.QUERY.COLUMNS;
var data=_273.QUERY.DATA;
for(var i=0;i<data.length;i++){
var _278={};
for(var j=0;j<cols.length;j++){
_278[cols[j]]=data[i][j];
}
_274.push(new Ext.data.Record(_278));
}
return {success:true,records:_274,totalRecords:_273.TOTALROWCOUNT};
}});
$G.CheckColumn=function(_27a){
Ext.apply(this,_27a);
if(!this.id){
this.id=Ext.id();
}
this.renderer=this.renderer.bind(this);
};
$G.findColumnIndex=function(grid,_27c){
var _27d=grid.headerCt.getGridColumns();
for(var i=0;i<_27d.length;i++){
if(_27d[i].dataIndex==_27c){
return i;
}
}
};
$G.CheckColumn.prototype={init:function(grid){
this.grid=grid;
this.count=0;
this.columnIndex=$G.findColumnIndex(this.grid,this.dataIndex);
this.grid.on("render",function(){
var view=this.grid.getView();
if(this.editable==true){
this.grid.addListener("itemmousedown",this.onMouseDown,this);
}
},this);
},onMouseDown:function(thi,_282,item,_284,e,_286){
var t=e.target;
if(t.className&&t.className.indexOf("x-grid-cc-"+this.id)!=-1){
e.stopEvent();
var _288=ColdFusion.clone(_282);
_288.data=ColdFusion.clone(_282.data);
this.grid.getSelectionModel().select(_284);
this.grid.getSelectionModel().fireEvent("rowselect",this.grid.getSelectionModel(),_284);
this.grid.fireEvent("beforeedit",this,{grid:this.grid,row:_284,record:_282,column:this.columnIndex,field:this.dataIndex,value:_282.data[this.dataIndex]});
_282.set(this.dataIndex,this.toggleBooleanValue(_282.data[this.dataIndex]));
this.grid.fireEvent("edit",this,{grid:this.grid,row:_284,record:_288,column:this.columnIndex,field:this.dataIndex,value:_282.data[this.dataIndex],originalValue:_288.data[this.dataIndex]});
}
},toggleBooleanValue:function(v){
v=typeof v=="undefined"?"N":(typeof v=="string"?v.toUpperCase():v);
if(v==="Y"){
return "N";
}
if(v==="N"){
return "Y";
}
if(v===true){
return false;
}
if(v===false){
return true;
}
if(v===0){
return 1;
}
if(v===1){
return 0;
}
if(v==="YES"){
return "NO";
}
if(v==="NO"){
return "YES";
}
if(v==="T"){
return "F";
}
if(v==="F"){
return "T";
}
return "Y";
},renderer:function(v,p,_28c){
p.css+=" x-grid-check-col-td";
var _28d=false;
v=(typeof v=="string")?v.toUpperCase():v;
if(typeof v!="undefined"&&(v==1||v=="1"||v=="Y"||v=="YES"||v=="TRUE"||v===true||v==="T")){
_28d=true;
}
return "<div style=\"background-repeat: no-repeat;background-position:center center;width:auto\" class=\"x-grid-cell-checker"+(_28d!=true?"-off":"")+" x-grid-cc-"+this.id+"\">&#160;</div>";
}};
$G.convertBoolean=function(v,_28f){
v=typeof v=="undefined"?"N":(typeof v=="string"?v.toUpperCase():v);
if(v==="Y"){
return "YES";
}
if(v==="N"){
return "NO";
}
if(v===true){
return "YES";
}
if(v===false){
return "NO";
}
if(v===0){
return "NO";
}
if(v===1){
return "YES";
}
if(v==="YES"){
return "YES";
}
if(v==="NO"){
return "NO";
}
if(v==="T"){
return "YES";
}
if(v==="F"){
return "NO";
}
if(v==="FALSE"){
return "NO";
}
if(v==""){
return "NO";
}
if(v.toUpperCase()=="NULL"){
return "NO";
}
return "YES";
};
Ext.define("MyReader",{extend:"Ext.data.reader.Json",alias:"reader.my-json",read:function(_290){
var _291;
if(_290.request){
_291=_290.request.proxy;
}
var _292=_290.responseText;
if(!_292){
_292=_290.responseJson;
}
if(!_292){
_292=_290;
}
var _293="";
if(_291&&!_291._cf_actions.bindOnLoad){
_293="{  totalrows:0, data :[] }";
_291._cf_actions.bindOnLoad=true;
}else{
_293=$G.queryToJson(_292);
}
if(_291){
$G.applyStyles(_291._cf_actions);
}
Ext.USE_NATIVE_JSON=false;
return this.callParent([Ext.decode(_293)]);
}});
Ext.define("customcfajax",{extend:"Ext.data.proxy.Ajax",alias:"proxy.customcfajax",getParams:function(_294){
params=this.callParent(arguments);
if(!(this.sortParam&&_294.config.sorters&&_294.config.sorters.length>0)){
params[this.sortParam]="";
params[this.directionParam]="ASC";
}
return params;
}});
Ext.define("Ext.data.proxy.JsProxy",{requires:["Ext.util.MixedCollection","Ext.Ajax"],extend:"Ext.data.proxy.Server",alias:"proxy.jsajax",alternateClassName:["Ext.data.HttpProxy","Ext.data.JsProxy"],actionMethods:{create:"POST",read:"GET",update:"POST",destroy:"POST"},binary:false,jsfunction:"",extraparams:[],getParams:function(_295){
params=this.callParent(arguments);
if(_295.config&&_295.config.sorters){
_295.sorters=_295.config.sorters;
}
if(!(this.sortParam&&_295.sorters&&_295.sorters.length>0)){
params[this.sortParam]="";
params[this.directionParam]="ASC";
}
return params;
},processResponse:function(_296,_297,_298,_299){
var me=this,exception,reader,resultSet,meta,destroyOp;
if(me.destroying||me.destroyed){
return;
}
me.fireEvent("beginprocessresponse",me,_299,_297);
if(_296===true){
reader=me.getReader();
if(_299.status===204){
resultSet=reader.getNullResultSet();
}else{
resultSet=reader.read(me.extractResponseData(_299),{recordCreator:_297.getRecordCreator()||reader.defaultRecordCreatorFromServer});
}
if(!_297.$destroyOwner){
_297.$destroyOwner=me;
destroyOp=true;
}
_297.process(resultSet,_298,_299);
exception=!_297.wasSuccessful();
}else{
me.setException(_297,_299);
exception=true;
}
if(me.destroyed){
if(!_297.destroyed&&destroyOp&&_297.$destroyOwner===me){
_297.destroy();
}
return;
}
if(exception){
me.fireEvent("exception",me,_299,_297);
}else{
meta=resultSet.getMetadata();
if(meta){
me.onMetaChange(meta);
}
}
if(me.destroyed){
if(!_297.destroyed&&destroyOp&&_297.$destroyOwner===me){
_297.destroy();
}
return;
}
me.fireEvent("endprocessresponse",me,_299,_297);
if(!_297.destroyed&&destroyOp&&_297.$destroyOwner===me){
_297.destroy();
}
},doRequest:function(_29b,_29c,_29d){
var me=this;
op=_29b;
if(!op.page){
op.page=op._page;
}
sorters=_29b.sorters;
sortcol="";
sortdir="ASC";
if(sorters&&sorters.length>0){
sortcol=sorters[0].property;
sortdir=sorters[0].direction;
}
if(this._cf_actions.bindOnLoad){
result=eval(this.jsfunction);
}else{
var _29f=[];
for(i=0;i<this._cf_actions.grid.columns.length;i++){
var _2a0=this._cf_actions.grid.columns[i];
_29f[i]=_2a0.colName;
}
result="{  totalrows:0, QUERY : { COLUMNS : "+_29f+" data :[] }}";
}
me.processResponse(true,_29b,"",result,_29c,_29d);
return null;
},getMethod:function(_2a1){
return this.actionMethods[_2a1.action];
},createRequestCallback:function(_2a2,_2a3,_2a4,_2a5){
var me=this;
return function(_2a7,_2a8,_2a9){
me.processResponse(_2a8,_2a3,_2a2,_2a9,_2a4,_2a5);
};
}},function(){
Ext.data.HttpProxy=this;
});
$G.queryToJson=function(data){
var _2ab=[];
jsondata=ColdFusion.AjaxProxy.JSON.decode(data);
var cols=jsondata.QUERY.COLUMNS;
var data=jsondata.QUERY.DATA;
var _2ad="{  totalrows:"+jsondata.TOTALROWCOUNT+", data :[";
for(var i=0;i<data.length;i++){
var _2af={};
_2ad=_2ad+"{";
for(var j=0;j<cols.length;j++){
if(data[i][j]==null){
data[i][j]="";
}
_2af[cols[j]]=data[i][j];
encodedata=ColdFusion.AjaxProxy.JSON.encode(data[i][j]);
_2ad=_2ad+cols[j]+":"+encodedata;
if(j!=cols.length-1){
_2ad=_2ad+",";
}
}
_2ad=_2ad+"}";
if(i!=data.length-1){
_2ad=_2ad+",";
}
}
_2ad=_2ad+"]}";
return _2ad;
};
$G.queryToArray=function(data){
var _2b2=[];
jsondata=ColdFusion.AjaxProxy.JSON.decode(data);
var cols=jsondata.QUERY.COLUMNS;
var data=jsondata.QUERY.DATA;
var _2b4=new Array();
for(var i=0;i<data.length;i++){
var _2b6=new Array(1);
for(var j=0;j<cols.length;j++){
_2b6[j]=data[i][j];
}
_2b4[i]=_2b6;
}
return _2b4;
};
};
cfinitgrid();
