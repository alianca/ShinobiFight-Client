package network
{
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLRequestHeader;
    import flash.net.URLRequestMethod;
    import flash.events.EventDispatcher;
    import flash.utils.ByteArray;
    import com.adobe.serialization.json.JSON;
    import com.hurlant.crypto.symmetric.ECBMode;
    import com.hurlant.crypto.symmetric.AESKey;
    import com.hurlant.util.Hex;

    public class Authentication extends EventDispatcher
    {
        private var key:AESKey = new AESKey(Hex.toArray("e1f2d17e6083fdd6952cf32248b4e403\
                                                         e2a86c8912485b823414c73365e748d1"));
        public var authenticated:Boolean = false;
        public var userId:String;

        public function Authentication(username:String, password:String)
        {
            var authdata:String = username + ":" + password;
            var authbytes:ByteArray = new ByteArray();
            authbytes.writeUTFBytes(authdata);

            var ecb:ECBMode = new ECBMode(key);
            ecb.encrypt(authbytes);

            var token:String = Hex.fromArray(authbytes);
			
			var rc:RemoteCall = new RemoteCall(URLRequestMethod.POST, 'authentication', 'login', 
			{ 
				credentials: token
			});
			
            rc.addEventListener(Event.COMPLETE, handleResponse);
			rc.addEventListener(RemoteErrorEvent.REMOTE_ERROR, handleError);
        }

        private function handleResponse(event:Event):void
        {
            authenticated = true;
            userId = event.target.data;
            dispatchEvent(new Event(Event.COMPLETE));
        }
		
		private function handleError(event:RemoteErrorEvent):void
		{
			authenticated = false;
			userId = null;
			dispatchEvent(new Event(Event.COMPLETE));
		}
    }
}
