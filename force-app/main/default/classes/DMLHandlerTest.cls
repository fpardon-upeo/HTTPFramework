/**
 * Created by Frederik on 17/01/2023.
 */

@IsTest
private class DMLHandlerTest {
    @IsTest
    static void testBehavior() {

        //Test String to Decimal
        System.assertEquals(100, DMLHandler.stringToDecimal('100'));

        //Test String to Date
        System.assertEquals(Date.newInstance(2020, 1, 1), DMLHandler.stringToDate('2020-01-01'));



    }
}