<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Single</title>
<link href="${pageContext.request.contextPath}/Comment/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.request.contextPath}/Comment/js/jquery-1.11.0.min.js"></script>
<link href="${pageContext.request.contextPath}/Comment/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Comment/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Comment/js/easing.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
<!-- //end-smoth-scrolling -->
<script>
$(function() {

	// grab the initial top offset of the navigation 
	var sticky_navigation_offset_top = $('#sticky_navigation').offset().top;
	
	// our function that decides weather the navigation bar should have "fixed" css position or not.
	var sticky_navigation = function(){
		var scroll_top = $(window).scrollTop(); // our current vertical position from the top
		
		// if we've scrolled more than the navigation, change its position to fixed to stick to top, otherwise change it back to relative
		if (scroll_top > sticky_navigation_offset_top) { 
			$('#sticky_navigation').css({ 'position': 'fixed', 'top':0, 'left':0 });
		} else {
			$('#sticky_navigation').css({ 'position': 'relative' }); 
		}   
	};
	
	// run our function on load
	sticky_navigation();
	
	// and run it again every time you scroll
	$(window).scroll(function() {
		 sticky_navigation();
	});
	
	// NOT required:
	// for this demo disable all links that point to "#"
	$('a[href="#"]').click(function(event){ 
		event.preventDefault(); 
	});
	
});
</script>
</head>
<body>
<!--header-strip start here-->
<div id="sticky_navigation_wrapper">
	<div id="sticky_navigation">
<jsp:include page="${pageContext.request.contextPath}/Comment/endHead.jsp" />
</div>
</div>
<section id="main">
<!--header strip end here-->

<div class="single">
	<div class="container">
		<div class="single-main">
			<div class="col-md-8 single-top">
				<div class="col-md-5 sing-slid-grid">		
			        <div class="flexslider">
					  <ul class="slides">
						  <li data-thumb="images/si1.jpg">
							  <div class="thumb-image"> <img src="${pageContext.request.contextPath}/<s:property value="commod.pic" />" /> </div>
						  </li>
					  </ul>
			      </div>
		        </div>	
	            <div class="col-md-7 information">
						<h3>$95.00</h3>
						<h4>ourplane is something Unbelievable.</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta.</p>
				        <a href="#">MORE DETAILS</a><br>
                       <h5>Also Share on</h5>
                       <span class="fa"> </span>
                       <span class="tw"> </span>
                       <span class="g"> </span>
				</div>
			  <div class="clearfix"> </div>
			 </div>
		  <div class="clearfix"> </div>
		  <div class="single-bottom">
		  	  <h5>Related places</h5>
		  	<div class="col-md-4 single-grid">
		  		<a href="single.jsp"><img src="images/s.jpg" alt="" class="img-responsive"></a>
		  	  <div class="single-bottom-grid">
		  	  	<h3>120.00 <sub>$</sub> </h3>
		  	  	<p>Our plane is something Unbelievable</p>
		  	  </div>
		  	</div>
		  	<div class="col-md-4 single-grid">
		  		<a href="single.jsp"><img src="images/s1.jpg" alt=""  class="img-responsive"></a>
		  	  <div class="single-bottom-grid">
		  	  	<h3>100.00 <sub>$</sub> </h3>
		  	  	<p>Our plane is something Unbelievable</p>
		  	  </div>
		  	</div>
		  	<div class="col-md-4 single-grid">
		  		<a href="single.jsp"><img src="images/s2.jpg" alt=""  class="img-responsive"></a>
		  	  <div class="single-bottom-grid">
		  	  	<h3>120.00 <sub>$</sub> </h3>
		  	  	<p>Our plane is something Unbelievable</p>
		  	  </div>
		  	</div>
		   <div class="clearfix"> </div>
		  </div>
		</div>
	</div>
</div>
<!--single page end here-->

<!--single page end here-->
<!--footer start here-->
<div class="footer">
	<div class="container">
		<div class="footer-main">
			<div class="col-md-6 footer-left">
			<h2><a href="commonPage.jsp">Jaunt</a></h2>
			</div>
			<div class="col-md-6 footer-right">
				<p class="footer-class">Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			</div>
		  <div class="clearfix"> </div>
		</div>
		<script type="text/javascript">
										$(document).ready(function() {
											/*
											var defaults = {
									  			containerID: 'toTop', // fading element id
												containerHoverID: 'toTopHover', // fading element hover id
												scrollSpeed: 1200,
												easingType: 'linear' 
									 		};
											*/
											
											$().UItoTop({ easingType: 'easeOutQuart' });
											
										});
									</script>
						<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	</div>
</div>
</section>
<!--footer end here--> 
<!-- slide -->
<script src="js/imagezoom.js"></script>
<!-- FlexSlider -->
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>

</body>
</html>