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
<title>Edit Expense</title>
<link rel="stylesheet" href="/css/edit_page.css" />
</head>
<body>
  <div id="main_div">
    <h1>Edit Expense</h1>
    <a href="/expense">home page</a>
    <div class="form">
      <form:form action="/expense/updating/${ expenseToEdit.id}" method="post" modelAttribute="expenseToEdit">
      <input type="hidden" name="_method" value="put">
      <!-- this hidden input passes in the id in -->
      
        <p>
            <form:label path="name">Expense Name:  </form:label>
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