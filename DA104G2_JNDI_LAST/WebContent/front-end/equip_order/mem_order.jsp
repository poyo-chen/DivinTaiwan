<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.mem.model.MemVO"%>
<%@page import="com.equip_order.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	EquipOrderService equipOrderSvc = new EquipOrderService();
	List<EquipOrderVO> list = equipOrderSvc.getMem(memVO.getMem_no());
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<link href="<%= request.getContextPath()%>/images/twdivers.png" rel="icon">
<title>會員訂單</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<style>
	table, th, td {
    	border: 1px solid #CCCCFF;
	}
	th, td {
    	padding: 5px;
    	text-align: center;
	}
	body {
		font-family: "Microsoft JhengHei UI";
		font-size: 20px;
		font-weight: bold;
	}
	.table {
		width: 1000px;
		margin:5px auto;
		background-color: white;
	}
	.table tbody tr th {
		line-height: 50px;
	}
	.table tbody tr td {
		line-height: 50px;
	}
	#title{
		text-align: center;
		font-size: 35px;
		color:darkblue;
		margin-bottom:30px;
	}
	#homeImg{
		margin-top:10px;
		margin-left:10px;	
	}
</style>

</head>
<body>

<div id="homeImg">
<%-- 	<a href="<%=request.getContextPath()%>/front-end/member/memDetail.jsp"> --%>
<%-- 	<img src="<%=request.getContextPath()%>/images/home.png" width="100" height="100"></a> --%>
	<font color="blue">${memVO.mem_name}</font>您好，您的購買紀錄如下
</div>

<div id="title">訂單</div>

<div class="container-fluid">
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th scope="col">訂單編號</th>
			<th scope="col">收件人姓名</th>
			<th scope="col">收件人電話</th>
			<th scope="col">收件人地址</th>
			<th scope="col">總金額</th>
			<th scope="col">訂單時間</th>
			<th scope="col">備註</th>
			<th scope="col">處理狀態</th>
			<th scope="col">出貨日期</th>
			<th scope="col"></th>	
			
		</tr>
	</thead>
	<c:forEach var="equiporderVO" items="${list}">
	<tbody>
		<tr>
			<td scope="row">${equiporderVO.equip_order_no}</td>
			<td>${equiporderVO.cus_name}</td>
			<td>${equiporderVO.cus_tel}</td>
			<td>${equiporderVO.cus_add}</td>
			<td>$${equiporderVO.equip_order_price}</td>
			<td><fmt:formatDate value="${equiporderVO.equip_order_time}" pattern="yyyy-MM-dd HH:mm"/></td>
			<td>${equiporderVO.equip_note}</td>
			<td>
				<c:if test="${equiporderVO.equip_order_status == 1}">
					<font color="blue">處理完成</font>
				</c:if>
				<c:if test="${equiporderVO.equip_order_status == 0}">
					<font color="red">處理中</font>
				</c:if>
			</td>
			<td>${equiporderVO.equip_shipping_date}</td>
			<td>
				<FORM method="post" action="<%=request.getContextPath()%>/odlist/equip_odlist.do">
					<button type="submit" class="btn btn-success">查看明細</button>
					<input type="hidden" name="equip_order_no" value="${equiporderVO.equip_order_no}">
			     	<input type="hidden" name="action" value="getOneOdlist_front">
				</FORM>
			</td>	
		</tr>
	</tbody>
	</c:forEach>
</table>
</div>

<%if (request.getAttribute("equiporderVO")!=null){%>
	<jsp:include page="/front-end/equip_odlist/mem_odlist.jsp" />
<%} %>



</body>
</html>