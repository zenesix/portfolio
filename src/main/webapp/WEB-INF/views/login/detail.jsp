<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Starter</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/skins/skin-blue.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script
	src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
</head>
<!-- REQUIRED JS SCRIPTS -->
<%@include file="../include/plugin.jsp"%>

<script>
//ajax를 통한 댓글 쓰기
$(document).ready(function(){
	console.log("ajax Test");
	
	//댓글 목록 불러오는 replylist()함수 호출
	replylist();
	
	//댓글 쓰기를 클릭하면 실행:  이벤트 클릭 발생 
	// $("#btnReplySave").click(function(){});
	//$('#btnReplySave').on('click' ,function(){ } 'click' -> 클릭 이벤트
	// pom에 jackson-databind, jackson-core 라이브러리 붙쳐줘야함  	
	$(document).on('click','#btnReplySave' ,function(){ //'click' -> 클릭 이벤트
		var rememo = $("#rememo").val();
		var rewriter=$("#rewriter").val();
		
		console.log("내용:" +rememo);
		console.log("작성자:" +rewriter);
		
		var url = "${pageContext.request.contextPath}/board/reply2";
		var paramData = {
		"rewriter" : rewriter,
		"rememo" : rememo,
		"bno" : ${board.bno}
		};
		
		$.ajax({
			type: "POST",
			url: url,
			data: paramData,
			dataType: 'json',
			success: function(result) {
				replylist();//댓글목록 불러오기
				$("#rememo").val('');//리셋
				$("#rewriter").val('');//리셋
				
				//alert('성공함')
				//console.log(result);
			},
			error: function(data){
				alert('실패함')
				console.log(data);
			}
			
		});
		
		
		//ajax 전송방식(GET/POST), 주소(매핑주소), 데이터, 데이터 타입(JSON) => 성공 또는 실패
	});
});

//댓글 목록 불러오기 해당 메소드 즉시실행
function replylist(){
	
	var url="${pageContext.request.contextPath}/board/replylist"
    var paramData = {
			"bno" : "${board.bno}"			
	}
			$.ajax({
				url: url,
				data: paramData,
				dataType: "json",
				type: 'POST',
				
				success: function(result) {
					
				    
				    var htmls = '';
				    if(result.length<1){
				    	htmls +="<h3>등록된 댓글이 없습니다.<h3>"
				    }
				    else{
				    	
				    
					//레이아웃을 작성해줌 그리고 밑에for문 .each 130라인부터밑에 있는내용이 계속나오는거임
					/* 
						htmls += '<div id="reno'+this.reno + '">';
						htmls += this.reno + '-' + this.rewriter + "<br>";
						htmls += this.rememo + '-' + this.redate;
						htmls += '</div>'*/ 
						
					   $(result).each(function(){
					
						htmls += '<div class="" id="reno' + this.reno + '">';
						htmls += '<span class="d-block">';
						htmls += this.reno + '-';
						htmls += '<strong class="text-gray-dark"> ' + this.rewriter + '</strong>';
						htmls += '<span style="padding-left:7px; font-size:9pt">';
						htmls += '<a href="javascript:void(0)" onclick="fn_editReply('+this.reno+', \''+ this.rewriter+'\',\''+this.rememo+'\')"sytle="padding-right:5px">수정</a>';
						htmls += '<a href="javascript:void:(0)" onclick="fn_deleteReply('+this.reno+')"> 삭제 </a>'; 
						htmls += '</span>';
						htmls += '</span><br>';
						htmls +=  this.rememo;
						htmls += '</p>';
						htmls += '</div>'
						
					
					});
					
				    
					
				    }
				    $("#replylist").html(htmls);
				},
				 error: function(data){
					alert("실패함");
				}
			
			}); //ajax end
			
	}// end of replylist()
	
	//댓글 수정하기(form)
	function fn_editReply(reno, rewriter, rememo){
		
		var htmls="";
		htmls = htmls +'<div class="" id="reno'+ reno +'">'
		htmls += '<span class="d-bloc">';
		htmls += reno+'-';
		htmls += '<strong class="text-gray-dark">' + rewriter + '</strong>';
		htmls += '<span style="padding-left:7px; font-size:9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply('+ reno +', \'' + rewriter +'\', \''+rememo+'\')"style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onclick="replylist()" > 취소</a>';
		htmls +=  '</span>';
		htmls += '</span><br>';
		htmls += '<textarea name="editmemo" id="editmemo" class="form-control" rows="3">'
		htmls += rememo;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';
 		
		
		
		
		//선택한 요소를 다른것으로 바꿉니다   함수설명:(replaceWith < 데이터 변경)  (focus는 수정을누르면 깜빡깜빡 거림)
		$('#reno' + reno).replaceWith(htmls);
		$('#reno'+reno+'#editmemo').focus();
	}
    //댓글 수정하기 (5/14 rememo빼야하는지 확인해보고 왜이벤트발생시 url이 바끼지않는지 알아보기)
    function fn_updateReply(reno, rewriter){
    	var editmemo = $('#editmemo').val();
    	url = "${pageContext.request.contextPath}/board/replyupdate2"; //url 
    	//paramData
    	var paramData= {
    			"reno" : reno,
    			"rewriter" : rewriter,
    			"rememo" : editmemo
    			
    			
    	}; //수정데이터
    	
    	//.ajax() 설정
    	$.ajax ({
    			url: url,
    			data: paramData,
    			dataType: "json",
    			type: "POST",
    			success: function(result) {
    				console.log(result);
    				alert("해당 댓글 수정 되었습니다.")
    				replylist();
    				
				    },
				   error: function(data){
					   console.log(data);
					   alert("에러가 발생했습니다.");
				   }
    		
    	});
    			
    			
    	}
    	//댓글 삭제
    	function fn_deleteReply(reno){
    	    var url = "${pageContext.request.contextPath}/board/replyDelete2";
    		var paramData= {
    			"reno": reno,	
    		};
    		$.ajax({
    			url: url,
    			data: paramData,
    			dataType:'json',
    			type: 'GET',
    			success: function(result){
    				console.log(result);
    				alert("댓글이 삭제되었습니다.")
    				replylist();
    			},
    			error:function(data){
    				console.log(data);
    				alert("에러가 발생했습니다");
    			}
    		});
    	}
    	
    

</script>
<!--

BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="/" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Admin</b>LTE</span>
			</a>

			<!-- Header Navbar -->
			<%@include file="../include/header.jsp"%>
			<!-- /.messages-menu -->

			<!-- Notifications Menu -->
			<li class="dropdown notifications-menu">
				<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
					class="label label-warning">10</span>
			</a>
				<ul class="dropdown-menu">
					<li class="header">You have 10 notifications</li>
					<li>
						<!-- Inner Menu: contains the notifications -->
						<ul class="menu">
							<li>
								<!-- start notification --> <a href="#"> <i
									class="fa fa-users text-aqua"></i> 5 new members joined today
							</a>
							</li>
							<!-- end notification -->
						</ul>
					</li>
					<li class="footer"><a href="#">View all</a></li>
				</ul>
			</li>
			<!-- Tasks Menu -->
			<li class="dropdown tasks-menu">
				<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> <i class="fa fa-flag-o"></i> <span
					class="label label-danger">9</span>
			</a>
				<ul class="dropdown-menu">
					<li class="header">You have 9 tasks</li>
					<li>
						<!-- Inner menu: contains the tasks -->
						<ul class="menu">
							<li>
								<!-- Task item --> <a href="#"> <!-- Task title and progress text -->
									<h3>
										Design some buttons <small class="pull-right">20%</small>
									</h3> <!-- The progress bar -->
									<div class="progress xs">
										<!-- Change the css width attribute to simulate progress -->
										<div class="progress-bar progress-bar-aqua" style="width: 20%"
											role="progressbar" aria-valuenow="20" aria-valuemin="0"
											aria-valuemax="100">
											<span class="sr-only">20% Complete</span>
										</div>							
									</div>
							</a>
							</li>
							<!-- end task item -->
						</ul>
					</li>
					<li class="footer"><a href="#">View all tasks</a></li>
				</ul>
			</li>

			<c:if test="${user != null }">
				<!-- User Account Menu -->
				<li class="dropdown user user-menu">
					<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <!-- The user image in the navbar--> <img
						src="${contextPath}/resources/dist/img/user2-160x160.jpg"
						class="user-image" alt="User Image"> <!-- hidden-xs hides the username on small devices so only the image appears. -->
						<span class="hidden-xs">${user.name }</span> <!-- 여기도 세션 부과하기 -->
				</a>
					<ul class="dropdown-menu">
						<!-- The user image in the menu -->
						<li class="user-header"><img
							src="${contextPath}/resources/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image">

							<p>
								Alexander Pierce - Web Developer <small>Member since
									Nov. 2012</small>
							</p></li>
						<!-- Menu Body -->
						<li class="user-body">
							<div class="row">
								<div class="col-xs-4 text-center">
									<a href="#">Followers</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Sales</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Friends</a>
								</div>
							</div> <!-- /.row -->
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a href="#" class="btn btn-default btn-flat">Sign out</a>
							</div>
						</li>
					</ul>
				</li>
			</c:if>
			<!-- 유저가 null 값이 아니면 트루 로그인하면 null 값이 아니니 보여짐 -->

			<!-- Control Sidebar Toggle Button -->
			<li><a href="#" data-toggle="control-sidebar"><i
					class="fa fa-gears"></i></a></li>
			</ul>
	</div>
	</nav>
	</header>
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">

		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">

			<!-- Sidebar user panel (optional) -->
			<c:if test="${user != null}">
				<div class="user-panel">
					<div class="pull-left image">
						<img src="${contextPath}/resources/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${user.name}</p>
						<!-- Status -->
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
			</c:if>

			<!-- search form (Optional) -->
			<form action="#" method="get" class="sidebar-form">
				<div class="input-group">
					<input type="text" name="q" class="form-control"
						placeholder="Search..."> <span class="input-group-btn">
						<button type="submit" name="search" id="search-btn"
							class="btn btn-flat">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form>
			<!-- /.search form -->

			<!-- Sidebar Menu -->
			<%@ include file="../include/sidebar.jsp"%>
			<!-- /.sidebar-menu -->
		</section>
		<!-- /.sidebar -->
	</aside>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Page Header <small>Optional description</small>
			</h1>
			<p>세션 :${user }, 유저이름:${user.name}</p>

			<p>
				<c:set var="num2" value="이것은 jstl 문법" />
				<c:out value="${num2}" />
			</p>
			<c:choose>
				<c:when test="${income <= 1000}">
      	income is not good
      </c:when>
				<c:when test="${income > 10000}">
      	income is verygood 
      </c:when>
				<c:otherwise>
       income
      </c:otherwise>

			</c:choose>

			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
				<li class="active">Here</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content container-fluid">
			<div class="box-header wuth-border">
				<!--  밑에 c:if 는 jstl 문법 -->
				<c:if test="${user == null }">
					<!-- 위 눌 값이 비어있으면 밑에 로그인이 뜸 그밑은 눌값이 비어있지않으면 트루 -->
					<a href="/board/login">
						<h3 class="box-title">로그인</h3>
					</a>
				</c:if>
				<c:if test="${user!= null }">       
    ${user.name }님 환영합니다. <br />
					<a href="/board/logout">
						<h3 class="box-title">로그 아웃</h3>
					</a>
				</c:if>
			</div>
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">상세보기</h3>
				</div>
				<div class="box-body">
					<div class="form-group">
						<label>제목</label> <input type="text" name="title"
							class="form-control" value="${board.title }" readonly="readonly" />
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea name="conten" rows="5" readonly="readonly"
							class="form-control"> ${board.content} </textarea>
					</div>
					<div class="form-group">
						<label> 작성자</label> <input type="text" name="id"
							class="form-control" value="${board.id }" readonly="readonly" />
					</div>

				</div>

			</div>
			<div class="box-footer">
				<button class="btn btn-success">메인</button>
				<button class="btn btn-warning">수정</button>
				<button class="btn btn-danger">삭제</button>
				<button class="btn btn-primary">목록</button>
				<button class="btn btn-info">댓글 작성</button>


			</div>

			<script>
				$(function() {
					//메인 버튼을 눌렀을떄 처리
					$(".btn-success").click(function() {
						location.href = "../";
					});
					//목록 버튼을 눌렀을떄 처리
					$(".btn-primary").click(function() {
						location.href = "/board/list";
					});
					//삭제 버튼을 눌렀을떄 처리
					$(".btn-danger").click(function() {
						location.href = "/board/delete?bno=${board.bno}";
					});
					//수정 버튼을 눌렀을떄
					$(".btn-warning").click(function() {
						location.href = "/board/update?bno=${board.bno}";
					});
					//댓글작성 버튼을 눌렀을 떄 처리
					$(".btn-info").click(function() {
						location.href = "/board/reply?bno=${board.bno}"
						
					});

				})
			</script>
			<div>
				<div class="box-body">
					<table>
						<tr>
							<td rowspan="2" width="70%"><textarea name="rememo"
									id="rememo" class="form-control" placeholder="내용을 입력해주세요"></textarea>
							</td>
							<td><input type="text" name="rewirter" id="rewriter"
								placeholder="댓글작성자" /></td>
						</tr>
						<tr>
							<td><button type="button" id="btnReplySave">저장</button></td>
						</tr>
					</table>
				</div>
				<hr style="border: 1px solid black;">
				<div id="replylist"></div>
			</div>

		</section>

		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- Main Footer -->
	<footer class="main-footer">
		<!-- To the right -->
		<div class="pull-right hidden-xs">Anything you want</div>
		<!-- Default to the left -->
		<strong>Copyright &copy; 2016 <a href="#">Company</a>.
		</strong> All rights reserved.
	</footer>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active"><a href="#control-sidebar-home-tab"
				data-toggle="tab"><i class="fa fa-home"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
					class="fa fa-gears"></i></a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane active" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">Recent Activity</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:;"> <i
							class="menu-icon fa fa-birthday-cake bg-red"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

								<p>Will be 23 on April 24th</p>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

				<h3 class="control-sidebar-heading">Tasks Progress</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:;">
							<h4 class="control-sidebar-subheading">
								Custom Template Design <span class="pull-right-container">
									<span class="label label-danger pull-right">70%</span>
								</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

			</div>
			<!-- /.tab-pane -->
			<!-- Stats tab content -->
			<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
				Content</div>
			<!-- /.tab-pane -->
			<!-- Settings tab content -->
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">General Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Report panel
							usage <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Some information about this general settings option</p>
					</div>
					<!-- /.form-group -->
				</form>
			</div>
			<!-- /.tab-pane -->
		</div>
	</aside>
	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->


</body>
</html>