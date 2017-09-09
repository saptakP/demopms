<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<link
	href="<spring:url value="/static/admin/bootstrap/css/font-awesome.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="<spring:url value="/static/admin/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet" type="text/css">
<link href="<spring:url value="/static/admin/css/custom.css"/>"
	rel="stylesheet" type="text/css">

<title>DemoWeb</title>

</head>


<body class="">

	<div class="page-wrapper">

		<header class="header">
			<div class="header-wrapper">
				<div class="container">
					<div class="header-inner">
						<div class="header-logo">
							<a href="/damweb"> <span>DamWeb</span>
							</a>
						</div>
						<!-- /.header-logo -->

						<div class="header-content">
							<div class="header-top">
								<ul class="header-nav-secondary nav nav-pills">
									<c:choose>
										<c:when test="${sessionScope.userBean.username != null && sessionScope.userBean.username != ''}">
											<li>Welcome ${sessionScope.userBean.username}</li>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<!-- /.header-top -->

							<div class="header-bottom">
								<!-- /.header-action -->

								<ul
									class="header-nav-primary nav nav-pills collapse navbar-collapse">

									<li><a
										href="">Admin -- ${sessionScope.userbean.userName}
											<i class="fa fa-chevron-down"></i>
									</a>

										<ul class="sub-menu">
											<li><a
												href="">Dashboard</a></li>
										</ul></li>

									<c:choose>
										<c:when
											test="${sessionScope.userbean.userName == null or sessionScope.userbean.userName == ''}">
											<li><a href="<spring:url value="prelogin"/>">Login</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="<spring:url value="logout"/>">Logout</a></li>
										</c:otherwise>
									</c:choose>
								</ul>

								<button class="navbar-toggle collapsed" type="button"
									data-toggle="collapse" data-target=".header-nav-primary">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>

							</div>
							<!-- /.header-bottom -->
						</div>
						<!-- /.header-content -->
					</div>
					<!-- /.header-inner -->
				</div>
				<!-- /.container -->
			</div>
			<!-- /.header-wrapper -->
		</header>
		<!-- /.header -->




		<div class="main">
			<div class="main-inner">
				<div class="container">
					<div class="content">
						<div class="document-title"></div>
						<!-- /.page-title -->
						<div class="cards-row">
							<c:forEach items="${HOTELS}" var="hotel">
								<div class="card-row">
									<div class="card-row-inner">
										<c:set var="imgUrl" value="${hotel.thumbImglink}"></c:set>
										<div class="card-row-image" data-background-image="${imgUrl}"
											style="background-image: url(&quot;${imgUrl}&quot;);">
											<div class="card-row-label">
												<a href="">Vacation</a>
											</div>
											<!-- /.card-row-label -->

											<div class="card-row-price">$100 / night</div>
											<!-- -->

										</div>
										<!-- /.card-row-image -->

										<div class="card-row-body">
											<h2 class="card-row-title">
												<a href="">${hotel.hotelName}</a>
											</h2>
											<div class="card-row-content">
												<p>${hotel.shortDesc}
												</p>
											</div>
											<div class="card-row-content">
												<div style="float: left;">
													<form id="details_${hotel.hotelCode}"
														name="details_${hotel.hotelCode}" method="get"
														action="getHotelDetails">
														<input type="hidden" id="hotelCode" name="hotelCode"
															value="${hotel.hotelCode}" />
														<button type="submit" class="btn btn-primary btn-flat">View
															Details</button>
													</form>
												</div>
												<div style="margin-left: 5px; float: left;">
													<form id="review_${hotel.hotelCode}"
														name="review_${hotel.hotelCode}" method="post"
														action="getHotelReviewPage">
														<input type="hidden" id="hotelCode" name="hotelCode"
															value="${hotel.hotelId}" />
														<button class="btn btn-primary btn-block" type="submit">
															<i class="fa fa-star"></i>Submit Review
														</button>
													</form>
												</div>
											</div>
											<!-- /.card-row-content -->
										</div>
										<!-- /.card-row-body -->

										<div class="card-row-properties">
											<dl>
												<dd>Price</dd>
												<dt>$100 / night</dt>

												<dd>Category</dd>
												<dt>Vacation</dt>

												<dd>Location</dd>
												<dt>${hotel.hotelAddress}</dt>

												<dd>Rating</dd>
												<dt>
													<div class="card-row-rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i>
													</div>
													<!-- /.card-row-rating -->
												</dt>
												<dd>&nbsp;&nbsp;&nbsp;&nbsp;</dd>
												<dt>
													<div style="margin-left: 5px; float: right;">
														<form id="book_${hotel.hotelCode}"
															name="book_${hotel.hotelCode}" method="post"
															action="getPaymentOptions">
															<input type="hidden" id="hotelCode" name="hotelCode"
																value="${hotel.hotelId}" />
															<button type="submit" class="btn btn-primary btn-book">Book
																Now</button>
														</form>
													</div>
												</dt>
											</dl>
										</div>
										<!-- /.card-row-properties -->
									</div>
									<!-- /.card-row-inner -->
								</div>
							</c:forEach>

						</div>
						<!-- /.cards-row -->


					</div>
					<!-- /.content -->
				</div>
				<!-- /.container -->
			</div>
			<!-- /.main-inner -->
		</div>
		<!-- /.main -->

		<footer class="footer">

			<div class="footer-bottom">
				<div class="container">
					<div class="footer-bottom-left">
						© 2017 All rights reserved. Created by <a href="#">MindBenders</a>.
					</div>
					<!-- /.footer-bottom-left -->

					<div class="footer-bottom-right"></div>
					<!-- /.footer-bottom-right -->
				</div>
				<!-- /.container -->
			</div>
		</footer>
		<!-- /.footer -->

	</div>
	<!-- /.page-wrapper -->

	<script
		src="<spring:url value="/static/admin/plugins/jQuery/jQuery-2.1.4.min.js"/>"
		type="text/javascript"></script>
	<script
		src="<spring:url value="/static/admin/bootstrap/js/bootstrap.min.js"/>"
		type="text/javascript"></script>

	<div id="cboxOverlay" style="display: none;"></div>
	<div id="colorbox" class="" role="dialog" tabindex="-1"
		style="display: none;">
		<div id="cboxWrapper">
			<div>
				<div id="cboxTopLeft" style="float: left;"></div>
				<div id="cboxTopCenter" style="float: left;"></div>
				<div id="cboxTopRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxMiddleLeft" style="float: left;"></div>
				<div id="cboxContent" style="float: left;">
					<div id="cboxTitle" style="float: left;"></div>
					<div id="cboxCurrent" style="float: left;"></div>
					<button type="button" id="cboxPrevious"></button>
					<button type="button" id="cboxNext"></button>
					<button id="cboxSlideshow"></button>
					<div id="cboxLoadingOverlay" style="float: left;"></div>
					<div id="cboxLoadingGraphic" style="float: left;"></div>
				</div>
				<div id="cboxMiddleRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxBottomLeft" style="float: left;"></div>
				<div id="cboxBottomCenter" style="float: left;"></div>
				<div id="cboxBottomRight" style="float: left;"></div>
			</div>
		</div>
		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none; max-width: none;"></div>
	</div>
</body>
</html>