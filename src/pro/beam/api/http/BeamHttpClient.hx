package pro.beam.api.http;
import tink.core.Error.ErrorCode;
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

	public function new(beam : BeamAPI, handler : HttpCompleteResponseHandler) 
	{
		this.beam = beam;
		this.handler = handler;
		
		handler.add(new HttpCompleteResponse(ErrorCode.Unauthorized, "Test"));
		handler.add(new HttpCompleteResponse(ErrorCode.Conflict, "Test2"));
		handler.add(new HttpCompleteResponse(ErrorCode.BadRequest, "Test3"));
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
		
		trace(handler.getResponse(0).getBody());
	}
}