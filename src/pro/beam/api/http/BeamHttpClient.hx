package pro.beam.api.http;
import lime.app.Future;
import pro.beam.api.BeamAPI;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamHttpClient
{
	var beam : BeamAPI;
	public var userAgent(default, set) : String;
	public var oauthToken(default, set) : String;
	public var httpUserName(default, set) : String;
	public var httpPassword(default, set) : String;

	public function new(beam : BeamAPI) 
	{
		this.beam = beam;
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
	
	/*public function get(path : String, type : Type, args : Map<String, Dynamic>) : Future<Type>
	{
		// Stub
	}
	
	public function post(path : String, type : Type, args : Array<Dynamic>) : Future<Type>
	{
		// Stub
	}
	
	public function put(path : String, type : Type, args : Array<Dynamic>) : Future<Type>
	{
		// Stub
	}
	
	public function patch(path : String, type : Type, args : Array<Dynamic>) : Future<Type>
	{
		// Stub
	}
	
	public function delete(path : String, type : Type, args : Array<Dynamic>) : Future<Type>
	{
		// Stub
	}*/
	
	// Stub
	
	public function printVars()
	{
		var http = "http.";
		trace(http + "oauthToken:" + oauthToken);
		trace(http + "httpUserName:" + httpUserName);
		trace(http + "httpPassword:" + httpPassword);
	}
}