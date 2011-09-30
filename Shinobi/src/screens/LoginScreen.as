package screens 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import game.Player;

	public class LoginScreen extends Screen 
	{
		
		public function LoginScreen()
		{
			loginButton.addEventListener(MouseEvent.CLICK, onLogin);
			signupButton.addEventListener(MouseEvent.CLICK, onSignup);
		}
		
		private function onSignup(event:MouseEvent):void
		{
			changeScreen("Signup.swf");
		}
		
		private function onLogin(event:MouseEvent):void
		{
			var player:Player = new Player();
			player.initFromAuth(userField.text, passwordField.text);
			player.addEventListener(Player.INIT_COMPLETE, onLoginEnd);
		}
		
		private function onLoginEnd(event:Event):void
		{
			var player:Player = event.target as Player;
			if (player.valid)
			{
				trace("OK");
			}
			else
			{
				trace("NOT OK");
				userField.text = "";
				passwordField.text = "";
				fillUser(null);
				fillPassword(null);
			}
		}
		
	}

}