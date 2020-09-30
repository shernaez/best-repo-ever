@isTest
public class TestVerifyDate {
    @isTest static void testOldDate(){
        Date dateTest = VerifyDate.checkDates(date.today(), date.today().addDays(-1));
        System.assertEquals(date.newInstance(2020, 9, 30), dateTest);
    }
    
    @isTest static void testLessThan30Days(){
        Date dateTest = VerifyDate.checkDates(date.today(), date.today().addDays(20));
        System.assertEquals(date.today().addDays(20), dateTest);
    }
    
    @isTest static void testMoreThan30Days(){
        Date dateTest = VerifyDate.checkDates(date.today(), date.today().addDays(31));
        System.assertEquals(date.newInstance(2020, 9, 30), dateTest);
    }

}