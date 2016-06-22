package pro.beam.api.services.impl;
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
	
	public function test() : Bool
	{
		return ShowSlugsResponse.putParams(new Map<String, Dynamic>());
	}
}