package pro.beam.api.exceptions;
import haxe.Log;
import haxe.io.Error;

/**
 * ...
 * @author DragOnGamer626
 */
class BeamException
{
	public static function checkNull(d : Dynamic) : Dynamic
	{
		if (d == null)
		{
			trace(Std.string(d) + " was Null");
			throw Error;
		}
		
		return d;
	}
}