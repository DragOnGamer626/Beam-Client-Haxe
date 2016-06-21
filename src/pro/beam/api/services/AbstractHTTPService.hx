package pro.beam.api.services;
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
	
	function get(path : String, type : Type, parameters : Map<String, Dynamic>) : Future<T>
	{
		
	}
	
	function patch(path : String, type : Type, args : Array<Dynamic>)
	{
		
	}
	
	function post(path : String, type : Type, args : Array<Dynamic>)
	{
		
	}
	
	function put(path : String, type : Type, args : Array<Dynamic>)
	{
		
	}
	
	function delete(path : String, type : Type, args : Array<Dynamic>)
	{
		
	}
	
	public function getPath(relative : String) : String
	{
		if (relative.length > 0)
		{
			relative = "/" + relative;
		}
		
		return this.beam.uri + this.patch + relative;
	}
}