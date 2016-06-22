package pro.beam.api.services.impl;
import pro.beam.api.BeamAPI;
import pro.beam.api.services.AbstractHTTPService;

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
	
}