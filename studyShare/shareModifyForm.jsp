<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="card" style="padding-bottom: 0px;">
				<h2 class="card-header">학습법 공유 작성</h2>

				<div class="card-body">

					<div class="row">
						<div class="col-xl-12">
							<form action="modify" method="post" role="modifyForm">
								<input type="hidden" id="shaBno" name="shaBno" value="${share.shaBno }" />
								<table class="table table-bordered" width="1500">
			
									<tbody>
										<tr>
											<th style="width:10%">제목</th>
											<td class="table-title">
												<input type="text" id="title" value="${share.title }"
												name='title' class="form-control" placeholder="제목을 쓰세요">
											</td>
											
										</tr>
			
										<tr>
											<th style="width:10%">등록날짜</th>
											<td class="table-title"><fmt:formatDate value="${share.cdate }" pattern="yyyy-MM-dd"/></td>
										</tr>
									</tbody>
								</table>
							<div>
								<div class="form-group">
									<textarea class="textarea" name="content" id="content"
										rows="20" placeholder="1000자 내외로 작성하세요."
										style="display: none;">${fn:escapeXml(share.content)}</textarea>
								</div>
							</div>
							</form>

						</div>



					</div>
					<!-- ================================================= -->
					<!-- 버튼 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-center">

						<button class="btn btn-primary" type="button" onclick="modifyPOST_go();">등록</button>
						&nbsp;&nbsp;
						<button class="btn btn-danger" type="button"
							onclick="history.go(-1)">취소</button>
						&nbsp;&nbsp;
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




<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>'); 
}
</script>


<script>
	function modifyPOST_go(){
		$("form[role='modifyForm']").submit();
	}    
</script>   

