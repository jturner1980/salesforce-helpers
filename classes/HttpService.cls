public with sharing class HttpService {
		
	public class HttpServiceException extends Exception{}
	
	private static Http http = new Http();
		
	public static HttpRequest generateRequest(String username, String password, String endpoint, String method, String contentType, String responseContentType, Integer timeout) {
		
		HttpRequest req = new HttpRequest();

	    Blob headerValue = Blob.valueOf(username + ':' + password);
	    String authorizationHeader = 'BASIC ' +
	    EncodingUtil.base64Encode(headerValue);
	    
	    req.setHeader('Authorization', authorizationHeader);				
		req.setEndpoint(endpoint);
		req.setMethod(method);
		req.setHeader('Content-Type', contentType);
		req.setHeader('Accept', responseContentType);		
		req.setTimeout(timeout);
		
		return req;
	}
	
	public static HttpResponse sendRequest(HttpRequest req){
		
        HttpResponse res = http.send(req);
        validateResponse(res);        
        
        return res;
    }
	
	public static HttpResponse validateResponse(HttpResponse res) {

		if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
			throw new HttpServiceException('Response error: ' + res.getBody());         
        }
        
        return res;
	}	
}
