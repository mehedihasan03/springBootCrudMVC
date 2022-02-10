<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product edit</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 mt-5">
				<h4>Edit product</h4>
				<c:if test="${data.status.equals('Failed')}">
					<div class="alert alert-danger" role="alert">
					  ${data.message}
					</div>
				</c:if>
				
				<c:if test="${data.status.equals('Success')}">
					<div class="alert alert-success" role="alert">
					  ${data.message}
					</div>
				</c:if>
				
				<form action="/update" method="post">
					<div class="mb-3">
					<label for="name" class="form-label">Product Name</label> 
					<input type="text" value="${data.product.name}" class="form-control" name="name"
						id="name" placeholder="Enter product name">
						
						<input type="hidden"  value="${data.product.id}" class="form-control" name="id"
						id="productId">
				</div>
				
				<div class="mb-3">
					<label for="quantity" class="form-label">Product Quantity</label> 
					<input type="number"  value="${data.product.quantity}" class="form-control" name="quantity"
						id="quantity" placeholder="Enter Product Quantity">
				</div>
				
				<div class="mb-3">
					<label for="price" class="form-label">Product Price</label> 
					<input type="number"  value="${data.product.price}" class="form-control" name="price"
						id="price" placeholder="Enter Product Price">
				</div>
				
				
				<div class="mb-3">
					<label for="remarks" class="form-label">Remarks</label>
					<textarea name="remarks" class="form-control" id="remarks"
						rows="3">${data.product.remarks}</textarea>
				</div>
				<button type="submit" class="btn btn-primary">Update</button>
				</form>
				<a href="/products" class="link-secondary">Product List</a>
			</div>
		</div>

	</div>
</body>
</html>