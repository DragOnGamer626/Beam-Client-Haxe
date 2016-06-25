package pro.beam.api.services.impl;

import tink.core.Future;
import pro.beam.api.BeamAPI;
import pro.beam.api.response.users.UserSearchResponse;
import pro.beam.api.services.AbstractHTTPService;
import pro.beam.api.resource.BeamUser;
import tink.core.Outcome;

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
	
	public function login<V, E>(userName : String, password : String, ?authCode : String) : Future<Outcome<V, E>>
	{
		if (authCode.length != 6)
		{
			//trace("Two Factor Authentication Code must be at least ");
			throw Outcome.Failure("Two Factor Authentication Code must be at least 6 digits long (was " + authCode.length + ")");
		}
		else 
		{
			// Need to insert Checker Here
		}
	
		return null;
	}
	
	public function logout() : Future<String>
	{
		return this.delete("current", null, null);
	}
	
	public function search(query : String) : Future<UserSearchResponse>
	{
		if (query != null && query.length < 3)
		{
			trace("unable to preform search with query less than 3 characters (was " + Std.string(query.length) + ")");
			throw null;
		}
		
		else
		{
			return null; // Stub
		}
	}
}