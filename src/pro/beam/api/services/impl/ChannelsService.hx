package pro.beam.api.services.impl;
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
	
	public function show(attributes : Map<Attributes, Ordering>, only : Ordering, page : Int, limit : Int) : Future<ShowChannelsResponse>
	{
		var args : Map<String, Dynamic> = BeamHttpClient.getArgumentsBuilder();
		
		var orderJson : String = "";
		var order : Ordering;
		
		/*if (attributes != null)
		{	
			for (i in attributes.keys())
			{
				for (j in attributes.iterator())
				{
					args.set(, j);
				}
			}
		};*/
		
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