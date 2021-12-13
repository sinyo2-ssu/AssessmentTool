<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Input</title>
  <!-- Favicon -->
  <!-- link rel="shortcut icon" href="./img/svg/logo.svg" type="image/x-icon" -->
  <!-- Custom styles -->
  <link rel="stylesheet" href="/resources/css/style.min.css">
</head>

<body>
  <div class="layer"></div>
<!-- ! Body -->
<a class="skip-link sr-only" href="#skip-target">Skip to content</a>
<div class="page-flex">
  <div class="main-wrapper">
    <!-- ! Main nav -->
    <nav class="main-nav--bg">
  <div class="container main-nav">
    <div class="main-nav-start">
      <div class="search-wrapper">
      	<img src = /resources/images/cloud.png width = "300" height = "40"></img>
      	
        <!-- input type="text" placeholder="Enter keywords ..." required -->
      </div>
    </div>
  </div>
</nav>
    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title">System1 </h2>
        
        
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon primary">
                <i data-feather="bar-chart-2" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
				<p class="stat-cards-info__num">${unmatch.core} Core</p>
                <p class="stat-cards-info__title">CPU CORE</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon warning">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">${unmatch.memTot} GB</p>
                <p class="stat-cards-info__title">Main Memory</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon purple">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Disk / SSD</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon success">
                <i data-feather="feather" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Operating System</p>
                <p class="stat-cards-info__progress">
                  <!-- <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
        </div>
        
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon primary">
                <i data-feather="bar-chart-2" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">${match.core} Core</p>
                <p class="stat-cards-info__title">Matched Core</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon warning">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">${match.memory} GB</p>
                <p class="stat-cards-info__title">Network</p>
                <p class="stat-cards-info__progress">
                  <!--span class="stat-cards-info__profit success">
                    <i data-feather="trending-up" aria-hidden="true"></i>0.24%
                  </span>  -->
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon purple">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Option1</p>
                <p class="stat-cards-info__progress">
                  <!-- span class="stat-cards-info__profit danger">
                    <i data-feather="trending-down" aria-hidden="true"></i>1.64%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon success">
                <i data-feather="feather" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Option2</p>
                <p class="stat-cards-info__progress">
                  <!-- span class="stat-cards-info__profit warning">
                    <i data-feather="trending-up" aria-hidden="true"></i>0.00%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
        </div>
        
        
        <h2 class="main-title">System2</h2>
        
        
        
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon primary">
                <i data-feather="bar-chart-2" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">CPU CORE</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon warning">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Main Memory</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon purple">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Disk / SSD</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon success">
                <i data-feather="feather" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Operating System</p>
                <p class="stat-cards-info__progress">
                  <!-- <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
        </div>
        
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon primary">
                <i data-feather="bar-chart-2" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">DBMS</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon warning">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Network</p>
                <p class="stat-cards-info__progress">
                  <!--span class="stat-cards-info__profit success">
                    <i data-feather="trending-up" aria-hidden="true"></i>0.24%
                  </span>  -->
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon purple">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Option1</p>
                <p class="stat-cards-info__progress">
                  <!-- span class="stat-cards-info__profit danger">
                    <i data-feather="trending-down" aria-hidden="true"></i>1.64%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon success">
                <i data-feather="feather" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Option2</p>
                <p class="stat-cards-info__progress">
                  <!-- span class="stat-cards-info__profit warning">
                    <i data-feather="trending-up" aria-hidden="true"></i>0.00%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        <h2 class="main-title">System3</h2>

        <div class="row stat-cards">
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon primary">
                <i data-feather="bar-chart-2" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">CPU CORE</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon warning">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Main Memory</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon purple">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Disk / SSD</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon success">
                <i data-feather="feather" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Operating System</p>
                <p class="stat-cards-info__progress">
                  <!-- <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
        </div>
        
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon primary">
                <i data-feather="bar-chart-2" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">DBMS</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon warning">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Network</p>
                <p class="stat-cards-info__progress">
                  <!--span class="stat-cards-info__profit success">
                    <i data-feather="trending-up" aria-hidden="true"></i>0.24%
                  </span>  -->
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon purple">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Option1</p>
                <p class="stat-cards-info__progress">
                  <!-- span class="stat-cards-info__profit danger">
                    <i data-feather="trending-down" aria-hidden="true"></i>1.64%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon success">
                <i data-feather="feather" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Option2</p>
                <p class="stat-cards-info__progress">
                  <!-- span class="stat-cards-info__profit warning">
                    <i data-feather="trending-up" aria-hidden="true"></i>0.00%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
        </div>
        
        
        
        
        
        <h2 class="main-title">System4</h2>
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon primary">
                <i data-feather="bar-chart-2" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">CPU CORE</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon warning">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Main Memory</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon purple">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Disk / SSD</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon success">
                <i data-feather="feather" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Operating System</p>
                <p class="stat-cards-info__progress">
                  <!-- <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
        </div>
        
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon primary">
                <i data-feather="bar-chart-2" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">DBMS</p>
                <p class="stat-cards-info__progress">
                  <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                      4.4%
                  </span>
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon warning">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Network</p>
                <p class="stat-cards-info__progress">
                  <!--span class="stat-cards-info__profit success">
                    <i data-feather="trending-up" aria-hidden="true"></i>0.24%
                  </span>  -->
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon purple">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Option1</p>
                <p class="stat-cards-info__progress">
                  <!-- span class="stat-cards-info__profit danger">
                    <i data-feather="trending-down" aria-hidden="true"></i>1.64%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon success">
                <i data-feather="feather" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Input Here</p>
                <p class="stat-cards-info__title">Option2</p>
                <p class="stat-cards-info__progress">
                  <!-- span class="stat-cards-info__profit warning">
                    <i data-feather="trending-up" aria-hidden="true"></i>0.00%
                  </span> -->
                </p>
              </div>
            </article>
          </div>
        </div>
        
        
        
        
        
        <div class="row">
          <div class="col">
            <!-- div class="chart">
              <canvas id="myChart" aria-label="Site statistics" role="img"></canvas>
            </div> -->
            <div class="users-table table-wrapper">
              <table class="posts-table">
                <thead>
                  <tr class="users-table-info">
                    <th>
                      <label class="users-table__checkbox ms-20">
                        <input type="checkbox" class="check-all">Thumbnail
                      </label>
                    </th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <label class="users-table__checkbox">
                        <input type="checkbox" class="check">
                        <div class="categories-table-img">
                          <picture><source srcset="./img/categories/01.webp" type="image/webp"><img src="./img/categories/01.jpg" alt="category"></picture>
                        </div>
                      </label>
                    </td>
                    <td>
                      How to build a loyal community online and offline
                    </td>
                    <td>
                      <div class="pages-table-img">
                        <picture><source srcset="./img/avatar/avatar-face-03.webp" type="image/webp"><img src="./img/avatar/avatar-face-03.png" alt="User Name"></picture>
                        Robert Fox
                      </div>
                    </td>
                    <td><span class="badge-active">Active</span></td>
                    <td>17.04.2021</td>
                    <td>
                      <span class="p-relative">
                        <button class="dropdown-btn transparent-btn" type="button" title="More info">
                          <div class="sr-only">More info</div>
                          <i data-feather="more-horizontal" aria-hidden="true"></i>
                        </button>
                        <ul class="users-item-dropdown dropdown">
                          <li><a href="##">Edit</a></li>
                          <li><a href="##">Quick edit</a></li>
                          <li><a href="##">Trash</a></li>
                        </ul>
                      </span>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label class="users-table__checkbox">
                        <input type="checkbox" class="check">
                        <div class="categories-table-img">
                          <picture><source srcset="./img/categories/03.webp" type="image/webp"><img src="./img/categories/03.jpg" alt="category"></picture>
                        </div>
                      </label>
                    </td>
                    <td>
                      How to build a loyal community online and offline
                    </td>
                    <td>
                      <div class="pages-table-img">
                        <picture><source srcset="./img/avatar/avatar-face-03.webp" type="image/webp"><img src="./img/avatar/avatar-face-03.png" alt="User Name"></picture>
                        Robert Fox
                      </div>
                    </td>
                    <td><span class="badge-active">Active</span></td>
                    <td>17.04.2021</td>
                    <td>
                      <span class="p-relative">
                        <button class="dropdown-btn transparent-btn" type="button" title="More info">
                          <div class="sr-only">More info</div>
                          <i data-feather="more-horizontal" aria-hidden="true"></i>
                        </button>
                        <ul class="users-item-dropdown dropdown">
                          <li><a href="##">Edit</a></li>
                          <li><a href="##">Quick edit</a></li>
                          <li><a href="##">Trash</a></li>
                        </ul>
                      </span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
         
        </div>
        <footer
            class="flex items-center justify-between p-4 bg-white border-t dark:bg-darker dark:border-primary-darker"
          >
          <div style="position:absolute; right:200px">
              <a href="Gen" class="text-blue-500 hover:underline" align="right"
                >Calculate</a
              >
          </div>
          </footer>
      </div>
      
    </main>
    
    <!-- ! Footer -->
    <footer class="footer">
  <div class="container footer--flex">
    <div class="footer-start">
      <p>2021 © Elegant Dashboard - <a href="elegant-dashboard.com" target="_blank"
          rel="noopener noreferrer">elegant-dashboard.com</a></p>
    </div>
    <ul class="footer-end">
      <li><a href="##">About</a></li>
      <li><a href="##">Support</a></li>
      <li><a href="##">Puchase</a></li>
    </ul>
  </div>
</footer>
  </div>
</div>
<!-- Chart library -->
<script src="/resources/js/chart.min.js"></script>
<!-- Icons library -->
<script src="/resources/js/feather.min.js"></script>
<!-- Custom scripts -->
<script src="/resources/js/script2.js"></script>
</body>

</html>