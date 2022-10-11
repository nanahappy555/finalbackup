<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">






<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	
	<div class="card">

		<div class="card-body">
			<!-- ================================================= -->
			<!-- 검색바 시작 -->
			<!-- ================================================= -->
			<div class="input-group mb-3 justify-content-end">
				<select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
						<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >정렬개수</option>
						<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>2개씩</option>
						<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>3개씩</option>
						<option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>5개씩</option>
					</select>
					<select class="form-control col-md-1" name="searchType" id="searchType">
						<option value=""  >검색구분</option>
					<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
					<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
					<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>	
																			
				</select>
				<!-- keyword -->
					<input  class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
				<span class="input-group-append">
					<button class="btn btn-primary btn-sm" type="button" 
							id="searchBtn" onclick="list_go(1);">
						<i class="fa fa-fw fa-search"></i>
					</button>
				</span>
			</div>
			<!-- ================================================= -->
			<!-- 검색바 끝 -->
			<!-- ================================================= -->
		<!-- ================================================= -->
		<!-- 아코디언 시작 -->
		<!-- ================================================= -->
		
		<div class="accrodion-regular">
			<div id="accordion">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
								강의 재밌어요
							</button>
						</h5>
					</div>
					<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion" style="">
						<div class="card-body">
							<p> Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								교수님재미없어요
							</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
						<div class="card-body">
							Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								귀에 쏙쏙 들어와요
							</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
						<div class="card-body">
							Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-tabhetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- ================================================= -->
		<!-- 아코디언 끝 -->
		<!-- ================================================= -->
	</div>
	</div>
</div>







</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->