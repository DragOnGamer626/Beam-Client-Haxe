package pro.beam.api.services.impl;
import lime.app.Future;
import pro.beam.api.BeamAPI;
import pro.beam.api.services.AbstractHTTPService;
import pro.beam.api.response.channels.ShowChannelsResponse;
import pro.beam.api.response.channels.ShowSlugsResponse;
import pro.beam.api.resource.channel.BeamChannel;

/**
 * ...
 * @author DragOnGamer626
 */
class TypesService extends AbstractHTTPService
{

	public function new(beam : BeamAPI) 
	{
		super(beam, "types");
	}
	
	public function all(onlineRestriction : OnlineRestriction) : Future<ShowSlugsResponse>
	{
		if (onlineRestriction == null)
			onlineRestriction = OnlineRestriction.NONE;
			
		return this.get("", Type.resolveClass("pro.beam.api.response.channels.ShowSlugsResponse"), new Map<String, Dynamic>());
	}
	
	public function channels(id : Int, page : Int, limit : Int, 
		attribute : Attributes, ordering : Ordering, onlineRestriction : OnlineRestriction,  
		only : Attributes) : Future<ShowChannelsResponse>
	{
		var args : Map<String, Dynamic> = new Map<String, Dynamic>();
		var orderJson : String;
		
		if (attribute != null)
		{	
			switch(ordering)
			{
				case ASCENDING:
					orderJson = ShowChannelsResponse.ascendingJson;
				case DESCENDING:
					orderJson = ShowChannelsResponse.descendingJson;
			};
			
			args.set("order", getAttibJson(attribute) + ":" + orderJson);
		};
		
		if (only != null)
		{
			args.set("only", getAttibJson(only));
		};
		
		args.set("page", Math.max(0, page));
		args.set("limit", Math.min(50, limit));
		
		if (onlineRestriction != null)
			ShowSlugsResponse.online = onlineRestriction;
		
		ShowSlugsResponse.putParams(args);
		
		return this.get(id + "/channels", Type.resolveClass("pro.beam.api.response.channels.ShowChannelsResponse"), args);
	}
	
	function getAttibJson(attribute : Attributes)
	{
		switch(attribute)
			{
				case ONLINE:
					return ShowChannelsResponse.onlineJson;
				case FEATURED:
					return ShowChannelsResponse.featuredJson;
				case PARTNERED:
					return ShowChannelsResponse.partneredJson;
				case NAME:
					return ShowChannelsResponse.attribNameJson;
				case VIEWERS_TOTAL:
					return ShowChannelsResponse.viewersJson;
				case FOLLOWERS:
					return ShowChannelsResponse.followersJson;
				case SUBSCRIBERS:
					return ShowChannelsResponse.subsJson;
				case INTERACTIVE:
					return ShowChannelsResponse.interactiveJson;
				default:
					return "";
			};
	}
}