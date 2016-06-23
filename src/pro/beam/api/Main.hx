package pro.beam.api;

#if java
import java.Lib;
#elseif !python
import lime.app.Application;
#end
import pro.beam.api.BeamAPI;

/**
 * ...
 * @author DragOnGamer626
 */
#if java
class Main
{
	public static function main()
	{
		var beam : BeamAPI = new BeamAPI();
		MainHelper.init(beam);
	}
}

#elseif python // Python 3 target only supported
class Main
{
	public static function main()
	{
		var beam : BeamAPI = new BeamAPI();
		MainHelper.init(beam);
	}
}

#else
class Main extends Application 
{

	public function new() 
	{
		var beam : BeamAPI = new BeamAPI();
		MainHelper.init(beam);
		super();
	}
}
#end

class MainHelper
{
	public static function init(beam : BeamAPI)
	{
		beam.uri = "http://test.com";
		beam.oauthToken = "tOkEn-626";
		beam.httpUserName = "Deej";
		beam.httpPassword = "Test";
		beam.run();
	}
}