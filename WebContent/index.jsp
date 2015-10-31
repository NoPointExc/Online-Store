<%@page import="java.sql.SQLException"%>
<%@page import="com.entity.Store"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.StoreDao"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.Iterator"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<%
	User regUser= (User) session.getAttribute("user");


%>



<html lang="en">
<!--<![endif]-->
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8" />
<title>Lastore</title>
<meta name="robots" content="index, follow" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />


<!-- CSS
  ================================================== -->
<link
	href='http://fonts.useso.com/css?family=Ubuntu:400,700,500,300,400italic,300italic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="styles/style.css" />
<link rel="stylesheet" href="styles/inner.css" />
<link rel="stylesheet" href="styles/layout.css" />
<link rel="stylesheet" href="styles/layerslider.css" />
<link rel="stylesheet" href="styles/color.css" />


<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!-- Favicons
	================================================== -->
<link rel="shortcut icon" href="images/favicon.ico" />



</head>


<body>

	<div id="bodychild">
		<div id="outercontainer">

			<!-- HEADER -->
			<div id="outerheader">


				<header>
					<div id="top">
						<div class="container">
							<div class="row">
								<div id="topmenu" class=" six columns">
									<ul id="topnav">
										<li><a href="sig_in.jsp">Log In</a></li>
										<li><a href="user_reg.jsp">Sign Up!</a></li>								
									</ul>
								</div>
								<div id="topright" class="six columns">
									<div class="language">
										Language: <a href="#"><img src="images/eng.png" alt="" /></a>
										<a href="#"><img src="images/fr.png" alt="" /></a> <a href="#"><img
											src="images/gr.png" alt="" /></a>
									</div>
									<div class="currency">
										Currency : <a href="#">€</a> <a href="#">£</a> <a href="#">$</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div id="logo-wrapper">
						<div class="container">
							<div class="row">
								<div id="logo" class="six columns">
									<a href="index.jsp"><img src="images/logo.png" alt="" /></a> <span
										class="desc">Best Solution for your business</span>
								</div>
								<div class="right six columns">

									<form action="#" id="searchform" method="get">

										<input type="text"
											onBlur="if (this.value == '')this.value = 'Search keywords here';"
											onFocus="if (this.value == 'Search keywords here')this.value = '';"
											value="Search keywords here" id="s" name="s" class="field">
										<input type="submit" value="" class="searchbutton">

									</form>

									<div id="shopping-cart-wrapper">
										<div id="shopping_cart">
											<a href="#" id="shop-bag">Cart:(empty)</a><a class="btncart"
												href="#"></a>
											<ul class="shop-box">
												<li>
													<h2>Product1</h2>
													<div class="price">1 x $150.00</div>
													<div class="clear"></div>
												</li>
												<li>
													<h2>Shipping</h2>
													<div class="price">1 x $10.00</div>
													<div class="clear"></div>
												</li>
												<li class="total">
													<h2>Total</h2>
													<div class="price">$160.00</div>
													<div class="clear"></div>
												</li>
												<li class="btn-wrapper"><a href="#" class="cart">Cart</a>
													<a href="#" class="checkout">Checkout</a>
													<div class="clear"></div></li>
											</ul>
										</div>
									</div>

									<div class="clear"></div>
									<!-- 提示登陆 -->
									<div class="login">
										<%
										if(regUser==null){											
												 %>
										Welcome Visitor, you can <a href="sign_in.jsp"><strong>login</strong></a>
										or <a href="user_reg.jsp"><strong>create an
												account</strong></a>		 												 
											 <%}else{  %>
																	
										Welcome <%= regUser.getUserName() %>, you can check your orders <a href="my_order.jsp"><strong>my orders</strong>
												
										<%} %>
																							
									</div>

								</div>
							</div>
						</div>
					</div>

					<section id="navigation">
						<div class="container">
							<div class="row">
								<nav id="nav-wrap" class="twelve columns">
									<ul id="sf-nav" class="sf-menu">
										<li class="current"><a href="index.jsp">Home</a></li>
										<li><a href="#">About Us</a>
											<ul>
												<li><a href="#">Elements</a></li>
												<li><a href="#">Blog Detail</a></li>
												<li><a href="#">Dropdown</a>
													<ul>
														<li><a href="#">Only</a></li>
														<li><a href="#">Example of</a></li>
														<li><a href="#">The Dropdown</a></li>
													</ul></li>
											</ul></li>
										<li><a href="#">Products</a>
											<ul>
												<li><a href="#">Product Grid</a></li>
												<li><a href="#">Product List</a></li>
												<li><a href="#">Product Details</a></li>
												<li><a href="#">Checkout</a></li>
											</ul></li>
										<li><a href="#">Portfolio</a></li>
										<li><a href="#">Blog</a></li>
										<li><a href="#">Contact Us</a></li>
									</ul>
									<!-- topnav -->
								</nav>
								<!-- nav -->
							</div>
						</div>
					</section>

					<div class="clear"></div>
				</header>

				<div class="headline">
					<div class="container">
						<div class="row">
							<div class="twelve columns">
								<h1>
									Hey there! We are La'store and We make Awesome eCommerce
									Themes. <br>Lorem ipsum dolor sit amet, consectetur
									adipiscing elit.
								</h1>
							</div>
						</div>
					</div>
				</div>


			</div>
			<!-- END HEADER -->

			<!-- SLIDER -->
			<div id="outerslider">
				<div id="slidercontainer">

					<section id="slider">
						<div id="layerslider" class="slideritems">
							<div class="ls-layer" id="ls-layer-1"
								data-rel="slidedelay: 3000;delayout: 750;">

								<img class="ls-s2" id="ls-s2-1"
									src="images/content/sample-1.png" alt="sample-1"
									title="New Arrival for Electronics"
									style="durationin: 2000; easingin: easeOutExpo; slidedirection: bottom; delayin: 1000" />
								<h3 class="ls-s3" id="ls-s3-1"
									data-rel="durationin: 2000; delayin:1000; easingin: easeOutElastic; slidedirection: bottom;">
									<a href="#" title="New Arrival for Electronics">New Arrival
										for Electronics</a>
								</h3>
								<div class="slidedesc ls-s4" id="ls-s4-1"
									data-rel="durationin: 2000; delayin:500; slidedirection: top;">Now
									AvailableMaecenas ac lectus ut justo sollicitudin accumsan quis
									quis ligula. Donec eu metus et sem aliquet placerat in id
									lacus. Nam nec arcu vitae justo cursus venenatis id at odio.</div>
							</div>
							<div class="ls-layer" id="ls-layer-2"
								data-rel="slidedelay: 3000;delayout: 750;">

								<img class="ls-s2" id="ls-s2-2"
									src="images/content/sample-2.png" alt="sample-2"
									title="New Arrival for Furnitures"
									style="durationin: 2000; easingin: easeOutExpo; slidedirection: bottom; delayin: 1000" />
								<h3 class="ls-s3" id="ls-s3-2"
									data-rel="durationin: 2000; delayin:1000; easingin: easeOutElastic; slidedirection: bottom;">
									<a href="#" title="New Arrival for Furnitures">New Arrival
										for Furnitures</a>
								</h3>
								<div class="slidedesc ls-s4" id="ls-s4-2"
									data-rel="durationin: 2000; delayin:500; slidedirection: top;">Now
									AvailableMaecenas ac lectus ut justo sollicitudin accumsan quis
									quis ligula. Donec eu metus et sem aliquet placerat in id
									lacus. Nam nec arcu vitae justo cursus venenatis id at odio.</div>
							</div>
							<div class="ls-layer" id="ls-layer-3"
								data-rel="slidedelay: 3000;delayout: 750;">

								<img class="ls-s2" id="ls-s2-3"
									src="images/content/sample-3.png" alt="sample-3"
									title="New Arrival for Accessories"
									style="durationin: 2000; easingin: easeOutExpo; slidedirection: bottom; delayin: 1000" />
								<h3 class="ls-s3" id="ls-s3-3"
									data-rel="durationin: 2000; delayin:1000; easingin: easeOutElastic; slidedirection: bottom;">
									<a href="#" title="New Arrival for Accessories">New Arrival
										for Accessories</a>
								</h3>
								<div class="slidedesc ls-s4" id="ls-s4-3"
									data-rel="durationin: 2000; delayin:500; slidedirection: top;">Now
									AvailableMaecenas ac lectus ut justo sollicitudin accumsan quis
									quis ligula. Donec eu metus et sem aliquet placerat in id
									lacus. Nam nec arcu vitae justo cursus venenatis id at odio.</div>
							</div>
						</div>
					</section>

				</div>
			</div>
			<!-- END SLIDER -->
			

			<!-- MAIN CONTENT -->
			<div id="outermain">
				<div class="container">
					<div class="row">
						<section id="maincontent" class="twelve columns">

							<section class="content">

								<div class="featured-products">
									<div class="header-wrapper">
										<h2>Store List</h2>
										<span></span>
										<div class="clear"></div>
									</div>


									<div class="row">

										<!--list of item-->

										<%
											StoreDao storeDao = new StoreDao();
														Store curStore ;
														ArrayList<Store> list = storeDao.getStores();
														Iterator<Store> it = list.iterator();
														while (it.hasNext()) {
															curStore = it.next();
															//System.out.println(curStore.getName());
										%>
										<div class="one_fifth columns">
											<div class="product-wrapper">
												<a title="Men's Watch" href="shop_detail.jsp?store_id=<%=curStore.getId()%>&action=openStore"><img
													src="images/content/products/p-31.jpg" alt="" /></a>
												<h3>
													<a title=<%=curStore.getName()%> href="shop_detail.jsp?store_id=<%=curStore.getId()%>&action=openStore">
													<%=curStore.getName()%></a>
												</h3>
												<div class="price-cart-wrapper">
													<div class="owner">Master id: <%=curStore.getSellerId()%></div>
													<div class="cart">
														<a href="#" class="more">more</a> | <a
															href="#" class="buy">buy</a>
													</div>
													<div class="clear"></div>
												</div>
											</div>
										</div>

										<%
											}
										%>
										<!--list of item-->

										<div class="row">
											<div class="one_half columns">
												<img src="images/content/FlexibleLayout.png" alt="" />
											</div>
											<div class="one_half columns">
												<img src="images/content/WellDocumented.png" alt="" />
											</div>
										</div>
							</section>

						</section>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->

			<!-- FOOTER -->
			<footer id="footer">
				<div id="carousel" class="es-carousel-wrapper">
					<div class="es-carousel">
						<ul>
							<li><a title="Audio Jungle" href="#"><img
									alt="Audio Jungle" src="images/content/audiojungle.png"></a></li>
							<li><a title="Active Den" href="#"><img alt="Active Den"
									src="images/content/activeden.png"></a></li>
							<li><a title="Graphic River" href="#"><img
									alt="Graphic River" src="images/content/graphicriver.png"></a></li>
							<li><a title="Photo Dune" href="#"><img alt="Photo Dune"
									src="images/content/photodune.png"></a></li>
							<li><a title="Theme Forest" href="#"><img
									alt="Theme Forest" src="images/content/themeforest.png"></a></li>
							<li><a title="Video Hive" href="#"><img alt="Video Hive"
									src="images/content/videohive.png"></a></li>
							<li><a title="Audio Jungle" href="#"><img
									alt="Audio Jungle" src="images/content/audiojungle.png"></a></li>
							<li><a title="Active Den" href="#"><img alt="Active Den"
									src="images/content/activeden.png"></a></li>
							<li><a title="Graphic River" href="#"><img
									alt="Graphic River" src="images/content/graphicriver.png"></a></li>
							<li><a title="Photo Dune" href="#"><img alt="Photo Dune"
									src="images/content/photodune.png"></a></li>
							<li><a title="Theme Forest" href="#"><img
									alt="Theme Forest" src="images/content/themeforest.png"></a></li>
							<li><a title="Video Hive" href="#"><img alt="Video Hive"
									src="images/content/videohive.png"></a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<!-- FOOTER SIDEBAR -->
				<div id="outerfootersidebar">
					<div class="container">
						<div id="footersidebar" class="row">

							<div id="footcol1" class="one_fifth columns">
								<ul>
									<li class="widget-container">
										<h2 class="widget-title">Information</h2>
										<ul>
											<li><a href="#">About Us</a></li>
											<li><a href="#">Delivery Information</a></li>
											<li><a href="#">Privacy Policy</a></li>
											<li><a href="#">Terms &amp; Condition</a></li>
										</ul>
									</li>
								</ul>
							</div>
							<div id="footcol2" class="one_fifth columns">
								<ul>
									<li class="widget-container">
										<h2 class="widget-title">Customer Services</h2>
										<ul>
											<li><a href="#">Contact Us</a></li>
											<li><a href="#">Returns</a></li>
											<li><a href="#">Site Map</a></li>
										</ul>
									</li>
								</ul>
							</div>
							<div id="footcol3" class="one_fifth columns">
								<ul>
									<li class="widget-container">
										<h2 class="widget-title">My Account</h2>
										<ul>
											<li><a href="#">Order History</a></li>
											<li><a href="#">My Account</a></li>
											<li><a href="#">Wish List</a></li>
											<li><a href="#">Newsletter</a></li>
										</ul>
									</li>
								</ul>
							</div>
							<div id="footcol4" class="one_fifth columns">
								<ul>
									<li class="widget-container">
										<h2 class="widget-title">Extras</h2>
										<ul>
											<li><a href="#">Brands</a></li>
											<li><a href="#">Affiliates</a></li>
											<li><a href="#">Gift Vouchers</a></li>
											<li><a href="#">Specials</a></li>
										</ul>
									</li>
								</ul>
							</div>
							<div id="footcol5" class="one_fifth columns">
								<ul>
									<li class="widget-container">
										<h2 class="widget-title">Contact Us</h2>
										<div class="textwidget">
											Telp: +62 500 800 123<br> Fax: +62 500 800 112<br>
											<a href="mailto:info@yourdomain.com">info@yourdomain.com</a>
										</div>
									</li>
								</ul>
							</div>
							<div class="clear"></div>

						</div>
					</div>
				</div>
				<!-- END FOOTER SIDEBAR -->

				
			</footer>
			<!-- END FOOTER -->
			<div class="clear"></div>
			<!-- clear float -->
		</div>
		<!-- end outercontainer -->
	</div>
	<!-- end bodychild -->


	<!-- ////////////////////////////////// -->
	<!-- //      Javascript Files        // -->
	<!-- ////////////////////////////////// -->
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

	<!-- jQuery Superfish -->
	<script type="text/javascript" src="js/hoverIntent.js"></script>
	<script type="text/javascript" src="js/superfish.js"></script>
	<script type="text/javascript" src="js/supersubs.js"></script>

	<!-- jQuery Carosel Slider -->
	<script type="text/javascript" src="js/jquery.elastislide.js"></script>
	<script type="text/javascript">
		jQuery('#carousel').elastislide({
			imageW : 135,
			margin : 12
		});
	</script>

	<!-- jQuery Dropdown Mobile -->
	<script type="text/javascript" src="js/tinynav.min.js"></script>

	<!-- Custom Script -->
	<script type="text/javascript" src="js/custom.js"></script>

	<!-- jQuery Layerslider -->
	<script type="text/javascript" src="js/jquery-easing-1.3.js"></script>
	<script type="text/javascript" src="js/layerslider.js"></script>
	<script type="text/javascript">
		jQuery(window).load(function() {
			jQuery('#layerslider.slideritems').layerSlider({
				skinsPath : 'images/layerslider-skins/',
				skin : 'lastore',
				autoStart : true
			});
			jQuery('.ls-nav-prev').fadeOut();
			jQuery('.ls-nav-next').fadeOut();
			jQuery('#layerslider.slideritems').mouseleave(function() {
				jQuery('.ls-nav-prev').fadeOut();
				jQuery('.ls-nav-next').fadeOut();
			});
			jQuery('#layerslider.slideritems').mouseenter(function() {
				jQuery('.ls-nav-prev').fadeIn();
				jQuery('.ls-nav-next').fadeIn();
			});
		});
	</script>


</body>
</html>
