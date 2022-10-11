<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">






<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	
	<!-- ================================================= -->
	<!-- 카드 시작 -->
	<!-- ================================================= -->
	<div class="card">
	
	<!-- ================================================= -->
	<!-- 카드바디 시작 -->
	<!-- ================================================= -->
		<div class="card-body">
			<!-- ================================================= -->
			<!-- 검색바 시작 -->
			<!-- ================================================= -->
			<div class="input-group mb-3 justify-content-end">
			 	<select class="form-control col-md-2" name="searchType" id="searchType">
			 		<option value=""  >주차 선택</option>
					<option value="1" ${param.searchType=='t' ? "selected":"" }>1주차</option>
					<option value="2" ${param.searchType=='w' ? "selected":"" }>2주차</option>
					<option value="3" ${param.searchType=='c' ? "selected":"" }>3주차</option>	
				</select>
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
								1주차 강의자료
							</button>
						</h5>
					</div>
					<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion" style="">
						<div class="card-body">
							<p> Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p>
							<!-- ================================================= -->
							<!-- 버튼 시작 -->
							<!-- ================================================= -->
							<div class="row justify-content-end mt-1">
								<button class="btn btn-outline-primary" type="button" onclick="">수정</button>&nbsp;&nbsp;
								<button class="btn btn-outline-danger" type="button" onclick="f_alert();">삭제</button>&nbsp;&nbsp;
							</div>
							<!-- ================================================= -->
							<!-- 버튼 끝 -->
							<!-- ================================================= -->
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								2주차 강의자료
							</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
						<div class="card-body">
							<p>Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
							<!-- ================================================= -->
							<!-- 버튼 시작 -->
							<!-- ================================================= -->
							<div class="row justify-content-end mt-1">
								<button class="btn btn-outline-primary" type="button" onclick="">수정</button>&nbsp;&nbsp;
								<button class="btn btn-outline-danger" type="button" onclick="f_alert();">삭제</button>&nbsp;&nbsp;
							</div>
							<!-- ================================================= -->
							<!-- 버튼 끝 -->
							<!-- ================================================= -->
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								3주차 강의자료
							</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
						<div class="card-body">
							<p>
							<p>Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-tabhetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
							<!-- ================================================= -->
							<!-- 버튼 시작 -->
							<!-- ================================================= -->
							<div class="row justify-content-end mt-1">
								<button class="btn btn-outline-primary" type="button" onclick="">수정</button>&nbsp;&nbsp;
								<button class="btn btn-outline-danger" type="button" onclick="f_alert();">삭제</button>&nbsp;&nbsp;
							</div>
							<!-- ================================================= -->
							<!-- 버튼 끝 -->
							<!-- ================================================= -->
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- ================================================= -->
		<!-- 아코디언 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 등록 버튼 시작 -->
		<!-- ================================================= -->
		<div class="row justify-content-end mt-2 mr-2">
			<button class="btn btn-outline-primary" type="button"onclick="">자료등록</button>
		</div>
		<!-- ================================================= -->
		<!-- 등록 버튼 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 페이지네이션 시작 -->
		<!-- ================================================= -->
		<!-- ================================================= -->
		<!-- 페이지네이션 끝 -->
		<!-- ================================================= -->
		
	</div> 
	<!-- ================================================= -->
	<!-- 카드바디 끝 -->
	<!-- ================================================= -->
	
	
	</div>
	<!-- ================================================= -->
	<!-- 카드 끝 -->
	<!-- ================================================= -->
</div>







</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->