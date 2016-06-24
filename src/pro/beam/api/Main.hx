package pro.beam.api;

#if cpp
import lime.app.Application;
#elseif java
import java.Lib;
#end
import pro.beam.api.BeamAPI;

/**
 * ...
 * @author DragOnGamer626
 */
#if cpp
class Main extends Application 
{

	public function new() 
	{
		var beam : BeamAPI = new BeamAPI("http://test.com", "tOkEn-626", "Deej", "Test");
		MainHelper.init(beam);
		super();
	}
}

#else // NOTE: Python 3 target only supported
class Main
{
	public static function main()
	{
		var beam : BeamAPI = new BeamAPI();
		MainHelper.init(beam);
	}
}
#end

class MainHelper
{
	public static function init(beam : BeamAPI)
	{
		/*beam.uri = "http://test.com";
		beam.oauthToken = "tOkEn-626";
		beam.httpUserName = "Deej";
		beam.httpPassword = "Test";*/
		beam.run();
	}
}