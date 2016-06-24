package pro.beam.api;
import haxe.Json;
import pro.beam.api.http.BeamHttpClient;
import pro.beam.api.http.HttpCompleteResponseHandler;
import pro.beam.api.services.AbstractBeamService;
import pro.beam.api.services.ServiceManager;
import pro.beam.api.services.impl.ChannelsService;
import pro.beam.api.services.impl.ChatService;
import pro.beam.api.services.impl.EmotesService;
import pro.beam.api.services.impl.TetrisService;
import pro.beam.api.services.impl.TypesService;
import pro.beam.api.services.impl.UsersService;

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
	
	var handler : HttpCompleteResponseHandler;
	public var http : BeamHttpClient;
	var services : ServiceManager;
	
	/**
	 * All of these parameters are optional (the ? prefix) and can either be set in constructor
	 * or individually. This is how the original code die it and how I would do it anyways.
	 * @param	uri
	 * @param	oauthToken
	 * @param	httpUserName
	 * @param	httpPassword
	 */
	public function new(?uri : String, ?oauthToken : String, ?httpUserName : String, ?httpPassword : String) 
	{
		this.uri = "https://beam.pro/api/v1/";
		
		initVars();
		checkConstructorParams(uri, oauthToken, httpUserName, httpPassword);	
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
	
	function checkConstructorParams(uri : String, oauthToken : String, httpUserName : String, httpPassword : String) : Void
	{
		checkURI(uri);
		checkOauthToken(oauthToken);
		checkHttpUserName(httpUserName);
		checkHttpPassword(httpPassword);
	}
	
	function checkURI(uri : String) : Void
	{
		checkStringNull(uri, this.uri);
	}
	
	function checkOauthToken(oauthToken : String) : Void
	{
		checkStringNull(oauthToken, this.oauthToken);
	}
	
	function checkHttpUserName(httpUserName : String) : Void
	{
		checkStringNull(httpUserName, this.httpUserName);
	}
	
	function checkHttpPassword(httpPassword : String) : Void
	{
		checkStringNull(httpPassword, this.httpPassword);
	}
	
	function checkStringNull(input : String, output : String) : Void
	{
		if (input != null) 
			output = input;
	}
	
	public function run()
	{
		buildJson();
		passVarsDown();
		registerServices();
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
	
	function initVars() : Void
	{
		this.handler = new HttpCompleteResponseHandler();
		this.http = new BeamHttpClient(this, handler);
		this.services = new ServiceManager();
	}
	
	function passVarsDown() : Void
	{
		http.oauthToken = oauthToken;
		http.httpUserName = httpUserName;
		http.httpPassword = httpPassword;
		http.printVars();
	}
	
	function register(service : AbstractBeamService) : Int
	{
		return this.services.register(service);
	}
	
	function registerServices() : Void
	{
		this.register(new UsersService(this));
		this.register(new ChatService(this));
		this.register(new EmotesService(this));
		this.register(new ChannelsService(this));
		this.register(new TypesService(this));
		this.register(new TetrisService(this));
	}
}