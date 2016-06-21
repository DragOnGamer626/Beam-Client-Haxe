package pro.beam.api;
import sys.net.Socket;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamAPI
{
	public var uri(default, set) : String;
	
	public function new() 
	{
		
	}
	
	function set_uri(uri) {
		return this.uri = uri;
	}
	
}