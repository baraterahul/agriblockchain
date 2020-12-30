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
               <li><a href="farmerhome.jsp">Purchase Seeds And Fertilize</a></li>
                  
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
    <div class="">

   
              
	<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Purchase Seeds & Fertilizers</h5>
            <form action="FarmerPurchaseSeedsServlet"  method="post" class="form-signin" >
          <!--   <...............fetch fertilizer email from database> .........................................-->
            <%
           String id= (request.getParameter("id"));
            System.out.print(id);
            if (id != null) {
    			String str = "select * from fertilizerregister where id=?";
    		Connection c=Dataconnection.getConnection();
    			PreparedStatement ps = c.prepareStatement(str);
    			ps.setString(1, id);

    			ResultSet rs = ps.executeQuery();
    			while (rs.next()) {
    				
    	%>
    	<input type="hidden" name="FertilizerEmail" value="<%=rs.getString(6)%>">
    	<%
				}
				}

				else {
					System.out.println("sorry");
				}
			%>
           <!--  <..........................fertilizer mail.............................................................> -->
            
              
              
              
<% HttpSession session1=request.getSession();
				
				String mail=(String)session1.getAttribute("farmermail");

           
             %>
             
             <input type="hidden" name="FarmerEmail" value="<%=mail%>">
              
              <%  String qryy = "select * from farmerregister where email='"+mail+"'"; 
              Connection conn=Dataconnection.getConnection();
              PreparedStatement pstt=conn.prepareStatement(qryy);
              ResultSet rse = pstt.executeQuery(); 
              %>
               <% 
                while(rse.next())
                {
                	%>
             <input type="hidden" name="farmerName" value="<%=rse.getString(2)%>">
             
              <% }%>
              
       <!--       <...............................farmer mail.................................................................................>  -->
              
               <%              String qry = "select * from seeds";
									
												Class.forName("com.mysql.jdbc.Driver");
													Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriblock","root","root");
													PreparedStatement pst=c.prepareStatement(qry);
													
												
													%>
													
													<%
													ResultSet rsets = pst.executeQuery(); 
													%>
             
               <div class="form-label-group">
              <label for="dealer">Select Seed</label>
                <select  class="form-control" name="Seed">
                <% 
                while(rsets.next())
                {
                	%>
            
              <option  value="<%=rsets.getString(2)%>"><%=rsets.getString(2)%></option>
              
               <% }%>
                </select>
              </div>
               
            <!--  id, farmerName, FarmerEmail, FertilizerEmail, Seed, seed_type, fertilize_1, fertilize_2, Pesticide_1, Pesticide_2 -->
              
            
			 <div class="form-label-group">
               <label for="inputEmail">seed_type</label>
               <select class="form-control" name="seed_type">
               <option value="natural">natural</option>
                <option value="hybrid">hybrid</option>
               </select>
              </div>
              <div class="form-label-group">
               <label for="inputEmail">Select Fertilize</label>
               <select class="form-control" name="fertilize_1">
               <option value="Ammonium Sulphate">Ammonium Sulphate:</option>
                <option value="Urea (46% N) (While free flowing)">Urea (46% N) (While free flowing)</option>
                <option value="Urea (coated) (45% N) (While free flowing)"> Urea (coated) (45% N) (While free flowing)</option>
                <option value="Ammonium Chloride">Ammonium Chloride</option>
                <option value="Calcium Ammonium Nitrate (26% N)">Calcium Ammonium Nitrate (26% N)</option>
                <option value="Calcium Ammonium Nitrate (26% N)">Calcium Ammonium Nitrate (26% N)</option>
                <option value="Anhydrous Ammonia">Anhydrous Ammonia</option>
                <option value="Urea Super Granulated">Urea Super Granulated</option>
               </select>
              </div>
               <div class="form-label-group">
               <label for="inputEmail">Select Fertilize</label>
                <select class="form-control" name="fertilize_2">
              <option value="Urea (Granular)">Urea (Granular)</option>
                <option value="STRAIGHT PHOSPHATIC FERTILIZERS">STRAIGHT PHOSPHATIC FERTILIZERS</option>
                <option value="Single Superphosphate ( 14% P2O5 Powdered" >Single Superphosphate ( 14% P2O5 Powdered</option>
                <option value="Triple Superphosphate">Triple Superphosphate</option>
                <option value="Bone meal, Raw">Bone meal, Raw</option>
                <option value="Bone meal, Steamed">Bone meal, Steamed</option>
                <option value="Rockphosphate">Rockphosphate</option>
                <option value="Single Superphosphate (16% P2O5Granulated)">Single Superphosphate (16% P2O5Granulated)</option>
               </select>
              </div>
                 <div class="form-label-group">
               <label for="inputEmail">Select pesticide</label>
               <select class="form-control" name="Pesticide_1">
               <option value="Azoxystrobin">Azoxystrobin</option>
                <option value="Boscalid">Boscalid</option>
                <option value="Carbendazim (MBC)">Carbendazim (MBC)</option>
                <option value="Chlorothalonil">Chlorothalonil</option>
                <option value="Cyprodinil">Cyprodinil</option>
                <option value="Dicloran">Dicloran</option>
                <option value="Fenbuconazole">Fenbuconazole</option>
                <option value="Fludioxonil">Fludioxonil</option>
               </select >
              </div>
               <div class="form-label-group">
               <label for="inputEmail">Select Pesticide</label>
                <select class="form-control" name="Pesticide_2">
              <option value="Vinclozolin">Vinclozolin</option>
                <option value="Metolachlor">Metolachlor</option>
                <option value="SOxyfluorfen">SOxyfluorfen</option>
                <option value="Propazine">Propazine</option>
                <option value="Trifluralin">Trifluralin</option>
                <option value="Bifenthrin">Bifenthrin</option>
                <option value="Chlorpyrifos">Chlorpyrifos</option>
                <option value="Coumaphos">Coumaphos</option>
               </select>
              </div>
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
         

      <!-- Single Welcome Slides -->
     

    
   
 
  <!-- ##### Newsletter Area End ##### -->

  <!-- ##### Farming Practice Area Start ##### -->
  
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