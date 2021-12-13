<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />

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
        <h3 class="my-4">Result</h3>
        <div class="list-group">
          <a href="Gen" class="list-group-item">가격 분석</a>
          <a href="topol" class="list-group-item">네트워크 구성도</a>
          <!-- a href="High" class="list-group-item">High Memory Server</a-->
        </div>

      </div>
      <!-- /.col-lg-3 -->

	<!--  -->
      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="resources/images/dis.png" alt="First slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="resources/images/sum.png" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Total Cost</a>
                </h4>
                <h5>${total.total}￦</h5>
                <p class="card-text">매칭된 제품들의 총 합계 가격입니다.</p>
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
                <h5>${total.serverCost}￦</h5>
                <p class="card-text">사용자의 Core, Memory 성능과 사용량을 기반으로 결정됩니다.</p>
              </div>
              <div class="card-footer">
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="resources/images/highmem.png" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">High Memory Server</a>
                </h4>
                <h5>${total.highServerCost}￦</h5>
                <p class="card-text">Core에 비해 Memory가 크게 요구되는 경우 매칭되는 제품입니다</p>
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
                <h5>${total.DBCost}￦</h5>
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
                <h5>${total.osCost}￦</h5>
                <p class="card-text">사용자의 OS 종류를 기반으로 결정됩니다.</p>
              </div>
              <div class="card-footer">
              </div>
            </div>
          </div>

          

          

        </div>
        <!-- /.row -->
			  <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="resources/images/compare.png" alt="First slide">
              <br>
            </div>
          </div>
        </div>
      </div>
      
      <!-- /.col-lg-9 -->
      <div style="position:relative;left:350px;">
      	<ul class="graph">
 		<li class="graph-bar bar1" graph-val=${(total.preServerCost+total.highServerCost)*130/(total.preServerCost+total.highServerCost+total.serverCost)}></li>
  		<li class="graph-bar bar2" graph-val=${(total.serverCost+total.highServerCost)*130/(total.preServerCost+total.highServerCost+total.serverCost)}></li>
		</ul>
      </div>
	
      <div style="position:relative;left:470px;">
      	<ul class="graph">
 		<li class="graph-bar bar1" graph-val=${total.preSsdCost*130/(total.ssdCost+total.preSsdCost)}></li>
  		<li class="graph-bar bar2" graph-val=${total.ssdCost*130/(total.ssdCost+total.preSsdCost)}></li>
		</ul>
      </div>
      
    </div>
     <div style="position:relative;left:350px;">
          <!--p style="position:absolute;left:500px;">${total.preServerCost}￦</p-->
          <p style="position:absolute;left:50px">${total.preServerCost+total.highServerCost}￦</p>
          <p style="position:absolute;left:130px;">${total.serverCost+total.highServerCost}￦</p>
          <p style="position:absolute;left:430px;">${total.preSsdCost}￦</p>
          <p style="position:absolute;left:510px;">${total.ssdCost}￦</p>
 	 </div>
 	 <br>
 	 <div style="position:relative;left:350px;">
          <!--p style="position:absolute;left:500px;">${total.preServerCost}￦</p-->
          <p style="position:absolute;left:65px;">일반</p>
          <p style="position:absolute;left:138px;">최적화</p>
          <p style="position:absolute;left:445px;">일반</p>
          <!--p style="position:absolute;left:930px;">${total.preSsdCost}￦</p-->
          <p style="position:absolute;left:520px;">최적화</p>
 	 </div>
     
    <!-- /.row -->
    <div style="position:relative;left:520px;"><br>
     <h4 class="my-4">총 절약 비용 : ${total.preServerCost - total.serverCost + total.preSsdCost - total.ssdCost}￦ (월)</h4>
     </div>
     
     
     <br><br>
     	<div style="position:relative;left:320px;">
     		<img class="d-block img-fluid" src="resources/images/doughnut.png" width = "700" height = "200">
     	</div>
     <br><br>
	 
     <div class="pie" style="position:relative;left:400px;float:left;" width="200" >
        
  		<div class="pie__segment" style="--offset: 0; --value: ${(total.serverCost / total.total)*100}; --bg: #F5A9F2;"></div>
  		<div class="pie__segment" style="--offset: ${((total.serverCost / total.total)*100)}; --value: ${(total.highServerCost / total.total)*100}; --bg: #81F79F;"></div>
  		<div class="pie__segment" style="--offset: ${((total.highServerCost / total.total)*100)+((total.serverCost / total.total)*100)}; --value: ${(total.ssdCost / total.total)*100}; --bg: #2E64FE;"></div>
  		<div class="pie__segment" style="--offset: ${((total.highServerCost / total.total)*100)+((total.serverCost / total.total)*100)+((total.ssdCost / total.total)*100)}; --value: ${(total.DBCost / total.total)*100}; --bg: #FE9A2E;"></div>
  		<div class="pie__segment" style="--offset: ${((total.highServerCost / total.total)*100)+((total.serverCost / total.total)*100)+((total.ssdCost / total.total)*100)+((total.DBCost / total.total)*100)}; --value: ${(total.osCost / total.total)*100}; --bg: #bbaacc;"></div>
	</div>
 	    <div style="position:relative;left:450px;float:left"><img src = "/resources/images/index.png"></div>
     
     <head>
        <meta charset="utf-8">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
    </head>

    <body>
        <div class="chart-div">
            <canvas id="pieChartCanvas" width="300px" height="300px"></canvas>
        </div>

        <script src="script.js"></script>
    </body>
     
     
     
     

     
     
  </div>
 
  
  <!-- /.container -->
  <!-- Footer -->
  <br><br><br>
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
