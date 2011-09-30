package screens
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Screen extends MovieClip
	{
		public var nextScreen:String = null;
		
		public function Screen()
		{
		}
		
		public function changeScreen(nextScreen:String):void
		{
			this.nextScreen = nextScreen;
			dispatchEvent(new Event(CHANGE_SCREEN));
		}
		
		public static const CHANGE_SCREEN:String = "change_screen";
	}

}