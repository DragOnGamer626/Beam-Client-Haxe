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
		beam.uri = "Test";
		trace(beam.uri);
		super();
	}
	
	public function init(context:RenderContext):Void 
	{
		switch (context) 
		{
			case OPENGL(gl):
			
			default:
		}
	}
}
