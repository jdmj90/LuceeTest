<cfquery name = "extractOrder" datasource = "luceeproject" result="orderInformation" maxRows = "1">
		select * from orders
		where 
			orderNumber = "#form.orderNumber#"
			and
			lastName = "#form.lastName#"
</cfquery>

<cfif orderInformation.RecordCount LT 1>
	<cfset session.order = -1>
<cfelse>
	<cfset session.order = #form.OrderNumber#>
</cfif>

<cflocation url="result.cfm">