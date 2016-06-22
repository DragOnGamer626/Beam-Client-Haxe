package pro.beam.api.services.impl;
import lime.app.Future;
import pro.beam.api.BeamAPI;
import pro.beam.api.http.BeamHttpClient;
import pro.beam.api.resource.channel.BeamChannel;
import pro.beam.api.resource.chat.BeamChat;
import pro.beam.api.response.chat.ChatSettingsResponse;
import pro.beam.api.response.chat.MessagesResponse;
import pro.beam.api.response.chat.OnlineUsersResponse;
import pro.beam.api.services.AbstractHTTPService;

/**
 * ...
 * @author DragOnGamer626
 */
class ChatService extends AbstractHTTPService
{

	public function new(beam : BeamAPI) 
	{
		super(beam, "chats");
	}
	
	public function messages(channel : BeamChannel, start : Int, end : Int, limit : Int) : Future<MessagesResponse>
	{
		var args : Map<String, Dynamic> = BeamHttpClient.getArgumentsBuilder();
		args.set("id", channel.id);
		args.set("start", start);
		args.set("end", end);
		args.set("limit", limit);
		return this.get((Std.string(channel.id) + "/message"), Type.resolveClass("pro.beam.api.response.chat.MessagesResponse"), args);
	}
	
	public function users(channel : BeamChannel, page : Int, limit : Int) : Future<OnlineUsersResponse>
	{
		var args : Map<String, Dynamic> = BeamHttpClient.getArgumentsBuilder();
		args.set("id", channel.id);
		args.set("page", page);
		args.set("limit", limit);
		return this.get((Std.string(channel.id) + "/users"), Type.resolveClass("pro.beam.api.response.chat.OnlineUsersResponse"), args);
	}
	
	public function usersSearch(userName : String, channel : BeamChannel, page : Int, limit : Int) : Future<OnlineUsersResponse>
	{
		var args : Map<String, Dynamic> = BeamHttpClient.getArgumentsBuilder();
		args.set("page", page);
		args.set("limit", limit);
		args.set("id", channel.id);
		args.set("userName", userName);
		return this.get((Std.string(channel.id) + "/users/search"), Type.resolveClass("pro.beam.api.response.chat.OnlineUsersResponse"), args);
	}
	
	public function updateSettings(channel : BeamChannel, linksAllowed : Bool, linksClickable : Bool, slowChat : Int) : Future<ChatSettingsResponse>
	{
		var args : Map<String, Dynamic> = BeamHttpClient.getArgumentsBuilder();
		args.set("id", channel.id);
		args.set("linksAllowed", linksAllowed);
		args.set("linksClickable", linksClickable);
		args.set("slowChat", slowChat);
		
		return null; // Stub
	}
	
	public function findOne(id : Int) : Future<BeamChat>
	{
		return this.get(Std.string(id), Type.resolveClass("pro.beam.api.resource.chat.BeamChat"), null);
	}
}