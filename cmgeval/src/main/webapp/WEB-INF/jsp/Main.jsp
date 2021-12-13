<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
	<head>
		<title>KT Cloud Assessment Tool title</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<noscript><link rel="stylesheet" type = "text/css" href="resources/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper" class="divided">	

				<!-- One -->
					<section class="banner style1 orient-left content-align-left image-position-right fullscreen onload-image-fade-in onload-content-fade-right">
						<div class="content">
							<h2 >KT Cloud Assessment Tool</h2>
							<p class="major"> 고객에 맞추어 클라우드 이전	 시 <br>사전 평가를 제공합니다 </p>
							<ul class="actions stacked">
								<li><a href="Explain" class="button big wide smooth-scroll-middle">Get Started</a></li>
							</ul>
						</div>
						<div class="image">
							<img src="resources/images/kt.png" alt="" />
						</div>
					</section>
				<!-- Two -->
					<section class="spotlight style1 orient-right content-align-left image-position-center onscroll-image-fade-in" id="first">
						<div class="content">
							<h2>사용 가이드</h2>
							<p> 엑셀파일의 형식에 맞추어 사용자의 시스템 상황을 입력하세요<br>Assessment Tool이 여러분의 Migration을 평가해드립니다.<br>아래 링크를 클릭하여 엑셀 양식을 다운받으세요.</p>
							<ul class="actions stacked">
								<!--li><a href="127.0.0.1/download" download="templete.xlsx" class="button">Download</a></li-->
								<li><a href="http://127.0.0.1:8000/download" download="guide.xlsx" class="button">Download</a></li>
								<br>
								
								
								
								
								
								<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
								<!-- <script>
								$(document).ready(function(){
 									 $("label").click(function(){
   										 $.get("demo_test.asp", function(data, status){
  										    alert("Data: " + data + "\nStatus: " + status);
   											 });
  											});
											});
								</script>
								</head>
								<body>
								
								<div class="filebox">
 									<label for="ex_file">엑셀 업로드</label>
  									<input type="file" id="upload">
								</div>
								 -->
								 
								
							</ul>
						</div>
						<div class="image">
							<img src="resources/images/secon.jpg" alt="" />
						</div>
					</section>

		<!-- Scripts -->
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/jquery.scrollex.min.js"></script>
			<script src="resources/js/jquery.scrolly.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>

	</body>
</html>

