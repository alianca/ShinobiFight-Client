package screens.components 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Chat extends MovieClip 
	{
		private var chatStatus:Boolean = false;
		
		public function Chat() 
		{
			chat_open.addEventListener(MouseEvent.CLICK, onChatOpen);
			onChatOpen();
			
			message_send.addEventListener(MouseEvent.CLICK, onSend);
			message_input.addEventListener(KeyboardEvent.KEY_DOWN,
			function(event:KeyboardEvent):void
			{
				if (event.keyCode == Keyboard.ENTER) onSend();
			});
		}
		
		function onChatOpen(event:MouseEvent = null):void
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
		
		function onSend(event:Event = null):void
		{
			if (message_input.text.length > 0)
			{
				message_history.addMessage(message_input.text, "self");
				message_input.text = "";
			}
		}
		
	}

}