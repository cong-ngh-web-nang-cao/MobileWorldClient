<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Trang chủ Mobile World</title>

<link rel="icon" href="img/icon-mobile.png" type="image/gif" > 

<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css"/>
<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css"/>

<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css"/>

</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<jsp:include page="Panel.jsp"></jsp:include>
	
	<jsp:include page="SanPhamMoi.jsp"></jsp:include>
	
	<jsp:include page="SanPhamHot.jsp"></jsp:include>
	
	<jsp:include page="Section4.jsp"></jsp:include>
	
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>