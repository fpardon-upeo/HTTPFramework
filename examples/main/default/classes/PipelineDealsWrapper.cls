/**
 * @Version: 1.0
 * @Author: Frederik
 * @Copyright: 2021 Upeo Consulting
 * @Uses:
 *
 * -----------------------------------------------------------------------------------------------
 * Description: Example of a wrapper class for a JSON response from PipelineDeals *
 * -----------------------------------------------------------------------------------------------
 * Revision No. 	Author 			Date 			Description
 * 1.0 			Frederik 		12/08/2023 		Initial version
 * -----------------------------------------------------------------------------------------------
 *
 * Unit tests:
 *
 * Change log:
 * -----------------------------------------------------------------------------------------------
*/


public class PipelineDealsWrapper {

    public Boolean success;
    public List<Deal> data;
    public AdditionalData additional_data;

    public class Deal {
        public String id;
        public String title;
    }

    public class AdditionalData {
        public Pagination_x pagination;
    }
    public class Pagination_x {
        public Boolean more_items_in_collection;
        public Integer next_start;
    }

    public static PipelineDealsWrapper parse(String json) {
        return (PipelineDealsWrapper) System.JSON.deserialize(json, PipelineDealsWrapper.class);
    }

    /* Example JSON response from PipelineDeals, in this example class we only use the "data" part of the response
     * From the data part we only use the "id" and "title" fields
    {
        "success": true,
        "data": [
            {
                "id": 25145,
                "creator_user_id": 13742945,
                "user_id": 13742945,
                "person_id": null,
                "org_id": 220822,
                "stage_id": 605,
                "title": "(BE SPEOS) Belgian Icecream Group",
                "value": 0,
                "currency": "EUR",
                "add_time": "2023-07-10 14:50:32",
                "update_time": "2023-07-13 15:02:11",
                "stage_change_time": null,
                "active": true,
                "deleted": false,
                "status": "open",
                "probability": null,
                "next_activity_date": "2023-07-14",
                "next_activity_time": null,
                "next_activity_id": 81230,
                "last_activity_id": 80836,
                "last_activity_date": "2023-07-13",
                "lost_reason": null,
                "visible_to": "3",
                "close_time": null,
                "pipeline_id": 89,
                "won_time": null,
                "first_won_time": null,
                "lost_time": null,
                "products_count": 0,
                "files_count": 0,
                "notes_count": 2,
                "followers_count": 1,
                "email_messages_count": 0,
                "activities_count": 2,
                "done_activities_count": 1,
                "undone_activities_count": 1,
                "participants_count": 0,
                "expected_close_date": null,
                "last_incoming_mail_time": null,
                "last_outgoing_mail_time": null,
                "label": null,
                "stage_order_nr": 1,
                "person_name": null,
                "org_name": "Belgian Icecream Group",
                "next_activity_subject": "mail",
                "next_activity_type": "call",
                "next_activity_duration": null,
                "next_activity_note": null,
                "formatted_value": "0 €",
                "weighted_value": 0,
                "formatted_weighted_value": "0 €",
                "weighted_value_currency": "EUR",
                "rotten_time": null,
                "owner_name": "Hava Kurbanova",
                "cc_email": "winpeo+deal25145@pipedrivemail.com",
                "43c7681fb78f0a050eddfd57014a0b1354d09a72": null,
                "org_hidden": false,
                "person_hidden": false
            },
            {
                "id": 24676,
                "creator_user_id": 13742945,
                "user_id": 13742945,
                "person_id": 196002,
                "org_id": 235452,
                "stage_id": 606,
                "title": "(BE SPEOS) Upfresh",
                "value": 0,
                "currency": "EUR",
                "add_time": "2023-05-03 09:43:44",
                "update_time": "2023-08-11 13:05:51",
                "stage_change_time": "2023-05-03 10:15:37",
                "active": true,
                "deleted": false,
                "status": "open",
                "probability": null,
                "next_activity_date": "2023-08-29",
                "next_activity_time": "12:00:00",
                "next_activity_id": 82096,
                "last_activity_id": 79004,
                "last_activity_date": "2023-07-17",
                "lost_reason": null,
                "visible_to": "3",
                "close_time": null,
                "pipeline_id": 89,
                "won_time": null,
                "first_won_time": null,
                "lost_time": null,
                "products_count": 0,
                "files_count": 0,
                "notes_count": 6,
                "followers_count": 1,
                "email_messages_count": 0,
                "activities_count": 7,
                "done_activities_count": 6,
                "undone_activities_count": 1,
                "participants_count": 1,
                "expected_close_date": null,
                "last_incoming_mail_time": null,
                "last_outgoing_mail_time": "2023-06-15 14:37:42",
                "label": null,
                "stage_order_nr": 3,
                "person_name": "Vicky Rogiers",
                "org_name": "Upfresh",
                "next_activity_subject": "Call her afternoon",
                "next_activity_type": "call",
                "next_activity_duration": null,
                "next_activity_note": "09/08 Na de middag terugbellen, niet voor 13h",
                "formatted_value": "0 €",
                "weighted_value": 0,
                "formatted_weighted_value": "0 €",
                "weighted_value_currency": "EUR",
                "rotten_time": null,
                "owner_name": "Hava Kurbanova",
                "cc_email": "winpeo+deal24676@pipedrivemail.com",
                "43c7681fb78f0a050eddfd57014a0b1354d09a72": null,
                "org_hidden": false,
                "person_hidden": false
            }
        ],
        "additional_data": {
            "pagination": {
                "start": 0,
                "limit": 2,
                "more_items_in_collection": true,
                "next_start": 2
            }
        }
    }
     */

}