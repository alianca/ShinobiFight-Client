package game
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.net.URLRequestMethod;
    import network.Authentication;
    import network.RemoteCall;
    import com.adobe.serialization.json.JSON;

    public class Player extends EventDispatcher
    {
        private var authentication:Authentication;

        public var playerId:String;
        public var valid:Boolean = false;
        public var name:String;
        public var clan:String;
        public var experience:int;
        public var level:int;
        public var attributes:PlayerAttributes;
        public var skills:Array;

        public function Player()
        {
        }

        public function initFromAuth(login:String, password:String):void
        {
            authentication = new Authentication(login, password);
            authentication.addEventListener(Event.COMPLETE, function(event:Event):void
            {
                if (event.target.authenticated)
                {
                    valid = true;
                    playerId = event.target.userId;
                    loadInfo();
                }
                else
                {
                    dispatchEvent(new Event(INIT_COMPLETE));
                }
            });
        }

        public function initFromId(playerId:String):void
        {
            this.playerId = playerId;
            loadInfo();
        }

        public function update():void
        {
			var player = this;
            var rc:RemoteCall = new RemoteCall(URLRequestMethod.GET, "players", "player_data", { player_id: playerId });
            rc.addEventListener(Event.COMPLETE, function(event:Event):void
            {
                var response:Object = event.target.data;
				
                player.name = response.name;
                player.experience = response.experience;
                player.level = response.level;
                player.clan = response.clan;
                player.attributes = response.attributes as PlayerAttributes;
                player.skills = response.skills as Array;

                dispatchEvent(new Event(UPDATE_COMPLETE));
            });
        }

        public function setClan(id:String):void
        {
            var rc:RemoteCall = new RemoteCall(URLRequestMethod.POST, "players", "set_clan", { player_id: playerId, clan_id: id });
            rc.addEventListener(Event.COMPLETE, function(event:Event):void
            {
                update();
                addEventListener(UPDATE_COMPLETE, function(event:Event):void
                {
                    dispatchEvent(new Event(SET_CLAN_COMPLETE));
                });
            });
        }

        public function loadInfo():void
        {
            update();
            addEventListener(UPDATE_COMPLETE, function(e:Event):void
            {
                dispatchEvent(new Event(INIT_COMPLETE));
            });
        }

        public static const INIT_COMPLETE:String = "init_complete";
        public static const UPDATE_COMPLETE:String = "update_complete";
        public static const SET_CLAN_COMPLETE:String = "set_clan_complete";
    }
}
