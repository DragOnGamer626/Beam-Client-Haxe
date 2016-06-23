package pro.beam.api.http;
import pro.beam.api.exceptions.BeamException;
import tink.core.Error;
import tink.core.Error.ErrorCode;

/**
 * ...
 * @author DragOnGamer626
 */
class HttpBadResponseException<V> extends BeamException<V>
{
	public var response(default, set) : HttpCompleteResponse;
	
	public function new(response : HttpCompleteResponse, ?code:ErrorCode = InternalError, message, ?pos) 
	{
		this.set_response(response);
		super(code, message, pos);
	}
	
	function set_response(response : HttpCompleteResponse)
	{
		return this.response = response;
	}
}