<cfoutput>
	<cfinclude template="../menu_component.cfm" >
</cfoutput>
<cfif isDefined('url.errorNumber')>
	<cfif isDefined('form.fld_error_openSubmit')>
		<cfset variables.aErrorMessages = application.errorService.change_error_status(errorNumber, form.fld_comment, "Открытая") />
	</cfif>
	<cfif isDefined('form.fld_error_doneSubmit')>
		<cfset variables.aErrorMessages = application.errorService.change_error_status(errorNumber, form.fld_comment, "Решенная") />
	</cfif>
	<cfif isDefined('form.fld_error_closedSubmit')>
		<cfset variables.aErrorMessages = application.errorService.change_error_status(errorNumber, form.fld_comment, "Закрытая") />
	</cfif>
	<cfset error_and_history = application.errorService.get_error_by_number(url.errorNumber)/>
	<table>
		<cfoutput>
			<tr>
				<td>Номер ошибки</td>
				<td>#error_and_history.number#</td>
			</tr>
			<tr>
				<td>Создана</td>
				<td>#error_and_history.created#</td>
			</tr>			
			<tr>
				<td>Краткое описание</td>
				<td>#error_and_history.short_desc#</td>
			</tr>
			<tr>
				<td>Полное описание</td>
				<td>#error_and_history.full_desc#</td>
			</tr>
			<tr>
				<td>Статус ошибки</td>
				<td>#error_and_history.error_status#</td>
			</tr>
			<tr>
				<td>Срочность ошибки</td>
				<td>#error_and_history.error_time_available#</td>
			</tr>
			<tr>
				<td>Критичность ошибки</td>
				<td>#error_and_history.error_critical#</td>
			</tr>
		</cfoutput>
	</table>
	<cfform id="frm_error_status_change">
		<fieldset>
			<legend>Изменение статуса ошибки</legend>
			<cfif isDefined('variables.aErrorMessages') AND NOT arrayIsEmpty(variables.aErrorMessages)>
				<cfoutput>
				<cfloop array="#variables.aErrorMessages#" index="message">
					<p class=errorMessage>#message#</p>
				</cfloop>
				</cfoutput>
			</cfif>
			<dl>
			<dt><label for="fld_short_desc">Комментарий</label></dt>
				<dd>
					<cftextarea name="fld_comment" id="fld_comment" richtext="true" toolbar="Basic" required="true" message="Введите комментарий" validateAt="onSubmit" ></cftextarea>
				</dd>
			</dl>
			<tr>
				<td>
					<input type="submit" name="fld_error_openSubmit" id="fld_error_openSubmit" value="Открытие ошибки" />
				</td>
				<td>
					<input type="submit" name="fld_error_doneSubmit" id="fld_error_doneSubmit" value="Решение ошибки" />
				</td>
				<td>
					<input type="submit" name="fld_error_closedSubmit" id="fld_error_closedSubmit" value="Закрытие ошибки" />
				</td>
			</tr>
		</fieldset>
	</cfform>
	<table>
		<cfoutput query="error_and_history">
		  	<tr>
				<td>#error_action#</td>
				<td>#comment#</td>
				<td>#user_id#</td>
		  	</tr>
		</cfoutput>
	</table>
<cfelse>
	<cfset allErrors = application.errorService.get_all_errors()/>
	<cfif isDefined('form.fld_error_numberSubmit')>
		<cfset allErrors = application.errorService.error_sort(allErrors, "Number") />
	</cfif>
	<cfif isDefined('form.fld_error_statusSubmit')>
		<cfset allErrors = application.errorService.error_sort(allErrors, "Status") />
	</cfif>
	<cfif isDefined('form.fld_error_time_availableSubmit')>
		<cfset allErrors = application.errorService.error_sort(allErrors, "Time") />
	</cfif>
	<cfif isDefined('form.fld_error_criticalSubmit')>
		<cfset allErrors = application.errorService.error_sort(allErrors, "Critical") />
	</cfif>
	<cfform id="frm_error_sort">
		<fieldset>
			<legend>Сортировка ошибок по</legend>
			<tr>
				<td>
					<input type="submit" name="fld_error_numberSubmit" id="fld_error_numberSubmit" value="номеру ошибки" />
				</td>
				<td>
					<input type="submit" name="fld_error_statusSubmit" id="fld_error_statusSubmit" value="статусу ошибки" />
				</td>
				<td>
					<input type="submit" name="fld_error_time_availableSubmit" id="fld_error_time_availableSubmit" value="срочности ошибки" />
				</td>
				<td>
					<input type="submit" name="fld_error_criticalSubmit" id="fld_error_criticalSubmit" value="критичности ошибки" />
				</td>
			</tr>
		</fieldset>
	</cfform>
	<table>
		<cfoutput query="allErrors">
		  	<tr>
		  		<td>#number#</td>
				<td>#user_id#</td>
				<td>#short_desc#</td>
				<td>#error_status#</td>
				<td>#error_time_available#</td>
				<td>#error_critical#</td>
				<td><a href="errors.cfm?errorNumber=#number#">Подробности</a></td>
		  	</tr>
		</cfoutput>
	</table>
</cfif>