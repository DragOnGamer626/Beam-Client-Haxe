package pro.beam.api.http;

/**
 * ...
 * @author DragOnGamer626
 */
class HttpCompleteResponse
{
	var status : Int;
	var body : String;
	
	public function new(status : Int, body : String) 
	{
		this.status = status;
		this.body = body;
	}
	
	public function getStatus() : Int
	{
		return status;
	}
	
	public function getBody() : String
	{
		return body;
	}
	
}