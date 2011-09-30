package network
{
    import flash.events.ErrorEvent;
	import com.adobe.serialization.json.JSON;

    public final class RemoteErrorEvent extends ErrorEvent
    {
        public var reason:Object;

        public function RemoteErrorEvent(reason:Object)
        {
            this.reason = reason;
            super(REMOTE_ERROR, false, false, JSON.encode(reason));
        }
		
		public static const REMOTE_ERROR:String = "remote_error";
    }
}
