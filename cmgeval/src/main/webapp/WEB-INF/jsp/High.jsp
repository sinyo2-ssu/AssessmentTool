<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Result</title>

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
        <h2 class="my-4">High-Memory</h2>
        <div class="list-group">
          <a href="Gen" class="list-group-item">General Server</a>
          <a href="High" class="list-group-item">High Memory Server</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

	<!--  -->
      <div class="col-lg-9">
		 <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="resources/images/high.png" alt="First slide">
            </div>
          </div>
        </div>


        <div class="row">

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="resources/images/sigma.png" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Total Cost</a>
                </h4>
                <h5>1417000￦</h5>
                <p class="card-text">매칭된 제품들의 총 합계 가격입니다.</p>
              </div>
               <div class="card-footer">
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="resources/images/ssd.png" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Storage / SSD</a>
                </h4>
                <h5>${total.ssdCost}￦</h5>
                <p class="card-text">사용자의 디스크 용량과 사용량과 설정한 IOPS를 기반으로 결정됩니다.</p>
              </div>
              <div class="card-footer">
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="resources/images/DB.png" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">DataBase</a>
                </h4>
                <h5>240,000￦</h5>
                <p class="card-text">사용자의 DB사용여부와 <br>Core, Memory 성능을 기반으로 결정됩니다.</p>
              </div>
              <div class="card-footer">
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="resources/images/OS.png" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">OS</a>
                </h4>
                <h5>20,000￦</h5>
                <p class="card-text">사용자의 OS 종류를 기반으로 결정됩니다.</p>
              </div>
              <div class="card-footer">
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="resources/images/Network.png" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Network</a>
                </h4>
                <h5>41,000￦</h5>
                <p class="card-text">사용자의 네트워크 상태를 기반으로 결정됩니다.</p>
              </div>
              <div class="card-footer">
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="resources/images/server.png" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Server</a>
                </h4>
                <h5>791000￦</h5>
                <p class="card-text">사용자의 Core, Memory 성능과 사용량을 기반으로 결정됩니다.</p>
              </div>
              <div class="card-footer">
              
              </div>
              
            </div>
            
          </div>
		
        </div>
        <!-- /.row -->
       <img class="d-block img-fluid" src="resources/images/comparehigh.png" alt="First slide">
       <br><br><br>
      </div>
      <!-- /.col-lg-9 -->
	

	      <div style="position:relative;left:400px;">
      	<ul class="graph">
  		<li class="graph-bar bar1" graph-val=${total.serverCost/10000}></li>
		</ul>
      </div>

      <div style="position:relative;left:550px;">
      	<ul class="graph">
 		<li class="graph-bar bar1" graph-val=${total.preSsdCost/10000}></li>
		</ul>
      </div>
      
    </div>
     <div>
          <p style="position:absolute;left:550px;">1863200￦</p>
          <p style="position:absolute;left:890px;">1417000￦</p>
 	 </div>
    
    <!-- /.row -->

  </div>
  <!-- /.container -->
<br><br><br>
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
