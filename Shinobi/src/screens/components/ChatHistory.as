package screens.components 
{
	import adobe.utils.CustomActions;
	import flash.display.MovieClip;
	import flash.filters.GlowFilter;
	import fl.events.ScrollEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class ChatHistory extends MovieClip 
	{
		private const HEIGHT_ON_SCREEN:int = 170;
		private const LINE_HEIGHT:int = 17;
		
		private var message_count:int = 0;
		private var formats:Object = {
			"self": new TextFormat(),
			"enemy": new TextFormat(),
			"server": new TextFormat(),
			"warning": new TextFormat(),
			"admin": new TextFormat()
		};
		
		public function ChatHistory() 
		{
			initializeFormats();
			
			scroll_bar.addEventListener(ScrollEvent.SCROLL,
			function(event:ScrollEvent):void
			{
				message_area.y = -event.position * LINE_HEIGHT + 6;
			});
		}
		
		public function addMessage(message:String, type:String):void
		{
			var line:TextField = createChatLine(message, type);
			line.y = message_count++ * LINE_HEIGHT;
			message_area.addChild(line);
			message_area.height = Math.max(message_count * LINE_HEIGHT, HEIGHT_ON_SCREEN);
			updateScrollbar();
		}
		
		private function initializeFormats():void
		{
			for (var type:String in formats)
			{
				formats[type].font = "Tahoma";
				formats[type].size = 11;
			}
			
			formats["self"].color = 0xffffff;
			formats["enemy"].color = 0x83abcb;
			formats["server"].color = 0x62e943;
			formats["warning"].color = 0xfe7777;
			formats["admin"].color = 0xfff000;
			formats["admin"].underline = true;
		}
		
		private function createChatLine(message:String, type:String):TextField
		{
			var tf:TextField = new TextField();
			tf.text = message;
			tf.width = message_area.width;
			tf.height = LINE_HEIGHT;
			tf.x = 0;
			tf.filters = [ new GlowFilter(0x000000, 0.9, 2, 2, 2) ];
			tf.selectable = false;
			tf.setTextFormat(formats[type]);
			return tf;
		}
		
		private function updateScrollbar():void
		{
			scroll_bar.lineScrollSize = LINE_HEIGHT;
			scroll_bar.minScrollPosition = 0;
			scroll_bar.maxScrollPosition = message_count - HEIGHT_ON_SCREEN / LINE_HEIGHT;
			if (scroll_bar.maxScrollPosition < 0) scroll_bar.maxScrollPosition = 0;
			scroll_bar.scrollPosition = scroll_bar.maxScrollPosition;
		}
	}
}