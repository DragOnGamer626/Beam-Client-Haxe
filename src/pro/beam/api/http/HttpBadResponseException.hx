package pro.beam.api.http;

#if (flash || js || html5)
import hex.error.Exception;
import hex.error.NullPointerException;
#end

/**
 * ...
 * @author DragOnGamer626
 */
class HttpBadResponseException
{
	
	public static function checkResponse(response : HttpCompleteResponse) : Bool
	{
		try
		{
			trace(response.getBody());
		#if (flash || js || html5)
			throw Exception; // Might take this out; still experimenting
		#else
			throw "Error";
		#end
		}
		catch (e : Dynamic)
		{
			trace("Error has been thrown: " + Std.string(e));
			return false;
		}
		
		return true;
	}
}