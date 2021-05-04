<head>
	<link rel="stylesheet" href="base.css">
</head>
<body>

	<cfif session.order GT 0>
		<cfquery name = "extractOrder" datasource = "luceeproject" result="orderInformation" maxRows = "1">
			select * from orders
			where orderNumber = "#session.order#"
		</cfquery>
		
		<cfoutput>
		<div class = "resultform">	
			<div class="result">OrderNumber: #extractOrder.orderNumber# </div>
			<div class="result">Grade: #extractOrder.grade# </div>
			<div class="result">First Name: #extractOrder.firstName# </div>
			<div class="result">Last Name: #extractOrder.lastName# </div>
			<div class="result">City Name: #extractOrder.City# </div>
			<div class="result">Address: #extractOrder.Address1# </div>
			<div class="result">         #extractOrder.Address2# </div>
			<div class="result">State: #extractOrder.State# </div>
			<div class="result">Zip: #extractOrder.Zip# </div>
		</div>
		</cfoutput>
		
		<div class="button"><a href="/index.cfm">Return to Main Page</a> </div>
		</body>
		<cfset session.order = 0>	

	<cfelseif session.order EQ -1>
		<div class="result"> Order could not be found. </div>
		<div class="button"><a href="/index.cfm">Return to Main Page</a> </div>
		<cfset session.order = 0>
		</body>
	<cfelse>
		<cflocation url="/index.cfm">
	</cfif>
