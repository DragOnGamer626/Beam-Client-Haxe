package pro.beam.api.services;
import haxe.macro.Type;
import lime.app.Future;
import pro.beam.api.BeamAPI;
import pro.beam.api.http.BeamHttpClient;

/**
 * ...
 * @author DragOnGamer626
 */
@:abstract class AbstractHTTPService extends AbstractBeamService
{
	var http : BeamHttpClient;
	var path : String;
	
	public function new(beam : BeamAPI, path : String) 
	{
		super(beam);
		this.http = this.beam.http;
		this.path = path;
	}
	
	function get<T>(path : String, type : Class<T>, parameters : Map<String, Dynamic>) : Future<T>
	{
		return this.http.get(this.getPath(path), type, parameters);
	}
	
	function patch<T>(path : String, type : Class<T>, args : Array<Dynamic>) : Future<T>
	{
		return this.http.patch(this.getPath(path), type, args);
	}
	
	function post<T>(path : String, type : Class<T>, args : Array<Dynamic>) : Future<T>
	{
		return this.http.post(this.getPath(path), type, args);
	}
	
	function put<T>(path : String, type : Class<T>, args : Array<Dynamic>) : Future<T>
	{
		return this.http.put(this.getPath(path), type, args);
	}
	
	function delete<T>(path : String, type : Class<T>, args : Array<Dynamic>) : Future<T>
	{
		return this.http.delete(this.getPath(path), type, args);
	}
	
	public function getPath(relative : String) : String
	{
		if (relative.length > 0)
		{
			relative = "/" + relative;
		}
		
		return this.beam.uri + this.path + relative;
	}
}