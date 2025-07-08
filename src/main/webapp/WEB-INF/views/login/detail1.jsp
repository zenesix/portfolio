<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- Main content -->
<section class="content container-fluid">
	
	<div class="table-resopnsive">
			<table class="table">
			<tr>
			<td>댓글번호</td>
			<td>댓글 작성자</td>
			<td>댓글내용</td>
			<td>날짜</td>
			<td>댓글 수정</td>
			<!-- <td type="hidden">해당게시글 번호</td> -->	      <!-- tr은 한줄 -->
			
			</tr>
			<c:forEach var="reply" items="${reply }">
			<tr>
			<td><a href="/board/replyupdate?reno=${reply.reno }&bno=${reply.bno}"> ${reply.reno}</a> </td>
			<td>  ${reply.rewriter }</a> </td>
			<td> ${reply.rememo}  </td>
			<td>${reply.redate }</td>
			<td><a href="/board/replyupdate?reno=${reply.reno }&bno=${reply.bno}" > 댓글 수정</a> </td>
			<!--  <td><span class="badge"> ${ reply.bno }</span> </td>-->
			</tr>			
			</c:forEach>
			
			<tr>
			<td colspan="5" align="center">
			<input class="btn btn-success" type="button" value="메인으로" onclick="location.href='/'" /> <br>
			
			</td>
			
			</tr>
				
			</table>

			</form>
</section>



