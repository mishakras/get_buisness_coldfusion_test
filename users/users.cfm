<cfoutput>
	<cfinclude template="../menu_component.cfm" >
</cfoutput>
	<cfset allUsers = application.userService.get_all_users()/>
	<table>
		<cfoutput query="allUsers">
		  	<tr>
				<td>#user_login#</td>
				<td>#user_name#</td>
				<td>#last_name#</td>
		  	</tr>
		</cfoutput>
	</table>
	<cfif isDefined('session.stLoggedInUser')>
		<cfif isDefined('form.fld_user_data_changeSubmit')>
			<cfset variables.aErrorMessages = application.userService.changeUser(form.fld_Name, form.fld_Last_name) />
		</cfif>
		<cfoutput>
			<td>#session.stLoggedInUser.user_name#</td>
			<td>#session.stLoggedInUser.user_last_name#</td>
			<td>#session.stLoggedInUser.user_login#</td>
		</cfoutput>
		<cfform id="frm_user_change">
			<fieldset>
				<legend>Изменение данных о пользователе</legend>
				<cfif isDefined('variables.aErrorMessages') AND NOT arrayIsEmpty(variables.aErrorMessages)>
					<cfoutput>
					<cfloop array="#variables.aErrorMessages#" index="message">
						<p class=errorMessage>#message#</p>
					</cfloop>
					</cfoutput>
				</cfif>
				<dl>
					<dt><label for="fld_Name">Новое имя</label></dt>
					<dd><cfinput name="fld_Name" id="fld_Name" required="true" message="Введите новое имя в форме" validateAt="onSubmit" /></dd>
					<dt><label for="fld_Last_name">Новая фамилия</label></dt>
					<dd><cfinput name="fld_Last_name" id="fld_Last_name" required="true" message="Введите новую фамилию в форме" validateAt="onSubmit" /></dd>
				</dl>
				<input type="submit" name="fld_user_data_changeSubmit" id="fld_user_data_changeSubmit" value="Изменить данные" />
			</fieldset>
		</cfform>
	</cfif>
