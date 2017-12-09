<%@tag description="Person shared form elements template" pageEncoding="UTF-8"%>
<%@tag import="com.aquent.crudapp.domain.Person" %>
<%@attribute name='person' required='true' type='com.aquent.crudapp.domain.Person'%>

<div class="form-group">
    <label for="${client.firstName}">First Name:</label>
    <input class="form-control" type="text" name="firstName" value="${person.firstName}" placeholder="First Name"/>
</div>
<div class="form-group">
    <label for="${client.lastName}">Last Name:</label>
    <input class="form-control" type="text" name="lastName" value="${person.lastName}" placeholder="Last Name"/>
</div>
<div class="form-group">
    <label for="${client.emailAddress}">Email Address:</label>
    <input class="form-control" type="text" name="emailAddress" value="${person.emailAddress}" placeholder="Email Address"/>
</div>
<div class="form-group">
    <label for="${client.streetAddress}">Street Address:</label>
    <input class="form-control" type="text" name="streetAddress" value="${person.streetAddress}" placeholder="Street Address"/>
</div>
<div class="form-group">
    <label for="${client.city}">City:</label>
    <input class="form-control" type="text" name="city" value="${person.city}" placeholder="City"/>
</div>
<div class="form-group">
    <label for="${client.state}">State:</label>
    <input class="form-control" type="text" name="state" value="${person.state}" placeholder="State"/>
</div>
<div class="form-group">
    <label for="${client.zipCode}">Zip Code:</label>
    <input class="form-control" type="text" name="zipCode" value="${person.zipCode}" placeholder="Zip Code"/>
</div>
