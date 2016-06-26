package pro.beam.api.futures.checkers;
import pro.beam.api.futures.AbstractChecker;
import pro.beam.api.futures.checkers.Chats.UpdateSettingsChecker;
import tink.core.Pair;

/**
 * ...
 * @author DragOnGamer626
 */
class Chats
{
	public function init()
	{
		UpdateSettingsChecker.inititialize();
	}
}

class UpdateSettingsChecker extends AbstractChecker
{
	static var BAD_REQUESTED_RESPONSE : Int = 400;
	static var FORBIDDEN_RESPONSE : Int = 403;
	static var CHANNEL_NOT_FOUND : Int = 404;
	
	static var started : Bool = false;
	
	function new()
	{
		this.map = [
			new Pair<Int, String>(BAD_REQUESTED_RESPONSE, "Bad Request Response Error thrown."),
			new Pair<Int, String>(FORBIDDEN_RESPONSE, "Forbidden response Error thrown."),
			new Pair<Int, String>(CHANNEL_NOT_FOUND, "Channel Not Found Error thrown.")
		];
	}
	
	public static function initialize() : UpdateSettingsChecker
	{
		if (!started)
		{
			started = true;
			return new UpdateSettingsChecker();
		}
	}
}