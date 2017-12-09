<%@tag description="Client shared form elements template" pageEncoding="UTF-8"%>
<%@tag import="com.aquent.crudapp.domain.Client" %>
<%@attribute name='client' required='true' type='com.aquent.crudapp.domain.Client'%>

<div class="form-group">
    <label for="${client.companyName}">Company Name:</label>
    <input class="form-control" type="text" name="companyName"
           required minlength="1" maxlength="50"
           value="${client.companyName}" placeholder="Company Name"/>
</div>
<div class="form-group">
    <label for="${client.websiteURI}">Website URI:</label>
    <input class="form-control" type="text" name="websiteURI"
           required minlength="1" maxlength="255"
           value="${client.websiteURI}" placeholder="Website URI"/>
</div>
<div class="form-group">
    <label for="${client.phoneNumber}">Phone Number:</label>
    <input class="form-control" type="text" name="phoneNumber"
           required minlength="1" maxlength="20"
           value="${client.phoneNumber}" placeholder="Phone Number"/>
</div>
<div class="form-group">
    <label for="${client.streetAddress}">Street Address:</label>
    <input class="form-control" type="text" name="streetAddress"
           required minlength="1" maxlength="50"
           value="${client.streetAddress}" placeholder="Street Address"/>
</div>
<div class="form-group">
    <label for="${client.city}">City:</label>
    <input class="form-control" type="text" name="city"
           required minlength="1" maxlength="50"
           value="${client.city}" placeholder="City"/>
</div>
<div class="form-group">
    <label for="${client.state}">State:</label>
    <input class="form-control" type="text" name="state"
           required minlength="2" maxlength="2"
           value="${client.state}" placeholder="State"/>
</div>
<div class="form-group">
    <label for="${client.zipCode}">Zip Code:</label>
    <input class="form-control" type="text" name="zipCode"
           required minlength="5" maxlength="5"
           value="${client.zipCode}" placeholder="Zip Code"/>
</div>
