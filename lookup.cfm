<head>
	<link rel="stylesheet" href="base.css">
</head>
<body>
</body>

<cfform name="customerlookup" action = "performLookup.cfm" id="LookUpOrderForm">
	Last name: <cfinput name = "lastName" type = "text" required = "yes" maxLength="45"><br/>
	Order Number: <cfinput name = "orderNumber" type = "text" required = "yes" validate = "integer"><br/>
	<input type="submit" name="submit" Value="Submit Order">
</cfform>