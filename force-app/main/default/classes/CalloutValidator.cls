/**
 * @Version: 1.0
 * @Author: Frederik
 * @Copyright: 2021 Upeo Consulting
 * @Uses:
 *
 * -----------------------------------------------------------------------------------------------
 * Description: Validator for Callout objects
 * -----------------------------------------------------------------------------------------------
 * Revision No. 	Author 			Date 			Description
 * 1.0 			Frederik 		12/08/2023 		Initial version
 * -----------------------------------------------------------------------------------------------
 * Dependencies: Callout
 * Created: 12/08/2023
 * Last Updated: 12/08/2023
 *
 * Unit tests: CalloutHandlerTest
 * -----------------------------------------------------------------------------------------------
*/


public class CalloutValidator {

    public static void validate(Callout callout) {
        if (callout == null) {
            throw new IllegalArgumentException('Callout object cannot be null');
        }
        if (callout.endpoint == null) {
            throw new IllegalArgumentException('Endpoint cannot be null');
        }
        if (callout.method == null) {
            throw new IllegalArgumentException('Method cannot be null');
        }
        // Add additional validations as needed
    }

}