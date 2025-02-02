<%-- 
    Document   : gallery
    Created on : Oct 3, 2022, 1:55:26 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Aquera</title>
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: Arial;
  background-image: url('Assets/images/whitebg.png');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;

}

/* The grid: Four equal columns that floats next to each other */
.column {
  float: left;
  width: 25%;
  padding: 10px;
}

/* Style the images inside the grid */
.column img {
  opacity: 0.8; 
  cursor: pointer; 
}

.column img:hover {
  opacity: 1;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* The expanding image container */
.container {
  position: relative;
  display: none;
}

/* Expanding image text */
#imgtext {
  position: absolute;
  bottom: 15px;
  left: 15px;
  color: white;
  font-size: 20px;
}

/* Closable button inside the expanded image */
.closebtn {
  position: absolute;
  top: 10px;
  right: 15px;
  color: white;
  font-size: 35px;
  cursor: pointer;
}
</style>
</head>
<body>
    <div>
    <!-- nav start -->
    <nav class="navbar navbar-expand-lg  navbar-dark bg-dark fixed-top">
      <!--fixing nav -->
      <div class="container">
        <a class="navbar-brand" href="#">
          <span class="text-info">Aquera</span>
        </a>
        <!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>-->
        <div class="collapse navbar-collapse text-white" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <!-- e=left ms=right -->
            <li class="nav-item">
              <a class="nav-link" href="/Aquera/">
                <p style="color:white">Home</p>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="gallery.jsp">
                <p style="color:white">Gallery</p>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="aboutus.jsp">
                <p style="color:white">About US</p>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="products.jsp">
                <p style="color:white">Our Products</p>
              </a>
            </li>
          <% if (session.getAttribute("name") != null && session.getAttribute("role").equals("buyer")) { %>
            <li class="nav-item">
              <a class="nav-link" href="orderList.jsp">
                <p style="color:white">Orders</p>
              </a>
            </li>
          <% } %>
            
          <% if (session.getAttribute("name") == null) { %>
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">
              <p style="color:white">Login</p>
            </a>
          </li>
          <% } else { %>
          <li class="nav-item">
            <a class="nav-link" href="logout.jsp">
              <p style="color:white">Logout</p>
            </a>
          </li>
          <% } %>
        </div>
      </div>
    </nav>
    </div>
<div style="text-align:center; margin-top:10rem;">
  <h1>Aquera Gallery</h1>
  <p>Click on the images below to get better view</p>
</div>

<!-- The four columns -->
<div class="row">
  <div class="column">
    <img src="Assets/images/pawel-czerwinski-mJMrbY-jtls-unsplash.jpg" alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
  </div>
  <div class="column">
    <img src="Assets/images/david-clode-YRShYRewi0M-unsplash.jpg" alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
  </div>
  <div class="column">
    <img src="Assets/images/david-clode-HDVmdzQxAds-unsplash.jpg" alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
  </div>
  <div class="column">
    <img src="Assets/images/david-clode-bFf6nKDwBtU-unsplash.jpg" alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
  </div>
</div>
</div>
  <div class="column">
    <img src="Assets/images/david-clode-lWY2xGMYbt8-unsplash.jpg" alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
  </div>
</div>
</div>
  <div class="column">
    <img src="Assets/images/kyaw-tun-ECvYbWrTPNU-unsplash.jpg" alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
  </div>
</div>
  <div class="column">
    <img src="Assets/images/claudio-guglieri-K2RH1QZdLF4-unsplash.jpg" alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
  </div>
</div>
  <div class="column">
    <img src="Assets/images/gabor-szuts-uu8sDKvTx-g-unsplash.jpg" alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
  </div>
</div>
</div>
<div class="container">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <img id="expandedImg" style="width:100%">
  <div id="imgtext"></div>
</div>

<script>
function myFunction(imgs) {
  var expandImg = document.getElementById("expandedImg");
  var imgText = document.getElementById("imgtext");
  expandImg.src = imgs.src;
  imgText.innerHTML = imgs.alt;
  expandImg.parentElement.style.display = "block";
}
</script>

</body>
</html>
