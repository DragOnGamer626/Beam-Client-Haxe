package pro.beam.api;

#if java
import java.Lib;
#else
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
		beam.uri = "http://test.com";
		beam.oauthToken = "tOkEn-626";
		beam.httpUserName = "Deej";
		beam.httpPassword = "Test";
		beam.run();
	}
}
#else
class Main extends Application 
{

	public function new() 
	{
		var beam : BeamAPI = new BeamAPI();
		beam.uri = "http://test.com";
		beam.oauthToken = "tOkEn-626";
		beam.httpUserName = "Deej";
		beam.httpPassword = "Test";
		beam.run();
		super();
	}
}
#end