package pro.beam.api.http;

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
			throw "Error";
		}
		catch (e : Dynamic)
		{
			trace("Error has been thrown");
			return false;
		}
		
		return true;
	}
}