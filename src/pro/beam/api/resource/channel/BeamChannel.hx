package pro.beam.api.resource.channel;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamChannel
{
	public var id(default, set) : Int;
	
	public function new() 
	{
		
	}
	
	function set_id(id : Int) : Int
	{
		return this.id = id;
	}
	
}