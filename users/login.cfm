<cfoutput>
	<cfinclude template="../Menu_component.cfc" >
</cfoutput>
<cfform id="frm_comment" preservedata="true" >
	<fieldset>
		<legend>Login</legend>
		<cfif isDefined('variables.aErrorMessages') AND NOT arrayIsEmpty(variables.aErrorMessages)>
			<cfoutput>
			<cfloop array="#variables.aErrorMessages#" index="message">
				<p class=errorMessage>#message#</p>
			</cfloop>
			</cfoutput>
		</cfif>
		<dl>
			<dt><label for="fld_Login">USername</label></dt>
			<dd><cfinput name="fld_Login" id="fld_Login" required="true" message="Please enter your username in the form" validateAt="onSubmit" /></dd>
			<dt><label for="fld_Password">Security code</label></dt>
			<dd><cfinput type="password" name="fld_Password" id="fld_Password" required="true" message="Please enter your password in the form" validateAt="onSubmit" /></dd>
		</dl>
		<input type="submit" name="fld_commentSubmit" id="fld_commentSubmit" value="Log in" />
	</fieldset>
</cfform>