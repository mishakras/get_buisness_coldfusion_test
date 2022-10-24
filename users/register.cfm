<cfif isDefined('form.fld_userSubmit')>
	<cfset variables.aErrorMessages = application.userService.validateUser(form.fld_Login, form.fld_Name, form.fld_Last_name,form.fld_Password,form.fld_Password_confirm) />
	<cfif arrayIsEmpty(variables.aErrorMessages)>
		<cfset arrayAppend(variables.aErrorMessages, application.userService.RegisterUser(form.fld_Login,form.fld_Name, form.fld_Last_name,form.fld_Password))/>
	</cfif>
</cfif>
<cfoutput>
	<cfinclude template="../Menu_component.cfc" >
</cfoutput>
<cfform id="frm_user_register">
	<fieldset>
		<legend>Register</legend>
		<cfif isDefined('variables.aErrorMessages') AND NOT arrayIsEmpty(variables.aErrorMessages)>
			<cfoutput>
			<cfloop array="#variables.aErrorMessages#" index="message">
				<p class=errorMessage>#message#</p>
			</cfloop>
			</cfoutput>
		</cfif>
		<dl>
			<dt><label for="fld_Login">Username</label></dt>
			<dd><cfinput name="fld_Login" id="fld_Login" required="true" message="Please enter your username in the form" validateAt="onSubmit" /></dd>
			<dt><label for="fld_Name">Your name</label></dt>
			<dd><cfinput name="fld_Name" id="fld_Name" required="true" message="Please enter your name in the form" validateAt="onSubmit" /></dd>
			<dt><label for="fld_Last_name">USername</label></dt>
			<dd><cfinput name="fld_Last_name" id="fld_Last_name" required="true" message="Please enter your last name in the form" validateAt="onSubmit" /></dd>
			<dt><label for="fld_Password">Password</label></dt>
			<dd><cfinput type="password" name="fld_Password" id="fld_Password" required="true" message="Please enter your password in the form" validateAt="onSubmit" /></dd>
			<dt><label for="fld_Password_confirm">Password confirmation</label></dt>
			<dd><cfinput type="password" name="fld_Password_confirm" id="fld_Password_confirm" required="true" message="Please confirm your password in the form" validateAt="onSubmit" /></dd>
		</dl>
		<input type="submit" name="fld_userSubmit" id="fld_userSubmit" value="Register user" />
	</fieldset>
</cfform>