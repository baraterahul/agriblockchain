<%@page import="dbconnect.Dataconnection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="description" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <!-- Title -->
  <title>Famie - Farm Services &amp; Organic Food Store Template | Home</title>
  <!-- Favicon -->
  <link rel="icon" href="img/core-img/favicon.ico">
  <!-- Core Stylesheet -->
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <!-- Preloader -->
  <div class="preloader d-flex align-items-center justify-content-center">
    <div class="spinner"></div>
  </div>

  <!-- ##### Header Area Start ##### -->
  <header class="header-area">
    <!-- Top Header Area -->
    <div class="top-header-area">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="top-header-content d-flex align-items-center justify-content-between">
              <!-- Top Header Content -->
              <div class="top-header-meta">
                <p>Welcome to <span>FarmBuddy</span>, we hope you will enjoy our service and have good experience</p>
              </div>
              <!-- Top Header Content -->
              <div class="top-header-meta text-right">
                <a href="#" data-toggle="tooltip" data-placement="bottom" title="infodeercreative@gmail.com"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span>Email: infodeercreative@gmail.com</span></a>
                <a href="#" data-toggle="tooltip" data-placement="bottom" title="+1 234 122 122"><i class="fa fa-phone" aria-hidden="true"></i> <span>Call Us: +84 223 9000</span></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Navbar Area -->
    <div class="famie-main-menu">
      <div class="classy-nav-container breakpoint-off">
        <div class="container">
          <!-- Menu -->
          <nav class="classy-navbar justify-content-between" id="famieNav">
            <!-- Nav Brand -->
            <a href="index.html" class="nav-brand"><img src="" alt=""></a>
            <!-- Navbar Toggler -->
            <div class="classy-navbar-toggler">
              <span class="navbarToggler"><span></span><span></span><span></span></span>
            </div>
            <!-- Menu -->
            <div class="classy-menu">
              <!-- Close Button -->
              <div class="classycloseIcon">
                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
              </div>
              <!-- Navbar Start -->
              <div class="classynav">
                <ul>
                  <li class="active"><a href="farmerhome.jsp">Home</a></li>
               <li><a href="farmerhome.jsp">Purchase Product</a></li>
                  
                   <li><a href="SubDealerLogout">Logout</a></li>
                </ul>
                <!-- Search Icon -->
                
                <!-- Cart Icon -->
                
              </div>
              <!-- Navbar End -->
            </div>
          </nav>

          <!-- Search Form -->
          <div class="search-form">
            <form action="#" method="get">
              <input type="search" name="search" id="search" placeholder="Type keywords &amp; press enter...">
              <button type="submit" class="d-none"></button>
            </form>
            <!-- Close Icon -->
            <div class="closeIcon"><i class="fa fa-times" aria-hidden="true"></i></div>
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- ##### Header Area End ##### -->
 
  <!-- ##### Hero Area Start ##### -->
  <div class="hero-area">
    <div class="">

      <!-- Single Welcome Slides -->
      <%
	
	  
		String id = (request.getParameter("id"));
		if (id != null) {
			String str = "select * from subdealersendreqtodealer where id=?";
			Class.forName("com.mysql.jdbc.Driver");
			Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriblock", "root", "root");

			PreparedStatement ps = co.prepareStatement(str);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
	%>
              
	<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Purchase Product</h5>
            <form action="SubDealerBlock"  method="post" class="form-signin" >
          
<!-- id, FarmerData, FarmerName, cropname, cropquantity, cropFRP, totalprice,
 dealerMail, cropquality, fid, Subdealermail -->
 
 <input type="hidden" name="id" value="<%=rs.getString(1)%>">
 <input type="hidden" name="FarmerData" value="<%=rs.getString(2)%>">
  <input type="hidden" name="dealerMail" value="<%=rs.getString(8)%>">
 <input type="hidden" name="fid" value="<%=rs.getString(10)%>">
  <input type="hidden" name="Subdealermail" value="<%=rs.getString(11)%>">

              <div class="form-label-group">
               <label for="inputEmail">Farmer Name</label>
                <input type="text" id="inputPassword" name="FarmerName" value="<%=rs.getString(3)%>" class="form-control"  >
              </div>
              
                <div class="form-label-group">
              <label for="inputPassword">Crop Name</label>
               <input type="text" id="inputPassword" name="cropname" value="<%=rs.getString(4)%>" class="form-control" placeholder="Enter location" >
              </div>

              <div class="form-label-group">
              <label for="inputPassword">Crop Quantity</label>
               <input type="text" id="inputPassword" name="cropquantity" value="<%=rs.getString(5)%>" class="form-control" placeholder="Enter Quantity in Quintal (100kg=1Quintal)">
              </div>
              
              <div class="form-label-group">
              <label for="inputPassword">Crop Quality</label>
                <input type="text" id="inputPassword" name="cropquality" value=<%=rs.getString(9)%>  class="form-control" placeholder="Enter location">
                
              </div>
               <%              String qry = "select * from subdealerfrprate";
									
												Class.forName("com.mysql.jdbc.Driver");
													Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriblock","root","root");
													PreparedStatement pst=c.prepareStatement(qry);
													
												
													%>
													
													<%
													ResultSet rsets = pst.executeQuery(); 
													%>
             
               <div class="form-label-group">
              <label for="dealer">Crop FRP Price</label>
                <select name="cropFRP" class="form-control">
                <% 
                while(rsets.next())
                {
                	%>
            
              <option  value="<%=rsets.getString(3)%>"><%=rsets.getString(2)%>,<%=rsets.getString(3)%>,100Kg</option>
              
               <% }%>
                </select>
              </div>
               
             <div class="form-label-group">
              <label for="inputPassword">Total Price</label>
               <input type="text" id="inputPassword" name="totalprice" value="" class="form-control" placeholder="Enter total Price">
              </div>
              
             <%
				}
				}

				else {
					System.out.println("sorry");
				}
			%>
              <input type="submit" value="Purchase" class="btn btn-lg btn-primary btn-block text-uppercase">
              <hr class="my-4">
             
             
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
		   	</div>
              </div>
         

    
  
  <!-- ##### Footer Area End ##### -->

  <!-- ##### All Javascript Files ##### -->
  <!-- jquery 2.2.4  -->
  <script src="js/jquery.min.js"></script>
  <!-- Popper js -->
  <script src="js/popper.min.js"></script>
  <!-- Bootstrap js -->
  <script src="js/bootstrap.min.js"></script>
  <!-- Owl Carousel js -->
  <script src="js/owl.carousel.min.js"></script>
  <!-- Classynav -->
  <script src="js/classynav.js"></script>
  <!-- Wow js -->
  <script src="js/wow.min.js"></script>
  <!-- Sticky js -->
  <script src="js/jquery.sticky.js"></script>
  <!-- Magnific Popup js -->
  <script src="js/jquery.magnific-popup.min.js"></script>
  <!-- Scrollup js -->
  <script src="js/jquery.scrollup.min.js"></script>
  <!-- Jarallax js -->
  <script src="js/jarallax.min.js"></script>
  <!-- Jarallax Video js -->
  <script src="js/jarallax-video.min.js"></script>
  <!-- Active js -->
  <script src="js/active.js"></script>
</body>

</html>