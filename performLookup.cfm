
<cfset session.message = "">

<cfset formOrderNumber = trim(#form.orderNumber#)>
<cfset formLastName = trim(#form.lastName#)>

<!--- Try and figure this regex out too for names
<cftry>
<cfparam name="formFirstName" type="regex" pattern="[A-Za-Z\.\s]+" >

<cfcatch type="expression">
	<cfset session.message = session.message & "First Name was not valid. </br>">
</cfcatch>
</cftry>
--->

<cfif session.message EQ "">

	<cfquery name = "extractOrder" datasource = "luceeproject" result="orderInformation" maxRows = "1">
			select * from orders
			where 
				orderNumber = <cfQueryParam value = "#formOrderNumber#" cfsqlType= "CF_SQL_INTEGER">
				and
				lastName = <cfQueryParam value = "#formLastName#" cfsqlType= "CF_SQL_VARCHAR" maxLength="45">
	</cfquery>

	<cfif orderInformation.RecordCount LT 1>
		<cfset session.order = -1>
	<cfelse>
		<cfset session.order = #form.OrderNumber#>
	</cfif>

	<cflocation url="/result.cfm">
<cfelse>
	<cflocation url="lookup.cfm">
</cfif>
	