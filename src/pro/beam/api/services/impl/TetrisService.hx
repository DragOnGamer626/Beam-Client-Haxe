package pro.beam.api.services.impl;
import haxe.io.Error;
import tink.core.Future;
import pro.beam.api.BeamAPI;
import pro.beam.api.futures.SimpleFutureChecker;
import pro.beam.api.resource.channel.BeamChannel;
import pro.beam.api.services.AbstractHTTPService;
import pro.beam.api.resource.tetris.RobotInfo;
import pro.beam.api.exceptions.BeamException;

/**
 * ...
 * @author DragOnGamer626
 */
class TetrisService extends AbstractHTTPService
{

	public function new(beam : BeamAPI) 
	{
		super(beam, "tetris");
	}
	
	public function getRobotCredentialsByID(channelId : Int) : Future<RobotInfo> // Exception Stuff Is Supposed to Be Here
	{
		var channel : BeamChannel = new BeamChannel();
		channel.id = channelId;
		
		return this.getRobotCredentials(channel);
	}
	
	public function getRobotCredentials(channel : BeamChannel) : Future<RobotInfo>
	{
		return this.get(Std.string(channel.id) + "/robot", Type.resolveClass("pro.beam.api.resource.tetris.RobotInfo"), null); // Stub
	}
}