package network
{
    import flash.events.ErrorEvent;
	import com.adobe.serialization.json.JSON;
	
    public final class RemoteErrorEvent extends ErrorEvent
    {
		private static const messages:Object = {
			bad_word: "A mensagem foi considerada ofensiva.",
			invalid_id: "Jogador desconectado."
		};
		
        public var message:String;
		
        public function RemoteErrorEvent(reason:String)
        {
			this.message = messages[reason];
            super(REMOTE_ERROR, false, false, JSON.encode(reason));
        }
		
		public static const REMOTE_ERROR:String = "remote_error";
    }
}
