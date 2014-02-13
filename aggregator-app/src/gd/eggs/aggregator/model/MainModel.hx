package gd.eggs.aggregator.model;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.net.URLRequestHeader;

/**
 * ...
 * @author Dukobpa3
 */

typedef Task = { name:String };
 
class MainModel extends EventDispatcher
{
	//=========================================================================
	//	STATIC, INLINE PARAMETERS
	//=========================================================================
	inline static var ASANA_API_KEY:String = "2k9Fibx.pdmzr6ZqIiQQsXszJVjiaBeO";
	inline static var ASANA_API_KEY_ENCODED:String = "Mms5RmlieC5wZG16cjZacUlpUVFzWHN6SlZqaWFCZU86";
	//=========================================================================
	//	PARAMETERS
	//=========================================================================
	var _loader:URLLoader;
	var _taskList:Array<Task>;
	//=========================================================================
	//	CONSTRUCTOR, INIT
	//=========================================================================
	public function new() 
	{
		super();
		
		_loader = new URLLoader();
		_loader.dataFormat = URLLoaderDataFormat.TEXT;
		_taskList = [];
	}
	//=========================================================================
	//	PUBLIC
	//=========================================================================
	public function init()
	{
		var _request:URLRequest = new URLRequest();
		var header:URLRequestHeader = new URLRequestHeader("Authorization", "Basic " + ASANA_API_KEY_ENCODED);
		_request.requestHeaders = [header];
		_request.url = "https://app.asana.com/api/1.0/users/me?opt_pretty";
		
		_loader.addEventListener(Event.COMPLETE, onLoaderComplete);
		_loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
		_loader.load(_request);
	}
	//=========================================================================
	//	PRIVATE
	//=========================================================================
	
	//=========================================================================
	//	HANDLERS
	//=========================================================================
	private function onLoaderComplete(e:Event):Void 
	{
		trace("Complete");
		trace(_loader.data);
	}
	
	private function onError(e:IOErrorEvent):Void 
	{
		trace("error");
		trace(e);
		trace(_loader.data);
	}
	//=========================================================================
	//	ACCESSORS
	//=========================================================================
}