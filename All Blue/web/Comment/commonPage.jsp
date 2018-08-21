<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Home</title>
<link href="${pageContext.request.contextPath}/Comment/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/Comment/js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/Comment/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${pageContext.request.contextPath}/Comment/css/hover.css" rel="stylesheet" media="all">
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Hind:400,300,500,600,700' rel='stylesheet' type='text/css'>
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
<script src="${pageContext.request.contextPath}/Comment/js/modernizr.custom.js"></script>
<!--banner Slider starts Here-->
	  			<script src="${pageContext.request.contextPath}/Comment/js/responsiveslides.min.js"></script>
			 <script>
			    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 4
			      $("#slider4").responsiveSlides({
			        auto:false,
			        pager: true,
			        nav: true,
			        speed: 500,
			        namespace: "callbacks",
			        before: function () {
			          $('.events').append("<li>before event fired.</li>");
			        },
			        after: function () {
			          $('.events').append("<li>after event fired.</li>");
			        }
			      });
                    loadPic();
			    });
                function loadPic() {
                    var Url = "${pageContext.request.contextPath}/goods_hotGoods.action?time=new Date()";
                    $.getJSON(Url,function (data) {
                        var imgss = '';
                        for (var i=0;i<data.pic.length;i++){
                            imgss += '<div class="showGood"><a href="${pageContext.request.contextPath}/goods_commodMessage.action?id='+data.commodId[i]+'"><img src="${pageContext.request.contextPath}/'+data.pic[i]+'" class="hotPic"></img></a><div class="bottomDiv"><span>'+data.commonName[i]+'<span></div></div>';
                        }
                        $(".showGoodWrap").append(imgss);
                    })
                }
			  </script>
			<!--//End-slider-script-->
<!--strikty navgation script start here-->
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

    loadType();
    loadGoods(1);
    setTimeout(function () {
        $(".typeName:eq("+0+")").addClass("selectName");
    },300)
	
});
function loadType() {

    var Url = "${pageContext.request.contextPath}/goods_goodTypeList.action?time=new Date()";
    $.getJSON(Url,function (data) {
        var html = '';
        html += '<ul class="List">';
        for (var i=0;i<data.typeId.length;i++){
            html += '<div class="imgWrap"><span class="spanShowType"><li id="'+data.typeId[i]+'" class="typeName" onclick="loadGoods('+data.typeId[i]+')">'+data.typeName[i]+'</li></span></div>';
        }
        html += '</ul>';
        $(".goodTypeList").append(html);
    })
}


//展现商品
function loadGoods(id) {
    $(".selectName").removeClass("selectName");

    var Url = "${pageContext.request.contextPath}/goods_goodList.action?time=new Date()&id="+id;
    $.getJSON(Url,function (data) {
        console.log(data)
        var html = '';
        $(".goodTypePic").empty();
        var big = 4;
        if (data.commodId.length<big){
            big = data.commodId.length;
		}
        for (var i=0;i<big;i++){
            html += '<div class="goodImgDiv"><a href="${pageContext.request.contextPath}/goods_commodMessage.action?id='+data.commodId[i]+'"><img class="goodImg" src="${pageContext.request.contextPath}/'+data.commodPic[i]+'"></img><div class="bottomDivT"><span>'+data.commodName[i]+'</span></div></a></div>';
        }
        html += '<a class="more" href="${pageContext.request.contextPath}/goods_showCommod.action?id='+id+'">更多>></a>'
        $(".goodTypePic").append(html);
    })
    $(".typeName:eq("+(id-1)+")").addClass("selectName");

}
</script>
<!--sticky navgation script end here-->
</head>
<style>

	.showGoodWrap{
		height: 240px;
		width: 1200px;
		position: relative;
		margin: 0 auto;
		text-align: center;
	}
	.showGood{
		height: 240px;
		width:250px;
		margin-right: 50px;
		margin-left: 50px;
		display: inline-block;
	}
	.hotPic{
		height:200px;
		width:250px;
	}
	.showGood:hover{
		box-shadow: 1px 1px 2px black;
		transition: all 0.3s;
	}
	a{
		text-decoration: none;
	}
	a:hover{
		text-decoration: underline;
	}
	.bottomDiv{
		display: inline-block;
		height: 40px;
		width: 250px;
		background: #3E8FBA;
		color: white;
		font-size: 20px;
		line-height: 40px;
	}
	.goodTypePic{
		height: 200px;
		width: 1200px;
		margin-top: 10px;
	}
	.goodType{
		text-align: left;
	}
	.goodsList{
		height: 300px;
		width: 1200px;
		position: relative;
		margin: 30px auto 0;
		text-align: center;
	}
	.selectName{
		background: blue;
		color: white;
	}
	.List{
		list-style-type:none;
		margin-left: 100px;
	}
	.typeName{
		height: 30px;
		width: 60px;
		text-align: center;
		line-height: 30px;
		margin-right:12px ;
		display: inline-block;
	}
	.imgWrap{
		display: inline-block;

	}
	.spanShowType{
		cursor: pointer;
	}
	.goodImgDiv{
		height: 200px;
		width: 180px;
		margin-left: 100px;
		text-align: center;
		display: inline-block;
	}
	.goodImg{
		height: 180px;
		width: 180px;
	}
	.goodImgDiv:hover{
		transform: scale(1.1);
		transition: all 0.5s;
	}
	.more{
		margin-left: 30px;
	}
	.bottomDivT{
		display: inline-block;
		height: 40px;
		width: 180px;
		background: #3E8FBA;
		color: white;
		font-size: 20px;
		line-height: 40px;
	}
</style>
<body>
<!--header banner start here-->
<!-- Slideshow 4 -->
<div id="demo_top_wrapper">
<!--banner Slider Ends Here-->
<!--header banner end sss here-->
<!--header strip start here-->
<div id="sticky_navigation_wrapper">
	<div id="sticky_navigation">
<jsp:include page="${pageContext.request.contextPath}/Comment/endHead.jsp" />
</div>
</div>
</div>
<section id="main">
<!--header strip end here-->
<!--contant start here-->
<div class="contant">
	<div class="container">
		<div class="contant-main">
			  <div class="col-md-4 content-grid-1 bg-one">
			  	<div class="content-grid-text">
			  		<h3>Trendy Hotels</h3>
			  		<p> when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic </p>
			  		 <div class=" ser-grid">	
		   				<a href="#" class="hi-icon hi-icon-archive glyphicon glyphicon-home"> </a>
		   			  </div>
			  		<div class="contant-bwn">
			  			<a href="single.jsp" class="button push">View</a>
			  		</div>
			  	</div> 
			  </div>
			  <div class="col-md-4 content-grid-1 bg-two">
			  	<div class="content-grid-text">
			  		<h3>Flight Booking</h3>
			  		<p> when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the  leap into electronic </p>
			  		<div class=" ser-grid">	
		   				<a href="#" class="hi-icon hi-icon-archive glyphicon glyphicon-plane"> </a>
		   			  </div>
			  		<div class="contant-bwn">
			  			<a href="single.jsp" class="button push">View</a>
			  		</div>
			  	</div>
			  </div>
			  <div class="col-md-4 content-grid-3 bg-three">
			  	<div class="content-grid-text">
			  		<h3>Customer Support</h3>
			  		<p> when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the  leap into electronic </p>
			  		<div class=" ser-grid">	
		   				<a href="#" class="hi-icon hi-icon-archive glyphicon glyphicon-cutlery"> </a>
		   			  </div>
			  		<div class="contant-bwn">
			  			<a href="single.jsp" class="button push">View</a>
			  		</div>
			  	</div>	  	
			  </div>
			<div class="clearfix"> </div>
			</div>
		</div>
</div>
<!--contact end here-->
<script>
		$(document).ready(function () {
		    size_li = $("#myList li").size();
		    x=2;
		    $('#myList li:lt('+x+')').show();
		    $('#loadMore').click(function () {
		        x= (x+1 <= size_li) ? x+1 : size_li;
		        $('#myList li:lt('+x+')').show();
		    });
		    $('#showLess').click(function () {
		        x=(x-1<0) ? 1 : x-1;
		        $('#myList li').not(':lt('+x+')').hide();
		    });
		});
	</script>

<!--feature grid start here-->
<div class="feature-grid">
	<div class="container">
		<div class="feature-grid-main">
			<h5>热门商品区</h5>
		      <div class="load_more">	
					 <ul id="myList">
					    <!-- These are our grid blocks -->
					<li>
						<div class="showGoodWrap">

						</div>
				    </li>
					<li>

				</li>

				<div class="clearfix"> </div>
			</ul>
				  <br /><br />
				  <%--商品分类--%>
				  <h5>商品分类区</h5>
				  <div class="goodType">
					  <ul class="goodTypeList"></ul>
					  <div class="goodTypePic">
					  </div>
				  </div>
		</div>
	</div>
</div>
</div>
<!--feature grid end here-->
<!--map start here-->

<!--map end here-->
<!--footer start here-->
<div class="footer">
	<div class="container">
		<div class="footer-main">
			<div class="col-md-6 footer-left">
			<h2><a href="commonPage.jsp">Jaunt</a></h2>
			</div>
		  <div class="clearfix"></div>
		</div>
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
</section>
<!--footer end here--> 
</body>
</html>

