<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">

<!-- 111111 -->
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			<h2 class="card-header">상세보기</h2>

			<div class="card-body m-3">
				<div class="row">
					<table class="table table-bordered">

						<tbody>
							<tr>
								<th style="width:10%">제목</th>
								<td colspan="5" class="table-title">${share.title }</td>
								
							</tr>
				
							<tr>
								<th style="width:10%">날짜</th>
								<td style="width:10%" class="table-title"><fmt:formatDate value="${share.cdate }" pattern="yyyy-MM-dd"/></td>
								<th style="width:10%">추천수</th>
								<td style="width:10%" class="table-title">${share.recoNum }</td>
								<th style="width:10%">조회수</th>
								<td style="width:10%" class="table-title">${share.viewCnt }</td>
							</tr>
							<tr>
								<td colspan="6" class="table-title">
									<p class="m-3">
										${share.content }
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				
				<!-- ================================================= -->
				<!-- 버튼 시작 -->
				<!-- ================================================= -->
				<div class="row justify-content-between mt-3">
					<div>
						<button class="btn btn-rounded btn-info m-1" type="button" onclick="reco_go(${share.shaBno})">추천</button>
						<button class="btn btn-rounded btn-danger m-1" type="button" onclick="repo_go(${share.shaBno})">신고</button>
					</div>
					
					<div>
						<button class="btn btn-outline-primary m-1" type="button" onclick="modify_go()">수정</button>
						<button class="btn btn-primary m-1" type="button" onclick="pageMove('/ai/stu/support/share')">목록</button>
					</div>
				</div>
				<!-- ================================================= -->
				<!-- 버튼 끝 -->
				<!-- ================================================= -->
			</div>
		</div>
	</div>
</div>

<!-- 11111끝 -->



<!-- 222222 -->

<div class="main-content-jsp">
<div class="row">

	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			<h3 class="card-header">
			댓글
<%-- 			<c:if test="${!empty replyList }">		 --%>
				<span class="nav-item">															
					&nbsp;&nbsp;<span class="badge badge-info">${fn:length(replyList) }</span>
				</span>
<%-- 			</c:if>		 --%>
			</h3>
			<!-- 버튼 -->
			<div class="card-body">
				<!-- <label for="qnaans">답변</label> -->
				<div class="timeline">
					<c:if test="${empty replyList }">
						&nbsp;&nbsp;댓글이 없습니다.
					</c:if>
					<!-- 여기 댓글목록이 handlebars로 들어옴 -->
					<div class="card replyDIV">
						<span class="card-header d-flex justify-content-between align-items-center">
							<span><strong>${share.stuCd }</strong>
								&nbsp;&nbsp;<fmt:formatDate value="${share.cdate }" pattern="yyyy-MM-dd"/></span>
							<span>
							<a href="#" class="btn btn-rounded btn-outline-primary btn-sm"
								data-toggle="modal" data-target="#modifyModal">수정</a>&nbsp;
							<a href="#" class="btn btn-rounded btn-outline-danger btn-sm"
								onclick="">삭제</a>
							</span>
						
						</span>
						<span class="card-body">
						${share.content }
						</span>
					</div>
					
				<!-- 여기 댓글목록이 handlebars로 들어옴 -->
				</div>
				
				<div class='text-center'>
					<ul id="pagination" class="pagination justify-content-center m-0" >
						
					</ul>
				</div>
				
			</div>

			<div class="card-footer">
			<div class="col-xl-12">
				<div class="d-flex justify-content-between align-items-center">
					<span>
					<h3 style="display:inline;">댓글 작성</h3>
					</span>
					<span>
					<button type="button" class="btn btn-primary" id="replyAddBtn" onclick="replyRegist_go();">등록</button>
					</span>
				</div>
			</div>
			<div class="col-xl-12 mt-1">
				<textarea class="form-control" type="text"	placeholder="REPLY TEXT" id="newReplyText"></textarea>
			</div>
			</div>






		</div>
	</div>

</div>
</div>
<!-- 22222끝 -->



<!-- Modal -->
<div id="modifyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="replyModBtn" onclick="replyModify_go();">Modify</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div><!-- Modal End -->

<form role="form">
	<input type="hidden" name="shaBno" value=${share.shaBno }/>
</form>





</div>

<script>
function modify_go(){
	location.href="modifyForm.do?shaBno="+${share.shaBno};
}

function reco_go(param){
	var reco_confirm = confirm('이 글을 추천하시겠습니까?');
	
	var v_url = "<%=request.getContextPath()%>/stu/support/share/recommend?shaBno="+param;
	
	if(reco_confirm == true){
		$.ajax({
			method:'put',
			url: v_url,
			success: (rslt)=>{
				alert(rslt);
			},
			error: ()=>{
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
		
	}
}

function repo_go(param){
	var repo_confirm = confirm('이 글을 신고하시겠습니까?');
	
	var v_url = "<%=request.getContextPath()%>/stu/support/share/report?shaBno="+param;
	
	if(repo_confirm == true){
		$.ajax({
			method:'put',
			url: v_url,
			success: (rslt)=>{
				alert(rslt);
				if(rslt.indexOf("5회") != -1){
					pageMove('/ai/stu/support/share');
				}
			},
			error: ()=>{
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}
}

</script>