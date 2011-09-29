package screens 
{
	import com.adobe.crypto.SHA1;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class ProgressMeter extends MovieClip
	{
		private var bar:Sprite = new Sprite();
		
		public function ProgressMeter()
		{
			// trocar pelo MovieClip correto
			graphics.beginFill(0x000000);
			graphics.drawRect(0, 0, 102, 20);1
			graphics.endFill();
			
			bar.x = 1;
			bar.y = 1;
			addChild(bar);
		}
		
		public function setMeter(percentage:int):void
		{
			// trocar pela atualização do MovieClip
			bar.graphics.beginFill(0xffffff);
			bar.graphics.drawRect(0, 0, percentage, 18);
			bar.graphics.endFill();
		}
	
	}

}