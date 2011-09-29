package 
{
	import flash.display.Scene;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Security;
	import screens.SceneLoader;
	import network.RemoteCall;
	
	public class Main extends Sprite
	{
		public function Main():void
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			stage.
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			Security.allowDomain(RemoteCall.ADDRESS);
			Security.loadPolicyFile(RemoteCall.ADDRESS + "crossdomain.xml");
			
			var ldr:SceneLoader = new SceneLoader("Login.swf");
			ldr.x = 0;
			ldr.y = 0;
			addChild(ldr);
		}
		
	}
	
}