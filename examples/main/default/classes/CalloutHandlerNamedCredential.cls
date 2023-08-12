/**
 * @Version: 1.0
 * @Author: Frederik
 * @Copyright: 2021 Upeo Consulting
 * @Uses:
 *
 * -----------------------------------------------------------------------------------------------
 * Description: Example of a callout handler that uses a named credential and that overrides the
 * makeCalloutNoBody method of the CalloutHandler class.
 * -----------------------------------------------------------------------------------------------
 * Dependencies: CalloutHandler, Callout
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


public class CalloutHandlerNamedCredential extends CalloutHandler{

    public override HttpResponse makeCalloutNoBody(Callout callout){

        //Build the endpoint url first using the named credential
        String endpoint = 'callout:pipeDriveLegacy'+'/pipelines/89/deals?limit=2&api_token=7a70da8fb8d1c290bdd41d19986e9054137ee5eb';
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);
        return response;
    }

}