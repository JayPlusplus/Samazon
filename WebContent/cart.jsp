<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<jsp:include page="bootstrap.jsp"></jsp:include>
    <!-- Custom CSS -->
    <link href="css/heroic-features.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>----- Shopping cart -----</title>
</head>
<body>
	<jsp:include page="Navigation.jsp"></jsp:include>
	<h2>Shopping Cart.</h2>
	<p>
		Your Shopping Cart lives to serve. Give it purpose — fill it with
		books, CDs, DVDs, toys, electronics, and more. If you already have an
		account, Sign In to see your Cart. Continue shopping on the Amazon.com
		<a href="home.html">Home page</a>, learn about today's deals, or visit
		your <a href="/">Wish List</a>. The price and availability of items at
		Samazon.com are subject to change. The Cart is a temporary place to
		store a list of your items and reflects each item's most recent price.
		Shopping Cart Learn more Do you have a gift card or promotional code?
		We'll ask you to enter your claim code when it's time to pay.
	</p>
	<table>
    <thead>
        <tr><th>Image</th><th>Product Name</th><th>Quantity</th><th>Price</th><th>Sub Total</th></tr>
    </thead>
    	<c:forEach var="product" items="${products}">
    
    <tbody>
    
        <tr><td><c:out value="${product.imageURL}"/></td>
        <td><c:out value="${product.productname}"/></td>
        <td><select name="quant" class="btn btn-primary">

						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
					</select></td>
        <td> <c:out value="${product.price}"/></td>
        <td> <c:out value="${message}"/></td>
        </tr>
    </tbody>
     </c:forEach>
    </table>
</body>
</html>