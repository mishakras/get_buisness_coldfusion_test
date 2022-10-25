<cfcomponent output="false">
	<cffunction name="RegisterUser" access="public" returntype="String">
		<cfargument name="user_login" type="string" required="true" />
		<cfargument name="user_name" type="string" required="true" />
		<cfargument name="last_name" type="string" required="true" />
		<cfargument name="user_password" type="string" required="true" />
		<cftry>
			<cfquery>
				INSERT INTO [get_buisness_coldfusion_test].[dbo].[users]
				           (user_login
				           ,user_name
				           ,last_name
				           ,user_password)
				     VALUES
					(
						<cfqueryparam value="#arguments.user_login#" cfsqltype="cf_sql_varchar"/>,
						<cfqueryparam value="#arguments.user_name#" cfsqltype="cf_sql_varchar" />,
						<cfqueryparam value="#arguments.last_name#" cfsqltype="cf_sql_varchar" />,
						<cfqueryparam value="#arguments.user_password#" cfsqltype="cf_sql_varchar" />
					)
			</cfquery>
	  	<cfcatch type="database">
			<cfreturn #cfcatch.queryError#/>
  		</cfcatch>
		</cftry>
		<cfreturn 'User registered'/>
	</cffunction>
	<cffunction name= "validateUser_register" access="public" output="false" returntype="array">
		<cfargument name="user_login" type="string" required="true" />
		<cfargument name="user_name" type="string" required="true" />
		<cfargument name="last_name" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
		<cfargument name="userPasswordConfirm" type="string" required="true" />
		<cfset var aErrorMessages = validateUser_login(arguments.user_login,arguments.userPassword) />
		<cfif arguments.user_name EQ ''>
			<cfset arrayAppend(aErrorMessages,'Введите правильное имя') />
		</cfif>
		<cfif arguments.last_name EQ '' >
			<cfset arrayAppend(aErrorMessages,'Введите правильную фамилию')/>
		</cfif>
		<cfif arguments.userPasswordConfirm EQ '' >
			<cfset arrayAppend(aErrorMessages,'Введите подтверждение пароля')/>
		</cfif>
		<cfif arguments.userPassword NEQ arguments.userPasswordConfirm >
			<cfset arrayAppend(aErrorMessages,'Введенные пароли не совпадают')/>
		</cfif>
		<cfreturn aErrorMessages />
	</cffunction>
	<cffunction name= "validateUser_login" access="public" output="false" returntype="array">
		<cfargument name="user_login" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
		<cfset var aErrorMessages = arrayNew(1) />
		<cfif arguments.user_login EQ ''>
			<cfset arrayAppend(aErrorMessages,'Введите правильный логин') />
		</cfif>
		<cfif arguments.userPassword EQ '' >
			<cfset arrayAppend(aErrorMessages,'Введите пароль')/>
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