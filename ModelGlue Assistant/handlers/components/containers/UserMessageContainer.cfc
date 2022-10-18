<cfcomponent hint="Collects and displays messages throughout a request.">

	<!--- init --->
	<cffunction name="init" access="public" output="false">

		<cfif NOT structKeyExists( variables, "MessageQuery")>
			<cfset initializeMessages() />
		</cfif>

		<cfreturn this />
	</cffunction>

	<cffunction name="addError" access="public" output="false" hint="Appends an error message">
		<cfargument name="Message" required="yes" />
		<cfargument name="Key" default="" />
		
		<cfset AddMessage('Error', arguments.Message, arguments.key) />
	</cffunction>

	<cffunction name="addInfo" access="public" output="false" hint="Appends an info message">
		<cfargument name="Message" required="yes" />
		<cfargument name="Key" default="" />
		<cfset AddMessage('Info', arguments.Message, arguments.key) />
	</cffunction>

	<cffunction name="addSuccess" access="public" output="false" hint="Appends a success message">
		<cfargument name="Message" required="yes" />
		<cfargument name="Key" default="" />
		<cfset AddMessage('Success', arguments.Message, arguments.key) />
	</cffunction>

	<cffunction name="getAllMessages" access="public" output="false" hint="Returns a query of all messages.">
		<cfset var SavedMessages=duplicate(variables.MessageQuery) />
		<cfif isQuery( SavedMessages ) IS false >
			<cfset initializeMessages() />
			<cfset SavedMessages=duplicate(variables.MessageQuery) />
		</cfif>
		<!--- clear messages --->
		<cfset initializeMessages() />

		<cfreturn SavedMessages />
	</cffunction>
	
	<cffunction name="exportMessageStruct" access="public" output="false" hint="Returns a query of messages with a key messages.">
		<cfset var SavedMessages=duplicate(variables.MessageQuery) />
		<cfset var returnStruct  = structNew() />
		<cfloop query="SavedMessages">
			<cfif len( trim( SavedMessages.key ) )>
				<cfset returnStruct[ SavedMessages.key ] = SavedMessages.Message />
			</cfif>
		</cfloop>
		<!--- clear messages --->
		<cfset initializeMessages() />

		<cfreturn returnStruct />
	</cffunction>
	
	<cffunction name="hasKey" output="false" access="public" returntype="boolean" hint="I check to see if there is a specific key in the message query">
		<cfargument name="key" type="string" required="true"/>
			<cfset var FindKey="" />
			<cfquery name="FindKey" dbtype="query">
				SELECT count(1)
				FROM variables.MessageQuery
				WHERE [Key] = '#arguments.key#'
			</cfquery>

			<cfreturn FindKey.Recordcount gt 0 />
	</cffunction>

	<cffunction name="hasError" access="public" output="false" hint="Returns true if any errors exist in the message collection.">

		<cfset var CountRows="" />

		<cfquery name="CountRows" dbtype="query">
			SELECT count(1)
			FROM variables.MessageQuery
			WHERE Type='Error'
		</cfquery>

		<cfreturn CountRows.Recordcount gt 0 />
	</cffunction>

	<cffunction name="getCount" access="public" output="false" hint="Returns number of messages in collection by type.">
		<cfargument name="Type" default="All" />

		<cfset var CountRows="" />

		<cfif arguments.Type is 'All'>
			<cfset CountRows=variables.MessageQuery />
		<cfelse>
			<cfquery name="CountRows" dbtype="query">
				SELECT *
				FROM variables.MessageQuery
				WHERE Type='#arguments.Type#'
			</cfquery>

		</cfif>
		<cfset CountRows=CountRows.Recordcount />
		<cfreturn CountRows />
	</cffunction>

	<!--- private: add Message --->
	<cffunction name="addMessage" access="private" output="false" hint="Appends a message to the message collection.">
		<cfargument name="Type" required="yes">
		<cfargument name="Message" required="yes">
		<cfargument name="Key" default="">
		
		<cfif NOT structKeyExists( variables, "MessageQuery")>
			<cfset initializeMessages() />
		</cfif>

		<cfset queryaddrow(variables.MessageQuery) />
		<cfset querysetcell(variables.MessageQuery, 'Type', arguments.Type) />
		<cfset querysetcell(variables.MessageQuery, 'Message', arguments.Message) />
		<cfset querysetcell(variables.MessageQuery, 'Key', arguments.Key) />
	</cffunction>
	
	<cffunction name="initializeMessages" output="false" access="private" returntype="void" hint="I initialize a blank Message Query">
		<cfset variables.MessageQuery = querynew('Type,Message,Key') />	
	</cffunction>

	
</cfcomponent>

