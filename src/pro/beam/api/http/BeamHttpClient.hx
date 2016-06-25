package pro.beam.api.http;

import haxe.ds.Option;
import tink.Url;
import tink.concurrent.*;
import tink.core.*;
import tink.http.*;
import tink.url.*;

using tink.http.Request;
using tink.http.Header;
using tink.core.Outcome;
using tink.core.Callback;

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
	@:protected var cp : Auth;
	@:protected var request : IncomingRequest;
		
	public var userAgent(default, set) : String;
	public var oauthToken(default, set) : String;
	public var httpUserName(default, set) : String;
	public var httpPassword(default, set) : String;
	
	public var uriJson : String;

	public function new(beam : BeamAPI, handler : HttpCompleteResponseHandler, ?oauthToken : String, httpUserName : String, httpPassword : String) 
	{
		this.beam = beam;
		this.handler = handler;
		
		checkConstructorParams(oauthToken, httpUserName, httpPassword);
		buildCredentials(httpUserName, httpPassword); // Auth is same as CredentialsProvider in Java
		buildContext(); // IncomingRequestHeader seems to be like HttpClientContext but I might be wrong
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
	
	function buildCredentials(httpUserName : String, httpPassword : String) : Void
	{	
		if (httpUserName != null && httpPassword != null)
			cp = new Auth(httpUserName, httpPassword); // CredentialsProvider
		else
			cp = null;
	}
	
	function buildContext()
	{		
		var header : Header = new Header([{
			HeaderField.ofString("auth:" + Std.string(cp));
			HeaderField.ofString("path:" + this.beam.uri);
		}]); // I haven't fully tested, but this seems to be how I pump data into my Cookies
	
		this.cookieStore = new IncomingRequestHeader(Method.HEAD, this.beam.uri, "1.1", header.fields); // CookieStore - Yayyyyyy!!!!
		this.request = new IncomingRequest("http://localhost", cookieStore, null);
		
		var option : Option<String> = OutcomeTools.toOption(this.request.header.byName("path"));
		var uri = option.getParameters().toString();
		uri = uri.substring(1, uri.length - 1);
		
		this.uriJson = uri;
		
		//trace(cp.user + ":" + cp.password);
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
	
	function makeCallable<T>(request : IncomingRequest, type : Class<T>) : Callback<T>
	{
		return null; // Not sure how to implement this with Haxe. Callbacks seem to work weirdly with Haxe and 
		// Tinkerbell doesn't have documentation that makes much sense with this stuff
	}
	
	function getUserAgent() : String
	{
		var version : String;
		
		if (this.userAgent == null)
		{
			version = checkVersion(this.beam.version);
			this.userAgent = "BeamClient ver. " + version + " (" + Sys.systemName() + ")";
		}
		
		return this.userAgent;
	}
	
	function checkVersion(version : Float) : String
	{
		if (version != 0)
			return Std.string(version);
		
		return null;
	}
	
	/*public function executor<T>() : Future<T>
	{
		return new Future<T>();
	}*/
	
	// This is how you make an ImmutableMap type thingy in Haxe (or at least, it's much easier than using a regular Map
	// and setting it ReadOnly. So Much RAAAAGGGGEEEE about this.)
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
		
		trace(this.getUserAgent());
	}
}