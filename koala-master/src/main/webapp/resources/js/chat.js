    

     var wsocket;
    
  
    function connect() {
     
        wsocket = new WebSocket(
                "ws://localhost:8090/koala/chat-ws");
        
      
        wsocket.onopen = onOpen;
        wsocket.onmessage = onMessage;
        wsocket.onclose = onClose;
        
    }
    
    
    function disconnect() {
        wsocket.close();
    }
        
    
     
    function onOpen(evt) {
      //  appendMessage("연결되었습니다.");
      //alert("연결되었습니다");
    }
     
    function onMessage(evt) {
        var data = evt.data;
        if (data.substring(0, 4) == "msg:") {
        	appendRecvMessage(data.substring(4));
        }
    }
    
     
    function onClose(evt) {
      // appendMessage("연결을 끊었습니다.");
      alert("연결을 끊었습니다");
    }
    
  
   
    function send() {    	         
        var nickname = $("#chat_userID").val();    //"임영빈"
        console.log( "userid ="+nickname);      
        var msg = $("#message").val();       
        wsocket.send("msg:"+nickname+":" + msg);        
        $("#message").val("");
        
         
        //채팅창에 자신이 쓴 메시지 추가 
        appendSendMessage(msg);
        
    }

    
    //받는 메시지 채팅창에 추가
    function appendRecvMessage(msg) {          
        $("#chatMessageArea").append( "<div class='recv'>" + msg+"</div>");        
        scrollTop();
    }

    
    function  scrollTop(){
    	  var chatAreaHeight = $("#chatArea").height();         
          var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;  
          $("#chatArea").scrollTop(maxScroll);
    }
    
    //보내는 메시지 채팅창에 추가
    function appendSendMessage(msg) {     
        $("#chatMessageArea").append( "<div class='send' > " + msg+  "</div>"); 
        scrollTop();
        
    }

 
  
   $(document).ready( function(){    
	 	connect();
           $('#message').keypress(function(event){
		   var keycode =  event.keyCode  ;		            
		  
		       if(keycode == '13'){		    	  
		                send(); 
		       }  		 
		            event.stopPropagation();  // 상위로 이벤트 전파 막음
		        });
       
		        $('#sendBtn').click(function() { send(); });
		        //$('.enterBtn').click(function() { connect(); });
		        $('#exitBtn').click(function() { disconnect(); });
	   
	   
   });