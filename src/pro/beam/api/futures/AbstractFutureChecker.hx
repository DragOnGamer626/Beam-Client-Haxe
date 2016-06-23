package pro.beam.api.futures;
import tink.core.Error.ErrorCode;
import tink.core.Future;

/**
 * ...
 * @author DragOnGamer626
 */
@:abstract class AbstractFutureChecker<V, E>
{
	public function check() : Future<V>
	{
		try
		{
			
		}
		catch (e : ErrorCode)
		{
			
		}
		
		return null;
	}
}