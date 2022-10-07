<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="main-content-jsp">
    
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->
	<div class="row">
	
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-header">
					<h2><i class="fas fa-tasks"></i>&nbsp;&nbsp;최근 공지사항</h2>
				</div>
				<div class="card-body">
					

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lnList }">
								<tr>
									<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${lnList }" var="list">
								<tr style='font-size: 0.85em;'>
									<td>${list.lecNoticeNo }</td>
									<td>${list.title}</td>
									<td><fmt:formatDate value="${list.cdate }" pattern="yyyy-MM-dd"/></td>
									<td>${list.viewCnt }</td>
					
								</tr>
							</c:forEach>
						</tbody>
					</table>

				
				</div>
			</div>
		</div>


		<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-header">
					<h2><i class="fas fa-question"></i>&nbsp;&nbsp;답변이 필요한 질문</h2>
				</div>
				<div class="card-body">
					

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lqList } }">
							<!-- 리플갯수가 0일때만 목록을 가져와야됨!!!!!!!!!!!!!!! -->
								<tr>
									<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${lqList }" var="qna">
								<tr style='font-size: 0.85em;'>
									<td>${list.lecNoticeNo }</td>
									<td>${list.title}</td>
									<td><fmt:formatDate value="${list.cdate }" pattern="yyyy-MM-dd"/></td>
									<td>${list.viewCnt }</td>
					
								</tr>
							</c:forEach>
						</tbody>
					</table>

				
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
			<div class="card">
				<div class="card-header">
					<h2><i class="fas fa-clipboard-list"></i>&nbsp;&nbsp;최근 과제</h2>
				</div>
				<div class="card-body">
					

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lnList }">
								<tr>
									<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${lnList }" var="list">
								<tr style='font-size: 0.85em;'>
									<td>${list.lecNoticeNo }</td>
									<td>${list.title}</td>
									<td><fmt:formatDate value="${list.cdate }" pattern="yyyy-MM-dd"/></td>
									<td>${list.viewCnt }</td>
					
								</tr>
							</c:forEach>
						</tbody>
					</table>

				
				</div>
			</div>
		</div>
		
		
		
		
		
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-header">
					<h2><i class="fas fa-calendar-check"></i>&nbsp;&nbsp;일정</h2>
				</div>
				<div class="card-body">
					

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lnList }">
								<tr>
									<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${lnList }" var="list">
								<tr style='font-size: 0.85em;'>
									<td>${list.lecNoticeNo }</td>
									<td>${list.title}</td>
									<td><fmt:formatDate value="${list.cdate }" pattern="yyyy-MM-dd"/></td>
									<td>${list.viewCnt }</td>
					
								</tr>
							</c:forEach>
						</tbody>
					</table>

				
				</div>
			</div>
		</div>

		
		
	</div> 
	<!-- ================================================= -->
	<!-- 본문2 끝 -->
	<!-- ================================================= -->
		
		
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->