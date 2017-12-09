<%@tag description="Client shared form elements template" pageEncoding="UTF-8"%>
<%@tag import="com.aquent.crudapp.domain.Client" %>
<%@attribute name='client' required='true' type='com.aquent.crudapp.domain.Client'%>

<div class="form-group">
    <label for="${client.companyName}">Company Name:</label>
    <input class="form-control" type="text" name="companyName" value="${client.companyName}" placeholder="Company Name"/>
</div>
<div class="form-group">
    <label for="${client.websiteURI}">Website URI:</label>
    <input class="form-control" type="text" name="websiteURI" value="${client.websiteURI}" placeholder="Website URI"/>
</div>
<div class="form-group">
    <label for="${client.phoneNumber}">Phone Number:</label>
    <input class="form-control" type="text" name="phoneNumber" value="${client.phoneNumber}" placeholder="Phone Number"/>
</div>
<div class="form-group">
    <label for="${client.streetAddress}">Street Address:</label>
    <input class="form-control" type="text" name="streetAddress" value="${client.streetAddress}" placeholder="Street Address"/>
</div>
<div class="form-group">
    <label for="${client.city}">City:</label>
    <input class="form-control" type="text" name="city" value="${client.city}" placeholder="City"/>
</div>
<div class="form-group">
    <label for="${client.state}">State:</label>
    <input class="form-control" type="text" name="state" value="${client.state}" placeholder="State"/>
</div>
<div class="form-group">
    <label for="${client.zipCode}">Zip Code:</label>
    <input class="form-control" type="text" name="zipCode" value="${client.zipCode}" placeholder="Zip Code"/>
</div>
