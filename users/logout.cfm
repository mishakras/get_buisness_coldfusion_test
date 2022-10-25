<cfoutput>
	<cfinclude template="../menu_component.cfm" >
</cfoutput>
<cfif IsDefined('session.stLoggedInUser')>
	<cfset variables.aErrorMessages = application.userService.doLogout() />
	<p>Выход из системы завершен</p>
<cfelse>
	<p>Вас нет в системе</p>
</cfif>
