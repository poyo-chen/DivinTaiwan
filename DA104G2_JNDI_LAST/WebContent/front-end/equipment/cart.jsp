<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.equipment.model.*"%>
<%@ page import="com.equip_odlist.model.*"%>
<%@ page import="java.util.*"%>

<%
	Vector<EquipOdlistVO> buylist = (Vector<EquipOdlistVO>) session.getAttribute("shoppingcart");
	pageContext.setAttribute("buylist",buylist);
	String amount = (String) session.getAttribute("amount");
%>

<!DOCTYPE html>
<html>
<head>
<link href="<%= request.getContextPath()%>/images/twdivers.png" rel="icon">
<title>購物車 - cart.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dive.css">
<!-- dive.css -->
<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/dive.css">
<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/album.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>


<style type="text/css">

	body{
		background-color: #bae9ff;
		font-family: "Microsoft JhengHei UI";
		font-size: 25px;
		font-weight: bold;
	}
	.grp {
		color: black;
	}
	table, th, td {
	    border: 1px solid #CCCCFF;
	}
	th, td {
	    padding: 5px;
	    text-align: center;
	}
	.table{
		width: 1000px;
		margin: 10px auto;
		background-color: white;
	}
	.table tbody tr th{
		line-height: 80px;
	}
	.table tbody tr td{
		line-height: 80px;
	}
	.endBtn{
	    text-align: center;
		margin: 20px auto;
	}
	.empty{
		text-align: center;
	}
	.total{
		text-align: center;
		margin: 40px auto;
	}
	#buy_amt {
	  width: 40px;
	  height: 35px;
	  text-align: center;
	  border: 0;
	  border-top: 1px solid #aaa;
	  border-bottom: 1px solid #aaa;
	  border-left: 1px solid #aaa;
	  border-right	: 1px solid #aaa;
	}
	.min{
		width: 35px;
		height: 35px;
		text-align: center;
	}
	.add{
		width: 35px;
		height: 35px;
		text-align: center;
	}
</style>

</head>
<body>
	<!-- navigation bar -->
	<nav class="navbar navbar-expand-lg fixed-top" id="nav">
		<a href="<%=request.getContextPath()%>/index.jsp"><img
			src="<%=request.getContextPath()%>/images/twdivers-light.png"
			id="n_img" class="navbar-brand"></a>
		<button class="navbar-toggler navbar-light" type="button"
			data-toggle="collapse" data-target="#navbarNav"
			aria-controls="navbarNav" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/front-end/group/listAllGroup.jsp">潛點揪團</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/front-end/travel-page/travel.jsp">行程</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/front-end/equipment/equip_shop.jsp">裝備</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/front-end/album/albumList.jsp">相簿</a></li>
			</ul>
			<c:choose>
				<c:when
					test="${not empty sessionScope.account && memVO.mem_type == 0}">
					<c:choose>
						<c:when test="${memVO.mem_img!=null}">
							<a class="user_name"
								href="<%=request.getContextPath()%>/front-end/memberCenter/memDetail.jsp">
								<span>
										<img alt=""
										src="<%=request.getContextPath()%>/ShowPic_V1?mem_no=${memVO.mem_no}"
										style="border-radius:50%;" width='40px' height='40px'>
								</span>
								<span>${memVO.mem_name}</span>
							</a>
						</c:when>
						<c:otherwise>
							<a class="user_name"
								href="<%=request.getContextPath()%>/front-end/memberCenter/memDetail.jsp"><span>
									<img alt=""
									src="<%=request.getContextPath()%>/images/mem_pic.png"
									style="border-radius:50%;" width='40px' height='40px'>
							</span>
							<span>${memVO.mem_name}</span>
							</a>
						</c:otherwise>
					</c:choose>
					<a
						href="<%=request.getContextPath()%>/member/MemberServlet.do?action=logout"><button
							type="button" class="btn" id="btn_out" data-toggle="modal"
							data-target="#exampleModalCenter">登出</button></a>
				</c:when>
				<c:when
					test="${not empty sessionScope.account && memVO.mem_type == 1}">
					<a class="user_name"
						href="<%=request.getContextPath()%>/front-end/store/store.jsp"><span><img
							alt="" src="<%=request.getContextPath()%>/images/store.png"
							style="border-radius:50%;"width='40px' height='40px'></span>
							<span>${memVO.mem_name}</span>
					</a>
					<a
						href="<%=request.getContextPath()%>/member/MemberServlet.do?action=logout"><button
							type="button" class="btn" id="btn_out" data-toggle="modal"
							data-target="#exampleModalCenter">登出</button></a>
				</c:when>
				<c:when test="${empty sessionScope.account}">
					<a class="user_name"
						href="<%=request.getContextPath()%>/front-end/member/login.jsp">
						<button type="button" class="btn btn-outline-warning" id="btn_log"
							data-toggle="modal" data-target="#exampleModalCenter">登入</button>
					</a>
				</c:when>
			</c:choose>
		</div>
	</nav>
    <!-- navigation bar 的bgImg -->
    <div class="container-fluid" id="bg">
        <div style="height: 90px"></div>  
    </div>


	<!-- 購物商城 -->
    <div class="container-fluid" id="div_shop">
        <!-- title -->
        <div class="row align-items-center h-25">
          <div class="col-3"></div>
          <div class="col-6 text-center">
            <div class="grouping">
              <div class="grp">
                <p>您購買的裝備</p>
                <hr class="line">
              </div>
            </div>
          </div>
          <div class="col-3"></div>
        </div>
	</div>


	<!-- 若購物車為空 -->
	<c:if test="${empty buylist}">
		<div class="empty">您尚未購買任何裝備</div>
		<div style="height: 400px"></div>
	</c:if>



	<!-- 購物車不為空 -->
	<c:if test="${not empty buylist}">	

	<div class="container-fluid">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">裝備名稱</th>
				<th scope="col">價格</th>
				<th scope="col">數量</th>
				<th scope="col">小計</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<c:forEach var="equipodlistVO" items="${buylist}" varStatus="s"> 
		<tbody>
			<tr>
				<td>${equipodlistVO.equip_name}</td>
				<td>${equipodlistVO.equip_price}</td>
				<td>
					<button type="button" class="btn btn-warning min" id="min${s.index}"> - </button>
					<input type='text' name='buy_amt' value="${equipodlistVO.buy_amt}" class='buy_amt${s.index}' id="buy_amt"/>
					<button type="button" class="btn btn-warning add" id="add${s.index}"> + </button>
				</td>
				<td><div class="subtotal${s.index}">${equipodlistVO.equip_price * equipodlistVO.buy_amt}</div></td>
				<td>
					<FORM method="post" action="<%=request.getContextPath()%>/equip/equipment.do">
						<button type="submit" class="btn btn-success">刪除</button>
						<input type="hidden" name="num" value="${s.index}">
						<input type="hidden" name="action" value="delete">
					</FORM>  
				</td>
			</tr>
		</tbody>
		
<script type="text/javascript">

$(function(){
	
	$("#add${s.index}").click(function(){
		var t=$(this).parent().find('input[class*=buy_amt${s.index}]');
		t.val(parseInt(t.val()) + 1)
		
		
		$.ajax({
	        url:"<%=request.getContextPath()%>/equip/equipment.do",
	        type:"post",
	        data:{
		         action:"calculate",
		         num:${s.index},
		         buy_amt${s.index}:$('.buy_amt${s.index}').val(),
	        },
	        success:function(data){
	        	var jsonObj=JSON.parse(data);
	        	$(".subtotal${s.index}").html(jsonObj.subtotal);
	        	$(".totalPrice").html(jsonObj.amount);
	       }
		});
		
		
	})
	
	$("#min${s.index}").click(function(){
		var t=$(this).parent().find('input[class*=buy_amt${s.index}]');
		t.val(parseInt(t.val()) - 1)
		
		if(parseInt(t.val()) < 1){
			t.val(1);
		}
		
		
		$.ajax({
	        url:"<%=request.getContextPath()%>/equip/equipment.do",
	        type:"post",
	        data:{
		         action:"calculate",
		         num:${s.index},
		         buy_amt${s.index}:$('.buy_amt${s.index}').val(),
	        },
	        success:function(data){
	        	var jsonObj=JSON.parse(data);
	        	$(".subtotal${s.index}").html(jsonObj.subtotal);
	        	$(".totalPrice").html(jsonObj.amount);
	       }
		});
		
		
	})
	
})
</script>

		</c:forEach>
	</table>
	</div>
	
	<div class="total">
		總 金 額 <font color="red"> $ <span class="totalPrice"> <%= amount %> </span></font>
	</div>




	<div class="endBtn">
		<a href="<%=request.getContextPath()%>/front-end/equipment/equip_shop.jsp">
		<button type="submit" class="btn btn-success">繼續購物</button></a>
	</div>

	<div class="endBtn">
		<a href="<%=request.getContextPath()%>/front-end/equip_order/buy_info.jsp">
		<button type="submit" class="btn btn-success">付款結帳</button></a>
	</div>
			

	<div style="height: 40px"></div>
	
	</c:if>


		
		
	<footer>
		<div class="logo">
			<img src="<%=request.getContextPath()%>/images/twdivers.png"
				class="logo_img" alt="tw_logo">
		</div>
		<!-- 揪 行 裝 社 -->
		<ul class="nav justify-content-center" id="footer">
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/front-end/group/listAllGroup.jsp">潛點揪團</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/front-end/travel-page/travel.jsp">行程</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/front-end/equipment/equip_shop.jsp">裝備</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/front-end/album/albumList.jsp">社群</a></li>
		</ul>


        <!-- fake icon -->
        <ul class="nav justify-content-center" id="icon">
            <li class="nav-item">
                <svg id="fb" width="25px" height="25px" viewBox="0 0 96.124 96.123">
                    <path
                        d="M72.089,0.02L59.624,0C45.62,0,36.57,9.285,36.57,23.656v10.907H24.037c-1.083,0-1.96,0.878-1.96,1.961v15.803
                    c0,1.083,0.878,1.96,1.96,1.96h12.533v39.876c0,1.083,0.877,1.96,1.96,1.96h16.352c1.083,0,1.96-0.878,1.96-1.96V54.287h14.654
                    c1.083,0,1.96-0.877,1.96-1.96l0.006-15.803c0-0.52-0.207-1.018-0.574-1.386c-0.367-0.368-0.867-0.575-1.387-0.575H56.842v-9.246
                    c0-4.444,1.059-6.7,6.848-6.7l8.397-0.003c1.082,0,1.959-0.878,1.959-1.96V1.98C74.046,0.899,73.17,0.022,72.089,0.02z" />
                </svg>
            </li>
            <li class="nav-item">
                <svg id="ig" width="25px" height="25px" viewBox="0 0 512 512">
                    <path d="M352,0H160C71.648,0,0,71.648,0,160v192c0,88.352,71.648,160,160,160h192c88.352,0,160-71.648,160-160V160
                        C512,71.648,440.352,0,352,0z M464,352c0,61.76-50.24,112-112,112H160c-61.76,0-112-50.24-112-112V160C48,98.24,98.24,48,160,48
                        h192c61.76,0,112,50.24,112,112V352z" />
                    <path
                        d="M256,128c-70.688,0-128,57.312-128,128s57.312,128,128,128s128-57.312,128-128S326.688,128,256,128z M256,336
                        c-44.096,0-80-35.904-80-80c0-44.128,35.904-80,80-80s80,35.872,80,80C336,300.096,300.096,336,256,336z" />
                    <circle cx="393.6" cy="118.4" r="17.056" />
                </svg>
            </li>
            <li class="nav-item">
                <svg id="twit" width="25px" height="25px" viewBox="0 0 512 512">
                    <path d="M512,97.248c-19.04,8.352-39.328,13.888-60.48,16.576c21.76-12.992,38.368-33.408,46.176-58.016
                        c-20.288,12.096-42.688,20.64-66.56,25.408C411.872,60.704,384.416,48,354.464,48c-58.112,0-104.896,47.168-104.896,104.992
                        c0,8.32,0.704,16.32,2.432,23.936c-87.264-4.256-164.48-46.08-216.352-109.792c-9.056,15.712-14.368,33.696-14.368,53.056
                        c0,36.352,18.72,68.576,46.624,87.232c-16.864-0.32-33.408-5.216-47.424-12.928c0,0.32,0,0.736,0,1.152
                        c0,51.008,36.384,93.376,84.096,103.136c-8.544,2.336-17.856,3.456-27.52,3.456c-6.72,0-13.504-0.384-19.872-1.792
                        c13.6,41.568,52.192,72.128,98.08,73.12c-35.712,27.936-81.056,44.768-130.144,44.768c-8.608,0-16.864-0.384-25.12-1.44
                        C46.496,446.88,101.6,464,161.024,464c193.152,0,298.752-160,298.752-298.688c0-4.64-0.16-9.12-0.384-13.568
                        C480.224,136.96,497.728,118.496,512,97.248z" />
                </svg>
            </li>
            <li class="nav-item">
                <svg id="yt" width="25px" height="25px" viewBox="0 0 512 512">
                    <path d="M490.24,113.92c-13.888-24.704-28.96-29.248-59.648-30.976C399.936,80.864,322.848,80,256.064,80
                        c-66.912,0-144.032,0.864-174.656,2.912c-30.624,1.76-45.728,6.272-59.744,31.008C7.36,138.592,0,181.088,0,255.904
                        C0,255.968,0,256,0,256c0,0.064,0,0.096,0,0.096v0.064c0,74.496,7.36,117.312,21.664,141.728
                        c14.016,24.704,29.088,29.184,59.712,31.264C112.032,430.944,189.152,432,256.064,432c66.784,0,143.872-1.056,174.56-2.816
                        c30.688-2.08,45.76-6.56,59.648-31.264C504.704,373.504,512,330.688,512,256.192c0,0,0-0.096,0-0.16c0,0,0-0.064,0-0.096
                        C512,181.088,504.704,138.592,490.24,113.92z M192,352V160l160,96L192,352z" />
                </svg>
            </li>
        </ul>

    </footer>
    
    
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	        crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	        crossorigin="anonymous"></script>
   
	<script src="<%=request.getContextPath()%>/dive.js"></script>

	        
</body>
</html>