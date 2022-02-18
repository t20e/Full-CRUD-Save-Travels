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
<title>show details</title>
<link rel="stylesheet" href="/css/show_page.css" />
</head>
<body>

	<div id="mainDiv">
	    <h1>Expense ${ expenseToShow.name }</h1>
	    <a href="/expense">home page</a>
	    
	    <div class="table">
	    <table>
			<tbody>
				<tr>
					<td>Expense Name:</td>
					<td>${ expenseToShow.name }</td>
				</tr>
				<tr>
					<td>Description</td>
					<td>${expenseToShow.description}</td>
				</tr>
				<tr>
					<td>Vendor:</td>
					<td>${expenseToShow.vendor}</td>
				</tr>
				<tr>
					<td>Amount Spent:</td>
					<td>${expenseToShow.amount}</td>
				</tr>
			</tbody>
	</table>
		</div>
	    
	</div>
</body>
</html>