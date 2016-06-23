package pro.beam.api.response.emotes;

import pro.beam.api.resource.emotes.EmoticonCoordinate;

/**
 * ...
 * @author DragOnGamer626
 */
class EmoteSet
{
	var map : Map<String, Dynamic>;
	
	public function new(string : String, coord : EmoticonCoordinate) 
	{
		map = new Map<String, Dynamic>();
		map.set(string, coord);
	}
	
}