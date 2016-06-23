package pro.beam.api.services.impl;
import haxe.ds.HashMap;
import lime.app.Future;
import pro.beam.api.BeamAPI;
import pro.beam.api.http.BeamHttpClient;
import pro.beam.api.resource.channel.BeamChannel;
import pro.beam.api.services.AbstractHTTPService;
import pro.beam.api.response.channels.ShowChannelsResponse;

/**
 * ...
 * @author DragOnGamer626
 */
class ChannelsService extends AbstractHTTPService
{

	public function new(beam : BeamAPI) 
	{
		super(beam, "channels");
	}
	
	public function show(attribute : Attributes, ordering : Ordering, only : Ordering, page : Int, limit : Int) : Future<ShowChannelsResponse>
	{
		var args : Map<String, Dynamic> = BeamHttpClient.getArgumentsBuilder();
		
		var orderJson : String = "";
		var order : Ordering;
		
		if (attribute != null)
		{	
			for (i in ordering.getParameters())
			{
				switch(i)
				{
					case ASCENDING:
						orderJson = ShowChannelsResponse.ascendingJson;
					case DESCENDING:
						orderJson = ShowChannelsResponse.descendingJson;
				};
			}
			
			args.set(getAttribJson(attribute), orderJson);
		};
		
		if (only != null)
		{
			for (i in only.getParameters())
			{
				switch(i)
				{
					case ASCENDING:
						orderJson = ShowChannelsResponse.ascendingJson;
					case DESCENDING:
						orderJson = ShowChannelsResponse.descendingJson;
				}
			}
			
			args.set("only", orderJson);
		};
		
		args.set("page", Math.max(0, page));
		args.set("limit", Math.min(0, limit));
		
		return this.get("", Type.resolveClass("pro.beam.api.response.channels.ShowChannelsResponse"), args);
	}
	
	function getAttribJson(attribute : Attributes) : String
	{
		for (i in attribute.getParameters())
		{
			switch(i)
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
		return "";
	}
	
	/**
	 * Find Beam Channel by token
	 * @param	token
	 * @return
	 */
	public function findOneByToken(token : String) : Future<BeamChannel>
	{
		return this.get(token, Type.resolveClass("pro.beam.api.resource.channel.BeamChannel"), null);
	}
	
	public function findOne(id : Int) : Future<BeamChannel>
	{
		return this.get(Std.string(id), Type.resolveClass("pro.beam.api.resource.channel.BeamChannel"), null);
	}
}