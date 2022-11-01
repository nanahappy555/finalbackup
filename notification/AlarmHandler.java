package kr.or.ddit.handler;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.dao.common.AlarmDAO;
import kr.or.ddit.dto.prof.LecOpenVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AlarmHandler extends TextWebSocketHandler {
	
	@Autowired
	private AlarmDAO alarmDAO;
	public void setAlarmDAO(AlarmDAO alarmDAO) {
		this.alarmDAO = alarmDAO;
	}


	//전체 세션
	private static List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	//개인
//	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	

	//클라이언트가 서버에 접속 성공시 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session); //리스트에 접속한 session들을 담음
		
	}

	
	//소켓에 메세지를 보냈을 때 호출
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		for(WebSocketSession single : sessions) {
			String memId = message.getPayload();
			int count = alarmDAO.selectAlarmUchkCount(memId);
			
			//리스트에 담긴 세션의 id와 메세지를 보내줄 세션의 id가 같고, uchkList가 0이 아닐 경우 메세지 전송
			if(single.getId().equals(session.getId()) && count != 0) {
				TextMessage sendMsg = new TextMessage(memId + "님 새 알림이 있습니다");
				single.sendMessage(sendMsg);
			}
		}
	}

	//연결이 종료됐을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//전체 세션리스트에서 세션 삭제 
		sessions.remove(session);
		
	}
}
