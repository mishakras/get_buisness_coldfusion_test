<cfif isDefined('form.fld_user_registerSubmit')>
	<cfset variables.aErrorMessages = application.userService.validateUser_register(form.fld_Login, form.fld_Name, form.fld_Last_name,form.fld_Password,form.fld_Password_confirm) />
	<cfif arrayIsEmpty(variables.aErrorMessages)>
		<cfset arrayAppend(variables.aErrorMessages, application.userService.RegisterUser(form.fld_Login,form.fld_Name, form.fld_Last_name,form.fld_Password))/>
	</cfif>
</cfif>
<cfoutput>
	<cfinclude template="../menu_component.cfm" >
</cfoutput>
<cfform id="frm_user_register">
	<fieldset>
		<legend>Регистрация пользователя</legend>
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
			<dt><label for="fld_Name">Имя</label></dt>
			<dd><cfinput name="fld_Name" id="fld_Name" required="true" message="Введите имя в форме" validateAt="onSubmit" /></dd>
			<dt><label for="fld_Last_name">Фамилия</label></dt>
			<dd><cfinput name="fld_Last_name" id="fld_Last_name" required="true" message="Введите фамилию в форме" validateAt="onSubmit" /></dd>
			<dt><label for="fld_Password">Пароль</label></dt>
			<dd><cfinput type="password" name="fld_Password" id="fld_Password" required="true" message="Введите пароль в форме" validateAt="onSubmit" /></dd>
			<dt><label for="fld_Password_confirm">Подтверждение паролля</label></dt>
			<dd><cfinput type="password" name="fld_Password_confirm" id="fld_Password_confirm" required="true" message="Введите подтверждение пароля в форме" validateAt="onSubmit" /></dd>
		</dl>
		<input type="submit" name="fld_user_registerSubmit" id="fld_user_registerSubmit" value="Регистрация" />
	</fieldset>
</cfform>