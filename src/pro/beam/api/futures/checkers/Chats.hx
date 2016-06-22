package pro.beam.api.futures.checkers;

/**
 * ...
 * @author DragOnGamer626
 */
class Chats
{
	@:final static var BAD_REQUESTED_RESPONSE : Int = 400;
	@:final static var FORBIDDEN_RESPONSE : Int = 403;
	@:final static var CHANNEL_NOT_FOUND : Int = 404;
}

import pro.beam.api.futures.SimpleFutureChecker;
class UpdateSettingsChecker extends SimpleFutureChecker<ChatSettingsResponse, BeamException>
{
	// Stub Not Sure How To Implement Exception Checking Stuff
}