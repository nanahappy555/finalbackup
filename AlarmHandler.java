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
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	

	//클라이언트가 서버에 접속 성공시 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session); //리스트에 접속한 session들을 담음
		
		//연결하려는 클라이언트의 세션에서 id값 가져와 map에 id값으로 세션을 담는다
		Map<String, Object> sessionGet = session.getAttributes();
		String sessionId = (String) sessionGet.get("memId");
		userSessionsMap.put(sessionId, session);

		//세션확인
		log.debug("세션들sessions"+sessions);
		log.debug("유저세션맵userSessionsMap"+userSessionsMap);
	}

	//소켓에 메세지를 보냈을 때 호출
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for (WebSocketSession single : sessions) {
//				log.debug("받은메세지 원본"+message);
				String memId = message.getPayload();
//				log.debug("받은 메세지 String"+memId);
				
				int count = alarmDAO.selectAlarmUchkCount(memId);
				log.debug("카운트"+count);
				if(count != 0) {
					TextMessage sendMsg = new TextMessage(memId + "님 새 알림이 있습니다");
					single.sendMessage(sendMsg);
				}else {
//					single.sendMessage(message);
				}
		}
	}

	//연결이 종료됐을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//전체 세션리스트에서 세션 삭제 
		sessions.remove(session);
		
		Map<String, Object> sessionGet = session.getAttributes();
		String sessionId = (String) sessionGet.get("memId");
		userSessionsMap.remove(sessionId, session);
		
		//세션확인
		log.debug("세션들sessions"+sessions);
		log.debug("유저세션맵userSessionsMap"+userSessionsMap);
	}
}
