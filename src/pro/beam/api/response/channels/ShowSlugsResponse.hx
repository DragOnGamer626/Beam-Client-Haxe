package pro.beam.api.response.channels;

import pro.beam.api.resource.channel.BeamChannel;
/**
 * ...
 * @author DragOnGamer626
 */
class ShowSlugsResponse extends List<ChannelType>
{
	public static var online : OnlineRestriction;
	
	public static function putParams(builder : Map<String, Dynamic>) : Bool
	{
		if (online != null)
		{
			switch(online)
			{
				case ONLINE:
					builder.set("where", "online.neq.0");
					return true;
				case OFFLINE:
					builder.set("where", "online.eq.0");
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