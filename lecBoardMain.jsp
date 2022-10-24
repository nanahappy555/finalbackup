<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="noticeList" value="${dataMap.noticeList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-date-picker.css" >
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-example-style.css" >
</head>
<body>
	<!-- ================================================= -->
	<!-- MAIN-CONTENT -->
	<!-- ================================================= -->
	<div class="container-fluid">
		<!-- ================================================= -->
		<!-- 본문 1 -->
		<!-- ================================================= -->
		<div class="row">


			<!-- ================================================= -->
			<!-- 탭 -->
			<!-- ================================================= -->
			<div class="pills-regular col-xl-12">

				<!-- ================================================= -->
				<!-- 탭LIST 시작 -->
				<!-- ================================================= -->
				<ul class="menuMove nav nav-pills mb-1" id="pills-tab" role="tablist">
					<li class="nav-item"><a class="nav-link active show"
						id="lecMain-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/main.do')"
						data-toggle="pill" href="#lecMain"
						role="tab" aria-controls="home" aria-selected="true">메인</a></li>
						
					<li class="nav-item"><a class="nav-link show"
						id="lecNotice-tab"
						onclick="pageMove('<%=request.getContextPath() %>/mylecture/notice/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecNotice"
						role="tab" aria-controls="home" aria-selected="false">공지사항</a></li>
						
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecQna-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/qna/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecQna"
						role="tab" aria-controls="profile" aria-selected="false">질문게시판</a>
					</li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecSchedule-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/schedule/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecSchedule"
						role="tab" aria-controls="contact"	aria-selected="false">일정관리</a></li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecAssignment-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/assignment/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecAssignment"
						role="tab" aria-controls="contact"	aria-selected="false">과제관리</a></li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecAttend-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/attend/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecAttend"
						role="tab" aria-controls="contact" aria-selected="false">출결관리</a>
					</li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecMarks-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/marks/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecMarks"
						role="tab" aria-controls="contact" aria-selected="false">성적관리</a>
					</li>
					
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecMaterials-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/materials/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecMaterials"
						role="tab" aria-controls="contact" aria-selected="false">학습자료</a></li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecReviews-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/review/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecReviews"
						role="tab" aria-controls="contact" aria-selected="false">강의평가</a>
					</li>
				</ul>
				<!-- ================================================= -->
				<!-- 탭 LIST 끝 -->
				<!-- ================================================= -->
				
				<!-- ================================================= -->
				<!-- 탭 CONTENT 시작 -->
				<!-- ================================================= -->
<!-- 				 onload="pageChanged()"  -->
<!-- alert(this.contentWindow.location); -->
<!-- 				<iframe id="innerFrame" -->
<%-- 					src="<%=request.getContextPath()%>/prof/lec/index.do"frameborder="0" --%>
<!-- 					scrolling="no" style="border:1px dotted red; overflow-x:hidden; width:100%;height:93%;"></iframe> -->

				<div class="tab-content" id="pills-tabContent">
					<!-- 탭 1 시작 -->
					<div class="tab-pane fade active show" id="lecMain" role="tabpanel" aria-labelledby="pills-lecMain-tab">
					
						<!-- ================================================= -->
						<!-- 본문 1 -->
						<!-- ================================================= -->
						<div class="row">
						
					        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="card" style="height:489px;">
									<div class="card-body">
										<h2><i class="fas fa-tasks"></i>&nbsp;&nbsp;공지사항</h2>
										<!-- ================================================= -->
										<!-- 검색바 시작 -->
										<!-- ================================================= -->
										<div class="input-group mb-3 justify-content-end">
											<select class="form-control col-md-2" name="searchType"
												id="searchType">
												<option value="">검색구분</option>
												<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
												<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
												<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>
								
											</select>
											<!-- keyword -->
											<input class="form-control col-md-3" type="text" name="keyword"
												placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
												class="input-group-append">
												<button class="btn btn-primary btn-sm" type="button"
													id="searchBtn" onclick="list_go(1);">
													<i class="fa fa-fw fa-search"></i>
												</button>
											</span>
										</div>
										<!-- ================================================= -->
										<!-- 검색바 끝 -->
										<!-- ================================================= -->
										<table class="table table-hover">
											<thead>
												<tr>
													<th>글번호</th>
													<th>제목</th>
													<th>날짜</th>
													<th>조회수</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty noticeList }">
													<tr>
														<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
													</tr>
												</c:if>
												<c:forEach items="${noticeList }" var="notice">
													<tr>
														<td>${notice.lecNoticeNo }</td>
														<td>${notice.title}</td>
														<td><fmt:formatDate value="${notice.cdate }" pattern="yyyy-MM-dd"/></td>
														<td>${notice.viewCnt }</td>
										
													</tr>
												</c:forEach>
											</tbody>
										</table>
					
										<!-- ================================================= -->
										<!-- 등록 버튼 시작 -->
										<!-- ================================================= -->
										<div class="row justify-content-end mt-2 mr-2">
											<button class="btn btn-outline-primary" type="button"
												onclick="OpenWindow('<%=request.getContextPath()%>/mylecture/notice/registForm','강의 공지사항 작성',600,600);">작성하기</button>
										</div>
										<!-- ================================================= -->
										<!-- 등록 버튼 끝 -->
										<!-- ================================================= -->
										<!-- ================================================= -->
										<!-- 페이지네이션 시작 -->
										<!-- ================================================= -->
										<div class="row justify-content-center">
										<%@ include file="/WEB-INF/views/include/pagination.jsp" %>
<!-- 											<nav aria-label="Page navigation example"> -->
<!-- 												<ul class="pagination"> -->
<!-- 													<li class="page-item"><a class="page-link" href="#" -->
<!-- 														aria-label="Previous"> <span aria-hidden="true">«</span> <span -->
<!-- 															class="sr-only">Previous</span> -->
<!-- 													</a></li> -->
<!-- 													<li class="page-item active"><a class="page-link" href="#">1</a> -->
<!-- 													</li> -->
<!-- 													<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 													<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 													<li class="page-item"><a class="page-link" href="#" -->
<!-- 														aria-label="Next"> <span aria-hidden="true">»</span> <span -->
<!-- 															class="sr-only">Next</span> -->
<!-- 													</a></li> -->
<!-- 												</ul> -->
<!-- 											</nav> -->
										</div>
										<!-- ================================================= -->
										<!-- 페이지네이션 끝 -->
										<!-- ================================================= -->
									</div>
								</div>
							</div>
					
					
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="card" style="height:489px;">
									<div class="card-body">
									<h2><i class="fas fa-question"></i>&nbsp;&nbsp;질문게시판</h2>
									
										<!-- ================================================= -->
										<!-- 검색바 시작 -->
										<!-- ================================================= -->
										<div class="input-group mb-3 justify-content-end">
											<select class="form-control col-md-2" name="searchType"
												id="searchType">
												<option value="">검색구분</option>
												<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
												<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
												<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>
								
											</select>
											<!-- keyword -->
											<input class="form-control col-md-3" type="text" name="keyword"
												placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
												class="input-group-append">
												<button class="btn btn-primary btn-sm" type="button"
													id="searchBtn" onclick="list_go(1);">
													<i class="fa fa-fw fa-search"></i>
												</button>
											</span>
										</div>
										<!-- ================================================= -->
										<!-- 검색바 끝 -->
										<!-- ================================================= -->
										<table class="table table-hover">
											<thead>
												<tr>
													<th scope="col">글번호</th>
													<th scope="col">제목</th>
													<th scope="col">내용</th>
													<th scope="col">작성자</th>
													<th scope="col">날짜</th>
													<th scope="col">조회수</th>
												</tr>
											</thead>
											<tbody>
												<tr>
										     		<td>1</td>
										     		<td class="table-title">
														<c:if test="${qna.secret ne '1' }">		
															<span class="nav-item">			
																<i class="fas fa-lock"></i>&nbsp;
															</span>
														</c:if>
											     		<c:if test="${qna.replycnt ne 0 }">		
															<span class="nav-item">															
																<span class="text-success">[답변완료]</span>&nbsp;
															</span>
														</c:if>
														<c:if test="${qna.replycnt eq 0}">		
															<span class="nav-item">															
																<span class="text-warning">[답변대기중]</span>&nbsp;
															</span>
														</c:if>
													<!-- 유저가 학생일 경우 비밀글은 클릭하지 못하는 c:if문이 필요함. a태그만 감싸려면 지저분한데..링크 끊는 속성이 없을까? -->
													<!-- a말고 쓸수 있는거 고민해보기.. -->
													<!-- href="javascript:;" 이거는 링크자체가 활성화 되니까 내가 원하는게 아님 -->
													<!-- href="javascript:void(0);" 이거는 유효성 오류가 생길수있다고 함 -->
										     		<a ${member.memclass ne 2? 'href="http://www.naver.com" target="_blank"' : '' }>
											     		이거비밀글이지롱................
										     		</a>
										     		
										     		</td>
										     		<td>안녕안녕</td>
										     		<td>안녕아녕</td>
										     		<td>ㅇ안녕</td>
										     		<td>500</td>
										     	</tr>
										     	<tr class=" ">
										     		<td>1</td>
										     		<td class="table-title">
														<span class="nav-item">															
															<span class="text-warning">[답변대기중]</span>&nbsp;
														</span>
										     		안녕
										     		</td>
										     		<td>안녕못함</td>
										     		<td>안녕아녕아녕</td>
										     		<td>ㅇ안녕ㅋㅋ</td>
										     		<td>50000</td>
										     	</tr>
										     	<tr class=" ">
										     		<td>1</td>
										     		<td class="table-title">
														<span class="nav-item">															
															<span class="text-warning">[답변대기중]</span>&nbsp;
														</span>
										     		안녕
										     		</td>
										     		<td>안녕못함</td>
										     		<td>안녕아녕아녕</td>
										     		<td>ㅇ안녕ㅋㅋ</td>
										     		<td>50000</td>
										     	</tr>
										     	<tr class=" ">
										     		<td>1</td>
										     		<td class="table-title">
														<span class="nav-item">															
															<span class="text-warning">[답변대기중]</span>&nbsp;
														</span>
										     		안녕
										     		</td>
										     		<td>안녕못함</td>
										     		<td>안녕아녕아녕</td>
										     		<td>ㅇ안녕ㅋㅋ</td>
										     		<td>50000</td>
										     	</tr>
											</tbody>
										</table>
					
										<!-- ================================================= -->
										<!-- 등록 버튼 시작 -->
										<!-- ================================================= -->
										<div class="row justify-content-end mt-2 mr-2">
											<button class="btn btn-outline-primary" type="button"
												style="visibility:${member.memclass eq 2 ? 'visible' : 'hidden'};" onclick="">질문등록</button>
										</div>
										<!-- ================================================= -->
										<!-- 등록 버튼 끝 -->
										<!-- ================================================= -->
										<!-- ================================================= -->
										<!-- 페이지네이션 시작 -->
										<!-- ================================================= -->
										<div class="row justify-content-center">
											<nav aria-label="Page navigation example">
												<ul class="pagination">
													<li class="page-item"><a class="page-link" href="#"
														aria-label="Previous"> <span aria-hidden="true">«</span> <span
															class="sr-only">Previous</span>
													</a></li>
													<li class="page-item active"><a class="page-link" href="#">1</a>
													</li>
													<li class="page-item"><a class="page-link" href="#">2</a></li>
													<li class="page-item"><a class="page-link" href="#">3</a></li>
													<li class="page-item"><a class="page-link" href="#"
														aria-label="Next"> <span aria-hidden="true">»</span> <span
															class="sr-only">Next</span>
													</a></li>
												</ul>
											</nav>
										</div>
										<!-- ================================================= -->
										<!-- 페이지네이션 끝 -->
										<!-- ================================================= -->					
									
									</div>
								</div>
							</div>
					
					
					
							
						</div> 
						<!-- ================================================= -->
						<!-- 본문1 끝 -->
						<!-- ================================================= -->
					
						<!-- ================================================= -->
						<!-- 본문 2 -->
						<!-- ================================================= -->
						<div class="row">
						
					        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="card" style="height:489px;">
									<div class="card-body">
									<h2><i class="fas fa-clipboard-list"></i>&nbsp;&nbsp;과제관리</h2>
									
										<!-- ================================================= -->
										<!-- 검색바 시작 -->
										<!-- ================================================= -->
										<div class="input-group mb-3 justify-content-end">
											<select class="form-control col-md-2" name="searchType"
												id="searchType">
												<option value="">검색구분</option>
												<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
												<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
												<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>
								
											</select>
											<!-- keyword -->
											<input class="form-control col-md-3" type="text" name="keyword"
												placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
												class="input-group-append">
												<button class="btn btn-primary btn-sm" type="button"
													id="searchBtn" onclick="list_go(1);">
													<i class="fa fa-fw fa-search"></i>
												</button>
											</span>
										</div>
										<!-- ================================================= -->
										<!-- 검색바 끝 -->
										<!-- ================================================= -->
					
										<table class="table table-hover">
											<thead>
												<tr>
													<th scope="col">글번호</th>
													<th scope="col">제목</th>
													<th scope="col">작성자</th>
													<th scope="col">날짜</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td class="table-title">제출합니다제출합니다제출합니다제출합니다제출합니다제출합니다</td>
													<td>박건영</td>
													<td>2022.10.18</td>
												</tr>
												<tr>
													<td>2</td>
													<td class="table-title">제출합니다제출합니다제출합니다제출합니다제출합니다제출합니다</td>
													<td>박건영</td>
													<td>2022.10.18</td>
												</tr>
												<tr>
													<td>3</td>
													<td class="table-title">제출합니다제출합니다제출합니다제출합니다제출합니다제출합니다</td>
													<td>박건영</td>
													<td>2022.10.18</td>
												</tr>
												<tr>
													<td>4</td>
													<td class="table-title">제출합니다제출합니다제출합니다제출합니다제출합니다제출합니다</td>
													<td>박건영</td>
													<td>2022.10.18</td>
												</tr>
												<tr>
													<td>5</td>
													<td class="table-title">제목제목제목제목제목제목제목제목제목제목제목제목제목제목</td>
													<td>박건영</td>
													<td>2022.10.18</td>
												</tr>
											</tbody>
										</table>
										
										<!-- ================================================= -->
										<!-- 등록 버튼 시작 -->
										<!-- ================================================= -->
										<div class="row justify-content-end mt-2 mr-2">
											<button class="btn btn-outline-primary" type="button"
											onclick="OpenWindow('<%=request.getContextPath()%>/prof/lec/assignment/regist','과제 등록하기',800,550);">과제등록</button>
										</div>
										<!-- ================================================= -->
										<!-- 등록 버튼 끝 -->
										<!-- ================================================= -->
										<!-- ================================================= -->
										<!-- 페이지네이션 시작 -->
										<!-- ================================================= -->
										<div class="row justify-content-center">
											<nav aria-label="Page navigation example">
												<ul class="pagination">
													<li class="page-item"><a class="page-link" href="#"
														aria-label="Previous"> <span aria-hidden="true">«</span> <span
															class="sr-only">Previous</span>
													</a></li>
													<li class="page-item active"><a class="page-link" href="#">1</a>
													</li>
													<li class="page-item"><a class="page-link" href="#">2</a></li>
													<li class="page-item"><a class="page-link" href="#">3</a></li>
													<li class="page-item"><a class="page-link" href="#"
														aria-label="Next"> <span aria-hidden="true">»</span> <span
															class="sr-only">Next</span>
													</a></li>
												</ul>
											</nav>
										</div>
										<!-- ================================================= -->
										<!-- 페이지네이션 끝 -->
										<!-- ================================================= -->	
									
									</div>
								</div>
							</div>
							
							
							<!-- 일정 시작 -->
					        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="card" style="height:489px;">
									<div class="card-body">
										<h2><i class="fas fa-calendar-check"></i>&nbsp;&nbsp;일정</h2>
										<!-- ================================================= -->
										<!-- 등록칸 시작 -->
										<!-- ================================================= -->
										<div class="input-group mt-3 mb-4 justify-content-center align-items-center">
										
											<span style="font-size:1.2em;"><strong>구분</strong></span>&nbsp;&nbsp;
											<select class="form-control col-md-2" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
										  		<option value="">선택</option>
										  		<option value="mid">중간고사</option>
										  		<option value="fin">기말고사</option>
										  		<option value="mini">쪽지시험</option>
										  		<option value="assign">과제</option>
										  		
										  	</select>
											&nbsp;&nbsp;&nbsp;
											<span style="font-size:1.2em;"><strong>일시</strong></span>&nbsp;&nbsp;
											<div class="code-html">
										        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
										            <input type="text" id="datepicker-input" aria-label="Date-Time">
										            <span class="tui-ico-date"></span>
										        </div>
										        <div id="datepicker-div"  style="position: relative; background-color:white; z-index: 9999; margin-top: -1px;"></div>
										    </div>
										  	
											&nbsp;&nbsp;&nbsp;
											<span style="font-size:1.2em;"><strong>강의실</strong></span>&nbsp;&nbsp;
										 	<input type="text" class="form-control col-md-2" id="classroom" name="classroom" id="searchType" style="height:38px;">
										 	&nbsp;&nbsp;&nbsp;
											<button class="btn btn-sm btn-primary" type="button" onclick="f_regist(event)">등록</button>
										</div>
										<!-- ================================================= -->
										<!-- 등록칸 끝 -->
										<!-- ================================================= -->
										
									
									
									
										<!-- ================================================= -->
										<!-- 게시판 시작 -->
										<!-- ================================================= -->
										
											<table class="table table-hover">
												<thead>
													<tr>
														<th>종류</th>
														<th>일시</th>
														<th>강의실명</th>
														<th style="width:12%">수정</th>
														<th style="width:12%">삭제</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>중간고사</td>
														<td data-date="v_date1">2022-10-15</td>
														<td data-room="v_classroom1">BT031</td>
														<td>
															<button class="btn btn-outline-primary btn-sm m-1" type="button" data-date="v_date1" data-room="v_classroom1"
																onclick="f_modify(event)">수정</button>
														</td>
														<td>
															<button class="btn btn-outline-danger btn-sm m-1" type="button" onclick="javascript:alert('삭제...');">삭제</button>
														</td>
													</tr>
													<tr>
														<td>과제</td>
														<td data-date="v_date2">2022-11-22</td>
														<td data-room="v_classroom2">BT000</td>
														<td>
															<button disabled class="btn btn-outline-primary btn-sm m-1" type="button" data-date="v_date2" data-room="v_classroom2"
																onclick="f_modify(event)">수정</button>
														</td>
														<td>
															<button disabled class="btn btn-outline-danger btn-sm m-1" type="button" onclick="javascript:alert('삭제...');">삭제</button>
														</td>
													</tr>
													<tr>
														<td>기말고사</td>
														<td data-date="v_date3">2022-12-10</td>
														<td data-room="v_classroom3">BT555</td>
														<td>
															<button class="btn btn-outline-primary btn-sm m-1" type="button" data-date="v_date3" data-room="v_classroom3"
																onclick="f_modify(event)">수정</button>
														</td>
														<td>
															<button class="btn btn-outline-danger btn-sm m-1" type="button" onclick="javascript:alert('삭제...');">삭제</button>
														</td>
													</tr>
								
													
												</tbody>
											</table>
														
														
											<!-- ================================================= -->
											<!-- 게시판 끝 -->
											<!-- ================================================= -->
											
									
											<!-- ================================================= -->
											<!-- 페이지네이션 시작 -->
											<!-- ================================================= -->
											<div class="row justify-content-center">
											      <nav aria-label="Page navigation example">
											         <ul class="pagination">
											            <li class="page-item">
											               <a class="page-link" href="#" aria-label="Previous">
											                  <span aria-hidden="true">«</span>
											                  <span class="sr-only">Previous</span>
											               </a>
											            </li>
											            <li class="page-item active">
											               <a class="page-link" href="#">1</a>
											            </li>
											            <li class="page-item">
											               <a class="page-link" href="#">2</a>
											            </li>
											            <li class="page-item">
											               <a class="page-link" href="#">3</a>
											            </li>
											            <li class="page-item">
											               <a class="page-link" href="#" aria-label="Next">
											                  <span aria-hidden="true">»</span>
											                  <span class="sr-only">Next</span>
											               </a>
											            </li>
											         </ul>
											      </nav>
											</div>
											<!-- ================================================= -->
											<!-- 페이지네이션 끝 -->
											<!-- ================================================= -->
								      
									   
									   
									</div>
								
								</div>
							</div>
							<!-- 일정 시작 -->
								
						</div>
						<!-- ================================================= -->
						<!-- 본문2 끝 -->
						<!-- ================================================= -->
				
							
							
					</div> 
					<!-- 탭 1 끝 -->
						
					<!-- 탭 2 시작 -->
					<div class="tab-pane fade" id="lecNotice" role="tabpanel" aria-labelledby="pills-lecNotice-tab">
						<p>텍스트2</p>
					</div>
					<!-- 탭 2 끝 -->
					<!-- 탭 3 시작 -->
					<div class="tab-pane fade" id="lecQna" role="tabpanel" aria-labelledby="pills-lecQna-tab">
						<p>텍스트3</p>
					</div>
					<!-- 탭 3 끝 -->
					<!-- 탭 4 시작 -->
					<div class="tab-pane fade" id="lecSchedule" role="tabpanel" aria-labelledby="pills-lecSchedule-tab">
						<p>텍스트4</p>
					</div>
					<!-- 탭 4 끝 -->
					<!-- 탭 5 시작 -->
					<div class="tab-pane fade" id="lecAssignment" role="tabpanel" aria-labelledby="pills-lecAssignment-tab">
						<p>텍스트5</p>
					</div>
					<!-- 탭 5 끝 -->
					<!-- 탭 6 시작 -->
					<div class="tab-pane fade" id="lecAttend" role="tabpanel" aria-labelledby="pills-lecAttend-tab">
						<p>텍스트6</p>
					</div>
					<!-- 탭 6 끝 -->
					<!-- 탭 7 시작 -->
					<div class="tab-pane fade" id="lecMarks" role="tabpanel" aria-labelledby="pills-lecMarks-tab">
						<p>텍스트7</p>
					</div>
					<!-- 탭 7 끝 -->
					<!-- 탭 8 시작 -->
					<div class="tab-pane fade" id="lecMaterials" role="tabpanel" aria-labelledby="pills-lecMaterials-tab">
						<p>텍스트8</p>
					</div>
					<!-- 탭 8 끝 -->
					<!-- 탭 9 시작 -->
					<div class="tab-pane fade" id="lecReviews" role="tabpanel" aria-labelledby="pills-lecReviews-tab">
						<p>텍스트9</p>
					</div>
					<!-- 탭 9 끝 -->
				</div>
				<!-- ================================================= -->
				<!-- 탭 CONTENT 끝 -->
				<!-- ================================================= -->

			</div>
			<!-- ================================================= -->
			<!-- 탭 끝 -->
			<!-- ================================================= -->
		</div>
		<!-- ================================================= -->
		<!-- 본문1 끝 -->
		<!-- ================================================= -->


	</div>
	<!-- ================================================= -->
	<!-- MAIN-CONTENT 끝 -->
	<!-- ================================================= -->

<script src="<%=request.getContextPath()%>/resources/js/tui-date-picker.js"></script>
<script>
function f_total(){
	
	document.getElementById('total').innerHTML = "점수가 없슈";
	
}
</script>

<script>
function f_test(){ 
	alert('박건영의 점수가 저장됐습니다.');
}
</script>




<script>
var datepicker = new tui.DatePicker('#datepicker-div', {
    date: new Date(),
    input: {
        element: '#datepicker-input',
        format: 'yyyy-MM-dd'
    },
    language:'ko'
});

//이 아래로 함수쓰면됨.
datepicker.setNull();
// datepicker.open();
</script>
<script>

function f_transFormat(date){
	let year = date.getFullYear();
	let month = date.getMonth() + 1;
	let day = date.getDate();
	
	return year + '-' + month + '-' + day;
}

function f_regist(e){
// 	var date = datepicker.getDate(); //Thu Oct 13 2022 22:01:13 GMT+0900 (한국 표준시) 
// 	var v_date = f_transFormat(date); // 2022-10-13
	
// // 	console.log(e.target);
// 	console.log(date);
// 	console.log(v_date);
	
	alert('콘솔로그에는 날짜가 있다');
	
	//셀렉트칸, 날짜, 강의실 => DB로 insert
	
}

function f_modify(e){
	console.log(e.target);
	var dataDate = e.target.getAttribute("data-date");
	var dataClassroom = e.target.getAttribute("data-room");
	var v_date = $('td[data-date='+dataDate+']').text(); //날짜
	var v_Classroom = $('td[data-room='+dataClassroom+']').text(); //강의실
	
	datepicker.open();
	datepicker.setDate(new Date(v_date));
	
	document.querySelector('#classroom').value = v_Classroom;
}
</script>

</body>