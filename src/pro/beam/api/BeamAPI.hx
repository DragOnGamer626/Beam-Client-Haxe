package pro.beam.api;
import haxe.Json;
import pro.beam.api.http.BeamHttpClient;
import sys.net.Socket;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamAPI
{
	public var uri(default, set) : String;
	public var oauthToken(default, set) : String;
	public var httpUserName(default, set) : String;
	public var httpPassword(default, set) : String;
	
	var http : BeamHttpClient;
	
	public function new() 
	{
		uri = "https://beam.pro/api/v1/";
	}
	
	function set_uri(uri) 
	{
		return this.uri = uri;
	}
	
	function set_oauthToken(oauthToken)
	{
		return this.oauthToken = oauthToken;
	}
	
	function set_httpUserName(httpUserName)
	{
		return this.httpUserName = httpUserName;
	}
	
	function set_httpPassword(httpPassword)
	{
		return this.httpPassword = httpPassword;
	}
	
	public function run()
	{
		buildJson();
		initVars();
	}
	
	function buildJson() : Void
	{
		var uriJSON = Json.stringify({uri : uri});
		var oauthTokenJSON = Json.stringify({oauthToken : oauthToken});
		var httpUserNameJSON = Json.stringify({httpUserName : httpUserName});
		var httpPasswordJSON = Json.stringify({httpPassword : httpPassword});
		
		trace(uriJSON);
		trace(oauthTokenJSON);
		trace(httpUserNameJSON);
		trace(httpPasswordJSON);
	}
	
	function initVars()
	{
		this.http = new BeamHttpClient(this);
		http.oauthToken = oauthToken;
		http.httpUserName = httpUserName;
		http.httpPassword = httpPassword;
	}
}