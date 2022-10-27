<cfif isDefined('form.fld_user_loginSubmit')>
	<cfset variables.aErrorMessages = application.userService.validateUser_login(form.fld_Login, form.fld_Password) />
	<cfif arrayIsEmpty(variables.aErrorMessages)>
		<cfset arrayAppend(variables.aErrorMessages, application.userService.doLogin(form.fld_Login, form.fld_Password))/>
	</cfif>
</cfif>
<cfoutput>
	<cfinclude template="../menu_component.cfm" >
</cfoutput>
	<cfoutput>

	</cfoutput>
<cfif IsDefined('session.stLoggedInUser')>
	<cfoutput>
	<p>Вы вошли как #session.stLoggedInUser.user_name#</p>
	</cfoutput>
<cfelse>
	<cfform id="frm_comment" preservedata="true" >
		<fieldset>
			<legend>Вход</legend>
			<cfif isDefined('variables.aErrorMessages') AND NOT arrayIsEmpty(variables.aErrorMessages)>
				<cfoutput>
				<cfloop array="#variables.aErrorMessages#" index="message">
					<p class=errorMessage>#message#</p>
				</cfloop>
				</cfoutput>
			</cfif>
			<dl>
				<dt><label for="fld_Login">Логин</label></dt>
				<dd><cfinput name="fld_Login" id="fld_Login" required="true" message="Введите логин в форме" validateAt="onSubmit" /></dd>
				<dt><label for="fld_Password">Пароль</label></dt>
				<dd><cfinput type="password" name="fld_Password" id="fld_Password" required="true" message="Введите пароль в форме" validateAt="onSubmit" /></dd>
			</dl>
			<input type="submit" name="fld_user_loginSubmit" id="fld_user_loginSubmit" value="Log in" />
		</fieldset>
	</cfform>
</cfif>