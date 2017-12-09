<%@tag description="Person shared form elements template" pageEncoding="UTF-8"%>
<%@tag import="com.aquent.crudapp.domain.Person" %>
<%@attribute name='person' required='true' type='com.aquent.crudapp.domain.Person'%>

<div class="form-group">
    <label for="${client.firstName}">First Name:</label>
    <input type="text" name="firstName" value="${person.firstName}"/>
</div>
<div class="form-group">
    <label for="${client.lastName}">Last Name:</label>
    <input type="text" name="lastName" value="${person.lastName}"/>
</div>
<div class="form-group">
    <label for="${client.emailAddress}">Email Address:</label>
    <input type="text" name="emailAddress" value="${person.emailAddress}"/>
</div>
<div class="form-group">
    <label for="${client.streetAddress}">Street Address:</label>
    <input type="text" name="streetAddress" value="${person.streetAddress}"/>
</div>
<div class="form-group">
    <label for="${client.city}">City:</label>
    <input type="text" name="city" value="${person.city}"/>
</div>
<div class="form-group">
    <label for="${client.state}">State:</label>
    <input type="text" name="state" value="${person.state}"/>
</div>
<div class="form-group">
    <label for="${client.zipCode}">Zip Code:</label>
    <input type="text" name="zipCode" value="${person.zipCode}"/>
</div>
