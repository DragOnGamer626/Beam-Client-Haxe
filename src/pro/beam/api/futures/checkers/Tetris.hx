package pro.beam.api.futures.checkers;
import pro.beam.api.futures.AbstractChecker;

/**
 * ...
 * @author DragOnGamer626
 */
class Tetris
{
	public function init()
	{
		UnsetGameChecker.initialize();
	}
}

class UnsetGameChecker extends AbstractChecker
{
	@:final static var GAME_NOT_SET_RESPONSE = 403;
	static var started : Bool = false;
	
	function new()
	{
		this.map = [
			new Pair<Int, String>(GAME_NOT_SET_RESPONSE, "Game Not Set Response Error thrown.")
		];
	}
	
	public static function initialize() : UnsetGameChecker
	{
		if (!started)
		{
			started = true;
			return new UnsetGameChecker();
		}
		return null;
	}
}