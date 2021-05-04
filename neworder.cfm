<head>
	<link rel="stylesheet" href="base.css">
</head>
<body>
</body>

<cfif isDefined("session.message") AND session.message NEQ "">
	<cfoutput>
		<div class="errorMessage">
			#session.message#
		</div>
	</cfoutput>
</cfif>
<cfform action = "insertneworder.cfm" name="customerlookup" id = "insertOrderform">
	<div class="insertform">First name: <cfinput name = "firstName"type = "text" required = "yes" maxLength="45"></div>
	<div class="insertform">Last name: <cfinput name = "lastName" type = "text" required = "yes" maxLength="45"></div>
	<div class="insertform">Grade: <cfselect name = "gradeChoice" required = "yes">
		<option value="K">K</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
	</cfselect>
	</div>
	<div class="insertform">Address 1: <cfinput name="address1" type = "text" required = "yes" maxLength="255"></div>
	<div class="insertform">Address 2: <cfinput name="address2" type = "text" maxLength="255"></div>
	<div class="insertform">City: <cfinput name="city" type = "text" required = "yes" maxLength="45"></div>
	<div class="insertform">State: <cfinput name="state" type = "text" required = "yes" maxLength="2" mask="AA"></div>
	<div class="insertform">Zip: <cfinput name="zip" type = "text" required = "yes" validate="zipcode" maxLength="10"></div>
	<div class="insertform"><input type="submit" name="submit" Value="Submit Order"> </div>
</cfform>