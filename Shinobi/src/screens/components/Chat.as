package screens.components
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.net.URLRequestMethod;
	import flash.ui.Keyboard;
	import network.RemoteCall;
	import network.RemoteErrorEvent;
	
	public class Chat extends MovieClip
	{
		private var chatStatus:Boolean = false;
		
		public function Chat()
		{
			chat_open.addEventListener(MouseEvent.CLICK, onChatOpen);
			onChatOpen();
			
			message_send.addEventListener(MouseEvent.CLICK, onSend);
			message_input.addEventListener(KeyboardEvent.KEY_DOWN, function(event:KeyboardEvent):void
			{
				if (event.keyCode == Keyboard.ENTER)
					onSend();
			});
		}
		
		private function onChatOpen(event:MouseEvent = null):void
		{
			chatStatus = !chatStatus;
			if (chatStatus)
			{
				chat_open.arrow.rotation = 180;
				chat_open.arrow.x = 30 + chat_open.arrow.width;
				chat_open.arrow.y = 3 + chat_open.arrow.height;
				chat_open.y = -180;
				background.y = -167;
				message_history.visible = true;
			}
			else
			{
				chat_open.arrow.rotation = 0;
				chat_open.arrow.x = 30;
				chat_open.arrow.y = 3;
				chat_open.y = 0;
				background.y = 13;
				message_history.visible = false;
			}
		}
		
		private function onSend(event:Event = null):void
		{
			if (message_input.text.length > 0)
			{
				if (message_input.text.length > 55)
				{
					message_history.addMessage("Mensagem muito longa.", "warning");
					return;
				}
				
				var rc:RemoteCall = new RemoteCall(URLRequestMethod.POST, "chat", "send", {sender_id: "admin", message: message_input.text});
				
				rc.addEventListener(Event.COMPLETE, onResponseOk);
				rc.addEventListener(RemoteErrorEvent.REMOTE_ERROR, onResponseError);
				
				message_history.addMessage(message_input.text, "self");
				message_input.text = "";
			}
		}
		
		private function onResponseOk(event:Event):void
		{
			trace("OK");
		}
		
		private function onResponseError(event:RemoteErrorEvent):void
		{
			message_history.addMessage(event.message, "warning");
		}
	}
}