package network
{
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.events.EventDispatcher;
    import com.adobe.serialization.json.JSON;

    public class RemoteCall extends EventDispatcher
    {
        public static const ADDRESS:String = "http://127.0.0.1:8001/";

        public var data:Object;

        public function RemoteCall(method:String, controller:String, action:String, param:Object)
        {
            var request:URLRequest = new URLRequest();
            request.url = ADDRESS + controller + "/" + action;
            request.method = method;
			
            if (param)
            {
                if (method == URLRequestMethod.POST)
                    request.data = JSON.encode(param);
                else
                    request.data = queryString(param);
            }

            var loader:URLLoader = new URLLoader();
            loader.load(request);
            loader.addEventListener(Event.COMPLETE, handleResponse);
        }

        private function handleResponse(event:Event):void
        {
            var message:Object = JSON.decode(event.target.data);
            if (message.status == 'ok')
            {
                data = message.response;
                dispatchEvent(new Event(Event.COMPLETE));
            }
            else if (message.status == 'error')
            {
                dispatchEvent(new RemoteErrorEvent(message.reason));
            }
        }

        private function queryString(param:Object):String
        {
            var query:String = '';
            var first:Boolean = true;

            for (var k:String in param)
            {
                if (first)
                    first = false;
                else
                    query += '&';
                query += k + '=' + param[k];
            }

            return query;
        }
    }
}
