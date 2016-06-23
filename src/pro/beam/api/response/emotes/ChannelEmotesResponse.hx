package pro.beam.api.response.emotes;

import pro.beam.api.resource.emotes.EmoticonCoordinate;

/**
 * ...
 * @author DragOnGamer626
 */
class ChannelEmotesResponse
{
	public var uri : String; // Will Probably Change This Later
	public var emoteSet : EmoteSet;
	
	public function new(uri : String, emoteSet : EmoteSet) 
	{
		this.uri = uri;
		this.emoteSet = emoteSet;
	}
	
}