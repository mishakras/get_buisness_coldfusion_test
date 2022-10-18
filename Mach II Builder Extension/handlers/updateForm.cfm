<!--- 
/* 	Code from Brian Rinaldi's CF Builder Extension updater
 *	Acme Boomerang for ColdFusion Builder http://acmeboomerang.riaforge.org/
 *	http://www.adobe.com/devnet/coldfusion/articles/cfbuilder_selfupdating_extension.html?devcon=f2
 * 	License: Apache License, Version 2
 */
 --->
<cfheader name="Content-Type" value="text/xml">
<cfoutput>
<response status="success" type="default">
  <ide handlerfile="updateForm.cfm">
     <dialog width="320" height="200">
        <input name="Update Available (v. #remoteVersion#). Download? ." Lable="downloadUpdate" type="list">
           <option value="Yes" />
           <option value="No" />
        </input>               
     </dialog>
  </ide>
</response>
</cfoutput>
<cfabort />