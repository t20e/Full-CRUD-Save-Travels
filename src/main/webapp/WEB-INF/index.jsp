<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/home_page.css" />
</head>
<body>
	<div id="mainDIv">
    <h1>Save Travels</h1>
    <div class="table">
      <table>
        <thead>
          <tr>
            <th>Expense</th>
            <th>Vendor</th>
            <th>Amount</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <!-- loop here to show all data -->
          <c:forEach items = '${ allExpense }' var = 'expenseObj'>
				<tr>
					<td> <a href="/expense/show/${ expenseObj.id}">${ expenseObj.name }</a></td>
					<td>${ expenseObj.vendor }</td>
					<td>${ expenseObj.amount }</td>
					<td> <a href="/expense/edit/${ expenseObj.id}">edit</a> </td>
          <th><a href="/expense/delete/${expenseObj.id}">Delete</a></th>
				</tr>   
          
          
          </c:forEach>

        </tbody>
      </table>
    </div>
	<div class="form">
      <h3>Add an Expense</h3>
				<form:form action="/expense/adding" method="post" modelAttribute="expense">
		    <p>
		        <form:label path="name">Expense Name:</form:label>
		        <form:errors path="name"/>
		        <form:input path="name"/>
		    </p>
		    <p>
		        <form:label path="vendor">Vendor:</form:label>
		        <form:errors path="vendor"/>
		        <form:input type="text" path="vendor"/>
		    </p>
		    <p>
		        <form:label path="amount">Amount:</form:label>
		        <form:errors path="amount"/>     
		        <form:input type="number" path="amount"/>
		    </p>
        <p>
          <form:label path="description">Description:</form:label>
          <form:errors path="description"/>
          <form:textarea path="description"/>
      </p>    
		    <input type="submit" value="Submit" id="btn"/>
		</form:form>    
	</div>
	
	
	</div>
</body>
</html>