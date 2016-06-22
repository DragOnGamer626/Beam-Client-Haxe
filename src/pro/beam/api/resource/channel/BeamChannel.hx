package pro.beam.api.resource.channel;
import haxe.Json;
import haxe.Serializer;
import pro.beam.api.resource.BeamUser;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamChannel
{
	public var id : Int;
	public var token : String;
	public var online : Bool;
	public var featured : Bool;
	public var partnered : Bool;
	public var transcodingEnabled : Bool;
	public var suspended : Bool;
	public var interactive : Bool;
	public var hasVod : Bool;
	public var name : String;
	public var streamKey : String;
	public var viewersTotal : Int;
	public var viewersCurrent : Int;
	public var numFollowers : Int;
	public var numSubscribers : Int;
	public var description : String;
	public var typeId : Int;
	public var createdAt : Date;
	public var updateAt : Date;
	public var userId : Int;
	public var coverId : Int;
	public var thumbnailId : Int;
	public var badgeId : Int;
	public var thumbnail : BeamResource;
	public var cover : BeamResource;
	public var badge : BeamResource;
	public var type : ChannelType;
	public var preferences : Map<String, Dynamic>;
	public var user : BeamUser;
	public var audience : AudienceRating;
	public var cosPref : CostreamPreference;
	
	public var messageCache : Array<CachedMessage>;

	// Stub Serializer Stuff
	
	@:final public var allJson = "all";
	@:final public var followingJson = "following";
	@:final public var noneJson = "none";
	
	@:final public var familyJson = "family";
	@:final public var teenJson = "teen";
	@:final public var adultJson = "18+";
	
	@:final public var cacheJson = "cache";
	
	public function new()
	{
		
	}
}

@:access(BeamChannel)
class ChannelType 
{
	public var id : Int;
	public var name : String;
	public var parent : String;
	public var description : String;
	public var source : String;
	public var viewersCurrent : Int;
	public var online : Int;
	public var coverUrl : String;
}

enum CostreamPreference
{	
	ALL;
	FOLLOWING;
	NONE;
}

enum AudienceRating
{
	FAMILY;
	TEEN;
	ADULT;
} // Don't Know How To Implement This