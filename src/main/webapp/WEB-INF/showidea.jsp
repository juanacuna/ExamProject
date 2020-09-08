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
	     <h3>Created By: <c:out value="${idea.user.name}"></c:out></h3>
	     <h2>Users who liked your idea: </h2>
	     
	     <table class="table bg-light mt-5 mb-5" >
			<thead>
					<tr>
						<th scope="col">Name:</th>
					</tr>
			</thead>
			<tbody>
			<c:forEach items="${likers}" var="user"> 
				<tr>
					<td><c:out value="${user.name}"></c:out></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	       
	 </div>
	  <a class="btn btn-warning" href="/ideas/${idea.id}/edit">Edit</a>  
</body>
</html>