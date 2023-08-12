/**
 * Created by fpardon on 12/08/2023.
 */

public class PipedriveQueuableExample implements Queueable {
    public String Pipeline = '89';
    public String PaginationStart = '0';
    public String PaginationLimit = '50';

    /**
    * Constructor for setting up the class properties
    * @param pip Pipeline ID
    * @param start Pagination start index
    * @param x_limit Pagination limit (max 50)
    */
    public PipedriveQueuableExample(String pip, String start, String x_limit) {
        Pipeline = pip;
        PaginationStart = start;
        PaginationLimit = x_limit;
    }

    // The execute method is where you place the logic to be executed when this job runs
    public void execute(QueueableContext context) {

        //Build the endpoint URL
        String endpoint = 'callout:Pipedrive/deals?pipeline_id=' + Pipeline +
                '&start=' + PaginationStart +
                '&limit=' + PaginationLimit +
                '&api_token=7a70da8fb8d1c290bdd41d19986e9054137ee5eb';

        Callout callout = new Callout();
        callout.endpoint = endpoint;
        callout.method = 'GET';

        CalloutHandler caHandler = new CalloutHandler();
        HttpResponse response = caHandler.makeCalloutNoBody(callout);
        parsePipelineResult(response);

    }

    public void parsePipelineResult(HttpResponse response) {
        //Parse the response
        PipelineDealsWrapper dealsWrapper = PipelineDealsWrapper.parse(response.getBody());
        List<PipelineDealsWrapper.Deal> deals = dealsWrapper.data;
        List<Lead> leads = new List<Lead>();
        for(PipelineDealsWrapper.Deal deal : deals){
            Lead l = new Lead();
            l.Pipedrive_Id__c = deal.id;
            l.Company = deal.title;
            l.LastName = deal.title;
            leads.add(l);
        }

        Schema.SObjectField fLead = Lead.Fields.Pipedrive_Id__c;

        //Call the DMLHandler to upsert the records
        DMLHandler.upsertRecords(fLead, leads);

        if(dealsWrapper.additional_data.pagination.more_items_in_collection == true){
            //If there are more items in the collection, queue the next batch
            Integer start = dealsWrapper.additional_data.pagination.next_start;
            String nextStart = String.valueOf(Integer.valueOf(start) + Integer.valueOf(PaginationLimit));
            System.enqueueJob(new PipedriveQueuableExample(Pipeline, nextStart, PaginationLimit));
        }



    }


}