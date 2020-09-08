<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body class="bg-dark text-white text-center m-5">
	<div class="col">
		<h1><c:out value="${idea.name }"></c:out></h1>
	    
	    <form:form method="post" action="/ideas/${idea.id}/edit" modelAttribute="idea">
	    	<input type="hidden" name="_method" value="put">
	       	<div class="input-group-prepend mb-3">
	            <form:label class="input-group-text" path="name">Content:</form:label>
	            <form:input type="text" path="name" required="required" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm"/>
	       	</div>
	        <input type="submit" value="Update!" class="btn btn-warning m-5"/>        
	    </form:form>
	    <form:form method="post" action="/ideas/${idea.id}/delete" modelAttribute="idea">
	        	<input type="hidden" name="_method" value="delete">
	        	<input type="submit" value="Delete!" class="btn btn-warning m-5"/>
	   	</form:form>
	 </div>   
</body>
</html>