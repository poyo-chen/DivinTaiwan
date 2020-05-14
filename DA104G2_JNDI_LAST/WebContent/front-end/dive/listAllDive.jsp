<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dive.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    DiveService divSvc = new DiveService();
    List<DiveVO> list = divSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<link href="<%= request.getContextPath()%>/images/twdivers.png" rel="icon">
<title>���I�T��</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>�����m�߱ĥ� EL ���g�k����:</h4>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�W��</th>
		<th>�y�z</th>
		<th>�Ϥ�</th>
		<th>���A</th>
		<th>�n��</th>
		<th>�g��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="diveVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${diveVO.dive_name}</td>
			<td>${diveVO.dive_des}</td>
			<td>${diveVO.dive_img}</td>
			<td>${diveVO.dive_status}</td>
			<td>${diveVO.dive_lat}</td>
			<td>${diveVO.dive_lang}</td> 

			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dive/DiveServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="���I����">
			     <input type="hidden" name="dive_no"  value="${diveVO.dive_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>