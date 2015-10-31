<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String regExpFlag = (String) session.getAttribute("regExpFlag");
	String titleBar = "Hello! New User";
	session.setAttribute("regExpFlag", null);
	if (regExpFlag != null && regExpFlag.endsWith("notAccept")) {
		titleBar = "U can not sign up without accepting the protocol";
	} else if (regExpFlag != null
			&& regExpFlag.endsWith("passwordError")) {
		titleBar = "Make sure your password is right";
	} else if (regExpFlag != null && regExpFlag.endsWith("usedName")) {
		titleBar = "Good name! But it has been used";
	} else if (regExpFlag != null
			&& regExpFlag.endsWith("accountNotNum")) {
		titleBar = "account should be a number";
	}
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
<link rel="stylesheet" href="styles/color.css" />



<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!-- Favicons
	================================================== -->
<link rel="shortcut icon" href="images/favicon.ico" />



</head>


<body class="single">

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
									<li><a href="#">Contact</a></li>
									<li><a href="#">Sitemap</a></li>
									<li><a href="#">Bookmark</a></li>
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
										onblur="if (this.value == '')this.value = 'Search keywords here';"
										onfocus="if (this.value == 'Search keywords here')this.value = '';"
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
							

							</div>
						</div>
					</div>
				</div>

				<section id="navigation">
				<div class="container">
					<div class="row">
						<nav id="nav-wrap" class="twelve columns">
						<ul id="sf-nav" class="sf-menu">
							<li><a href="index.jsp">Home</a></li>
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
						<!-- topnav --> </nav>
						<!-- nav -->
					</div>
				</div>
				</section>

				<div class="clear"></div>
				</header>

			</div>
			<!-- END HEADER -->


			<!-- MAIN CONTENT -->
			<div id="outermain">
				<div class="container">
					<div class="row">

						<section id="maincontent" class="ten columns positionleft">
						<div class="padcontent">

							<!--********************** 核心表单********************** -->
							<form name="regForm" action="com/servlet/RegServlet"
								method="post">
								<section class="content" id="register">

								<div class="breadcrumb">
									<a href="index.jsp">Home</a> / Register
								</div>
								<h1 class="pagetitle">Register</h1>

								<div class="alert">
									Already registered? <a href="#">Click here to
										login</a>
								</div>
								<h3>Shipping Address</h3>

								<div class="row">
									<!-- *************user name *****************-->
									<div class="five columns ">
										<label for="user_name" class="">User Name <span
											class="required">*</span></label> <input type="text"
											class="input-text" name="username" value="" />
									</div>
									<div class="clear"></div>
									<!-- *************password *****************-->
									<div class="five columns ">

										<label for="password" class="">Password <span
											class="required">*</span></label> <input type="password"
											class="input-text" name="password" value="" />
									</div>
									<!-- *************confirm password *****************-->
									<div class="five columns ">
										<label for="confirm password" class="">Confirm
											Password <span class="required">*</span>
										</label> <input type="password" class="input-text" name="confirmpass"
											value="" />
									</div>
									<!-- *************location *****************-->
									<div class="five columns ">
										<label for="location" class="">Address <span
											class="required">*</span></label> <input type="text"
											class="input-text" name="location" value="" />
									</div>
									<!-- *************account *****************-->
									<div class="five columns ">
										<label for="location" class="">Address <span
											class="required">*</span></label> <input type="number"
											class="input-text" min="0" name="account" />
									</div>
									<div class="clear"></div>

									<div id="shiptobilling">
										<input class="input-checkbox" checked='checked'
											type="checkbox" name="shiptobilling" value="1" /> <label
											for="shiptobilling" class="checkbox">Ship to same
											address?</label>
									</div>
									<h3 class="margin_bottom_middle">Shipping Address</h3>
									<label for="order_comments" class="">Order Notes</label>
									<textarea name="order_comments" class="input-text"
										id="order_comments" rows="6"></textarea>
									<input type="submit" name="submit" class="button mini"
										id="submit_btn" value="submit" /> <input type="reset"
										name="reset" class="button mini" id="reset_btn" value="reset" />
								</section>
							</form>
						</div>
						</section>
						<!--********************** 核心表单********************** -->
						<aside class="two columns">

						<div class="sidebar">
							<ul>
								<li class="widget-container">
									<h2 class="widget-title">Categories</h2>
									<ul>
										<li><a href="#">Clothing (8)</a>
											<ul>
												<li><a href="#">Woman Dress (4)</a></li>
												<li><a href="#">Man Suit (4)</a></li>
											</ul></li>
										<li><a href="#">Furniture (4)</a></li>
										<li><a href="#">Electronics (4)</a></li>
										<li><a href="#">Accessories (4)</a></li>
										<li><a href="#">Shoes (4)</a></li>
									</ul>
								</li>
								<li class="widget-container">
									<h2 class="widget-title">Special Offers</h2>
									<ul class="sp-widget">
										<li><img src="images/content/products/p-28.jpg" alt="" />
											<h3>
												<a href="#">Woman's Couple Shoes</a>
											</h3>
											<div class="price">$120.00</div></li>
										<li><img src="images/content/products/p-20.jpg" alt="" />
											<h3>
												<a href="#">Modern Chair</a>
											</h3>
											<div class="price">$120.00</div></li>
									</ul>
								</li>
								<li class="widget-container"><a href="#"><img
										src="images/content/banner.gif" alt="" /></a></li>
							</ul>
						</div>

						</aside>

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
										Telp: +62 500 800 123<br> Fax: +62 500 800 112<br> <a
											href="mailto:info@yourdomain.com">info@yourdomain.com</a>
									</div>
								</li>
							</ul>
						</div>
						<div class="clear"></div>

					</div>
				</div>
			</div>
			<!-- END FOOTER SIDEBAR --> <!-- COPYRIGHT -->
			<div id="outercopyright">
				<div class="container">
					<div id="copyright">
						Copyright &copy;2012. All Rights Reserved. More Templates <a
							href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
						- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
							target="_blank">网页模板</a>
					</div>
					<ul class="sn">
						<li><a href="http://twitter.com" title="Twitter"><span
								class="icon-img twitter"></span></a></li>
						<li><a href="http://facebook.com" title="Facebook"><span
								class="icon-img facebook"></span></a></li>
						<li><a href="https://plus.google.com" title="Google+"><span
								class="icon-img google"></span></a></li>
						<li><a href="http://amazon.com" title="Amazon"><span
								class="icon-img amazon"></span></a></li>
						<li><a href="http://pinterest.com" title="Pinterest"><span
								class="icon-img pinterest"></span></a></li>
					</ul>
				</div>
			</div>
			<!-- END COPYRIGHT --> </footer>
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



</body>
</html>