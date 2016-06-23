package pro.beam.api.futures;
import haxe.Log;
import pro.beam.api.exceptions.BeamException;
import pro.beam.api.http.HttpBadResponseException;
import pro.beam.api.http.HttpCompleteResponse;
import tink.core.Error;
import tink.core.Error.ErrorCode;
import tink.core.Future;

/**
 * ...
 * @author DragOnGamer626
 */
@:abstract class AbstractFutureChecker<V, E>
{
	public function check(future : Future<V>) : Future<V>
	{
		var hbre : HttpBadResponseException<V> = null;
		/*var status : Int = 0;
		var body : String = "";
		var message : String = "";*/
		
		try
		{
			if (future == null)
			{
				//message = "HttpBadResponseException has been thrown";
				return null;
			}
			
			else 
			{
				/*status = 1;
				body = "Future is Good";
				message = "HttpBadResponseException was not thrown";*/
				return future;
			}
		}
		catch (e : Dynamic)
		{
			if (Std.is(HttpBadResponseException, e)) // This is the same as InstanceOf in most OO Languages
			{
				trace(Std.string(e) + " has been thrown");
				//body = "Future is Bad";
				hbre = e;
			}
			
			return null;
		}
		
		return future; // Not sure what to do here
	}
	
	/*@:abstract function getException(response : HttpCompleteResponse) : BeamException<V>
	{
		return ;
	}*/
}