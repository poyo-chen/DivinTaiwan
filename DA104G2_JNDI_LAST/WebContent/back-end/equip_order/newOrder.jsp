<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.equip_order.model.*"%>

<%
	EquipOrderService equipOrderSvc = new EquipOrderService();
	List<EquipOrderVO> list = equipOrderSvc.getOrderStatus(0);
	pageContext.setAttribute("list", list);
%>
<!doctype html>
<html lang="en">

<head>
<link href="<%= request.getContextPath()%>/images/twdivers.png" rel="icon">
<title>潛進台灣 GO !</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/manage/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/manage/css/manage.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+TC:700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/43de8a2881.js"
	crossorigin="anonymous"></script>

<!---------------背景css(可以換成自己的)---------------------->
<style type="text/css">
body {
/* 	width: 2000px; */
	background-image: url("<%=request.getContextPath()%>/images/memBg.png");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

#bgimg {
	background: rgb(255, 255, 255, 0.8);
}

/* #nav { */
/* 	opacity: 0.8; */
/* } */

#n_img {
	height: 70px;
	width: 70px;
/* 	border-radius: 50%; */
}

.navbar-nav .nav-item .nav-link {
	font-size: 26px;
	font-weight: bold;
	font-family: "Microsoft JhengHei UI";
}


	table, th, td {
	    border: 1px solid #CCCCFF;
	}
	th, td {
	    padding: 5px;
	    text-align: center;
	}
	body{
		font-family: "Microsoft JhengHei UI";
		font-size: 17px;
		font-weight: bold;
	}
	.table{
 		width: 1350px; 
		margin:10px auto;
	}
	.table td{
		vertical-align:middle !important;
	}
	.table tbody tr th{
		line-height: 50px;
	}
	.table tbody tr td{
		line-height: 50px;
	}
	#title{
		text-align: center;
		font-size: 35px;
		color:darkblue;
		margin-bottom:10px;
	}
	.headPosition{
		margin-left:20px;
		margin-bottom:20px;
	}
	.pagePosition{
		text-align: center;
		margin:10px auto;
	}

</style>
</head>
<!--------------------------以上--------------------------------->
<body>
	<jsp:include page="/back-end/manage/admNav.jsp" />
	<!-----------------------------------------此區塊放自己的資料----------------------------------------------------->
	<div id="title">審核訂單</div>
	
	<div class="headPosition"><%@ include file="page1.file"%></div>
	<div class="container-fluid">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">訂單編號</th>
					<th scope="col">會員編號</th>
					<th scope="col">收件人姓名</th>
					<th scope="col">收件人電話</th>
					<th scope="col">收件人地址</th>
					<th scope="col">總金額</th>
					<th scope="col">訂單時間</th>
					<th scope="col">備註</th>
					<th scope="col">處理狀態</th>
					<th scope="col"></th>
				</tr>
			</thead>

			<c:forEach var="equiporderVO" items="${list}" begin="<%=pageIndex%>"
				end="<%=pageIndex+rowsPerPage-1%>">
				<tbody>
					<tr>
						<th scope="row">${equiporderVO.equip_order_no}</th>
						<td>${equiporderVO.mem_no}</td>
						<td>${equiporderVO.cus_name}</td>
						<td>0${equiporderVO.cus_tel}</td>
						<td>${equiporderVO.cus_add}</td>
						<td>${equiporderVO.equip_order_price}</td>
						<td><fmt:formatDate value="${equiporderVO.equip_order_time}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td>${equiporderVO.equip_note}</td>
						<td>
							<FORM method="post"
								action="<%=request.getContextPath()%>/order/equip_order.do">
								<select name="equip_order_status">
									<option value="0">處理中</option>
									<option value="1">處理完成</option>
								</select>
								<button type="submit" class="btn btn-success">修改</button>
								<input type="hidden" name="equip_order_no"
									value="${equiporderVO.equip_order_no}"> <input
									type="hidden" name="action" value="update">
							</FORM>
						</td>
						<td>
							<FORM method="post"
								action="<%=request.getContextPath()%>/odlist/equip_odlist.do">
								<button type="submit" class="btn btn-success">訂單明細</button>
								<input type="hidden" name="equip_order_no"
									value="${equiporderVO.equip_order_no}"> <input
									type="hidden" name="action" value="getOneOdlist">
							</FORM>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<div class="container-fluid">
		<div class="row">
			<div class="pagePosition"><%@ include file="page2.file"%></div>
		</div>
		</div>
	
	
	</div>
	

	
	
	
	</div>
	</div>
	</div>
	<!----------------------------------------------以上-------------------------------------------------------------->
	
	<footer class="text-center text-secondary">
		&copy; DA104G2 GO ! <span id="year"></span>
	</footer>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="<%=request.getContextPath()%>/back-end/manage/js/poper.js"></script>
	<script
		src="<%=request.getContextPath()%>/back-end/manage/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/back-end/manage/js/manager.js"></script>
	</div>

</body>
</html>