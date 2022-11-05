<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="all-list-template">
<div class="row" style="position:relative; left:1%;">
	<h2 class="d-flex align-items-center"><i class="fas fa-pencil-alt"></i>&nbsp;&nbsp;일반학습법</h2>
	<!-- ================================================= -->
	<!-- 검색바 시작 -->
	<!-- ================================================= -->
	<div class="input-group mb-3 justify-content-end" style="width:85%;height:38px;">
		<select class="form-control col-md-1" name="perPageNum"
			id="allperPageNum" onchange="list_go_all(1);">
			{{#if (eq shareAllMap.pageMaker.cri.perPageNum '10')}}
			<option value="10" selected>정렬개수</option>
			{{else}}
			<option value="10" >정렬개수</option>
			{{/if}}
			{{#if (eq shareAllMap.pageMaker.cri.perPageNum '2')}}
			<option value="2" selected>2개씩</option>
			{{else}}
			<option value="2" >2개씩</option>
			{{/if}}
			{{#if (eq shareAllMap.pageMaker.cri.perPageNum '3')}}
			<option value="3" selected>3개씩</option>
			{{else}}
			<option value="3" >3개씩</option>
			{{/if}}
			{{#if (eq shareAllMap.pageMaker.cri.perPageNum '5')}}
			<option value="5" selected>5개씩</option>
			{{else}}
			<option value="5" >5개씩</option>
			{{/if}}
		</select> 
		<select class="form-control col-md-1" name="searchType"
			id="allsearchType">
			<option value="">검색구분</option>
			{{#if (eq shareAllMap.pageMaker.cri.searchType 't')}}
			<option value="t" selected>글제목</option>
			{{else}}
			<option value="t" >글제목</option>
			{{/if}}
			{{#if (eq shareAllMap.pageMaker.cri.searchType 'c')}}
			<option value="c" selected>글내용</option>
			{{else}}
			<option value="c" >글내용</option>
			{{/if}}
		</select>
		<!-- keyword -->
		<input  class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="{{shareAllMap.pageMaker.cri.keyword}}"/>
			<span class="input-group-append">
				<button class="btn btn-primary btn-sm" type="button" id="allsearchBtn" onclick="list_go_all(1);">
				<i class="fa fa-fw fa-search"></i>
				</button>
			</span>
	</div>
	<!-- ================================================= -->
	<!-- 검색바 끝 -->
	<!-- ================================================= -->
</div>
<table class="table table-hover">
<thead>
    <tr>
        <th style="width : 10%">글번호</th>
		<th style="width : 40%">제목</th>
		<th style="width : 15%">작성일자</th>
		<th style="width : 10%">추천수</th>
		<th style="width : 10%">조회수</th>
    </tr>
</thead>
<tbody>
	<!-- 추천10 -->
	{{#each recoAllList}}
	<tr class="evalRow" name="All" onclick="f_move(event);"
		style="color:#5969FF;">
		<td>BEST<div class="hiddenshaBno" style="display:none;">{{shaBno }}</div></td>
		<td class="table-title">{{title }}</td>
		<td>{{prettifyDate cdate }}</td>
		<td>{{recoNum }}</td>
		<td>{{viewCnt }}</td>
	</tr>
	{{/each}}
	{{#each shareAllMap.shareAllList}}
	<tr class="evalRow" name="All" onclick="f_move(event);">
		<td>{{shaBno }}
			<div class="hiddenshaBno" style="display:none;">{{shaBno }}</div>
		</td>
		<td class="table-title">{{title }}</td>
		<td>{{prettifyDate cdate }}</td>
		<td>{{recoNum }}</td>
		<td>{{viewCnt }}</td>
	</tr>
	{{/each}}
</tbody>
</table>

</script>

<script type="text/x-handlebars-template"  id="lec-list-template">
<div class="row" style="position:relative; left:1%;">
	<h2 class="d-flex align-items-center"><i class="fas fa-pencil-alt"></i>&nbsp;&nbsp;과목별학습법</h2>
	<!-- ================================================= -->
	<!-- 검색바 시작 -->
	<!-- ================================================= -->
	<div class="input-group mb-3 justify-content-end" style="width:85%;height:38px;">
		<select class="form-control col-md-1" name="perPageNum"
			id="lecperPageNum" onchange="list_go_lec(1);">
			{{#if (eq shareLecMap.pageMaker.cri.perPageNum '10')}}
			<option value="10" selected>정렬개수</option>
			{{else}}
			<option value="10" >정렬개수</option>
			{{/if}}
			{{#if (eq shareLecMap.pageMaker.cri.perPageNum '2')}}
			<option value="2" selected>2개씩</option>
			{{else}}
			<option value="2" >2개씩</option>
			{{/if}}
			{{#if (eq shareLecMap.pageMaker.cri.perPageNum '3')}}
			<option value="3" selected>3개씩</option>
			{{else}}
			<option value="3" >3개씩</option>
			{{/if}}
			{{#if (eq shareLecMap.pageMaker.cri.perPageNum '5')}}
			<option value="5" selected>5개씩</option>
			{{else}}
			<option value="5" >5개씩</option>
			{{/if}}
		</select> 
		<select class="form-control col-md-1" name="searchType"
			id="lecsearchType">
			<option value="">검색구분</option>
			{{#if (eq shareLecMap.pageMaker.cri.searchType 'l')}}
			<option value="l" >과목명</option>
			{{else}}
			<option value="l" >과목명</option>
			{{/if}}
			{{#if (eq shareLecMap.pageMaker.cri.searchType 't')}}
			<option value="t" >글제목</option>
			{{else}}
			<option value="t" >글제목</option>
			{{/if}}
			{{#if (eq shareLecMap.pageMaker.cri.searchType 'c')}}
			<option value="c" >글내용</option>
			{{else}}
			<option value="c" >글내용</option>
			{{/if}}
		</select>
		<!-- keyword -->
		<input  class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="{{shareLecMap.pageMaker.cri.keyword}}"/>
			<span class="input-group-append">
				<button class="btn btn-primary btn-sm" type="button" id="lecsearchBtn" onclick="list_go_lec(1);">
				<i class="fa fa-fw fa-search"></i>
				</button>
			</span>
	</div>
	<!-- ================================================= -->
	<!-- 검색바 끝 -->
	<!-- ================================================= -->
</div>
<table class="table table-hover">
<thead>
    <tr>
        <th style="width : 10%">글번호</th>
		<th style="width : 15%">과목명</th>
		<th style="width : 40%">제목</th>
		<th style="width : 15%">작성일자</th>
		<th style="width : 10%">추천수</th>
		<th style="width : 10%">조회수</th>
    </tr>
</thead>
<tbody>
	<!-- 추천10 -->
	{{#each recoLecList}}
	<tr class="evalRow" name="Lec" onclick="f_move(event);"
		style="color:#5969FF;">
		<td>BEST<div class="hiddenshaBno" style="display:none;">{{shaBno }}</div></td>
		<td>{{subjName }}</td>
		<td class="table-title">{{title }}</td>
		<td>{{prettifyDate cdate }}</td>
		<td>{{recoNum }}</td>
		<td>{{viewCnt }}</td>
	</tr>
	{{/each}}
	{{#each shareLecMap.shareLecList}}
	<tr class="evalRow" name="Lec" onclick="f_move(event);">
		<td>{{shaBno }} 
			<div class="hiddenshaBno" style="display:none;">{{shaBno }}</div>
		</td>
		<td>{{subjName }}</td>
		<td class="table-title">{{title }}</td>
		<td>{{prettifyDate cdate }}</td>
		<td>{{recoNum }}</td>
		<td>{{viewCnt }}</td>
	</tr>
	{{/each}}
</tbody>
</table>

</script>
<script type="text/x-handlebars-template"  id="all-pagination-template" >
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{else}}{{cri.page}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{allsignActive this}} ">
	<a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{else}}{{cri.page}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>	
</script>
<script type="text/x-handlebars-template"  id="lec-pagination-template" >
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{else}}{{cri.page}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{lecsignActive this}} ">
	<a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{else}}{{cri.page}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>	
</script>

<script>
function printData(dataArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(dataArr);	
	target.html(html);
}
/* pagination */
function printPagination(pageMaker,target,templateObject){
	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNumArray[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNumArray; 
	
	if (pageMaker.startPage == 1) {
		pageMaker.prev = false;
		pageMaker.prevPageNum=pageMaker.startPage-1;
	}else{
		pageMaker.prev = true;
		pageMaker.prevPageNum=pageMaker.cri.page;
	}
	
	if (pageMaker.endPage >= pageMaker.realEndPage) {
		pageMaker.next = false;
		
	}else{
		pageMaker.next = true;
		
	}
	
	pageMaker.nextPageNum=pageMaker.cri.page+1;
	
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html(html);
}

Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"allsignActive":function(pageNum){
		if(pageNum == allPage) return 'active';
	},
	"lecsignActive":function(pageNum){
		if(pageNum == lecPage) return 'active';
	}
});
Handlebars.registerHelper("inc", function(value, options){
	return parseInt(value) + 1;
});
Handlebars.registerHelper('if_eq', function(a, b, opts) {
    if(a == b) // Or === depending on your needs
        return opts.fn(this);
    else
        return opts.inverse(this);
});
Handlebars.registerHelper('eq', (a, b) => a == b);
</script>
<script>

var allPage=1;
var lecPage=1;

window.onload = () => {
	getAll("<%=request.getContextPath()%>/stu/support/share/allList?page=",allPage);
	getLec("<%=request.getContextPath()%>/stu/support/share/lecList?page=",lecPage);
	
	$('#allPagiUl').on('click','li a', function(e){
		
		allPage = $(this).attr("href");
		list_go_all(allPage);
		return false;
	});
	$('#lecPagiUl').on('click','li a', function(e){
		
		lecPage = $(this).attr("href");
		list_go_lec(lecPage);
		return false;
	});
}


var getAll = function(pageUrl,paramPage) {
	$.ajax({
		method: 'get',
		url: pageUrl+paramPage,
		dataType:'json',
		success: (rslt)=>{
// 			console.log(rslt.shareAllMap);
			
			printData(rslt,$('#allCardBody'),$('#all-list-template'));
			printPagination(rslt.shareAllMap.pageMaker,$('#allPagiUl'),$('#all-pagination-template'));
			
		},
		error: ()=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}


var getLec = function(pageUrl,paramPage) {
	$.ajax({
		method: 'get',
		url: pageUrl+paramPage,
		dataType:'json',
		success: (rslt)=>{
// 			console.log(rslt.shareLecMap);
			
			printData(rslt,$('#lecCardBody'),$('#lec-list-template'));
			printPagination(rslt.shareLecMap.pageMaker,$('#lecPagiUl'),$('#lec-pagination-template'));
		},
		error: ()=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function list_go_all(paramPage){
	
	var perPageNum = $('select[name="perPageNum"]').eq(0).val();
	var searchType = $('select[name="searchType"]').eq(0).val();
	var keyword = $('div.input-group>input[name="keyword"]').eq(0).val();
	
	var paramUrl = "<%=request.getContextPath()%>/stu/support/share/allList?page="+paramPage+"&perPageNum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword;
	
	$.ajax({
		method:'get',
		url:paramUrl,
		success: (rslt) => {
			console.log("ppp",rslt.shareAllMap.pageMaker.cri);
			printData(rslt,$('#allCardBody'),$('#all-list-template'));
			printPagination(rslt.shareAllMap.pageMaker,$('#allPagiUl'),$('#all-pagination-template'));
		},
		error: () => {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
	
}

function list_go_lec(paramPage){
// 	alert('렉 들어온다');
	var perPageNum = $('select[name="perPageNum"]').eq(1).val();
	var searchType = $('select[name="searchType"]').eq(1).val();
	var keyword = $('div.input-group>input[name="keyword"]').eq(1).val();
	
	var paramUrl = "<%=request.getContextPath()%>/stu/support/share/lecList?page="+paramPage+"&perPageNum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword;
	$.ajax({
		method:'get',
		url:paramUrl,
		success: (rslt) => {
			printData(rslt,$('#lecCardBody'),$('#lec-list-template'));
			printPagination(rslt.shareLecMap.pageMaker,$('#lecPagiUl'),$('#lec-pagination-template'));
		},
		error: () => {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>
