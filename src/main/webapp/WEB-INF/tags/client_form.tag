<%@tag description="Client shared form elements template" pageEncoding="UTF-8"%>
<%@tag import="com.aquent.crudapp.domain.Client" %>
<%@attribute name='client' required='true' type='com.aquent.crudapp.domain.Client'%>

<br/>
<label for="${client.companyName}">Company Name:</label>
<input type="text" name="companyName" value="${client.companyName}"/>
<br/>
<label for="${client.websiteURI}">Website URI:</label>
<input type="text" name="websiteURI" value="${client.websiteURI}"/>
<br/>
<label for="${client.phoneNumber}">Phone Number:</label>
<input type="text" name="phoneNumber" value="${client.phoneNumber}"/>
<br/>
<label for="${client.streetAddress}">Street Address:</label>
<input type="text" name="streetAddress" value="${client.streetAddress}"/>
<br/>
<label for="${client.city}">City:</label>
<input type="text" name="city" value="${client.city}"/>
<br/>
<label for="${client.state}">State:</label>
<input type="text" name="state" value="${client.state}"/>
<br/>
<label for="${client.zipCode}">Zip Code:</label>
<input type="text" name="zipCode" value="${client.zipCode}"/>
<br/>
