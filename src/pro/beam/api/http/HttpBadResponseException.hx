package pro.beam.api.http;
import hex.error.Exception;
import hex.error.NullPointerException;

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
			throw Exception;
		}
		catch (e : Dynamic)
		{
			trace("Error has been thrown: " + Std.string(e));
			return false;
		}
		
		return true;
	}
}