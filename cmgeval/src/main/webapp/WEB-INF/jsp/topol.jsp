<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <head>
        <link rel="stylesheet" href="/resources/css/next.min.css">
        <script src="/resources/js/next.min.js"></script>
        <link rel="stylesheet" href="/resources/css/next.css">
   		<script type="text/javascript" src="/resources/js/next.js"></script>
   		<script type="text/javascript" src="/resources/js/shop-homepage.js"></script>
   		<link href="resources/css/bootstrap.min.css" rel="stylesheet">
    </head>
    
    
    <body>
    <br><br>
	<div class="search-wrapper" style="position:relative; left:170px;">
      	<img src = resources/images/cloud.png width = "300" height = "40"></img>	
      	<br><br>
		<div class="col-lg-3" style="position:relative;>
        	<div class="list-group">
          		<a href="Gen" class="list-group-item">가격 분석</a>
          		<a href="topol" class="list-group-item">네트워크 구성도</a>
        </div>
        <img src = resources/images/index_top.png width = "400" height = "70"></img>
        <br>
        
	</div>
    <div id="topology-container" >
    	<div style="border:1px solid skyblue">
        <script src="/resources/js/topology.js"></script>
        <script src="/resources/js/app.js"></script>
        <!-- input type="text" placeholder="Enter keywords ..." required -->
        </div>
    </div>
      
    

    </body>
</html>