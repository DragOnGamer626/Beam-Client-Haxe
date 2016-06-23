package pro.beam.api.http;
import tink.core.Error;
import tink.core.Error.ErrorCode;

/**
 * ...
 * @author DragOnGamer626
 */
class HttpBadResponseException<V>
{
	public var response(default, set) : HttpCompleteResponse;
	
	public function new(response : HttpCompleteResponse) 
	{
		this.set_response(response);
	}
	
	function set_response(response : HttpCompleteResponse)
	{
		return this.response = response;
	}
}