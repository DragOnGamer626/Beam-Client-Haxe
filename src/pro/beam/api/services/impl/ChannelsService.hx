package pro.beam.api.services.impl;
import tink.core.Future;
import tink.core.Any;
import tink.core.Pair;
import pro.beam.api.BeamAPI;
import pro.beam.api.http.BeamHttpClient;
import pro.beam.api.resource.BeamUser;
import pro.beam.api.resource.channel.BeamChannel;
import pro.beam.api.response.emotes.ChannelEmotesResponse;
import pro.beam.api.services.AbstractHTTPService;
import pro.beam.api.response.channels.ShowChannelsResponse;
import pro.beam.api.response.channels.ChannelStatusResponse;

/**
 * ...
 * @author DragOnGamer626
 */
class ChannelsService extends AbstractHTTPService
{
	static var CHANNEL_ROOT = "";
	
	public function new(beam : BeamAPI) 
	{
		super(beam, "channels");
	}
	
	public function show(attribute : Attributes, ordering : Ordering, only : Ordering, page : Int, limit : Int) : Future<ShowChannelsResponse>
	{
		var args : Array<Pair<String, Any>> = BeamHttpClient.getArgumentsBuilder();
		
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
			
			args.push(new Pair<String, Any>(getAttribJson(attribute), orderJson));
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
			
			args.push(new Pair<String, Any>("only", orderJson));
		};
		
		args.push(new Pair<String, Any>("page", Math.max(0, page)));
		args.push(new Pair<String, Any>("limit", Math.min(0, limit)));
		
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
	
	public function findOneByTokenDetailed(token : String) : Future<BeamChannel>
	{
		return this.get(token + "/detailed", Type.resolveClass("pro.beam.api.resource.channel.BeamChannel"), null);
	}
	
	public function findOneDetailed(id : Int) : Future<BeamChannel>
	{
		return this.get(Std.string(id) + "/detailed", Type.resolveClass("pro.beam.api.resource.channel.BeamChannel"), null);
	}
	
	public function findRelationship(channel : BeamChannel, user : BeamUser) : Future<ChannelStatusResponse>
	{
		var args : Array<Pair<String, Any>> = BeamHttpClient.getArgumentsBuilder();
		args.push(new Pair<String, Any>("user", Std.string(channel.id)));
		
		return this.get(Std.string(channel.id) + "/relationship", Type.resolveClass("pro.beam.api.response.channels.ChannelStatusResponse"), args);
	} // This will probably need to be changed in the future
	
	public function follow<T>(channel : BeamChannel, follower : BeamUser) : Future<T>
	{
		var args : Array<Pair<String, Any>> = BeamHttpClient.getArgumentsBuilder();
		args.push(new Pair<String, Any>("user", follower.id));
		
		return this.get(Std.string(channel.id) + "/follow", null, args);
	}
	
	public function unfollow<T>(channel : BeamChannel, exFollower : BeamUser) : Future<T>
	{
		var args : Array<Pair<String, Any>> = BeamHttpClient.getArgumentsBuilder();
		args.push(new Pair<String, Any>("user", exFollower.id));
		
		return this.get(Std.string(channel.id) + "/follow", null, args);
	}
	
	public function search(query : String, scope : Scope, page : Int, limit : Int) : Future<ShowChannelsResponse>
	{
		var options : Array<Pair<String, Any>> = BeamHttpClient.getArgumentsBuilder();
		
		options.push(new Pair<String, Any>("q", query));
		options.push(new Pair<String, Any>("scope", scope));
		options.push(new Pair<String, Any>("page", Math.min(0, page)));
		options.push(new Pair<String, Any>("limit", Math.min(0, limit)));
		
		return this.get(CHANNEL_ROOT, Type.resolveClass("pro.beam.api.response.channels.ShowChannelResponse"), options);
	}
	
	public function update(channel : BeamChannel) : Future<BeamChannel>
	{
		var args : Array<Pair<String, Any>> = BeamHttpClient.getArgumentsBuilder();
		
		args.push(new Pair<String, Any>(channel.allJson, ALL));
		args.push(new Pair<String, Any>(channel.followingJson, FOLLOWING));
		args.push(new Pair<String, Any>(channel.noneJson, NONE));
		args.push(new Pair<String, Any>(channel.familyJson, FAMILY));
		args.push(new Pair<String, Any>(channel.teenJson, TEEN));
		args.push(new Pair<String, Any>(channel.adultJson, ADULT));
		
		return this.get(Std.string(channel.id), Type.resolveClass("pro.beam.api.resource.channel.BeamChannel"), args);
	}
	
	public function emotes(channel : BeamChannel) : Future<ChannelEmotesResponse>
	{
		return this.get(Std.string(channel.id) + "/emoticons", Type.resolveClass("pro.beam.api.response.emotes.ChannelEmotesResponse"), null);
	}
	
}