<cfquery name="allUsers">
	SELECT user_login
      ,user_name
      ,last_name
  	FROM [get_buisness_coldfusion_test].[dbo].[users]
</cfquery>
<cfoutput>
	<cfinclude template="../menu_component.cfm" >
</cfoutput>
<table>
	<cfoutput query="allUsers">
	  	<tr>
			<td>#user_login#</td>
			<td>#user_name#</td>
			<td>#last_name#</td>
	  	</tr>
	</cfoutput>
</table>
