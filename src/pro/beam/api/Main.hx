package pro.beam.api;

#if (cpp || flash || js || html5 || neko)
import lime.app.Application;
#end
import haxe.http.Url;
import pro.beam.api.BeamAPI;

/**
 * ...
 * @author DragOnGamer626
 */
#if (cpp || neko)
class Main extends Application 
{	
	public function new() 
	{
		var beam : BeamAPI = new BeamAPI(MainHelper.URL, MainHelper.token, MainHelper.httpUN, MainHelper.httpPW);
		MainHelper.init(beam);
		super();
	}
}
#end

#if (flash || js || html5)
class Main extends Application
{
	public static function main()
	{
		var beam : BeamAPI = new BeamAPI(MainHelper.URL, MainHelper.token, MainHelper.httpUN, MainHelper.httpPW);
		MainHelper.init(beam);
	}
}
#end

class MainHelper
{
	public static function init(beam : BeamAPI)
	{
		beam.run();
	}
	
	public static var URL : Url = new Url("test.com");
	public static var token : String = "tOkEn-626";
	public static var httpUN : String = "Deej";
	public static var httpPW : String = "Test";
}