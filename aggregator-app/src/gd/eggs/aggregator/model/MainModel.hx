package gd.eggs.aggregator.model;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.Lib;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.net.URLRequestHeader;
import flash.net.URLVariables;

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
	inline static var ASANA_APP_KEY:String = "10257151362570";
	inline static var ASANA_SECRET:String = "ab577f9652ab6628df41b8733f8accab";
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
		
		//client_id - required The Client ID uniquely identifies the application making the request.
		//redirect_uri - required The URI to redirect to on success or error. This must match the Redirect URL specified in the application settings.
		//response_type - required Must be one of either code (if using the Authorization Code Grant flow) or token (if using the I
		
		var _request:URLRequest = new URLRequest();
		var client_id:URLRequestHeader = new URLRequestHeader('client_id', ASANA_APP_KEY);
		var redirect_uri:URLRequestHeader = new URLRequestHeader('redirect_uri', 'http://task.eggs.gd');
		var response_type:URLRequestHeader = new URLRequestHeader('response_type', 'code');
		
		_request.requestHeaders = [client_id, redirect_uri, response_type];
		_request.url = "https://www.dropbox.com/1/oauth2/authorize";
		
		var vars = new URLVariables();
		vars.client_id = 'q1u7cqfy3s01j6g';
		//vars.redirect_uri = 'http://localhost';
		vars.response_type = 'code';
		
		_request.data = vars;
		
		_loader.addEventListener(Event.COMPLETE, onLoaderComplete);
		_loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
		//_loader.load(_request);
		Lib.getURL(_request);
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