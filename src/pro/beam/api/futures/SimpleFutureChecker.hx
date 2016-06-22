package pro.beam.api.futures;

/**
 * ...
 * @author DragOnGamer626
 */
class SimpleFutureChecker<V, E> extends AbstractFutureChecker<V, E>
{
	@:final var exceptions : Map<Int, Class<E>>;
	public function new(exceptions : Map<Int, Class<E>>)
	{
		this.exceptions = exceptions;
	}
}