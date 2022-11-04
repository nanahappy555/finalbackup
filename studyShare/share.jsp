<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="shareAllList" value="${shareAllMap.shareAllList }" />
<c:set var="AllPageMaker" value="${shareAllMap.pageMaker }" />
<c:set var="Allcri" value="${AllPageMaker.cri }" />
<c:set var="shareLecList" value="${shareLecMap.shareLecList }" />
<c:set var="LecPageMaker" value="${shareLecMap.pageMaker }" />
<c:set var="Leccri" value="${LecPageMaker.cri }" />
<div class="container-fluid">
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="pills-regular">
    <ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
        <li class="nav-item">
            <a class="nav-link" id="pills-all-tab" data-toggle="pill"
            href="#pills-all" role="tab" aria-controls="all" aria-selected="false">일반학습법</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="pills-lec-tab" data-toggle="pill" 
            href="#pills-lec" role="tab" aria-controls="lec" aria-selected="false">과목별학습법</a>
        </li>
    </ul>
<div class="tab-content" id="pills-tabContent">
    <!-- 탭2시작 -->
	<div class="tab-pane fade" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab">
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card-body" id="allCardBody">
					<!-- ajax 시작 -->
					<!-- ajax 끝 -->
				</div>	
				<div  class="row justify-content-center">
						<ul id="allPagiUl" class="pagination justify-content-center m-0">
						</ul>
				</div>
            </div>
       	</div>
	</div>
	<!-- 탭1끝 -->
	<!-- 탭2시작 -->
	<div class="tab-pane fade" id="pills-lec" role="tabpanel" aria-labelledby="pills-lec-tab">
	        <div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card-body" id="lecCardBody">
						<!-- ajax 시작 -->
						<!-- ajax끝 -->
					</div>
					<div  class="row justify-content-center">
							<ul id="lecPagiUl" class="pagination justify-content-center m-0">
							</ul>
					</div>
				</div>
            </div>
    	</div>
   	</div>
</div>
</div>


 
 


<script>
$(document).ready(function(){
	var currentTap = top.document.querySelector('#currentTap');
	if (currentTap.value == "All" || currentTap.value == ""){
		$('#pills-all-tab').addClass("active show");
		$('#pills-all').addClass("active show");
		$('#pills-all-tab').attr('aria-selected', 'true');
	}
	if (currentTap.value == "Lec"){
		$('#pills-lec-tab').addClass("active show");
		$('#pills-lec').addClass("active show");
		$('#pills-lec-tab').attr('aria-selected', 'true');
	}
	currentTap.value= 'All';
	
});

var evalRow = document.querySelectorAll('.evalRow');
for(var i=0;i<evalRow.length;i++){
	evalRow[i].style.cursor="pointer";
}
//pageMove('/ai/stu/support/share/detail?shaBno=${shareAll.shaBno}')
function f_move(e){
	var currentTap = top.document.querySelector('#currentTap');
	var dataCd = e.target.parentNode.getAttribute("name"); // All or Lec
	var hiddenshaBno = e.target.parentNode.children[0].children[0].innerHTML;
	console.log(e.target.parentNode.children[0].children[0].innerHTML);
	currentTap.value = dataCd;
	
	pageMove('/ai/stu/support/share/detail?from=list&shaBno='+hiddenshaBno);
		
}

</script>
<script>
<c:if test="${from eq 'remove'}">
	alert("삭제되었습니다.");
	location.replace();
</c:if>
</script>
<%@ include file="./share_js.jsp" %>
