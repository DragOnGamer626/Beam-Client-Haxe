package;

import lime.app.Application;
import lime.graphics.opengl.GL;
import lime.graphics.RenderContext;
import pro.beam.api.BeamAPI;

/**
 * ...
 * @author DragOnGamer626
 */
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
