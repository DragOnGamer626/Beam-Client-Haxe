package pro.beam.api.http;

import tink.core.Future;
import pro.beam.api.BeamAPI;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamHttpClient
{
	var beam : BeamAPI;
	var handler : HttpCompleteResponseHandler;
	
	public var userAgent(default, set) : String;
	public var oauthToken(default, set) : String;
	public var httpUserName(default, set) : String;
	public var httpPassword(default, set) : String;

	public function new(beam : BeamAPI, handler : HttpCompleteResponseHandler, ?oauthToken : String, httpUserName : String, httpPassword : String) 
	{
		this.beam = beam;
		this.handler = handler;
		
		checkConstructorParams(oauthToken, httpUserName, httpPassword);
		// Cookie Store Code Here?
	}
	
	function set_userAgent(userAgent : String)
	{
		return this.userAgent = userAgent;
	}
	
	function set_oauthToken(oauthToken : String)
	{
		return this.oauthToken = oauthToken;
	}
	
	function set_httpUserName(httpUserName : String)
	{
		return this.httpUserName = httpUserName;
	}
	
	function set_httpPassword(httpPassword : String)
	{
		return this.httpPassword = httpPassword;
	}
	
	function checkConstructorParams(oauthToken : String, httpUserName : String, httpPassword : String) : Void
	{
		checkOauthToken(oauthToken);
		checkHttpUserName(httpUserName);
		checkHttpPassword(httpPassword);
	}
	
	function checkOauthToken(oauthToken : String) : Void
	{
		if (oauthToken != null)
			set_oauthToken(oauthToken);
	}
	
	function checkHttpUserName(httpUserName : String) : Void
	{
		if (httpUserName != null)
			set_httpUserName(httpUserName);
	}
	
	function checkHttpPassword(httpPassword : String) : Void
	{
		if (httpPassword != null)
			set_httpPassword(httpPassword);
	}
	
	public function get<T>(path : String, type : Class<T>, args : Map<String, Dynamic>) : Future<T>
	{
		return null; // Stub
	}
	
	public function post<T>(path : String, type : Class<T>, args : Array<Dynamic>) : Future<T>
	{
		return null; // Stub
	}
	
	public function put<T>(path : String, type : Class<T>, args : Array<Dynamic>) : Future<T>
	{
		return null; // Stub
	}
	
	public function patch<T>(path : String, type : Class<T>, args : Array<Dynamic>) : Future<T>
	{
		return null; // Stub
	}
	
	public function delete<T>(path : String, type : Class<T>, args : Array<Dynamic>) : Future<T>
	{
		return null; // Stub
	}
	
	// Stub
	
	public static function getArgumentsBuilder() : Map<String, Dynamic>
	{
		return new Map<String, Dynamic>();
	}
	
	public function printVars()
	{
		var http = "http.";
		trace(http + "oauthToken:" + oauthToken);
		trace(http + "httpUserName:" + httpUserName);
		trace(http + "httpPassword:" + httpPassword);
	}
}