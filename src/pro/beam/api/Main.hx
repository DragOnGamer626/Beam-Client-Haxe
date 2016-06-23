package pro.beam.api;

#if !java
import lime.app.Application;
import lime.graphics.opengl.GL;
import lime.graphics.RenderContext;
#elseif java
import java.Lib;
#end
import pro.beam.api.BeamAPI;

/**
 * ...
 * @author DragOnGamer626
 */

#if !java
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

#elseif java
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
#end