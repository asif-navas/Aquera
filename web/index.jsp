<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="Assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
   
    <title>Aquera</title>
    </head>
    <style>
        *{
    padding: 0px;
    margin: 0px;
    box-sizing: border-box;
}
li{
   padding-left: 25px;
}
    .mheader{
    background-image: url("Assets/images/aquarium gold.jpg");
    min-height: 100vh;
    width:100%;
    background-repeat: no-repeat;
    background-size:cover;
   
        }
         html{
    scroll-behavior: smooth;
}
   .words{
    position: absolute;
    transform: translate(320px,600px);
    text-align: center;
   }
   #welcome{
    font-weight: bold;
    font-size: 60px;
    color:rgb(0, 234, 255);
   }
   #line{
    text-decoration-line: underline ;
    color: black;
    font-weight: bold;
    font-size: 30px;
   }
   /*gallery*/

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
      #gallery{
          padding-top:4px;
      }
      #aboutus{
          padding-top: 0px;
          padding-bottom: 2rem;
      }
      .row{
          padding-top:70px;
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
  .closebtn {
    position: absolute;
    top: 10px;
    right: 15px;
    color: white;
    font-size: 35px;
    cursor: pointer;
  }
  /*about*/
 *:before,
 *:after {
    box-sizing: inherit;
 }
 .card {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    margin: 8px;
}
.card-body{
  text-align: center;
}
.about-section {
    padding: 50px;
    text-align: center;
    background-color: #474e5d;
    background-color: #cccccc;
    color: white;
  }  
  .title {
    color: grey;
  }
  
  .button {
    border: none;
    outline: 0;
    display: inline-block;
    padding: 8px;
    color: white;
    background-color: #000;
    text-align: center;
    cursor: pointer;
    width: 100%;
    
  }  
  .button:hover {
    background-color: #555;
  }

  @media screen and (max-width: 650px) {
    .column {
      width: 100%;
      display: block;
    }
  }

  /*footer*/
  footer{
    background:black;
    padding: 50px 25px;
 }
footer .fcontainer{
  width: 100%;
  margin: auto;
  display: flex;
  justify-content: space-between;
}

footer .ftr h3{
  color: white;
  font-size:22px;
  text-align: center;
}
footer .fcontent a,footer .fcontent li{
  font-size:18px;
  color:white;
  opacity: 0.6;
  line-height: 30px;  
  text-decoration: none!important;
 
}
.fcontent{
  list-style-type:none;  
}

footer .fcontent a:hover{
opacity:1;
 }
.footercenter{
  padding: 50px 50px;
  font-weight:bold;
  color:white;
}
.ftr{
  text-align:center;
}
.jst{
  padding-left: 43px;
}

    </style>
     <body>
     
        <section class="mheader">
      <nav class="navbar navbar-expand-lg  navbar-dark bg-dark fixed-top">
        <!--fixing nav -->
        <div class="container">
          <a class="navbar-brand" href="#">
            <span style="font-family: cursive; font-weight: bold; font-size:28px;" class="text-info">Aquera</span>
          </a>
          <div class="collapse navbar-collapse text-white" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <!-- e=left ms=right -->
              <li class="nav-item">
                <a class="nav-link" href="/Aquera/">
                   <p style="color:white">Home</p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#gallery">
                  <p style="color:white">Gallery</p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#aboutus">
                  <p style="color:white">About US</p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="products.jsp">
                  <p style="color:white">Our Products</p>
                </a>
              </li>  
              <% if (session.getAttribute("name") == null) { %>
                <li class="nav-item">
                  <a class="nav-link" href="login.jsp">
                    <p style="color:white ">Login</p>
                  </a>
                </li>
                <% } else { %>
                <li class="nav-item">
                  <a class="nav-link" href="#logout.jsp">
                    <p style="color:white ">Logout</p>
                  </a>
                </li>
                <% } %>      
             </div>
        </div>
      </nav>
          <div class="words">
            <h2 id="welcome">welcome to the world of wonder</h2>
            <h4 id="line">The complete aquatic store</h4>
          </div>
         
             </div>
    </section>

    <!--gallery section-->
    <section id="gallery">
        <div style="text-align:center; margin-top:5rem;">
            <h2 style="font-weight:bold;">Aquera Gallery</h2>
          <p >Click on the images below to get better view</p>
        <!--The four columns -->
      <div class="row">
          <div class="column">
            <img src="Assets/images/LESS MB8.jpg"  alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
          </div>
          <div class="column">
            <img src="Assets/images/LESS MB3.jpg"  alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
          </div>
          <div class="column">
            <img src="Assets/images/LESS MB1.jpg"  alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
          </div>
          <div class="column">
            <img src="Assets/images/LESS MB7.jpg"  alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
          </div>
        </div>
        </div>
          <div class="column">
            <img src="Assets/images/LESS MB2.jpg"  alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
          </div>
        </div>
        </div>
          <div class="column">
            <img src="Assets/images/LESS MB0.jpg"  alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
          </div>
        </div>
          <div class="column">
            <img src="Assets/images/LESSMB4.jpg" alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
          </div>
        </div>
          <div class="column">
            <img src="Assets/images/LESSMB11.jpg" alt="alt=""Nature" style="width:100%" onclick="myFunction(this);"/>
          </div>
        </div>
        </div>
        <div class="container">
          <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
          <img id="expandedImg" style="width:100%">
          <div id="imgtext"></div>
        </div><div></div>
       
        <script>
        function myFunction(imgs) {
          var expandImg = document.getElementById("expandedImg");
          var imgText = document.getElementById("imgtext");
          expandImg.src = imgs.src;
          imgText.innerHTML = imgs.alt;
          expandImg.parentElement.style.display = "block";
        }
        </script>-->
        </section>
         

           
    <!--about us-->
    <section id="aboutus">
        <div style="margin-top:10rem;" class="about-section">
          <h1 class="bg-secondary p-3 " style="color: black ;text-align:center">AQUERA</h1>
          <p class="apara" style="color:black;">The complete online aquatic store</p>
          <p class="apara" style="color:black;">Gmail ID : Aquera957@gmail.com</p>
          <p class="apara" style="color:black;">Contact Number : 9865236754</p>
         </div>
           <h2 class="bg-secondary p-3 text-black" style="text-align:center ; ">Our Team</h2>
           <div class="row m-2 mt-4">
             <div class="col-6">
               <div class="card">
                 <div class="card-body">
                   <h2 class="ourname">Asif Navas</h2>
                   <p class="dpara" class="title">Developer/Owner</p>
                   <p class="apara" >Studied in : School Of Computer Sciences MG University Kottayam</p>
                   <p class="apara" >asifnavas27@gmail.com</p>
                   <p>
                     <button class="button rounded-2">Contact</button>
                   </p>
                 </div>
               </div>
             </div>
             <div class="col-6">
               <div class="card">
                 <div class="card-body">
                   <h2 class="ourname">Vismaya K N</h2>
                   <p class="dpara" class="title">Developer/Owner</p>
                   <p class="apara" >Studied in : School Of Computer Sciences MG University Kottayam</p>
                   <p class="apara" >vismayavis656@gmail.com</p>
                   <p>
                     <button class="button rounded-2">Contact</button>
                   </p>
                 </div>
               </div>
             </div>
           </div>
    </section>
    <!--footer-->


    <footer>
      <div class="fcontainer">
          <div class="ftr">
              <h3 class="jst">contact info</h3>
              <ul class="fcontent">
                  <li>aquera957@gmail.com</li>
                  <li>7012237790</li>
                  <li>9870122809</li>
              </ul>
          </div>
          <div class="ftr">
          <h3 class="jst">social</h3>
              <ul class="fcontent">
                  <li>instagram</li>
                  <li>facebook</li>
                  <li>twitter</li>
              </ul>
          </div>
          <div class="ftr">
              <h3 class="jst">quick link</h3>
              <ul class="fcontent">
                  <li><a href="/Aquera/">home</a></li>
                  <li><a href="#gallery">gallery</a></li>
                  <li><a href="login.jsp">login</a></li>
              </ul>
          </div>
          <div class="ftr">
              <div class="footercenter">
              <h3 style="font-size:30px;">AQUERA</h3>
              <P style="font-size:20px;">complete aquatic store</P>
              </div>
          </div>
      </div>
  </footer>
          </body>
     
  </html>
    </body>
</html>