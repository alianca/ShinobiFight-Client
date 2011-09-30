package screens
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import network.RemoteCall;
	
	public class SceneLoader extends Sprite
	{
		public static const SWF_ADDRESS:String = RemoteCall.ADDRESS;
		
		public var loader:Loader = new Loader();
		public var progress:ProgressMeter = new ProgressMeter();
		
		public function SceneLoader(defaultScene:String)
		{
			progress.x = 349;
			progress.y = 239;
			load(defaultScene);
		}
		
		public function load(file:String):void
		{
			if (loader.parent == this)
				removeChild(loader);
			
			progress.setMeter(0);
			addChild(progress);
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onSwfLoaded);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onSwfProgress);
			loader.load(new URLRequest(getPath(file)));
		}
		
		private function onSwfLoaded(event:Event):void
		{
			removeChild(progress);
			loader.content.addEventListener(Screen.CHANGE_SCREEN, onChangeScreen);
			addChild(loader);
		}
		
		private function onSwfProgress(event:ProgressEvent):void
		{
			var percentage:int = event.bytesLoaded / event.bytesTotal * 100;
			progress.setMeter(percentage);
		}
		
		private function onChangeScreen(event:Event):void
		{
			load(event.target.nextScreen);
		}
		
		private function getPath(fileName:String):String
		{
			return SWF_ADDRESS + "swf/" + fileName;
		}
	}
}