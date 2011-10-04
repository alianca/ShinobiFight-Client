package screens.components 
{
	import flash.display.MovieClip;
	
	public class EnemyStatus extends MovieClip 
	{
		
		public function EnemyStatus() 
		{
		}
		
		public function setPlayer(player:Object):void
		{
			enemy_name.text = player.name;
			setLevel(player.level);
			enemy_hp.gotoAndStop(player.attributes.hp);
		}
		
		private function setLevel(level:int):void
		{
			enemy_level.value.label.text = level;
			enemy_level.gotoAndStop(level);
		}
	}

}