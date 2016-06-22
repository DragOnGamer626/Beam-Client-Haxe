package pro.beam.api.resource.channel;
import haxe.Serializer;

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
	public var audience : AudienceRating;
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
	public var type : Type;
	public var preferences : Map<String, Dynamic>;
	public var messageCache : Array<CachedMessage>;
	
	public function new() {
		var ser : Serializer = new Serializer();
	}
	
	public static enum AudienceRating {
		FAMILY("family");
		TEEN("teen");
		ADULT("18+");
	}
}