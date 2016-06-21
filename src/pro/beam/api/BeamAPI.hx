package pro.beam.api;
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
	
	public function buildJson() : Void
	{
		
	}
}