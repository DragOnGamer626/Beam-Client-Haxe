package pro.beam.api.services.impl;
import tink.core.Future;
import pro.beam.api.BeamAPI;
import pro.beam.api.response.emotes.EmotePacksResponse;
import pro.beam.api.services.AbstractHTTPService;
import pro.beam.api.resource.emotes.EmotePack;

/**
 * ...
 * @author DragOnGamer626
 */
class EmotesService extends AbstractHTTPService
{
	public function new(beam : BeamAPI) 
	{
		super(beam, "/_latest/emoticons");
	}
	
	public function defaultEmotes() : Future<EmotePacksResponse<String, EmotePack>>
	{
		return this.get("manifest.json", Type.resolveClass("pro.beam.api.response.emotes.EmotePacksResponse"), null);
	}
}