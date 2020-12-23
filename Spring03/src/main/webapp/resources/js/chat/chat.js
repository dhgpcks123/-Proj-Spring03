
	// ##### 입장~~~!!
	let websocket;
	websocket = new WebSocket("ws://192.168.0.102/www/chat-ws");
// 		websocket = new WebSocket("ws://localhost/www/chat-ws");

	//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
	websocket.onopen = onOpen;
	websocket.onmessage = onMessage;
	
	// ##### 연결 되었습니다!
	function onOpen(){
		id = document.getElementById('id').value;
		websocket.send('바르고 고운 말을 사용합니다 : )');
		websocket.send( "[ "+ id + " ] 님 입장하셨습니다.");
	}
	
	// ##### 메세지 보내기 버튼 클릭!
	
	document.getElementById('send').addEventListener('click', function() {
		send();
	});
	
	function send(){
		id = document.getElementById("id").value;
		msg = document.getElementById("message").value;
		if(msg==null || msg ==''){
			return;
		}
		websocket.send(id + " ]  "+ msg);
		document.getElementById("message").value = "";
	}
	
	function onMessage(evt){
		data= evt.data;
		chatarea = document.getElementById("chatarea");
		chatarea.innerHTML = chatarea.innerHTML + "<br/>" +data
	}
	
	// ##### 연결을 해제합니다!
	document.getElementById("exit").addEventListener("click", function() {
		exitMsg();
		setTimeout(function(){			
			disconnect();
		}, 200);
		
	});
	function exitMsg(){
		id = document.getElementById("id").value;
		websocket.send( "[ "+ id + " ] 님 퇴장하셨습니다");
	}

	function disconnect(){
		websocket.close();
		location.href="main.jeju";
	}
