package pro.beam.api.response.channels;

/**
 * ...
 * @author DragOnGamer626
 */
class ShowChannelsResponse
{
	public static var attributes : Attributes;
	public static var scope : Scope;
	public static var ordering : Ordering;
	
	// Serialization Stuff
	@:final public static var onlineJson = "online";
	@:final public static var featuredJson = "featured";
	@:final public static var partneredJson = "partnered";
	@:final public static var attribNameJson = "name";
	@:final public static var viewersJson = "viewers_total";
	@:final public static var followersJson = "followers";
	@:final public static var subsJson = "subscribers";
	@:final public static var interactiveJson = "interactive";
	
	@:final public static var scopeNamesJson = "names";
	@:final public static var titlesJson = "titles";
	@:final public static var typesJson = "types";
	@:final public static var allJson = "names"; // why is this the same as Names?
	
	@:final public static var ascendingJson = "ascending";
	@:final public static var descendingJson = "descending";
}

enum Attributes
{
	ONLINE;
	FEATURED;
	PARTNERED;
	NAME;
	VIEWERS_TOTAL;
	FOLLOWERS;
	SUBSCRIBERS;
	INTERACTIVE;
}

enum Scope
{
	NAMES;
	TITLES;
	TYPES;
	ALL;
}

enum Ordering
{
	ASCENDING;
	DESCENDING;
}