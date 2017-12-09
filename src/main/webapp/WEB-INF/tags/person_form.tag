<%@tag description="Person shared form elements template" pageEncoding="UTF-8"%>
<%@tag import="com.aquent.crudapp.domain.Person" %>
<%@attribute name='person' required='true' type='com.aquent.crudapp.domain.Person'%>

<div class="form-group">
    <label for="${client.firstName}">First Name:</label>
    <input class="form-control" type="text" name="firstName"
           required minlength="1" maxlength="50"
           value="${person.firstName}" placeholder="First Name"/>
</div>
<div class="form-group">
    <label for="${client.lastName}">Last Name:</label>
    <input class="form-control" type="text" name="lastName"
           required minlength="1" maxlength="50"
           value="${person.lastName}" placeholder="Last Name"/>
</div>
<div class="form-group">
    <label for="${client.emailAddress}">Email Address:</label>
    <input class="form-control" type="text" name="emailAddress"
           required minlength="1" maxlength="50"
           value="${person.emailAddress}" placeholder="Email Address"/>
</div>
<div class="form-group">
    <label for="${client.streetAddress}">Street Address:</label>
    <input class="form-control" type="text" name="streetAddress"
           required minlength="1" maxlength="50"
           value="${person.streetAddress}" placeholder="Street Address"/>
</div>
<div class="form-group">
    <label for="${client.city}">City:</label>
    <input class="form-control" type="text" name="city"
           required minlength="1" maxlength="50"
           value="${person.city}" placeholder="City"/>
</div>
<div class="form-group">
    <label for="${client.state}">State:</label>
    <input class="form-control" type="text" name="state"
           required minlength="2" maxlength="2"
           value="${person.state}" placeholder="State"/>
</div>
<div class="form-group">
    <label for="${client.zipCode}">Zip Code:</label>
    <input class="form-control" type="text" name="zipCode"
           required minlength="5" maxlength="5"
           value="${person.zipCode}" placeholder="Zip Code"/>
</div>
