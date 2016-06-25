package pro.beam.api.services.impl;
import tink.core.Future;
import tink.core.Any;
import tink.core.Pair.MPair;
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
		var args : Array<MPair<String, Any>> = BeamHttpClient.getArgumentsBuilder();
		args.push(new MPair<String, Any>("id", channel.id));
		args.push(new MPair<String, Any>("start", start));
		args.push(new MPair<String, Any>("end", end));
		args.push(new MPair<String, Any>("limit", limit));
		return this.get((Std.string(channel.id) + "/message"), Type.resolveClass("pro.beam.api.response.chat.MessagesResponse"), args);
	}
	
	public function users(channel : BeamChannel, page : Int, limit : Int) : Future<OnlineUsersResponse>
	{
		var args : Array<MPair<String, Any>> = BeamHttpClient.getArgumentsBuilder();
		args.push(new MPair<String, Any>("id", channel.id));
		args.push(new MPair<String, Any>("page", page));
		args.push(new MPair<String, Any>("limit", limit));
		return this.get((Std.string(channel.id) + "/users"), Type.resolveClass("pro.beam.api.response.chat.OnlineUsersResponse"), args);
	}
	
	public function usersSearch(userName : String, channel : BeamChannel, page : Int, limit : Int) : Future<OnlineUsersResponse>
	{
		var args : Array<MPair<String, Any>> = BeamHttpClient.getArgumentsBuilder();
		args.push(new MPair<String, Any>("page", page));
		args.push(new MPair<String, Any>("limit", limit));
		args.push(new MPair<String, Any>("id", channel.id));
		args.push(new MPair<String, Any>("userName", userName));
		return this.get((Std.string(channel.id) + "/users/search"), Type.resolveClass("pro.beam.api.response.chat.OnlineUsersResponse"), args);
	}
	
	public function updateSettings(channel : BeamChannel, linksAllowed : Bool, linksClickable : Bool, slowChat : Int) : Future<ChatSettingsResponse>
	{
		var args : Array<MPair<String, Any>> = BeamHttpClient.getArgumentsBuilder();
		args.push(new MPair<String, Any>("id", channel.id));
		args.push(new MPair<String, Any>("linksAllowed", linksAllowed));
		args.push(new MPair<String, Any>("linksClickable", linksClickable));
		args.push(new MPair<String, Any>("slowChat", slowChat));
		
		return null; // Stub
	}
	
	public function findOne(id : Int) : Future<BeamChat>
	{
		return this.get(Std.string(id), Type.resolveClass("pro.beam.api.resource.chat.BeamChat"), null);
	}
}