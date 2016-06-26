package pro.beam.api.futures.checkers;
import pro.beam.api.futures.AbstractChecker;
import pro.beam.api.futures.checkers.Channels.StatusChecker;

/**
 * ...
 * @author DragOnGamer626
 */
class Channels
{
	public static function init()
	{
		StatusChecker.initialize();
	}
}

class StatusChecker extends AbstractChecker
{
	static var MISSING_PERMISSION_CODE(default, never) : Int = 403;
	static var started : Bool;

	
	function new()
	{
		this.map = [
			new Pair<Int, String>(MISSING_PERMISSION_CODE, "Missing Permission Code Error Thrown")
		];
	}
	
	public static function initialize() : StatusChecker
	{
		if (!started)
		{
			return new StatusChecker();
			started = true;
		}
		return null;
	}
}