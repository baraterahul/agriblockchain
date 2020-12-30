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
              <!--  <li><a href="farmerhome.jsp">Add crop Details</a></li> -->
                <li><a href="ViewFertilizer.jsp">View Fertilizer</a></li>
                   <li><a href="viewpricedealer.jsp">View Market</a></li>
                   <li><a href="FarmerLogout">Logout</a></li>
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
    <div class="welcome-slides owl-carousel">

      <!-- Single Welcome Slides -->
      <div class="single-welcome-slides bg-img bg-overlay jarallax" style="background-image: url(img/bg-img/7.jpg);">
        <div class="container h-600">
          <div class="row h-100 align-items-center">
            <div class="col-12 col-lg-12">
              <div class="welcome-content">
              
	<%-- <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Add Crop Details</h5>
            <form action="AddCropDetails"  method="post" class="form-signin" >
              <% 
              HttpSession session1=request.getSession(false);
              String mail=(String)session1.getAttribute("farmermail");

%>
<input type="hidden" name="farmerEmail" value="<%=mail%>"> 
  <%
	
	  
	
			String strrr = "select * from dealer_frp_rate";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriblock", "root", "root");

			PreparedStatement pstt = con.prepareStatement(strrr);
			

			ResultSet rstt = pstt.executeQuery();
			
				
	%> 
              <div class="form-label-group">
               <label for="inputEmail">Enter Crop Name</label>
                 <select name="cropname" class="form-control" >
              <% 
                while(rstt.next())
                {
                	%>
            
              <option  value="<%=rstt.getString(2)%>"><%=rstt.getString(2)%></option>
              
               <% }%>
             </select>
               
              </div>

              <div class="form-label-group">
              <label for="inputPassword">Crop Quantity</label>
               <select name="cropquantity" class="form-control" >
              <option  value="0-100Kg">0-100Kg</option>
              <option  value="100-1000Kg">100-1000Kg</option>
              <option  value="0-10 Tone">0-10 Tone</option>
              <option  value="10-20 Tone">10-20 Tone</option>
              <option  value="20-30 Tone">20-30 Tone</option>
               <option  value="More then 30 Tone">More then 30 Tone</option>
             </select>
              </div>
              
              <div class="form-label-group">
              <label for="inputPassword">Crop Quality</label>
                <select name="cropquality" class="form-control" >
               
            
              <option  value="Natural">Natural</option>
              <option  value="Hybrid">Hybrid</option>
            
             </select>
                
              </div>
              
                <div class="form-label-group">
              <label for="inputPassword">Enter Location</label>
                <input type="text" id="inputPassword" name="location" class="form-control" placeholder="Enter location" required>
                
              </div>
              

				           
              
               
              <%
	
	  
	
			String str = "select id,fname,lname,address,phone,email,mname,maddress,city,state,password from dealerregister";
			Class.forName("com.mysql.jdbc.Driver");
			Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriblock", "root", "root");

			PreparedStatement ps = co.prepareStatement(str);
			

			ResultSet rs = ps.executeQuery();
			
				
	%> 
	
	
                
				<div class="form-label-group">
              <label for="dealer">Select Market</label>
                <select name="mname" class="form-control" >
                <% 
                while(rs.next())
                {
                	%>
            
              <option  value="<%=rs.getString(7)%>"><%=rs.getString(7)%></option>
              
               <% }%>
             </select>
              </div>
                
          
              
               <%
	
	  
	
			String strr = "select id,fname,lname,address,phone,email,mname,maddress,city,state,password from dealerregister";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriblock", "root", "root");

			PreparedStatement pst = con1.prepareStatement(str);
			

			ResultSet rst = pst.executeQuery();
			
				
	%> 
               <div class="form-label-group">
              <label for="dealer">Select Dealer</label>
                <select name="dealerName" class="form-control" >
                
             <% 
                while(rst.next())
                {
                	%>
            
              <option  value="<%=rst.getString(6)%>"><%=rst.getString(6)%></option>
              
               <% }%>
               
             </select>
              </div>
            
              
             
              <input type="submit" value="Send Request" class="btn btn-lg btn-primary btn-block text-uppercase">
              <hr class="my-4">
             
             
            </form>
          </div>
        </div>
      </div>
    </div>
  </div> --%>
		   	</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Single Welcome Slides -->
     

    </div>
   
 
  <!-- ##### Newsletter Area End ##### -->

  <!-- ##### Farming Practice Area Start ##### -->
  <section class="farming-practice-area section-padding-100-50">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <!-- Section Heading -->
          <div class="section-heading text-center">
            <p>Make the green world</p>
            <h2><span>Farming Practices</span> To Preserve Land & Water</h2>
            <img src="img/core-img/decor2.png" alt="">
          </div>
        </div>
      </div>

      <div class="row">

        <!-- Single Farming Practice Area -->
        <div class="col-12 col-sm-6 col-lg-4">
          <div class="single-farming-practice-area mb-50 wow fadeInUp" data-wow-delay="100ms">
            <!-- Thumbnail -->
            <div class="farming-practice-thumbnail">
              <img src="img/bg-img/9.jpg" alt="">
            </div>
            <!-- Content -->
            <div class="farming-practice-content text-center">
              <!-- Icon -->
              <div class="farming-icon">
                <img src="img/core-img/chicken.png" alt="">
              </div>
              <span>Farming practice for</span>
              <h4>Chicken Farmed For Meat</h4>
              <p>Donec nec justo eget felis facilisis ferme ntum. Aliquam portitor mauris sit amet orci. donec salim...</p>
            </div>
          </div>
        </div>

        <!-- Single Farming Practice Area -->
        <div class="col-12 col-sm-6 col-lg-4">
          <div class="single-farming-practice-area mb-50 wow fadeInUp" data-wow-delay="200ms">
            <!-- Thumbnail -->
            <div class="farming-practice-thumbnail">
              <img src="img/bg-img/10.jpg" alt="">
            </div>
            <!-- Content -->
            <div class="farming-practice-content text-center">
              <!-- Icon -->
              <div class="farming-icon">
                <img src="img/core-img/pig.png" alt="">
              </div>
              <span>Farming practice for</span>
              <h4>Pig Farm Management</h4>
              <p>Donec nec justo eget felis facilisis ferme ntum. Aliquam portitor mauris sit amet orci. donec salim...</p>
            </div>
          </div>
        </div>

        <!-- Single Farming Practice Area -->
        <div class="col-12 col-sm-6 col-lg-4">
          <div class="single-farming-practice-area mb-50 wow fadeInUp" data-wow-delay="300ms">
            <!-- Thumbnail -->
            <div class="farming-practice-thumbnail">
              <img src="img/bg-img/11.jpg" alt="">
            </div>
            <!-- Content -->
            <div class="farming-practice-content text-center">
              <!-- Icon -->
              <div class="farming-icon">
                <img src="img/core-img/cow.png" alt="">
              </div>
              <span>Farming practice for</span>
              <h4>Beef Cattle Farming</h4>
              <p>Donec nec justo eget felis facilisis ferme ntum. Aliquam portitor mauris sit amet orci. donec salim...</p>
            </div>
          </div>
        </div>

        <!-- Single Farming Practice Area -->
        <div class="col-12 col-sm-6 col-lg-4">
          <div class="single-farming-practice-area mb-50 wow fadeInUp" data-wow-delay="400ms">
            <!-- Thumbnail -->
            <div class="farming-practice-thumbnail">
              <img src="img/bg-img/12.jpg" alt="">
            </div>
            <!-- Content -->
            <div class="farming-practice-content text-center">
              <!-- Icon -->
              <div class="farming-icon">
                <img src="img/core-img/cereal.png" alt="">
              </div>
              <span>Farming practice for</span>
              <h4>Improved Rice Cultivation</h4>
              <p>Donec nec justo eget felis facilisis ferme ntum. Aliquam portitor mauris sit amet orci. donec salim...</p>
            </div>
          </div>
        </div>

        <!-- Single Farming Practice Area -->
        <div class="col-12 col-sm-6 col-lg-4">
          <div class="single-farming-practice-area mb-50 wow fadeInUp" data-wow-delay="500ms">
            <!-- Thumbnail -->
            <div class="farming-practice-thumbnail">
              <img src="img/bg-img/13.jpg" alt="">
            </div>
            <!-- Content -->
            <div class="farming-practice-content text-center">
              <!-- Icon -->
              <div class="farming-icon">
                <img src="img/core-img/sprout.png" alt="">
              </div>
              <span>Farming practice for</span>
              <h4>Soil Improvement Techniques</h4>
              <p>Donec nec justo eget felis facilisis ferme ntum. Aliquam portitor mauris sit amet orci. donec salim...</p>
            </div>
          </div>
        </div>

        <!-- Single Farming Practice Area -->
        <div class="col-12 col-sm-6 col-lg-4">
          <div class="single-farming-practice-area mb-50 wow fadeInUp" data-wow-delay="600ms">
            <!-- Thumbnail -->
            <div class="farming-practice-thumbnail">
              <img src="img/bg-img/14.jpg" alt="">
            </div>
            <!-- Content -->
            <div class="farming-practice-content text-center">
              <!-- Icon -->
              <div class="farming-icon">
                <img src="img/core-img/vegetable.png" alt="">
              </div>
              <span>Farming practice for</span>
              <h4>Intensive Fruit Farming</h4>
              <p>Donec nec justo eget felis facilisis ferme ntum. Aliquam portitor mauris sit amet orci. donec salim...</p>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>
  <!-- ##### Farming Practice Area End ##### -->

  
  <!-- ##### Testimonial Area End ##### -->

  <!-- ##### Contact Area Start ##### -->
 
  <!-- ##### Contact Area End ##### -->

  <!-- ##### News Area Start ##### -->
  
  <!-- ##### News Area End ##### -->

  <!-- ##### Footer Area Start ##### -->
  
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