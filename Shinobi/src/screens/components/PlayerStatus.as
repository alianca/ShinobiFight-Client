package screens.components
{
	import flash.display.MovieClip;
	
	public class PlayerStatus extends MovieClip
	{
		
		public function PlayerStatus()
		{
		}
		
		public function setPlayer(player:Object):void
		{
			character_name.text = player.name;
			setLevel(player.level);
			bars.hp.gotoAndStop(player.attributes.hp);
			bars.chk.gotoAndStop(player.attributes.chk);
			bars.stm.gotoAndStop(player.attributes.stm);
			bars.cog.gotoAndStop(player.attributes.cog);
		}
		
		private function setLevel(level:int):void
		{
			player_level.value.label.text = level;
			player_level.gotoAndStop(level);
		}
		
	}

}