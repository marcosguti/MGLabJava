
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!-- Website Template by freewebsitetemplates.com -->
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet">
    </head>
    <body>
        <div id="header">
		<a href="index.html" class="logo"><img src="images/logo.png" alt=""></a>
		<ul>
			<li class="selected">
				<a href="index.html">home</a>
			</li>
			<li>
				<a href="about.html">about</a>
			</li>
			<li>
				<a href="services.html">services</a>
			</li>
			<li>
				<a href="location.html">our locations</a>
			</li>
			<li>
				<a href="contact.html">contact</a>
			</li>
			<li>
				<a href="blog.html">blog</a>
			</li>
		</ul>
	</div>
	<div id="section">
		<div>
			<div>
				<h1>accurate.reliable.fast</h1>
				<p>
					When it comes to finding answers to questions and getting results. Illumelabs is number one. No other diagnostic laboratory is faster, more reliable and accurate. Choose Illumelabs.
				</p>
			</div>
		</div>
	</div>
	<div id="featured">
		<div>
			<div class="article">
				<h2>Welcome to Illumelabs Diagnostic Center</h2>
				<img src="images/diagnostic-center.jpg" alt="">
				<p>
					This website template hahs been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text.
				</p>
				<p>
					You can remove any link to our website from this website template, you're free to use this website template without linking back to us.
				</p>
				<p>
					f you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forums/">Forums</a>.
				</p>
			</div>
			<ul>
				<li>
					<h3>hematology</h3>
					<div>
						<p>
							Blood extraction using seismic energy for painless testing.
						</p>
						<a href="blog.html" class="more">read more</a>
					</div>
					<img src="images/hematology.jpg" alt="">
				</li>
				<li>
					<h3>urine &amp; drug testing</h3>
					<div>
						<p>
							Accurate and secure testing of urine for diseases and drugs and medicines.
						</p>
						<a href="blog.html" class="more">read more</a>
					</div>
					<img src="images/urine-and-drug-testing.jpg" alt="">
				</li>
				<li>
					<h3>x-ray</h3>
					<div>
						<p>
							Fast and clear x-ray results. You’ll be assisted by our friendly staff all the way.
						</p>
						<a href="blog.html" class="more">read more</a>
					</div>
					<img src="images/x-ray.jpg" alt="">
				</li>
				<li>
					<h3>pathology and dna</h3>
					<div>
						<p>
							State of the art testing for DNA that’s sure to be have fast and accurate results.
						</p>
						<a href="blog.html" class="more">read more</a>
					</div>
					<img src="images/pathology-and-dna.jpg" alt="">
				</li>
			</ul>
		</div>
	</div>
	<div id="footer">
		<div>
			<p>
				<span>2023 &copy; Illumelabs Diagnostic Center.</span><a href="#" >Terms of Service</a> | <a href="#" >Privacy Policy</a>
			</p>
			<ul>
				<li id="facebook">
					<a href="http://freewebsitetemplates.com/go/facebook/">facebook</a>
				</li>
				<li id="twitter">
					<a href="http://freewebsitetemplates.com/go/twitter/">twitter</a>
				</li>
				<li id="googleplus">
					<a href="http://freewebsitetemplates.com/go/googleplus/">googleplus</a>
				</li>
				<li id="rss">
					<a href="#" >rss</a>
				</li>
			</ul>
		</div>
	</div>
        
     <form action="/Laboratorio/somepage" method="POST">
        <input type="text" name="id" value=""/>
        <!--<input type="text" name="cedula" value=""/>-->
        <input type="submit"/>
    </form>
</body>
</html>