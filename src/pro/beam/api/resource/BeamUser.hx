package pro.beam.api.resource;
import pro.beam.api.resource.channel.BeamChannel;
import pro.beam.api.resource.channel.BeamResource;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamUser
{
	public var createdAt : Date;
	public var email : String;
	public var id : Int;
	public var channel : BeamChannel;
	public var points : Int;
	public var experience : Int;
	public var sparks : Int;
	public var resetTime : Date;
	public var social : Social;
	public var updatedAt : Date;
	public var userName : String;
	public var verified : Bool;
	public var avatars : Array<BeamResource>;
	
	public function new()
	{
		
	}
}

@:final
@:enum
abstract Role(String)
{
	public var BANNED = "Banned";
	public var MUTED = "Muted";
	public var USER = "User";
	public var PRO = "Pro";
	public var SUBSCRIBER = "Subscriber";
	public var MOD = "Mod";
	public var GLOBAL_MOD = "Global Mod";
	public var FOUNDER = "Founder";
	public var STAFF = "Staff";
	public var OWNER = "Owner";
}

@:access(BeamUser)
class Social
{
	public var facebook : String;
	public var twitter : String;
	public var youtube : String;
}