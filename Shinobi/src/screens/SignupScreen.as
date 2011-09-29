package screens
{
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.net.URLRequestMethod;
	import network.RemoteCall;
	import network.RemoteErrorEvent;
	
	public class SignupScreen extends Screen
	{
		public function SignupScreen()
		{
			submitButton.addEventListener(MouseEvent.CLICK, onSubmit);
			termsLink.addEventListener(MouseEvent.CLICK, onTerms);
			loginLink.addEventListener(MouseEvent.CLICK, onLogin);
		}
		
		private function onSubmit(event:MouseEvent):void
		{
			if (passwordField.text != passwordConfirmationField.text) {
				trace("Passwords don't match");
				return;
			}
			
			if (emailField.text != emailConfirmationField.text) {
				trace("Emails don't match");
				return;
			}
			
			var phone:String = "";6
			if (phoneCodeField.text != "DDD")
				phone = "(" + phoneCodeField.text + ")" + phoneNumberField.text;
			
			var rc:RemoteCall = new RemoteCall(URLRequestMethod.POST, 'players', 'create',
			{
				player: {
					name: nameField.text,
					user: userField.text,
					password: passwordField.text,
					email: emailField.text,
					gender: genderField.text,
					birth: birthDayField.text + "/" +
						   birthMonthField.text + "/" +
						   birthYearField.text,
					phone: phone,
					accept_newsletter: acceptNewsletter.selected,
					accept_sms: acceptSms.selected,
					accept_terms: acceptTerms.selected
				}
			});
			rc.addEventListener(Event.COMPLETE, onSubmitEnd);
			rc.addEventListener(RemoteErrorEvent.REMOTE_ERROR, onError);
		}
		
		private function onError(event:RemoteErrorEvent):void
		{
			for (var key:String in event.reason)
				trace(key + ": " + event.reason[key]);
		}
		
		private function onSubmitEnd(event:Event):void
		{
			trace(event.target.data);
		}
		
		private function onTerms(event:MouseEvent):void
		{
			trace("Terms of Service");
		}
		
		private function onLogin(event:MouseEvent):void
		{
			changeScreen("Login.swf");
		}
	
	}

}