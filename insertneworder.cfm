<cfset session.message = "">

<cfset formFirstName = trim(#form.firstName#)>
<cfset formLastName = trim(#form.lastName#)>
<cfset formCity = trim(#form.city#)>
<cfset formState = UCase(trim(#form.state#))>
<cfset formAddress1 = trim(#form.address1#)>
<cfset formAddress2 = trim(#form.address2#)>



<!---  try and figure out why the pattern didnt work for the regex matching for validation
<cftry>
<cfparam name="formFirstName" type="regex" pattern="[A-Za-Z\.\s]+" >

<cfcatch type="expression">
	<cfset session.message = session.message & "First Name was not valid. </br>">
</cfcatch>
</cftry>

<cftry>
<cfparam name="formLastName" type="regex"  pattern="[A-Za-Z\.\s]+" >

<cfcatch type="expression">
	<cfset session.message = session.message & "Last Name was not valid. </br>">
</cfcatch>
</cftry>

<cftry>
<cfparam name="formCity" type="regex"  pattern="[A-Za-Z\.\s]+" >

<cfcatch type="expression">
	<cfset session.message = session.message & "City was not valid. </br>">
</cfcatch>
</cftry>

<cftry>
<cfparam name="formState" type="regex" pattern="[A-Z]{2}" >

<cfcatch type="expression">
	<cfset session.message = session.message & "State was not valid. </br>">
</cfcatch>
</cftry>


--->

<cfif session.message EQ "">

	<cfquery name = "insertNewOrder" datasource = "luceeproject" result="insertedOrder" >
		Insert into orders (firstName, lastName, Grade, Address1, Address2, City, State, Zip)
		values (
				<cfQueryParam value = "#formFirstName#" cfsqlType= "CF_SQL_VARCHAR" maxLength="45">
				,<cfQueryParam value = "#formLastName#" cfsqlType= "CF_SQL_VARCHAR" maxLength="45">
				,<cfQueryParam value = "#form.gradeChoice#" cfsqlType= "CF_SQL_VARCHAR" maxLength="2">
				,<cfQueryParam value = "#formAddress1#" cfsqlType= "CF_SQL_VARCHAR" maxLength="255">
				,<cfQueryParam value = "#formAddress2#" cfsqlType= "CF_SQL_VARCHAR" maxLength="255">
				,<cfQueryParam value = "#formCity#" cfsqlType= "CF_SQL_VARCHAR" maxLength="45">
				,<cfQueryParam value = "#formState#" cfsqlType= "CF_SQL_VARCHAR" maxLength="2">
				,<cfQueryParam value = "#form.zip#" cfsqlType= "CF_SQL_VARCHAR" maxLength="10">
				)

	</cfquery>

	<cfset session.order = #insertedOrder.GENERATEDKEY#>
	<cflocation url="result.cfm">
<cfelse>
<cflocation url="neworder.cfm">
</cfif>