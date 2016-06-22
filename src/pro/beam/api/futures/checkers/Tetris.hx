package pro.beam.api.futures.checkers;

/**
 * ...
 * @author DragOnGamer626
 */
class Tetris
{
	@:final static var GAME_NOT_SET_RESPONSE = 403;
}

import pro.beam.api.futures.SimpleFutureChecker;
import pro.beam.api.resource.tetris.RobotInfo;
import pro.beam.api.exceptions.BeamException;

class UnsetGameChecker extends SimpleFutureChecker<RobotInfo, BeamException>
{
	
}