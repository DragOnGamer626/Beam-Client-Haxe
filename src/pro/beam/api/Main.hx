package pro.beam.api;

#if (cpp || flash || js || html5 || neko)
import lime.app.Application;
#end
import tink.Url;
import pro.beam.api.BeamAPI;

/**
 * ...
 * @author DragOnGamer626
 */

class Main extends Application 
{	
	#if (cpp || neko)
	public function new() 
	{
		var beam : BeamAPI = new BeamAPI(MainHelper.URL, MainHelper.token, MainHelper.httpUN, MainHelper.httpPW);
		MainHelper.init(beam);
		super();
	}
	
	#elseif (flash || js || html5)
	public static function main()
	{
		var beam : BeamAPI = new BeamAPI(MainHelper.URL, MainHelper.token, MainHelper.httpUN, MainHelper.httpPW);
		MainHelper.init(beam);
	}
	#end
	
}

class MainHelper
{
	public static function init(beam : BeamAPI)
	{
		beam.version = 0.1;
		beam.run();
	}
	
	public static var URL : Url = Url.parse("https://beam.pro/api/v1/");
	public static var token : String = "tOkEn-626";
	public static var httpUN : String = "Deej";
	public static var httpPW : String = "Test";
}