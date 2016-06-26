package pro.beam.api.futures.checkers;
import pro.beam.api.futures.AbstractChecker;
import pro.beam.api.futures.checkers.Users.ForgotPasswordChecker;
import pro.beam.api.futures.checkers.Users.ResetPasswordChecker;
import pro.beam.api.futures.checkers.Users.TwoFactorFutureChecker;

/**
 * ...
 * @author DragOnGamer626
 */
import tink.core.*;

class Users
{
	public static function init() : Void
	{
		TwoFactorFutureChecker.initialize();
		ForgotPasswordChecker.initialize();
		ResetPasswordChecker.initialize();
	}
}

class TwoFactorFutureChecker extends AbstractChecker
{	
	static var WRONG_PASSWORD_RESPONSE(default, never) : Int = 401;
	static var TWOFACTOR_WRONG_CODE_RESPONSE(default, never) : Int = 409;
	
	static var started : Bool = false;
	
	function new()
	{
		this.map = [
			new Pair<Int, String>(WRONG_PASSWORD_RESPONSE, "Wrong Password Error Thrown"),
			new Pair<Int, String>(TWOFACTOR_WRONG_CODE_RESPONSE, "Two Factor Wrong Code Error Thrown")
		];
	}
	
	public static function initialize() : TwoFactorFutureChecker
	{
		if (!started) 
		{
			started = true;
			return new TwoFactorFutureChecker();
		}
		return null;
	}
}

class ForgotPasswordChecker extends AbstractChecker
{
	static var MISSING_USER_CODE = 404;
	static var TOO_MANY_REQUESTS = 429;
	
	static var started : Bool = false;
	
	function new()
	{
		this.map = [
			new Pair<Int, String>(MISSING_USER_CODE, "Missing User Code Error Thrown"),
			new Pair<Int, String>(TOO_MANY_REQUESTS, "Too Many Requests Error Thrown")
		];
	}
	
	public static function initialize() : ForgotPasswordChecker
	{
		if (!started)
		{
			started = true;
			return new ForgotPasswordChecker();
		}
		return null;
	}
}

class ResetPasswordChecker extends AbstractChecker
{
	static var MISSING_USER_CODE = 404;
	static var BAD_REQUEST_CODE = 400;
	
	static var started : Bool = false;
	
	function new()
	{
		this.map = [
			new Pair<Int, String>(MISSING_USER_CODE, "Missing User Code Error Thrown"),
			new Pair<Int, String>(BAD_REQUEST_CODE, "Bad Request Code Error Thrown")
		];
	}
	
	public static function initialize() : ResetPasswordChecker
	{
		if (!started)
		{
			started = true;
			return new ResetPasswordChecker();
		}
		return null;
	}
}

// Stub
