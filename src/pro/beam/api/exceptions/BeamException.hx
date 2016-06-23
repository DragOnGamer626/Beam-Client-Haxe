package pro.beam.api.exceptions;
import haxe.Log;
import tink.core.Error.ErrorCode;
import tink.core.Error.TypedError;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamException<T> extends TypedError<T>
{
	public function new(?code:ErrorCode = InternalError, message, ?pos)
	{
		super(code, message, pos);
	}
}