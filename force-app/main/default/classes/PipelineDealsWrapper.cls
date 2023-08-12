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

public class PipelineDealsWrapper {

    public Boolean success;
    public List<Deal> data;

    public class Deal {
        public String id;
        public String title;
    }

    public static PipelineDealsWrapper parse(String json) {
        return (PipelineDealsWrapper) System.JSON.deserialize(json, PipelineDealsWrapper.class);
    }

}