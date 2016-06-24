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
		responses.push(response);
	}
	
	public function getResponse(code : Int) : HttpCompleteResponse
	{		
		var response : HttpCompleteResponse = null;

		for (i in 0...responses.length)
		{
			checkResponse(i, response, code);
			return null;
		}
		
		return response;
	}
	
	function checkResponse(index : Int, response : HttpCompleteResponse, code : Int) : Void
	{
		if (HttpBadResponseException.checkResponse(responses[index]))
		{
			checkResponseByCode(index, response, code);
		}
	}
	
	function checkResponseByCode(index : Int, response : HttpCompleteResponse, code : Int) : Void
	{
		if(responses[index].getStatus() == code)
			response = responses[index];
	}
	
	public function getResponses() : Array<HttpCompleteResponse>
	{
		return responses;
	}
}