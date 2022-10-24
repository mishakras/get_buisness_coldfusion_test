<cfcomponent output="false">
	<cffunction name="RegisterUser" access="public" returntype="String">
		<cfargument name="user_login_aaaa" type="string" required="true" />
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
						<cfqueryparam value="#arguments.user_login_aaaa#" cfsqltype="cf_sql_varchar"/>,
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
		<cfargument name="user_login_bbbb" type="string" required="true" />
		<cfargument name="user_name" type="string" required="true" />
		<cfargument name="last_name" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
		<cfargument name="userPasswordConfirm" type="string" required="true" />
		<cfset var aErrorMessages = arrayNew(1) />
		<cfif arguments.user_login_bbbb EQ ''>
			<cfset arrayAppend(aErrorMessages,'Please provide a valid username') />
		</cfif>
		<cfif arguments.user_name EQ ''>
			<cfset arrayAppend(aErrorMessages,'Please provide a valid name') />
		</cfif>
		<cfif arguments.last_name EQ '' >
			<cfset arrayAppend(aErrorMessages,'Please provide a valid last name ')/>
		</cfif>
		<cfif arguments.userPassword EQ '' >
			<cfset arrayAppend(aErrorMessages,'Please provide a password ')/>
		</cfif>
		<cfif arguments.userPasswordConfirm EQ '' >
			<cfset arrayAppend(aErrorMessages,'Please confirm your password')/>
		</cfif>
		<cfif arguments.userPassword NEQ arguments.userPasswordConfirm >
			<cfset arrayAppend(aErrorMessages,'The password and the password confirmation do not match')/>
		</cfif>
		<cfreturn aErrorMessages />
	</cffunction>
	<cffunction name= "validateUser_login" access="public" output="false" returntype="array">
		<cfargument name="user_login_bbbb" type="string" required="true" />
		<cfargument name="user_name" type="string" required="true" />
		<cfargument name="last_name" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
	</cffunction>
	<cffunction name="doLogin" access="public" output="false" returntype="boolean">
		<cfargument name="userEmail" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
		
		<!---Create the isUserLoggedIn variable--->
		<cfset var isUserLoggedIn = false />
		<!---Get the user data from the database--->
		<cfquery name="LoginUser">
		</cfquery>
		<!---Check if the query returns one and only one user--->
		<cfif rsLoginUser.recordCount EQ 1>
			<!---Log the user in--->
			<cflogin >
				<cfloginuser name="#rsLoginUser.FLD_USERFIRSTNAME# #rsLoginUser.FLD_USERFIRSTNAME#" password="#rsLoginUser.FLD_USERPASSWORD#" roles="#rsLoginUser.FLD_ROLENAME#" >
			</cflogin>
			<!---Save user data in the session scope--->
			<cfset session.stLoggedInUser = {'userFirstName' = rsLoginUser.FLD_USERFIRSTNAME, 'userLastName' = rsLoginUser.FLD_USERLASTNAME, 'userID' = rsLoginUser.FLD_USERID} />
			<!---change the isUserLoggedIn variable to true--->
			<cfset var isUserLoggedIn = true />
		</cfif>
		<!---Return the isUserLoggedIn variable--->
		<cfreturn isUserLoggedIn />
	</cffunction>
	<!---doLogout() method--->
	<cffunction name="doLogout" access="public" output="false" returntype="void">
		<!---delete user data from the session scope--->
		<cfset structdelete(session,'stLoggedInUser') />
		<!---Log the user out--->
		<cflogout />
	</cffunction>
</cfcomponent>