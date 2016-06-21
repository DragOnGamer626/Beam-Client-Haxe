package pro.beam.api.services.impl;
import lime.app.Future;
import pro.beam.api.BeamAPI;
import pro.beam.api.services.AbstractHTTPService;
import pro.beam.api.resource.BeamUser;

/**
 * ...
 * @author DragOnGamer626
 */
class UsersService extends AbstractHTTPService
{
	var user : BeamUser;
	public function new(beam : BeamAPI) 
	{
		user = new BeamUser();
		super(beam, "users");
	}
	
	public function findOne(id : Int) : Future<BeamUser>
	{
		return this.get(Std.string(id), Type.resolveClass("pro.beam.api.resource.BeamUser"), null);
	}
	
	public function refresh() : Future<BeamUser>
	{
		return this.post("current/refresh", Type.resolveClass("pro.beam.api.resource.BeamUser"), null);
	}
	
	// Stub
}