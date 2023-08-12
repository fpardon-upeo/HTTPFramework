/**
 * Created by fpardon on 12/08/2023.
 */

global class PipedriveQueuableSchedulerExample implements Schedulable {
    global void execute(SchedulableContext SC) {
        System.enqueueJob(new PipedriveQueuableExample('89', '0', '50'));
        System.enqueueJob(new PipedriveQueuableExample('126', '0', '50'));
    }
}