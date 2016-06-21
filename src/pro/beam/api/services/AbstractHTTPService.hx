package pro.beam.api.services;
import haxe.macro.Type;
import lime.app.Future;
import pro.beam.api.BeamAPI;
import pro.beam.api.http.BeamHttpClient;

/**
 * ...
 * @author DragOnGamer626
 */
class AbstractHTTPService extends AbstractBeamService
{
	var http : BeamHttpClient;
	var path : String;
	
	public function new(beam : BeamAPI, path : String) 
	{
		super(beam);
		this.http = this.beam.http;
		this.path = path;
	}
	
	/*function get(path : String, type : Type, parameters : Map<String, Dynamic>) : Future<Dynamic>
	{
		return this.http.get(this.getPath(path), type, parameters);
	}
	
	function patch(path : String, type : Type, args : Array<Dynamic>) : Future<Dynamic>
	{
		return this.http.patch(this.getPath(path), type, args);
	}
	
	function post(path : String, type : Type, args : Array<Dynamic>) : Future<Dynamic>
	{
		return this.http.post(this.getPath(path), type, args);
	}
	
	function put(path : String, type : Type, args : Array<Dynamic>) : Future<Dynamic>
	{
		return this.http.put(this.getPath(path), type, args);
	}
	
	function delete(path : String, type : Type, args : Array<Dynamic>) : Future<Dynamic>
	{
		return this.http.delete(this.getPath(path), type, args);
	}*/
	
	public function getPath(relative : String) : String
	{
		if (relative.length > 0)
		{
			relative = "/" + relative;
		}
		
		return this.beam.uri + this.path + relative;
	}
}