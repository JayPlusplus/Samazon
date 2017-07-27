<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome to Samazon!</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<jsp:include page="bootstrap.jsp"></jsp:include>
    <!-- Custom CSS -->
    <link href="css/heroic-features.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

   	<jsp:include page="Navigation.jsp"></jsp:include>

    <!-- Page Content -->
    <div class="container">

        <!-- Jumbotron Header -->
     <jsp:include page="header.jsp"></jsp:include> 

        <hr>
	   <!--<form action="IndexServlet" method="post"> -->
        <!-- Title -->
        <div class="row">
            <div class="col-lg-12">
                <h3>Latest Features</h3>
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Features -->
        <div class="row text-center">
			<c:forEach var="product" items="${products}">
            <div class="col-md-3 col-sm-6 hero-feature">
            	${person.username} is cool!
                <div class="thumbnail">
                   <img style="height:200px;width:auto;" src="${product.imageURL}" alt="">
                     <div style="height:200px" class="caption">
                                <h5 class="pull-right">$${product.price}</h5>
                                <h5><a href="#">${product.productname}</a>
                                </h5>
                                <p>${product.description}
                                <form action="CartServ" method="post">
                                <input type="submit" class = "btn btn-primary" name="addToCart" value="Buy Now!">
                                <input type="hidden" name="productid" value="${product.productid}">
                                </form>
                        
                           <a href="InfoServ?productid=${product.productid}" class="btn btn-default">More Info</a>
                        
           
                    </div>
                </div>
            </div>
  </c:forEach>
 	</div>
 </div>
  
        <!-- /.row -->

        <hr>

        <!-- Footer 
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>
			-->
  
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
