<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>


<script type="text/x-handlebars-template" id="uchk-list-template">
{{#each .}}
        	<a href="javascript:void(0);" class="list-group-item list-group-item-action uchk" style>
                <div class="notification-info">
                    <div class="notification-list-user-img"><img src="<%=request.getContextPath() %>/resources/bootstrap/assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                    <div class="notification-list-user-block"><span class="notification-list-user-name"><strong>{{prefix}}</strong></span>
                     <br>
                	{{alarmContent}}
                        <div class="notification-date">{{cdate}}</div>
                    </div>
                </div>
            </a>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="chk-list-template">
{{#each .}}
        	<a href="javascript:void(0);" class="list-group-item list-group-item-action chk" style="background-color:#ececec">
                <div class="notification-info">
                    <div class="notification-list-user-img"><img src="<%=request.getContextPath() %>/resources/bootstrap/assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                    <div class="notification-list-user-block"><span class="notification-list-user-name"><strong>{{prefix}}</strong></span>
                     <br>
                	{{alarmContent}}
                        <div class="notification-date">{{cdate}}</div>
                    </div>
                </div>
            </a>
{{/each}}
</script>


<script>
//Handlebars
function printData(dataArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(dataArr);	
	target.html(html);
}

</script>

<script>
//웹소켓
document.addEventListener('DOMContentLoaded', () => {
	var webSocket = new WebSocket("ws://192.168.141.12/<%=request.getContextPath()%>/ws-alarm");
	   
	webSocket.onopen = function(e){
		webSocket.send("${loginUser.memId}");
	}
	webSocket.onmessage = function(e){
// 		console.log(e.data);
		var alarmIcon = document.querySelector("#alarmIcon");
		alarmIcon.style.display = 'inline';
	}
	setInterval(function() {
		// 3초마다 클라이언트로 메시지 전송
		webSocket.send("${loginUser.memId}");
	}, 3000);
	
	

}); 
</script>


<script>
//notification list get & put
var alarmIcon = document.querySelector('#navbarDropdownMenuLink1');
alarmIcon.onclick = () => {
	var alarmIcon = document.querySelector("#alarmIcon");
	alarmIcon.style.display = 'none';
	
	//getList
	var uchkDiv = $('#uchk');
	var chkDiv = $('#chk');
	$.ajax({
		type: 'get',
		url: '<%=request.getContextPath()%>/alarm/getAlarmList',
		dataType: 'json',
		success: (rslt)=>{
// 			console.log(rslt);
			printData(rslt.uchkList,uchkDiv,$('#uchk-list-template'));
			
			printData(rslt.chkList,chkDiv,$('#chk-list-template'));
			
			var totalCount = rslt.uchkList.length + rslt.chkList.length;
			document.querySelector("#totalCount").innerHTML = ` 총 알림 갯수 ( `+totalCount+`개) `;
// 			if(rslt.uchkList.length == 0){
// 				var alarmIcon = document.querySelector("#alarmIcon");
// 				alarmIcon.style.display = 'none';
// 			}
			
		},
		error: (error)=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
	
	//check update
	setTimeout(function(){
		$.ajax({
			method: 'put',
			url: '<%=request.getContextPath()%>/alarm/updateCheck',
			dataType:'text',
			success: (rslt) => {
				console.log(rslt);
				var uchk = document.querySelectorAll('.uchk');
				for(var i = 0; i<uchk.length; i++){
					uchk[i].style.backgroundColor = '#ececec';
				}
				
				var alarmIcon = document.querySelector("#alarmIcon");
				alarmIcon.style.display = 'none';
				
			},
			error: (error) => {
				AjaxErrorSecurityRedirectHandler(error.status);
			}
			
		});
	}, 1000);
}
</script>

