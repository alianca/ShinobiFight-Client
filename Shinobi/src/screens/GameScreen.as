package screens
{
	import game.Player;
	import flash.utils.setInterval;
	import flash.utils.clearInterval;
	
	public class GameScreen extends Screen
	{
		private var countdown_value:int = 12;
		private var countdown_interval;
		
		public function GameScreen() 
		{
			player_status.setPlayer({
				name: "Edric Garran",
				level: 42,
				attributes: {
					hp: 37,
					chk: 50,
					stm: 39,
					cog: 2
				}
			});
			
			enemy_status.setPlayer({
				name: "Cthulhu",
				level: 23,
				attributes: {
					hp: 42
				}
			});
			
			countdown_interval = setInterval(timeoutTick, 1000);
		}
		
		private function timeoutTick():void
		{
			countdown.container.value.text = countdown_value--;
			if (countdown_value < 0)
			{
				clearInterval(countdown_interval);
				timeOut();
			}
		}
		
		private function timeOut():void
		{
			countdown.visible = false;
		}
		
	}

}