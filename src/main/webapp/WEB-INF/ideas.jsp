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
<body class="bg-dark text-white text-center ml-5 mr-5">
	<div class="row">
		<h1 class="display-4 col-6">Welcome, <c:out value="${user.name}"></c:out></h1>
		<div class="col-6">
			<a href="/logout" class="btn btn-warning">Logout</a>
		</div>
	</div>
	<h1 class="mt-5">Ideas</h1>
	<table class="table bg-light" >
			<thead>
					<tr>
						<th scope="col">Idea</th>
						<th scope="col">Created By:</th>
						<th scope="col">Likes</th>
						<th scope="col">Action</th>
					</tr>
			</thead>
			<tbody>
			<c:forEach items="${allIdeas}" var="idea"> 
				<tr>
					<td><a href="ideas/<c:out value="${idea.id}"></c:out>"><c:out value="${idea.name}"></c:out></a></td>
					<td><c:out value="${idea.user.name}"></c:out></td>
					<td><c:out value="${idea.likes}"></c:out></td>
					<td>
						<c:set var="found" value="false" scope="request" />
				 		<c:forEach items="${idea.likers}" var="liker">
							<c:if test="${liker.id == user.id}">
								<c:set var="found" value="true" scope="request" />
							</c:if>
						</c:forEach>
						<c:if test="${found == 'true'}">
						<a href="/ideas/unlike/${idea.id}">Unlike</a>
						</c:if>
	
						<c:if test="${found != 'true'}">
							<a href="/ideas/like/${idea.id}">Like</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
	
	<div>
	 	<a class="btn btn-warning" href="/ideas/new">Create an Idea</a>
	 </div>
</body>
</html>