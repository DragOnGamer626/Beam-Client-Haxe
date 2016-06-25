package pro.beam.api.http;

import tink.Url;
import tink.core.Any;
import tink.core.Future;
import tink.core.Pair;
import tink.http.Method;
import tink.http.Header;
import tink.http.Request.IncomingRequest;
import tink.http.Request.IncomingRequestBody;
import tink.http.Request.IncomingRequestHeader;
import tink.http.StructuredBody;
import tink.url.Auth;
import tink.url.Host;

import pro.beam.api.BeamAPI;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamHttpClient
{
	@:protected var beam : BeamAPI;
	@:protected var handler : HttpCompleteResponseHandler;
	@:protected var cookieStore : IncomingRequestHeader;
	@:protected var request : IncomingRequest;
		
	public var userAgent(default, set) : String;
	public var oauthToken(default, set) : String;
	public var httpUserName(default, set) : String;
	public var httpPassword(default, set) : String;

	public function new(beam : BeamAPI, handler : HttpCompleteResponseHandler, ?oauthToken : String, httpUserName : String, httpPassword : String) 
	{
		this.beam = beam;
		this.handler = handler;
		
		checkConstructorParams(oauthToken, httpUserName, httpPassword);
		checkHttp(httpUserName, httpPassword);
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
	
	function checkHttp(httpUserName : String, httpPassword : String) : Void
	{
		if (httpUserName != null && httpPassword != null)
		{
			var cp : Auth = new Auth(httpUserName, httpPassword);
			var header : Header = new Header([{
				HeaderField.ofString("auth:" + Std.string(cp));
			}]);
						
			this.cookieStore = new IncomingRequestHeader(Method.HEAD, this.beam.uri, "1.1", header.fields); // CookieStore - Yayyyyyy!!!!
			this.request = new IncomingRequest("http://localhost", cookieStore, null);
		}
	}
	
	public function get<T>(path : String, type : Class<T>, args :  Array<Pair<String, Any>>) : Future<T>
	{
		return null;
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
	
	function executor<T>() : Future<T>
	{
		return null;
	}
	
	// This is how you make an ImmutableMap type thingy in Haxe (or at least, it's much easier than using a regular Map
	// and setting it ReadOnly. So Much RAAAAGGGGEEEE about this.
	public static function getArgumentsBuilder() : Array<Pair<String, Any>>
	{
		return new Array<Pair<String, Any>>();
	}
	
	public function printVars()
	{
		var http = "http.";
		trace(http + "oauthToken:" + oauthToken);
		trace(http + "httpUserName:" + httpUserName);
		trace(http + "httpPassword:" + httpPassword);
	}
}