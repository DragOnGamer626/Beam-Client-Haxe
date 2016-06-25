package pro.beam.api.futures;
import haxe.Log;
import pro.beam.api.exceptions.BeamException;
import pro.beam.api.http.HttpBadResponseException;
import pro.beam.api.http.HttpCompleteResponse;
import tink.core.Error;
import tink.core.Error.ErrorCode;
import tink.core.Future;
import tink.core.Outcome;

/**
 * ...
 * @author DragOnGamer626
 */
@:abstract class AbstractFutureChecker<V, E>
{
	public function check(future : Future<V>) : Future<V>
	{
		// Stub
		return future;
	}
}