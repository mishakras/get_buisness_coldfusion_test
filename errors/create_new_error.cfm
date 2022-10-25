<cfif isDefined('form.fld_error_createSubmit')>
	<cfset variables.aErrorMessages = application.errorService.validateError_register(form.fld_short_desc,form.fld_full_desc, form.fld_error_time_available,form.error_critical) />
	<cfif arrayIsEmpty(variables.aErrorMessages)>
		<cfset arrayAppend(variables.aErrorMessages,application.errorService.create_error(form.fld_short_desc,form.fld_full_desc, form.fld_error_time_available,form.error_critical)) />
	</cfif>
</cfif>
<cfoutput>
	<cfinclude template="../menu_component.cfm" >
</cfoutput>
<cfform id="frm_comment" preservedata="true" >
	<fieldset>
		<legend>Добавить новую ошибку</legend>
		<cfif isDefined('variables.aErrorMessages') AND NOT arrayIsEmpty(variables.aErrorMessages)>
			<cfoutput>
			<cfloop array="#variables.aErrorMessages#" index="message">
				<p class=errorMessage>#message#</p>
			</cfloop>
			</cfoutput>
		</cfif>
		<dl>
			<dt><label for="fld_short_desc">Краткое описание ошибки</label></dt>
			<dd>
				<cftextarea name="fld_short_desc" id="fld_short_desc" richtext="true" toolbar="Basic" required="true" message="Введите краткое описание ошибки в форме" validateAt="onSubmit" ></cftextarea>
			</dd>
			<dt><label for="fld_full_desc">Полное описание ошибки</label></dt>
			<dd>
				<cftextarea name="fld_full_desc" id="fld_full_desc" richtext="true" toolbar="Basic" required="true" message="Введите полное описание ошибки в форме" validateAt="onSubmit" ></cftextarea>
			</dd>
			<dt><label for="fld_error_time_available">Срочность ошибки</label></dt>
			<dd><cfinput name="fld_error_time_available" id="fld_error_time_available" required="true" message="Введите срочность ошибки в форме" validateAt="onSubmit" /></dd>
			<dt><label for="error_critical">Критичность ошибки</label></dt>
			<dd><cfinput name="error_critical" id="error_critical" required="true" message="Введите критичность ошибки в форме" validateAt="onSubmit" /></dd>

		<input type="submit" name="fld_error_createSubmit" id="fld_error_createSubmit" value="Создать новую ошибку" />
	</fieldset>
</cfform>