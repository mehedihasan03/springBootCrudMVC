<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="table-responsive">
			<a href="/" class="link-secondary">Add a new product</a>
			<h4>Product List</h4>
			<table class="table table-responsive">
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Remarks</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="#{data.productList}">
						<tr>
							<td>${p.id}</td>
							<td>${p.name}</td>
							<td>${p.quantity}</td>
							<td>${p.price}</td>
							<td>${p.remarks}</td>
							<td><a href="/edit/${p.id}">Edit</a>&nbsp;&nbsp;|&nbsp; <a
								href="/delete/${p.id}">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>