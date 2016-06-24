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
			throw "Test";
		}
		catch (e : Dynamic)
		{
			trace("Please Kill Me");
			return false;
		}
		
		return true;
	}
}