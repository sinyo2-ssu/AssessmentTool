<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Cost Compare</title>

  <!-- Bootstrap core CSS -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/shop-homepage.css" rel="stylesheet">
  
</head>

<body>

  <!-- Navigation -->
	   <div class="search-wrapper" style="position:relative; left:170px;">
      	<img src = resources/images/cloud.png width = "300" height = "40"></img>
      	
        <!-- input type="text" placeholder="Enter keywords ..." required -->
      </div>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">
        <h3 class="my-4">Result</h3>
        <div class="list-group">
          <a href="Gen" class="list-group-item">General Server</a>
          <a href="High" class="list-group-item">High Memory Server</a>
          <a href="Compare" class="list-group-item">가격 비교</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

<ul class="graph">
  <li class="graph-bar bar1" graph-val="30"></li>
  <li class="graph-bar bar2" graph-val="80"></li>
  <li class="graph-bar bar3" graph-val="60"></li>
  <li class="graph-bar bar4" graph-val="30"></li>   
</ul>
  






	<!--  -->

    <!-- /.row -->

  </div>
  <!-- /.container -->


  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; KT Cloud 2021</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/bootstrap.bundle.min.js"></script>

</body>

</html>
