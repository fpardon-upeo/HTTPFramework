/**
 * @Version: 1.0
 * @Author: Frederik
 * @Copyright: 2021 Upeo Consulting
 * @Uses:
 *
 * -----------------------------------------------------------------------------------------------
 * Description: 
 *
 *
 * Created: 12/08/2023
 * Last Updated: 12/08/2023
 *
 * Unit tests:
 *
 * Change log:
 * -----------------------------------------------------------------------------------------------
*/

public virtual class CalloutHandler {


    public virtual HttpResponse makeCalloutNoBody(Callout callout) {
        // Execute the callout
        CalloutValidator.validate(callout);
        System.debug('Callout: ' + callout);
        HttpRequest request = new HttpRequest();
        request.setEndpoint(callout.endpoint);
        request.setMethod(callout.method);
        // Parse the headers
        request = parseHeaders(request, callout);

        Http http = new Http();
        HttpResponse response = http.send(request);
        return response;
    }

    public virtual HttpResponse makeCalloutWithBody(Callout callout) {
        // Execute the callout
        CalloutValidator.validate(callout);

        System.debug('Callout: ' + callout);
        HttpRequest request = new HttpRequest();
        request.setEndpoint(callout.endpoint);
        request.setMethod(callout.method);
        request.setBody(callout.body);
        // Parse the headers
        request = parseHeaders(request, callout);

        Http http = new Http();
        HttpResponse response = http.send(request);
        return response;
    }

    public virtual HttpRequest parseHeaders(HttpRequest request, Callout callout) {
        // Parse the headers
        for (String header : callout.headers.keySet()) {
            request.setHeader(header, callout.headers.get(header));
        }
        System.debug('Request: ' + request);
        return request;
    }


}