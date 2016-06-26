package pro.beam.api;
import haxe.Json;
import pro.beam.api.futures.checkers.Users.TwoFactorFutureChecker;
import tink.Url;
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
import tink.core.Any;
import tink.core.Callback;
import tink.core.Future;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamAPI
{
	public var version(default, set) : Float;
	public var uri(default, set) : Url;
	public var basePath(default, set) : String;
	public var oauthToken(default, set) : String;
	public var httpUserName(default, set) : String;
	public var httpPassword(default, set) : String;
	
	public var http : BeamHttpClient;
		
	var handler : HttpCompleteResponseHandler;
	var services : ServiceManager;
	
public var executor : Dynamic;
		
	/**
	 * All of these parameters are optional (the ? prefix) and can either be set in constructor
	 * or individually. This is how the original code does it and how I would do it anyways.
	 * @param	uri
	 * @param	oauthToken
	 * @param	httpUserName
	 * @param	httpPassword
	 */
	public function new(?uri : Url, ?oauthToken : String, ?httpUserName : String, ?httpPassword : String) 
	{		
		initVars();
		checkConstructorParams(uri, oauthToken, httpUserName, httpPassword);
		this.http = new BeamHttpClient(this, handler, oauthToken, httpUserName, httpPassword);
	}
	
	function initVars<T>() : Void
	{
		this.handler = new HttpCompleteResponseHandler();
		this.services = new ServiceManager();
		this.executor = new Future<T>(null);
	}
		
	function set_version(version : Float)
	{
		return this.version = version;
	}
	
	function set_uri(uri) 
	{
		return this.uri = uri;
	}
	
	function set_basePath(basePath)
	{
		return this.basePath = basePath;
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
	
	function checkConstructorParams(uri : Url, oauthToken : String, httpUserName : String, httpPassword : String) : Void
	{
		checkURI(uri);
		checkOauthToken(oauthToken);
		checkHttpUserName(httpUserName);
		checkHttpPassword(httpPassword);
	}
	
	function checkURI(uri : Url) : Void
	{
		if (uri != null)
			set_uri(uri);
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
	
	public function run()
	{
		buildJson();
		passVarsDown();
		registerServices();
	}
	
	function buildJson() : Void
	{
		var uriJSON = Json.stringify({uri : http.uriJson});
		var oauthTokenJSON = Json.stringify({oauthToken : oauthToken});
		var httpUserNameJSON = Json.stringify({httpUserName : httpUserName});
		var httpPasswordJSON = Json.stringify({httpPassword : httpPassword});
		
		trace(uriJSON);
		trace(oauthTokenJSON);
		trace(httpUserNameJSON);
		trace(httpPasswordJSON);
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