package pro.beam.api.http;

/**
 * ...
 * @author DragOnGamer626
 */
class HttpCompleteResponseHandler
{
	var responses : Array<HttpCompleteResponse>;
	
	public function new() 
	{
		responses = new Array<HttpCompleteResponse>();
	}
	
	public function add(response : HttpCompleteResponse) : Void
	{
		if (response != null)
			responses.push(response);
	}
	
	public function getResponse(code : Int) : HttpCompleteResponse
	{
		var response : HttpCompleteResponse = null;
		
		for (i in responses.iterator())
		{
			response = checkResponseBasedOnCode(responses.lastIndexOf(i), code);
		}
		
		return response;
	}
	
	function checkResponseBasedOnCode(index : Int, code : Int) : HttpCompleteResponse
	{
		var response : HttpCompleteResponse = responses[index];
		
		if (response.getStatus() == code)
			return response;
			
		return null;
	}
	
	public function getResponses() : Array<HttpCompleteResponse>
	{
		return responses;
	}
}