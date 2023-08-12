/**
 * @Version: 1.0
 * @Author: Frederik
 * @Copyright: 2021 Upeo Consulting
 * @Uses:
 *
 * -----------------------------------------------------------------------------------------------
 * Description: Example of an API call using the Callout and CalloutHandler class
 * -----------------------------------------------------------------------------------------------
 * Dependencies: Callout, CalloutHandler, PipelineDealsWrapper
 * -----------------------------------------------------------------------------------------------
 * Revision No. 	Author 			Date 			Description
 * 1.0 			Frederik 		12/08/2023 		Initial version
 * -----------------------------------------------------------------------------------------------
 *
 * Unit tests:
 *
 * -----------------------------------------------------------------------------------------------
*/


public with sharing class PipedriveExample {

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
        HttpResponse response = ca.makeCallout(callout);
        System.debug('Response: ' + response.getBody());

        PipelineDealsWrapper wrapper = PipelineDealsWrapper.parse(response.getBody());

        List<Lead> leads = new List<Lead>();

        for(PipelineDealsWrapper.Deal deal : wrapper.data){
            System.debug('Deal: ' + deal);
            Lead lead = new Lead();
            lead.LastName = deal.title;
            lead.Company = deal.title;
            leads.add(lead);
        }

        DMLHandler.insertRecords(leads);

    }

    public static void getPipelineDealsNamedCredential(){

        //Prepare the callout
        Callout callout = new Callout();
        CalloutHandlerNamedCredential ca = new CalloutHandlerNamedCredential();

        HttpResponse response = ca.makeCall(callout);
        System.debug('Response: ' + response.getBody());

        PipelineDealsWrapper wrapper = PipelineDealsWrapper.parse(response.getBody());

        List<Lead> leads = new List<Lead>();

        for(PipelineDealsWrapper.Deal deal : wrapper.data){
            System.debug('Deal: ' + deal);
            Lead lead = new Lead();
            lead.LastName = deal.title;
            lead.Company = deal.title;
            lead.Pipedrive_Id__c = deal.id;
            leads.add(lead);
        }

        //Set the External Id field
        Schema.SObjectField fLead = Lead.Fields.Pipedrive_Id__c;

        //Call the DMLHandler to upsert the records
        DMLHandler.upsertRecords(fLead, leads);

    }

}