package screens.components 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class SkillBar extends MovieClip
	{
		private const BAR_WIDTH:int = 425;
		
		private var basic:Array = [ new SkillSlot(), new SkillSlot() ];
		private var general:Array = [ new SkillSlot(), new SkillSlot(), new SkillSlot() ];
		private var clan:Array = [ new SkillSlot(), new SkillSlot(), new SkillSlot() ];
		private var gates:Array = [ new SkillSlot(), new SkillSlot(), new SkillSlot() ];
		
		public function SkillBar()
		{
			scroll_area.updateBar([ basic, general, clan, gates ]);
			addEventListener(MouseEvent.MOUSE_MOVE, onMove);
		}
		
		private function onMove(event:MouseEvent):void
		{
			if (scroll_area.width > BAR_WIDTH)
			{
				var position:Number = (event.stageX - this.x) / BAR_WIDTH;
				scroll_area.x = - (scroll_area.width - BAR_WIDTH) * position;
				if (scroll_area.x > 0) scroll_area.x = 0;
			}
		}
	}

}