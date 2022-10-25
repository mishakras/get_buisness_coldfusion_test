<cfquery name="allErrors">
	SELECT number
      ,short_desc
      ,error_status
      ,error_time_available
      ,error_critical
  	FROM [get_buisness_coldfusion_test].[dbo].[errors]
</cfquery>
<cfoutput>
	<cfinclude template="../menu_component.cfm" >
</cfoutput>
<table>
	<cfoutput query="allErrors">
	  	<tr>
			<td>#short_desc#</td>
			<td>#error_status#</td>
			<td>#error_time_available#</td>
			<td>#error_critical#</td>
	  	</tr>
	</cfoutput>
</table>