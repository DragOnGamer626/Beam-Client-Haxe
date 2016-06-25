package pro.beam.api.response.channels;

import pro.beam.api.resource.channel.BeamChannel;
import tink.core.Any;
import tink.core.Pair;
/**
 * ...
 * @author DragOnGamer626
 */
class ShowSlugsResponse extends List<ChannelType>
{
	public static var online : OnlineRestriction;
	
	public static function putParams(builder : Array<Pair<String, Any>>) : Bool
	{
		if (online != null)
		{
			switch(online)
			{
				case ONLINE:
					builder.push(new Pair<String, Any>("where", "online.neq.0"));
					return true;
				case OFFLINE:
					builder.push(new Pair<String, Any>("where", "online.eq.0"));
					return true;
				case NONE:
					return false;
				default:
					return false;
			}
		}
		return false;
	}
	
	public static function getParams()
	{
		return online.getParameters();
	}
}

@:access(ShowSlugsResponse)
enum OnlineRestriction
{
	ONLINE;
	OFFLINE;
	NONE;
}