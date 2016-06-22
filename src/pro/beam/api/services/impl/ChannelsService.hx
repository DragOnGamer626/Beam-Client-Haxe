package pro.beam.api.services.impl;
import lime.app.Future;
import pro.beam.api.BeamAPI;
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
		return null; // Stub
	}
	
}