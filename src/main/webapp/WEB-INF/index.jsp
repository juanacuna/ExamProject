<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body class="bg-dark text-white m-5">

	<div class="row">
		<div class="col-5">
			<h1 class="display-4">Register!</h1>
		    <p><form:errors path="user.*"/></p>
		    <form:form method="POST" action="/register" modelAttribute="user">
		       <div class="input-group-prepend mb-3">
		            <form:label class="input-group-text" path="name">Full Name:</form:label>
		            <form:input type="text" path="name" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm"/>
		       </div>
		        <div class="input-group-prepend mb-3">
		            <form:label class="input-group-text" path="email">Email:</form:label>
		            <form:input type="email" path="email" required="required" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm"/>
		        </div>
		        <div class="input-group-prepend mb-3">
		            <form:label class="input-group-text" path="passw">Password:</form:label>
		            <form:password path="passw" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm"/>
		        </div>
		        <div class="input-group-prepend mb-3">
		            <form:label class="input-group-text" path="passwConf">Password Confirmation:</form:label>
		            <form:password path="passwConf" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm"/>
		        </div>
		        <input type="submit" value="Register" class="btn btn-warning"/>
		    </form:form>
		</div>
		
		<div class="col-2"></div>
		    
		<div class="col-5">
			<h1 class="display-4" >Login</h1>
		    <p><c:out value="${error}" /></p>
		    <form method="post" action="/login">
		       <div class="input-group-prepend mb-3">
		            <label class="input-group-text" for="email">Email</label>
		            <input type="text" id="email" name="email" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm"/>
		        </div>
		        <div class="input-group-prepend mb-3">
		            <label class="input-group-text" for="password">Password</label>
		            <input type="password" id="password" name="password" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm"/>
		        </div>
		        <input type="submit" value="Login!" class="btn btn-warning"/>
		    </form>   
		</div>
	</div>
</body>
</html>