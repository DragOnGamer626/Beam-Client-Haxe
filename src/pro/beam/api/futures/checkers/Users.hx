package pro.beam.api.futures.checkers;
import pro.beam.api.futures.AbstractChecker;
import pro.beam.api.futures.checkers.Users.TwoFactorFutureChecker;
import tink.core.Outcome;

/**
 * ...
 * @author DragOnGamer626
 */
import tink.core.*;

class Users
{
	
}

class TwoFactorFutureChecker extends AbstractChecker
{	
	static var WRONG_PASSWORD_RESPONSE(default, never) : Int = 401;
	static var TWOFACTOR_WRONG_CODE_RESPONSE(default, never) : Int = 409;
	
	public function new() 
	{
		map = [
			new Pair<Int, String>(WRONG_PASSWORD_RESPONSE, "Wrong Password Error Thrown"),
			new Pair<Int, String>(TWOFACTOR_WRONG_CODE_RESPONSE, "Two Factor Wrong Code Error Thrown")
		];
	}
}

class ForgotPasswordChecker extends AbstractChecker
{
	static var MISSING_USER_CODE = 404;
	static var TOO_MANY_REQUESTS = 429;
	
	public function new()
	{
		map = [
			new Pair<Int, String>(MISSING_USER_CODE, "Missing User Code Error Thrown"),
			new Pair<Int, String>(TOO_MANY_REQUESTS, "Too Many Requests Error Thrown")
		];
	}
}

class ResetPasswordChecker extends AbstractChecker
{
	static var MISSING_USER_CODE = 404;
	static var BAD_REQUEST_CODE = 400;
	
	public function new()
	{
		map = [
			new Pair<Int, String>(MISSING_USER_CODE, "Missing User Code Error Thrown"),
			new Pair<Int, String>(BAD_REQUEST_CODE, "Bad Request Code Error Thrown")
		];
	}
}

// Stub
