<cfcomponent output="false">
	<cffunction name="create_error" access="public" returntype="String">
		<cfargument name="short_desc" type="string" required="true" />
		<cfargument name="full_desc" type="string" required="true" />
		<cfargument name="error_time_available" type="string" required="true" />
		<cfargument name="error_critical" type="string" required="true" />
		<cfset id_of_user = Val(session.stLoggedInUser.userID) />
		<cfset database_date = CREATEODBCDATETIME(Now()) />
		<cftry>
			<cfquery name=insert_error>
				INSERT INTO [get_buisness_coldfusion_test].[dbo].[errors]
				           (created
				           ,short_desc
				           ,full_desc
				           ,user_id
				           ,error_status
				           ,error_time_available
				           ,error_critical)
				     OUTPUT INSERTED.number
				     VALUES
					 (
					 	<cfqueryparam value="#database_date#" cfsqltype="CF_SQL_DATE" />,
						<cfqueryparam value="#arguments.short_desc#" cfsqltype="cf_sql_varchar"/>,
						<cfqueryparam value="#arguments.full_desc#" cfsqltype="cf_sql_varchar" />,
						<cfqueryparam value="#id_of_user#" cfsqltype="CF_SQL_INTEGER" />,
						<cfqueryparam value="Новая" cfsqltype="cf_sql_varchar" />,
						<cfqueryparam value="#arguments.error_time_available#" cfsqltype="cf_sql_varchar" />,
						<cfqueryparam value="#arguments.error_critical#" cfsqltype="cf_sql_varchar" />
					 )
			</cfquery>
			<cfquery>
				INSERT INTO [get_buisness_coldfusion_test].[dbo].[error_history]
				           (error_id
				           ,created
				           ,error_action
				           ,comment
				           ,user_id)
				     VALUES
					 (
						<cfqueryparam value="#insert_error.number#" cfsqltype="CF_SQL_INTEGER"/>,
						<cfqueryparam value="#database_date#" cfsqltype="CF_SQL_DATE" />,
						<cfqueryparam value="Ввод ошибки" cfsqltype="cf_sql_varchar" />,
						<cfqueryparam value="Создано пользователем #id_of_user#" cfsqltype="cf_sql_varchar" />,
						<cfqueryparam value="#id_of_user#" cfsqltype="cf_sql_varchar" />
					 )
			</cfquery>
		<cfcatch type="database">
			<cfreturn #cfcatch.queryError#/>
  		</cfcatch>
		</cftry>
		<cfreturn "Error created"/>
	</cffunction>
	<cffunction name= "validateError_register" access="public" output="false" returntype="array">
		<cfargument name="short_desc" type="string" required="true" />
		<cfargument name="full_desc" type="string" required="true" />
		<cfargument name="error_time_available" type="string" required="true" />
		<cfargument name="error_critical" type="string" required="true" />
		<cfset var aErrorMessages = arrayNew(1) />
		<cfset var array_error_time_available = ['Очень Срочно', 'Срочно', 'Несрочно', 'Совсем несрочно'] />
		<cfset var array_error_critical = ['Авария', 'Критичная', 'Некритичная', 'Запрос на изменение'] />
		<cfif arguments.short_desc EQ ''>
			<cfset arrayAppend(aErrorMessages,'Введите правильное краткое описание') />
		</cfif>
		<cfif arguments.full_desc EQ '' >
			<cfset arrayAppend(aErrorMessages,'Введите правильное полное описание')/>
		</cfif>
		<cfif not ArrayContains(array_error_time_available, arguments.error_time_available)>
			<cfset arrayAppend(aErrorMessages,'Введите правильную срочность')/>
		</cfif>
		<cfif not ArrayContains(array_error_critical, arguments.error_critical)>
			<cfset arrayAppend(aErrorMessages,'Введите правильную критичность')/>
		</cfif>
		<cfreturn aErrorMessages />
	</cffunction>
	<cffunction name="doLogin" access="public" output="false" returntype="String">
		<cfargument name="user_login" type="string" required="true" />
		<cfargument name="user_password" type="string" required="true" />
		<cftry>
			<cfquery name = "got_User">
				SELECT id
					   ,user_name
					   ,last_name
				FROM [get_buisness_coldfusion_test].[dbo].[users]
				WHERE user_login = <cfqueryparam value="#arguments.user_login#" cfsqltype="cf_sql_varchar"/> 
				AND user_password = <cfqueryparam value="#arguments.user_password#" cfsqltype="cf_sql_varchar" />
			</cfquery>
	  	<cfcatch type="database">
			<cfreturn #cfcatch.queryError#/>
  		</cfcatch>
		</cftry>
		<cfif got_User.recordCount EQ 0>
			<cfreturn 'Wrong login or password'/>
		</cfif>
		<cfset session.stLoggedInUser = {'userFirstName' = got_User.user_name, 'userLastName' = got_User.last_name, 'userID' = got_User.id} />
		<cfreturn 'You logged in succsesfully'/>
	</cffunction>
	<cffunction name="doLogout" access="public" output="false" returntype="void">
		<cfset structdelete(session,'stLoggedInUser') />
	</cffunction>
</cfcomponent>