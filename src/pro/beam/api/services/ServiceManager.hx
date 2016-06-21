package pro.beam.api.services;

/**
 * ...
 * @author DragOnGamer626
 */
class ServiceManager
{
	
	var services : Array<AbstractBeamService>;
	
	public function new() 
	{
		services = new Array();
	}
	
	public function register(service : AbstractBeamService) : Int
	{
		return this.services.push(service);
	}
}