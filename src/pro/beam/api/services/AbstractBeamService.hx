package pro.beam.api.services;
import pro.beam.api.BeamAPI;

/**
 * ...
 * @author DragOnGamer626
 */
@:abstract class AbstractBeamService extends AbstractService
{
	var beam : BeamAPI;
	
	public function new(beam : BeamAPI)
	{
		this.beam = beam;
	}
}