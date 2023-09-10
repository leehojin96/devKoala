package com.acorn.koala.webchat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ChatWebSocketHandler extends TextWebSocketHandler{
    //세션 리스트
    private List<WebSocketSession> websocketList = new ArrayList<WebSocketSession>();


    //클라이언트가 연결 
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	websocketList.add(session);
        
    	System.out.println(session.getId()+"님이 입장하셨습니다");
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        
    	System.out.println(session.getId()+"로부터"+ message.getPayload()+"받음");
        //모든 유저에게 메세지 출력
        for(WebSocketSession sess : websocketList){
            sess.sendMessage(new TextMessage(session.getId() + ":" + message.getPayload()));
        }
    }
    //클라이언트 연결을 끊었을 때 
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	websocketList.remove(session);
       
    }
    
}