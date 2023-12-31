<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<link rel="icon" type="image/x-icon" href="/logoimg/iconV2.jpg">
<style>
body {
  margin: 0;
  font-family: Arial, sans-serif;
}
.header-container {
  width: 1890px; /* 옵션의 최대 너비 설정 */
  background-color: #fff;
  padding: 15px 0;
  border-bottom: 1px solid #ccc;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.header-table {
  width: 60%;
  border-collapse: collapse;
}
#logo img {
  max-width: 400px;
  height: auto;
}
#search-container {
  display: flex;
  align-items: center;
}
#search-bar {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
}
#search-button {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 8px 15px;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  margin-left: 5px;
}
.menu-links a {
  text-decoration: none;
  color: #333;
  font-weight: bold;
  font-size: 16px;
  margin: 0 15px;
  transition: color 0.3s ease;
}
.menu-links a:hover {
  color: #007bff;
}
.user-actions {
  display: flex;
  align-items: center;
  margin-right: 2%;
}
.action-link {
  text-decoration: none;
  color: #333;
  font-weight: bold;
  font-size: 16px;
  margin-right: 10px;
  transition: color 0.3s ease;
}
.action-link:hover {
  color: #007bff;
}
.welcome-msg {
  font-size: 16px;
  margin-right: 10px;
}
.cart-link {
  text-decoration: none;
  color: #333;
  font-weight: bold;
  font-size: 16px;
  margin-right: 10px;
  position: relative;
  transition: color 0.3s ease;
}
.cart-link:hover {
  color: #007bff;
}
#labelqty {
  position: absolute;
  background-color: #007bff;
  color: #fff;
  font-size: 12px;
  padding: 2px 6px;
  border-radius: 50%;
  
}
.floBanPc1 {
  position: fixed;
  top: 180px; /* 윗쪽 끝에서부터의 거리 */
  left: 0;
  z-index: 99;
  width:200px;
  height:730px;
  border: 1px solid grey;
  text-align: center;
  background-color: white;
  border-top-right-radius:10%;
}
</style>
</head>
<body>
<header class="header-container">
  <table class="header-table">
    <tr>
      <td id="logo"><a href="/"><img src="../logoimg/book.png" alt="로고"></a></td>
      <td colspan="5">
        <div id="search-container">
          <input type="text" id="search-bar" placeholder="도서를 검색하세요...">
          <button id="search-button">검색</button>
        </div>
      </td>
    </tr>
    
    <tr class="menu-links">
    <td></td>
      <td><a href="/korBook/korbook">전체보기</a>
      <td><a href="/korBook/bestSeller">베스트셀러</a></td>
      <td><a href="/korBook/kornovel">소설</a></td>
      <td><a href="/korBook/korhistory">역사</a></td>
      <td><a href="/korBook/koreconomy">경제/경영</a></td>
      <td><a href="/korBook/korpolitics">정치</a></td>
      <td><a href="/korBook/korcomic">만화</a></td>
      <td><a href="/korBook/g_board">게시판</a></td>
     <!--  <td><a href="/korBook/review">리뷰게시판</a></td> -->
    </tr>
  </table>
  <div class="user-actions">
  <input type="hidden" value= '${sessionScope.admin}'>
  <%
  	String id =(String)session.getAttribute("userid");
  	Integer admin =(Integer)session.getAttribute("admin");
  	if(id==null){
  %>
	<div id=guestMenu>
      <a href="/login" class="action-link">로그인</a>
      <a href="/signup" class="action-link">회원가입</a>
   	</div>
  <%
  	}
	if(id!=null){
		if(admin==0){
  %>   
		<div id = userMenu>
            <span class="welcome-msg">${userid}님</span>
            <a href="/logout" class="action-link">로그아웃</a>
            <a href="/mypage" class="action-link">마이페이지</a>
		    <a href="/korBook/orderhistory" class="action-link">결제내역</a>
		    
		    <a class="cart-link" href="/korBook/viewcart">장바구니<label id="labelqty"></label></a>
		</div>
			
	<%
		}
		if(admin==1){
	%>
		<div id = adminMenu>
            <span class="welcome-msg">관리자 ${userid}님</span>
            <a href="/logout" class="action-link">로그아웃</a>
            <a href="/adminPage" class="action-link">회원관리</a>
		    <a href="/korBook/productmanagement" class="action-link">상품관리</a>
		    <a href="/mypage" class="action-link">마이페이지</a>
		    <a href="/korBook/orderhistory" class="action-link">결제내역</a>
		    &nbsp;&nbsp;&nbsp;
		    <a class="cart-link" href="/korBook/viewcart">장바구니<label id="labelqty"></label></a>
		</div>
	<%
		}
	}
	%>
</div>
  <div class="floBanPc1">
  <a href="/">
    <img src="/logoimg/pmo.jpg" width="60%" height="90" style="margin-top:10px">
   	<br>이벤트<br>
  </a>
  <a href="https://www.musinsa.com/app/" target="_blank"> 	
   	<img src="/logoimg/musinsa.jpg" width="60%" height="90">
   	<br> 실시간 인기<br> 아이템은<br> 무신사
   	<br><span style="font-size:small">무신사스토어</span><br><br>
  </a> 
  <br><span style="color:darkblue; font-weight:bold; font-size:large">[오늘의 추천]</span><br>
  <c:forEach items="${random}" var="alist" >
  <a href="/korBook/detail?seqno=${alist.seq}" style="margin-top:10px;">
   <img src="../img/prodmain/${alist.img}" width="60%" height="20%">
   <br><span style="white-space: no-wrap; overflow: hidden; text-overflow: ellipsis;">${alist.name}</span><br>
  </a>
  </c:forEach>
  </div>
</header>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function() {
	$('#labelqty').text(${count});
  $(document).on('click','#search-button',function(){
    let search = $('#search-bar').val();
    console.log(search);
    document.location="/dosearch?name="+search;
    return false;
  });
})
</script>
</body>
</html>
