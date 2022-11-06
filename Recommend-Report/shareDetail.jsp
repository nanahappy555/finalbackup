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
								<td colspan="8" class="table-title">${share.title }</td>
								
							</tr>
				
							<tr>
								<th style="width:10%">과목명</th>
								<td style="width:14%" class="table-title">${share.subjName }</td>
								<th style="width:10%">날짜</th>
								<td style="width:8%" class="table-title"><fmt:formatDate value="${share.cdate }" pattern="yyyy-MM-dd"/></td>
								<th style="width:10%">추천수</th>
								<td style="width:8%" class="table-title">${share.recoNum }</td>
								<th style="width:10%">조회수</th>
								<td style="width:8%" class="table-title">${share.viewCnt }</td>
							</tr>
							<tr>
								<td colspan="8" class="table-title">
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
						<c:if test="${loginUser.memId ne share.stuCd}">
						<button class="btn btn-rounded btn-info m-1" type="button" onclick="reco_go(${share.shaBno})">추천</button>
						<button class="btn btn-rounded btn-danger m-1" type="button" onclick="repo_go(${share.shaBno})">신고</button>
						</c:if>
					</div>
					
					<div>
						<c:if test="${loginUser.memId eq share.stuCd}">
						<button class="btn btn-outline-primary m-1" type="button" onclick="modify_go()">수정</button>
						</c:if>
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
				<span class="nav-item">															
					&nbsp;&nbsp;<span class="badge badge-info" id="replyCount"></span>
				</span>
			</h3>
			<div class="card-body">
				<div class="timeline" id="repliesDIV">
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
        <h4 class="modal-title">댓글 수정</h4><span id="hiddenShaRno" style="display:none;"></span>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="replyModBtn" onclick="replyModify_go();">등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div><!-- Modal End -->

<form role="form">
	<input type="hidden" name="shaBno" value=${share.shaBno }/>
</form>





</div>

<script>
window.onload = ()=> {
	getReplyList();
}

function getReplyList(){
	$.ajax({
		method:'get',
		url:'<%=request.getContextPath()%>/replies/'+${share.shaBno},
		dataType: 'json',
		success: (reply)=>{
			var v_str = "";
			for(var i=0; i<reply.length; i++){
				var v_cdate = new Date(reply[i].cdate);
				var v_cdateFormat = f_transFormatToDate(v_cdate);
				
				v_str +=
					`<div class="card replyDIV">
						<span class="card-header d-flex justify-content-between align-items-center">`;
				v_str +=	`<span><strong>`+reply[i].name+`</strong>`;
				v_str +=	`&nbsp;&nbsp;\${v_cdateFormat}</span>
							<span>
							<a href="#" class="btn btn-rounded btn-outline-primary btn-sm"
								data-toggle="modal" data-target="#modifyModal"
								onclick="replyModifyModal_go(\${reply[i].shaRno})">수정</a>&nbsp;
							<a href="#" class="btn btn-rounded btn-outline-danger btn-sm"
								onclick="replyRemove_go(\${reply[i].shaRno})">삭제</a>
							</span>
						</span>
						<span class="card-body" id="\${reply[i].shaRno}-replytext">\${reply[i].content }</span>
					</div>`;
			}
			document.querySelector('#replyCount').innerHTML = reply.length;
			document.querySelector('#repliesDIV').innerHTML = v_str;
		},
		error: ()=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>
<script>
function modify_go(){
	pageMove("modifyForm.do?shaBno="+${share.shaBno});
}

function reco_go(param){
	var reco_confirm = confirm('이 글을 추천하시겠습니까?');
	
	var v_url = "<%=request.getContextPath()%>/stu/support/share/recommend?shaBno="+param;
	
	if(reco_confirm == true){
		$.ajax({
			type:'put',
			url: v_url,
			success: (rslt)=>{
				alert(rslt);
				pageMove('/ai/stu/support/share/detail?shaBno='+param);
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
<script>
function replyModifyModal_go(shaRno){	
	$('div#modifyModal div.modal-body #replytext').val($('span#'+shaRno+'-replytext').text()); //내용
	$('#hiddenShaRno').text(shaRno); //shaRno
}

function replyRegist_go(){
	let shaBno = ${share.shaBno};
	let newReplyText = $('#newReplyText').val();
	let lecCd = `${share.lecCd}`;

	let sendData={
			shaBno:shaBno,
			content:newReplyText,
			lecCd:lecCd
	}
	console.log(sendData);
	$.ajax({
		type:'post',
		url:'<%=request.getContextPath()%>/replies',
		data:JSON.stringify(sendData),
		contentType:'application/json',
		success: (rslt)=>{
			alert(rslt);
			pageMove('/ai/stu/support/share/detail?shaBno='+${share.shaBno});

		},
		error: ()=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function replyModify_go(){
	let shaRno = $('#hiddenShaRno').text();
	let replytext = $('#replytext').val();
	
	let sendData={
			shaRno:shaRno,
			content:replytext
	}
	console.log(sendData);
	$.ajax({
		type:'put',
		url:'<%=request.getContextPath()%>/replies/'+shaRno,
		data:JSON.stringify(sendData),
		contentType:'application/json',
		success: (rslt)=>{
			alert(rslt);
			pageMove('/ai/stu/support/share/detail?shaBno='+${share.shaBno});

		},
		error: ()=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}


function replyRemove_go(shaRno){
	let shaBno = ${share.shaBno};
	
	$.ajax({
		type:'delete',
		url:`<%=request.getContextPath()%>/replies/\${shaBno}/\${shaRno}`,
		success: (rslt)=>{
			alert(rslt);
			pageMove('/ai/stu/support/share/detail?shaBno='+${share.shaBno});
		},
		error: ()=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>