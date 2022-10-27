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
						<cfqueryparam value="Ввод" cfsqltype="cf_sql_varchar" />,
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
	<cffunction name="get_all_errors" access="public" output="false" returntype="query">
		<cfquery name="allErrors">
			SELECT number
			  ,user_id
		      ,short_desc
		      ,error_status
		      ,error_time_available
		      ,error_critical
		  	FROM [get_buisness_coldfusion_test].[dbo].[errors]
		</cfquery>
		<cfreturn allErrors />
	</cffunction>
	<cffunction name="get_error_by_number" access="public" output="false" returntype="query">
		<cfargument name="error_number" type="string" required="true" />
		<cfset int_error_number = Val(error_number) />
		<cfquery name="error_and_history">
			SELECT errors.number
			  ,errors.created
		      ,errors.short_desc
		      ,errors.full_desc
		      ,errors.error_status
		      ,errors.error_time_available
		      ,errors.error_critical
		      ,error_history.error_action
		      ,error_history.comment
		      ,error_history.user_id
		      ,users_login
		  	FROM [get_buisness_coldfusion_test].[dbo].[errors] 
		  	INNER JOIN [get_buisness_coldfusion_test].[dbo].[error_history] ON errors.number = error_history.error_id
		  	INNER JOIN [get_buisness_coldfusion_test].[dbo].[users] ON error_history.user_id = users.id
		  	WHERE errors.number = <cfqueryparam value="#int_error_number#" cfsqltype="CF_SQL_INTEGER"/>
		</cfquery>
		<cfreturn error_and_history />
	</cffunction>
	<cffunction name="change_error_status" access="public" output="false" returntype="array">
		<cfargument name="error_number" type="string" required="true" />
		<cfargument name="comment" type="string" required="true" />
		<cfargument name="new_status" type="string" required="true" />
		<cfset id_of_user = Val(session.stLoggedInUser.userID) />
		<cfset int_error_number = Val(error_number) />
		<cfset database_date = CREATEODBCDATETIME(Now()) />
		<cfset var aErrorMessages = arrayNew(1) />
		<cfif new_status EQ "Открытая">
			<cfset action = "Открытие" />
		</cfif>
		<cfif new_status EQ "Решенная">
			<cfset action = "Решение" />
		</cfif>
		<cfif new_status EQ "Закрытая">
			<cfset action = "Закрытие" />
		</cfif>
		<cftry>
			<cfquery>
				INSERT INTO [get_buisness_coldfusion_test].[dbo].[error_history]
				           (error_id
				           ,created
				           ,error_action
				           ,comment
				           ,user_id)
				     VALUES
					 (
						<cfqueryparam value="#int_error_number#" cfsqltype="CF_SQL_INTEGER"/>,
						<cfqueryparam value="#database_date#" cfsqltype="CF_SQL_DATE" />,
						<cfqueryparam value="#action#" cfsqltype="cf_sql_varchar" />,
						<cfqueryparam value="#comment#" cfsqltype="cf_sql_varchar" />,
						<cfqueryparam value="#id_of_user#" cfsqltype="cf_sql_varchar" />
					 )
			</cfquery>
			<cfquery>
				UPDATE [get_buisness_coldfusion_test].[dbo].[errors] 
				   SET error_status = <cfqueryparam value="#new_status#" cfsqltype="cf_sql_varchar"/>
		  		WHERE errors.number = <cfqueryparam value="#int_error_number#" cfsqltype="CF_SQL_INTEGER"/>
			</cfquery>
		<cfcatch type="database">
			<cfset arrayAppend(aErrorMessages, "#cfcatch.queryError#")/>
			<cfreturn aErrorMessages />
  		</cfcatch>
		</cftry>
		<cfset arrayAppend(aErrorMessages, "Изменение статуса успешно завершено")/>	
		<cfreturn aErrorMessages />
	</cffunction>
	<cffunction name="error_sort" access="public" output="false" returntype="query">
		<cfargument name="all_errors" type="query" required="true" />
		<cfargument name="type" type="string" required="true" />
		<cfset allErrors_sorted = all_errors/>
		<cfif type EQ "Number">
			<cfscript>
				allErrors_sorted.sort(function (c1,c2){
		             return c1.number GT c2.number; 
		       });
			</cfscript>	
		</cfif>
		<cfif type EQ "Status">
			<cfscript>
				allErrors_sorted.sort(function (c1,c2){
					var Order = "Новая,Открытая,Решенная,Закрытая";
		            return listFindNoCase(Order,c1.error_status) - listFindNoCase(Order,c2.error_status); 
		       });
			</cfscript>	
		</cfif>
		<cfif type EQ "Time">
			<cfscript>
				allErrors_sorted.sort(function (c1,c2){
					var Order = "Очень Срочно,Срочно,Несрочно,Совсем несрочно";
		            return listFindNoCase(Order,c1.error_time_available) - listFindNoCase(Order,c2.error_time_available); 
		       });
			</cfscript>	
		</cfif>
		<cfif type EQ "Critical">
			<cfscript>
				allErrors_sorted.sort(function (c1,c2){
					var Order = "Авария,Критичная,Некритичная,Запрос на изменение";
		            return listFindNoCase(Order,c1.error_critical) - listFindNoCase(Order,c2.error_critical); 
		       });
			</cfscript>	
		</cfif>
		<cfreturn allErrors_sorted />
	</cffunction>
	<cffunction name="error_sort_status" access="public" output="false" returntype="integer">
		<cfargument name="first" type="struct" required="true" />
		<cfargument name="second" type="struct" required="true" />
		<cfif first.error_status EQ "Новая">
			<cfif second.error_status EQ "Открытая" OR second.error_status EQ "Решенная" OR second.error_status EQ "Закрытая">
				<cfreturn 1/>
			</cfif>
		</cfif>
		<cfif firs.error_statust EQ "Открытая">
			<cfif second.error_status EQ "Решенная" OR second.error_status EQ "Закрытая">
				<cfreturn 1/>
			</cfif>
		</cfif>
		<cfif first.error_status EQ "Решенная">
			<cfif second.error_status EQ "Закрытая">
				<cfreturn 1/>
			</cfif>
		</cfif>
		<cfreturn 0/>
	</cffunction>
	<cffunction name="error_sort_time" access="public" output="false" returntype="integer">
		<cfargument name="first" type="struct" required="true" />
		<cfargument name="second" type="struct" required="true" />
		<cfif first.error_time_available EQ "Очень Срочно»">
			<cfif second.error_time_available EQ "Срочно" OR second.error_time_available EQ "Несрочно" OR second.error_time_available EQ "Совсем несрочно">
				<cfreturn 1/>
			</cfif>
		</cfif>
		<cfif first.error_time_available EQ "Срочно">
			<cfif second.error_time_available EQ "Несрочно" OR second.error_time_available EQ "Совсем несрочно">
				<cfreturn 1/>
			</cfif>
		</cfif>
		<cfif first.error_time_available EQ "Несрочно">
			<cfif second.error_time_available EQ "Совсем несрочно">
				<cfreturn 1/>
			</cfif>
		</cfif>
		<cfreturn 0/>
	</cffunction>
	<cffunction name="error_sort_critical" access="public" output="false" returntype="integer">
		<cfargument name="first" type="struct" required="true" />
		<cfargument name="second" type="struct" required="true" />
		<cfif first.error_critical EQ "Авария">
			<cfif second.error_critical EQ "Критичная" OR second.error_critical EQ "Некритичная" OR second.error_critical EQ "Запрос на изменение">
				<cfreturn 1/>
			</cfif>
		</cfif>
		<cfif first.error_critical EQ "Критичная">
			<cfif second.error_critical EQ "Некритичная" OR second.error_critical EQ "Запрос на изменение">
				<cfreturn 1/>
			</cfif>
		</cfif>
		<cfif first.error_critical EQ "Некритичная">
			<cfif second.error_critical EQ "Запрос на изменение">
				<cfreturn 1/>
			</cfif>
		</cfif>
		<cfreturn 0/>
	</cffunction>
</cfcomponent>