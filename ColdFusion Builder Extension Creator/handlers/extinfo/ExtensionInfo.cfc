<!---
ADOBE SYSTEMS INCORPORATED
 Copyright 2009 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
--->

<cfcomponent name="ExtensionInfo" output="false"  >

	<cfset this.installLocation = "">
	<cfset this.projectName = "">
	<cfset this.projectPath = "">
	<cfset this.extName = "">
	<cfset this.author = "">
	<cfset this.version = "">
	<cfset this.email = "">
	<cfset this.description = "">
	<cfset this.license = "">
	<cfset this.createNewFolder = true>
	<cfset this.menus = ArrayNew(1)>
	<cfset this.handlers = ArrayNew(1)>
	<cfset this.installWizard = "">
	<cfset this.onProjectCreateNotifyHandlerId = "">
	<cfset this.processor = createObject("component","ExtensionInfoProcessor")>
	<cfset this.validExtension = true>
	

	<cffunction name="setInstallLocation">
		<cfargument name="location" required="true" >

		<cfset this.installLocation = arguments.location>
	</cffunction>

	<cffunction name="getInstallLocation" output="false" >
		<cfreturn this.installLocation>
	</cffunction>

	<cffunction name="setProjectPath">
		<cfargument name="path" required="true" >
		<cfset this.projectPath = arguments.path>
	</cffunction>

	<cffunction name="getProjectPath" output="false" >
		<cfreturn this.projectPath>
	</cffunction>

	<cffunction name="getProjectName" output="false" >
		<cfreturn this.projectName>
	</cffunction>

	<cffunction name="setProjectName">
		<cfargument name="name" required="true" >
		<cfset this.projectName = arguments.name>
	</cffunction>

	<cffunction name="getExtensionName" output="false" >
		<cfreturn this.extName>
	</cffunction>

	<cffunction name="setExtensionName">
		<cfargument name="name" required="true" >
		<cfset this.extName = arguments.name>
	</cffunction>

	<cffunction name="getAuthor" output="false" >
		<cfreturn this.author>
	</cffunction>

	<cffunction name="setAuthor">
		<cfargument name="author" required="true" >
		<cfset this.author = arguments.author>
	</cffunction>

	<cffunction name="getVersion" output="false" >
		<cfreturn this.version>
	</cffunction>

	<cffunction name="setVersion">
		<cfargument name="version" required="true" >
		<cfset this.version = arguments.version>
	</cffunction>

	<cffunction name="getEmail" output="false" >
		<cfreturn this.email>
	</cffunction>

	<cffunction name="setEmail">
		<cfargument name="email" required="true" >
		<cfset this.email = arguments.email>
	</cffunction>

	<cffunction name="getDescription" output="false" >
		<cfreturn this.description>
	</cffunction>

	<cffunction name="setDescription">
		<cfargument name="desc" required="true" >
		<cfset this.description = arguments.desc>
	</cffunction>

	<cffunction name="getLicense" output="false" >
		<cfreturn this.license>
	</cffunction>

	<cffunction name="setLicense">
		<cfargument name="license" required="true" >
		<cfset this.license = arguments.license>
	</cffunction>

	<cffunction name="addMenu" output="false" >
		<cfargument name="menu" required="true" type="Menu">
		<cfset ArrayAppend(this.menus,arguments.menu)>
	</cffunction>
	
	<cffunction name="deleteMenuAt" output="false">
		<cfargument name="index" required="true" type="numeric">
		<cfset Arraydeleteat(this.menus,index)>
	</cffunction>
	
	<cffunction name="getMenus" output="false" returntype="Array" >
		<cfreturn this.menus>
	</cffunction>

	<cffunction name="getMenuAt" output="false" returntype="Menu" >
		<cfargument name="index" required="true" type="numeric" >
		<cfreturn this.menus[index]>
	</cffunction>
	
	<cffunction name="getMenuIndex" output="false" returnType="numeric" >
		<cfargument name="name" required="true" >
		<cfloop index="i" from="1" to="#ArrayLen(this.menus)#">
			<cfif this.menus[i].getName() eq name>
				<cfreturn i>
			</cfif>
        </cfloop>
	</cffunction>

	<cffunction name="addHandler" output="false" >
		<cfargument name="handler" required="true" type="Handler">
		<cfset ArrayAppend(this.handlers,arguments.handler)>
	</cffunction>
	
	<cffunction name="getHandlers" output="false" returntype="Array" >
		<cfreturn this.handlers>
	</cffunction>

	<cffunction name="deleteHandlerAt" output="false">
		<cfargument name="index" required="true" type="numeric">
		<cfset Arraydeleteat(this.handlers,index)>
	</cffunction>

	<cffunction name="getHandlerAt" output="false" returntype="Handler" >
		<cfargument name="index" required="true" type="numeric" >
		<cfreturn this.handlers[index]>
	</cffunction>
	
	<cffunction name="getHandlerIds" output="false" returntype="Array" >
	
		<cfset result = ArrayNew(1)>
		<cfloop index="i" from="1" to="#ArrayLen(this.handlers)#">
			<cfset Arrayappend(result, this.handlers[i].getId())>
        </cfloop>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="getHandlerFromId" output="false" returntype="Handler">
		<cfargument name="id" required="true">
		<cfloop index="i" from="1" to="#ArrayLen(this.handlers)#">
			<cfif this.handlers[i].getId() eq id>
				<cfreturn this.handlers[i]>
			</cfif>
        </cfloop>
	</cffunction>

	<cffunction name="getHandlerFromName" output="false" returntype="Handler">
		<cfargument name="name" required="true">
		<cfloop index="i" from="1" to="#ArrayLen(this.handlers)#">
			<cfif this.handlers[i].getName() eq name>
				<cfreturn this.handlers[i]>
			</cfif>
        </cfloop>
	</cffunction>
	
	<cffunction name="setInstallWizard" output="false" >
		<cfargument name="wizard" required="true" type="InstallWizard">
		<cfset this.installWizard = arguments.wizard>
	</cffunction>
	
	<cffunction name="getInstallWizard" output="false" >
		<cfreturn this.installWizard>
	</cffunction>
	
	<cffunction name="isCreateNewFolder" output="false">
		<cfreturn this.createNewFolder>
	</cffunction>
	
	<cffunction name="setCreateNewFolder" output="false">
		<cfargument name="createFolder" required="true" >
		<cfset this.createNewFolder = arguments.createFolder>
	</cffunction>

	<cffunction name="generateHTMLSummary" output="false" returntype="string" >
		<cfreturn this.processor.generateHTMLSummary(this)>
	</cffunction>
	
	<cffunction name="generateExtension" returntype="boolean" >
		<cfreturn this.processor.generateExtension(this)>
    </cffunction>
	
	<cffunction name="getLogContent" returntype="string" output="false" >
		<cfreturn this.processor.getLogContent()>
	</cffunction>
	
	<cffunction name="validate" output="false" returnType="boolean">
		<cfset validateExtDetails()>
		<cfset validateMenus()>
		<cfset validateHandlers()>
		<cfset validateInstallWizard()>
		<cfreturn true>
	</cffunction>
	
	<cffunction name="validateExtDetails" output="false" access="private">
		<cfset var errMsg = "">
		
		<cfif this.installLocation eq "">
			<cfset errMsg = errMsg & "Installation location must be specified." & Chr(10) & Chr(13)>
		</cfif>
		
		<cfif this.extName eq "">
			<cfset errMsg = errMsg & "Extension name must be specified." & Chr(10) & Chr(13)>
		</cfif>
		
		<cfif ArrayLen(this.menus) eq 0>
			<cfset errMsg = errMsg & "You must define at least one menu contribution." & Chr(10) & Chr(13)>
		</cfif>
		
		<cfif ArrayLen(this.handlers) eq 0>
			<cfset errMsg = errMsg & "You must define at least one handler." & Chr(10) & Chr(13)>
		</cfif>
		
		<cfif errMsg neq "">
			<cfthrow message="#errMsg#" type="Application" >
		</cfif>
	</cffunction>
	
	<cffunction name="validateMenus" output="false">
		<cfloop index="i" from="1" to="#ArrayLen(this.menus)#">
			<cfset this.menus[i].validate()>
        </cfloop>
	</cffunction>
	
	<cffunction name="validateHandlers" output="false">
		<cfloop index="i" from="1" to="#ArrayLen(this.handlers)#">
			<cfset this.handlers[i].validate()>
        </cfloop>
	</cffunction>	

	<cffunction name="validateInstallWizard" output="false">
		<cfif not isSimplevalue(this.installWizard)>
			<cfset this.installWizard.validate()>
		</cfif>
	</cffunction>
	
	<cffunction name="getOnProjectCreateHandlerId" output="false">
		<cfreturn this.onProjectCreateNotifyHandlerId>
	</cffunction>
	
	<cffunction name="setOnProjectCreateHandlerId" output="false">
		<cfargument name="handlerId" required="true">
		<cfset this.onProjectCreateNotifyHandlerId = arguments.handlerId>
	</cffunction>
	
	<cffunction name="isValidExtension" returntype="boolean" >
		<cfreturn ththivalidExtension>
	</cffunction>
	
	<cffunction name="setValidExtension" >
		<cfargument name="valid" required="true" type="Boolean" >
		<cfset ththivalidExtension = arguments.valid>
    </cffunction>
</cfcomponent>
