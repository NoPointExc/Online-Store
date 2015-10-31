<%@page import="com.dao.ItemDao"%>
<%@page import="com.entity.Item"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
User regUser= (User) session.getAttribute("user");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ItemDao itemDao=new ItemDao();
	//System.out.println("@@@itemid=="+request.getParameter("item_id"));
	//int  requestId=1;
	int  requestId=Integer.parseInt(request.getParameter("item_id"))   ;
	Item item=itemDao.getItemById(requestId);	
	session.setAttribute("item", item);
 %>

<html lang="en"> <!--<![endif]-->
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
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

	<!-- CSS
  	================================================== -->
  	<link href='http://fonts.useso.com/css?family=Ubuntu:400,700,500,300,400italic,300italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="styles/style.css" />
    <link rel="stylesheet" href="styles/inner.css" />
    <link rel="stylesheet" href="styles/layout.css" />
    <link rel="stylesheet" href="styles/flexslider.css" />
    <link rel="stylesheet" href="styles/color.css" />
    <link rel="stylesheet" href="styles/prettyPhoto.css"  media="screen" />


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
                           		Language:  <a href="#"><img src="images/eng.png" alt=""/></a> <a href="#"><img src="images/fr.png" alt=""/></a> <a href="#"><img src="images/gr.png" alt=""/></a>
                            </div>
                        	<div class="currency"> Currency : <a href="#">€</a> <a href="#">£</a> <a href="#">$</a></div>
                        </div>
                    </div>
                    </div>
            	</div>
                
                <div id="logo-wrapper">
                    <div class="container">
                    <div class="row">
                        <div id="logo" class="six columns">
                            <a href="index.jsp"><img src="images/logo.png" alt=""/></a>
                            <span class="desc">Best Solution for your business</span>
                        </div>
                        <div class="right six columns">

                            <form action="#" id="searchform" method="get">
                                
                                <input type="text" onblur="if (this.value == '')this.value = 'Search keywords here';" onfocus="if (this.value == 'Search keywords here')this.value = '';" value="Search keywords here" id="s" name="s" class="field">
                                <input type="submit" value="" class="searchbutton">
                               
                            </form>
                               
                            <div id="shopping-cart-wrapper">
                                <div id="shopping_cart"><a href="#" id="shop-bag">Cart:(empty)</a><a class="btncart" href="#"></a>
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
                                            <div class="price"> $160.00</div>
                                            <div class="clear"></div>
                                        </li>
                                        <li class="btn-wrapper">
                                            <a href="#" class="cart">Cart</a> <a href="#" class="checkout">Checkout</a>
                                            <div class="clear"></div>
                                        </li>
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
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="current"><a href="#">Products</a>
                                <ul>
                                	<li><a href="#">Product Grid</a></li>
                                    <li><a href="#">Product List</a></li>
                                    <li><a href="#">Product Details</a></li>
                                    <li><a href="#">Checkout</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Portfolio</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul><!-- topnav -->
                    </nav><!-- nav -->	
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
                    
                        	<section class="content" id="product-detail">
                            
                                <div class="breadcrumb"><a href="index.jsp">Home</a> / products / Woman's Dress Flower</div>
                                <h1 class="pagetitle">Woman's Dress Flower</h1>
                                
                                <div class="row">
                                	<div class="one_fourth columns">
                                        <div id="pb-right-column">
                                            <div class="image-block">                                               
                                                    <div id="imageitems" class="flexslider">
                                                        <ul class="slides">
                                                            <li>
                                                            <a class="image" href="images/content/products/p-1.jpg" data-rel="prettyPhoto[mixed]" >
                                                           		<img src="images/content/products/p-1.jpg" alt="" />
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <a class="image" href="images/content/products/p-2.jpg" data-rel="prettyPhoto[mixed]" >
                                                            <img src="images/content/products/p-2.jpg" alt="" />
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <a class="image" href="images/content/products/p-3.jpg" data-rel="prettyPhoto[mixed]" >
                                                           		<img src="images/content/products/p-3.jpg" alt="" />
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <a class="image" href="images/content/products/p-4.jpg" data-rel="prettyPhoto[mixed]" >
                                                            <img src="images/content/products/p-4.jpg" alt="" />
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <a class="image" href="images/content/products/p-5.jpg" data-rel="prettyPhoto[mixed]" >
                                                           		<img src="images/content/products/p-5.jpg" alt="" />
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <a class="image" href="images/content/products/p-6.jpg" data-rel="prettyPhoto[mixed]" >
                                                            <img src="images/content/products/p-6.jpg" alt="" />
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <a class="image" href="images/content/products/p-7.jpg" data-rel="prettyPhoto[mixed]" >
                                                           		<img src="images/content/products/p-7.jpg" alt="" />
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <a class="image" href="images/content/products/p-8.jpg" data-rel="prettyPhoto[mixed]" >
                                                            <img src="images/content/products/p-8.jpg" alt="" />
                                                            </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                            </div>
                                                
                                            <div id="thumbslider">
                                                    <div id="carouselslider" class="flexslider">
                                                        <ul class="slides">
                                                            <li><img src="images/content/products/p-1.jpg" alt="" /></li>
                                                            <li><img src="images/content/products/p-2.jpg" alt="" /></li>
                                                            <li><img src="images/content/products/p-3.jpg" alt="" /></li>
                                                            <li><img src="images/content/products/p-4.jpg" alt="" /></li>
                                                            <li><img src="images/content/products/p-5.jpg" alt="" /></li>
                                                            <li><img src="images/content/products/p-6.jpg" alt="" /></li>
                                                            <li><img src="images/content/products/p-7.jpg" alt="" /></li>
                                                            <li><img src="images/content/products/p-8.jpg" alt="" /></li>
                                                        </ul>
                                                    </div>
                                            </div>
                                            
                                            <ul id="usefull_link_block">   
                                            	<li class="print"><a href="#">Print</a></li>  
                                                <li class="share_fb"><a href="#">Share on Facebook</a> </li>
                                                <li class="favoriteproducts"><a href="#">my favorites</a></li>			
                                                
                                            </ul>
                                            
                                        </div>
                                    </div>
                                    
                                	<div class="three_fourth columns">
                                    
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quis purus a arcu porta convallis ut in nunc. Donec elementum erat ipsum, eu consectetur tellus. Morbi et venenatis dui. Quisque at arcu ante, in placerat arcu. Curabitur scelerisque imperdiet elementum. </p>

<p>Cras sed tortor a tortor malesuada tempus eget non ante. Pellentesque cursus, elit nec semper porttitor, nisi magna adipiscing quam, nec convallis leo erat a nunc. Nulla libero urna, faucibus eget fermentum tempus, porttitor ac urna. In tempus lacinia neque id auctor. </p>
									
									
									<div class="price"><%=item.getPrice()%><span>(<%=item.getNum() %> avaiable)</span></div>
                                    <form name="regForm" action="com/servlet/CartServlet" method="post" class="product_attributes">
                                        <fieldset class="attribute_fieldset">
                                            <label class="attribute_label">Color:</label>
                                            <div class="attribute_list">
                                            <select>
                                                  <option title="White" selected="selected">White</option>
                                                  <option title="Red">Red</option>
                                                  <option title="Green">Green</option>
                                                  <option title="Blue">Blue</option>
                                            </select>
                                            </div>
                                            <br>
                                            <label class="amount" name="amount">Qty:</label>
                                            <div class="qty_list">
                                            <select>
                                                  <option title="1" selected="selected">1</option>
                                                  <option title="2">2</option>
                                                  <option title="3">3</option>
                                                  <option title="4">4</option>
                                            </select>
                                            </div>
                                        </fieldset>
                                        <input type="submit" value="Buy Now!" />
                                    </form>
                                    	
									
                                  	
                                    
                                    </div>
                                </div>
                                
                                <div class="separator"></div>
                                
                                
                                <div class="tabcontainer">
                                    <ul class="tabs">
                                        <li><a href="#tab0">More Info</a></li>
                                        <li><a href="#tab1">Data Sheet</a></li>
                                    </ul>
                                    <div class="tab-body">
                                        <div id="tab0" class="tab-content">
                                        <p>Ut ac tristique quam. Aenean tincidunt ipsum et magna consequat in auctor nisi molestie. Duis ornare, nibh quis accumsan ullamcorper, lacus lacus posuere purus, eget auctor velit velit sed arcu. Phasellus a gravida quam. Mauris tristique lectus metus. Aenean lorem leo, rhoncus eget varius a, adipiscing in turpis. Vivamus egestas euismod nisi ut bibendum. In faucibus, massa in porta venenatis, diam enim suscipit lorem, vitae ultrices urna turpis et lectus.</p> 

<p>Nullam tortor orci, tempus ut eleifend vestibulum, vulputate eu ante. Phasellus vestibulum, est et mollis hendrerit, elit diam fermentum leo, et ultrices quam est eget enim. In turpis nisi, rutrum lobortis auctor id, congue eget est. Phasellus semper mauris et odio volutpat placerat. In tellus diam, aliquam quis hendrerit nec, scelerisque sit amet urna. Donec nunc erat, luctus at mattis vel, rutrum ac nunc. Morbi pretium suscipit suscipit. Aliquam id mi tellus. Ut vitae dolor nunc. Donec ullamcorper dapibus ante eu hendrerit. Sed vitae felis in lacus iaculis fermentum. </p>
                                        </div>
                                        <div id="tab1" class="tab-content">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis feugiat rutrum luctus. Proin nisl augue, tempus quis lacinia at, ultrices eget sapien. Vestibulum at orci a eros molestie rutrum. Fusce interdum erat vel eros elementum vitae interdum massa varius. Morbi fermentum commodo nisi, id interdum mauris suscipit pellentesque. Morbi velit eros, accumsan ut faucibus at, viverra id mi. Nunc augue nisl, rutrum vitae luctus nec, lobortis sit amet diam. Proin porttitor semper sollicitudin. Donec mollis rhoncus turpis et rhoncus. In elit nisl, ultrices id mollis ut, dapibus eget nulla. Fusce laoreet neque ut purus faucibus ut condimentum purus condimentum. Vestibulum vel magna ligula, in tincidunt augue. Fusce sit amet neque ut neque vestibulum rhoncus in eu nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer interdum sapien facilisis odio fermentum tincidunt. Nullam a ante augue.</p>
                                        </div>

                                    </div>
                                </div>
                               
							</section>
                         
                        </div>
                    </section>
                    
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
                                        </ul>
                                    </li>
                                    <li><a href="#">Furniture (4)</a></li>
                                    <li><a href="#">Electronics (4)</a></li>
                                    <li><a href="#">Accessories (4)</a></li>
                                    <li><a href="#">Shoes (4)</a></li>
                                </ul>
                            </li>
                            <li class="widget-container">
                                <h2 class="widget-title">Special Offers</h2>
                                <ul class="sp-widget">
                                    <li>
                                        <img src="images/content/products/p-28.jpg" alt="" />
                                        <h3><a href="#">Woman's Couple Shoes</a></h3>
										<div class="price">$120.00</div>
                                    </li>
                                    <li>
                                        <img src="images/content/products/p-20.jpg" alt="" />
                                        <h3><a href="#">Modern Chair</a></h3>
                                        <div class="price">$120.00</div>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                        </div>
                        
                    </aside>
                    
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT -->
        
        <!-- FOOTER -->
        <footer id="footer">
            <div id="carousel"  class="es-carousel-wrapper">
                <div class="es-carousel">
                    <ul>
                        <li><a title="Audio Jungle"  href="#"><img alt="Audio Jungle" src="images/content/audiojungle.png"></a></li>
                        <li><a title="Active Den"  href="#"><img alt="Active Den" src="images/content/activeden.png"></a></li>
                        <li><a title="Graphic River"  href="#"><img alt="Graphic River" src="images/content/graphicriver.png"></a></li>
                        <li><a title="Photo Dune"  href="#"><img alt="Photo Dune" src="images/content/photodune.png"></a></li>
                        <li><a title="Theme Forest"  href="#"><img alt="Theme Forest" src="images/content/themeforest.png"></a></li>
                        <li><a title="Video Hive"  href="#"><img alt="Video Hive" src="images/content/videohive.png"></a></li>
                        <li><a title="Audio Jungle"  href="#"><img alt="Audio Jungle" src="images/content/audiojungle.png"></a></li>
                        <li><a title="Active Den"  href="#"><img alt="Active Den" src="images/content/activeden.png"></a></li>
                        <li><a title="Graphic River"  href="#"><img alt="Graphic River" src="images/content/graphicriver.png"></a></li>
                        <li><a title="Photo Dune"  href="#"><img alt="Photo Dune" src="images/content/photodune.png"></a></li>
                        <li><a title="Theme Forest"  href="#"><img alt="Theme Forest" src="images/content/themeforest.png"></a></li>
                        <li><a title="Video Hive"  href="#"><img alt="Video Hive" src="images/content/videohive.png"></a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <!-- FOOTER SIDEBAR -->
            <div id="outerfootersidebar">
                <div class="container">
                    <div id="footersidebar" class="row"> 

                        <div id="footcol1"  class="one_fifth columns">
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
                        <div id="footcol2"  class="one_fifth columns">
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
                        <div id="footcol3"  class="one_fifth columns">
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
                        <div id="footcol4"  class="one_fifth columns">
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
                        <div id="footcol5"  class="one_fifth columns">
                            <ul>
                                <li class="widget-container">
                                    <h2 class="widget-title">Contact Us</h2>
									<div class="textwidget">
                                        Telp: +62 500 800 123<br>
                                        Fax: +62 500 800 112<br>
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
            
            <!-- COPYRIGHT -->
            <div id="outercopyright">
                <div class="container">
                    <div id="copyright">
                    	Copyright &copy;2012. All Rights Reserved. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                    </div>
                    <ul class="sn">
                        <li><a href="http://twitter.com" title="Twitter"><span class="icon-img twitter"></span></a></li>
                        <li><a href="http://facebook.com" title="Facebook"><span class="icon-img facebook"></span></a></li>
                        <li><a href="https://plus.google.com" title="Google+"><span class="icon-img google"></span></a></li>
                        <li><a href="http://amazon.com" title="Amazon"><span class="icon-img amazon"></span></a></li>
                        <li><a href="http://pinterest.com" title="Pinterest"><span class="icon-img pinterest"></span></a></li>
                    </ul> 
                </div>
            </div>
            <!-- END COPYRIGHT -->
        </footer>
        <!-- END FOOTER -->
        <div class="clear"></div><!-- clear float --> 
	</div><!-- end outercontainer -->
</div><!-- end bodychild -->


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
		imageW 	: 135,
		margin      : 12
	});
</script>

<!-- jQuery PrettyPhoto -->
<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="js/fade.js"></script>
<script type="text/javascript" src="js/jquery-easing-1.3.js"></script>

<!-- jQuery Dropdown Mobile -->
<script type="text/javascript" src="js/tinynav.min.js"></script>

<!-- Custom Script -->
<script type="text/javascript" src="js/custom.js"></script>

<!-- jQuery Flexslider -->
<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
<script type="text/javascript">
jQuery(window).load(function() {
  // The slider being synced must be initialized first
  jQuery('#carouselslider').flexslider({
    animation: "slide",
    controlNav: false,
    animationLoop: false,
    slideshow: false,
    itemWidth: 60,
    itemMargin:0,
    asNavFor: '#imageitems'
  });
   
  jQuery('#imageitems').flexslider({
    animation: "fade",
	directionNav: false,
    controlNav: false,
    animationLoop: false,
    slideshow: false,
    sync: "#carouselslider"
  });
});

</script>	



</body>
</html>
