<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!-- 게시판등록 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">

<!-- 111111 -->
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			<h2 class="card-header">글 등록</h2>

			<div class="card-body">
				<form action="modify.do" method="post" role="modifyForm">
					<table class="table table-bordered" width="1500">

						<tbody>
							<tr>
								<th style="width:10%">제목</th>
								<td colspan="3" class="table-title">
									<input type="text" id="title" value=""
									name='title' class="form-control" placeholder="제목을 쓰세요">
								</td>
								
							</tr>

							<tr>
								<th style="width:10%">작성자</th>
								<td class="table-title">장재훈</td>
								<th style="width:10%">날짜</th>
								<td class="table-title">2022-10-10</td>
							</tr>
						</tbody>
					</table>
				<div>
					<div class="form-group">
						<textarea class="textarea" name="content" id="content" rows="20"
							placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
					</div>
				</div>
				<div>
					<div class="form-group">								
						<h5 class="ml-3" style="display:inline;line-height:40px;"><strong>파일첨부 </strong></h5>
						&nbsp;&nbsp;<button class="btn btn-xs btn-light"
						onclick="addFile_go();"	type="button" id="addFileBtn">+</button>
					</div>									
					<div class="ml-3 fileInput">
					</div>
				</div>
				</form>
				
				
				
				
				<!-- ================================================= -->
				<!-- 버튼 시작 -->
				<!-- ================================================= -->
				<div class="row justify-content-end mt-1">
					<button class="btn btn-outline-primary" type="button" onclick="">수정</button>&nbsp;&nbsp;
					<button class="btn btn-outline-danger" type="button" onclick="f_alert();">삭제</button>&nbsp;&nbsp;
					<button class="btn btn-primary" type="button" onclick="">목록</button>&nbsp;&nbsp;
				</div>
				<!-- ================================================= -->
				<!-- 버튼 끝 -->
				<!-- ================================================= -->
			</div>
		</div>
	</div>
</div>

<!-- 11111끝 -->






</div>
<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>');	
	
	
	$('.fileInput').on('change','input[type="file"]',function(event){
		//alert(this.files[0].size);
		if(this.files[0].size>1024*1024*40){
 			alert("파일 용량이 40MB를 초과하였습니다.");
 			this.click();
 			this.value="";	 					
 			return false;
 		} 
	});
}	
</script>
<script>


function f_alert(arg){
	Swal.fire(arg)
		
}


var dataNum=0;

function addFile_go(){
	//alert("click add btn");
	

	if($('input[name="uploadFile"]').length >=5){
		f_alert('파일추가는 5개까지만 가능합니다.');
// 		alert("파일추가는 5개까지만 가능합니다.");
		return;
	}
	
	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	
	var button="<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge-danger' type='button'>X</button>";
	
	div.append(input).append(button);
	$('.fileInput').append(div);
	
	
	dataNum++;
}

function remove_go(dataNum){
	$('div[data-no="'+dataNum+'"]').remove();
}

</script>
<script>
function f_alert(arg){
	Swal.fire(arg)
		
}

</script>
