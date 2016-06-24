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
			if (HttpBadResponseException.checkResponse(responses[i]))
			{
				if(responses[i].getStatus() == code)
					response = responses[i];
			}
		}
		
		return response;
	}
	
	public function getResponses() : Array<HttpCompleteResponse>
	{
		return responses;
	}
}