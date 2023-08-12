/**
 * Created by Frederik on 17/01/2023.
 */

@IsTest
private class DMLHandlerTest {
    @IsTest
    static void testDMLNoReturn() {

        //Test thd DML Methods
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 5; i++){
            Account a = new Account(Name = 'Test Account ' + i);
            accounts.add(a);
        }

        //Test Insert
        DMLHandler.insertRecords(accounts);
        System.assertEquals(5, [SELECT COUNT() FROM Account]);
        System.assertEquals(0, [SELECT COUNT() FROM Error_Log__c]);

        Schema.SObjectField fAcc = Account.Fields.Id;
        DMLHandler.upsertRecords(fAcc, accounts);
        System.assertEquals(5, [SELECT COUNT() FROM Account]);
        System.assertEquals(0, [SELECT COUNT() FROM Error_Log__c]);

        //Test String to Integer
        System.assertEquals(100, DMLHandler.stringToInteger('100'));
        //Test String to Decimal
        System.assertEquals(100, DMLHandler.stringToDecimal('100'));
        //Test String to Date
        System.assertEquals(Date.newInstance(2020, 1, 1), DMLHandler.stringToDate('2020-01-01'));

        //Test Failed String to Integer
        System.assertEquals(0, DMLHandler.stringToInteger('test'));
        //Test Failed String to Decimal
        System.assertEquals(0, DMLHandler.stringToDecimal('test'));
        //Test Failed String to Date
        System.assertEquals(Date.today(), DMLHandler.stringToDate('test'));

    }

    @IsTest
    static void testDMLReturn() {
        //Test thd DML Methods
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 5; i++){
            Account a = new Account(Name = 'Test Account ' + i);
            accounts.add(a);
        }

        //Test Insert
        DMLHandler.insertRecordsWithReturn(accounts);
        System.assertEquals(5, [SELECT COUNT() FROM Account]);
        System.assertEquals(0, [SELECT COUNT() FROM Error_Log__c]);

        Schema.SObjectField fAcc = Account.Fields.Id;
        DMLHandler.upsertRecordsWithReturn(fAcc, accounts);
        System.assertEquals(5, [SELECT COUNT() FROM Account]);
        System.assertEquals(0, [SELECT COUNT() FROM Error_Log__c]);
    }

    @IsTest
    static void testDMLReturnError() {
        //Test thd DML Methods
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 5; i++){
            Account a = new Account(Name = null);
            accounts.add(a);
        }

        //Test Insert
        DMLHandler.insertRecordsWithReturn(accounts);
        System.assertEquals(0, [SELECT COUNT() FROM Account]);
        System.assertEquals(5, [SELECT COUNT() FROM Error_Log__c]);

        Schema.SObjectField fAcc = Account.Fields.Id;
        DMLHandler.upsertRecordsWithReturn(fAcc, accounts);
        System.assertEquals(0, [SELECT COUNT() FROM Account]);
        System.assertEquals(10, [SELECT COUNT() FROM Error_Log__c]);
    }
}