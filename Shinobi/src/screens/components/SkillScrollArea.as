package screens.components 
{
	import flash.display.MovieClip;
	
	public class SkillScrollArea extends MovieClip 
	{
		private const SLOT_WIDTH:int = 45;
		
		private var separators:Array = [ new Separator(), new Separator(), new Separator() ];
		
		public function SkillScrollArea() 
		{
		}
		
		function updateBar(panels:Array):void
		{
			initializeSeparators(panels[0], panels[1], panels[2]);
			initializeTitles(panels[3]);
			for (var i:int = 0; i < panels.length; i++)
			{
				var shift:int = i > 0 ? separators[i-1].x : 0;
				for (var j:int = 0; j < panels[i].length; j++)
				{
					panels[i][j].x = shift + j * SLOT_WIDTH + 5;
					panels[i][j].y = 20;
					addChild(panels[i][j]);
				}
			}
		}
		
		private function initializeSeparators(basic:Array, general:Array, clan:Array):void
		{
			separators[0].x = basic.length * SLOT_WIDTH + 5;
			separators[1].x = separators[0].x + general.length * SLOT_WIDTH + 5;
			separators[2].x = separators[1].x + clan.length * SLOT_WIDTH + 5;
			for (var i:int = 0; i < separators.length; i++)
				addChild(separators[i]);
		}
		
		private function initializeTitles(gates:Array):void
		{
			var w:int = separators[2].x + gates.length * SLOT_WIDTH + 5;
			title_1.x = (separators[0].x - title_1.width) / 2;
			title_2.x = (separators[0].x + separators[1].x - title_2.width) / 2;
			title_3.x = (separators[1].x + separators[2].x - title_3.width) / 2;
			title_4.x = (separators[2].x + w - title_4.width) / 2;
			this.width = w;
		}
		
	}

}