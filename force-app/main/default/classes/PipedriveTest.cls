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
/**
@Description:

@Change Log:

@Dependencies:

@Test Classes:

*/

public with sharing class PipedriveTest {

    public static void getPipelineDeals(){

        //Prepare the callout

        String endpoint = 'https://api.pipedrive.com/v1/pipelines/89/deals?limit=2&api_token=7a70da8fb8d1c290bdd41d19986e9054137ee5eb';

        Callout callout = new Callout();
        callout.endpoint = endpoint;
        callout.method = 'GET';
        callout.timeout = '120000';

        callout.headers = new Map<String, String>();
        callout.headers.put('Content-Type', 'application/json');
        callout.headers.put('Accept', 'application/json');

        //Make the callout
        CalloutHandler ca = new CalloutHandler();
        HttpResponse response = ca.makeCalloutNoBody(callout);
        System.debug('Response: ' + response.getBody());

        PipelineDealsWrapper wrapper = PipelineDealsWrapper.parse(response.getBody());

        for(PipelineDealsWrapper.Deal deal : wrapper.data){
            System.debug('Deal: ' + deal);
        }



    }

}