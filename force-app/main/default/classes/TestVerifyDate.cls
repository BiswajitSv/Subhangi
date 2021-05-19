@isTest public class TestVerifyDate {
    @isTest static void testmethod1(){
        Date datepick=VerifyDate.CheckDates(Date.parse('1/10/2020'),Date.parse('20/10/2020'));
        System.assertEquals(Date.parse('20/10/2020'),datepick); 
    }
    @isTest static void testmethod2(){
        Date datepick1=VerifyDate.CheckDates(Date.parse('1/10/2020'),Date.parse('20/11/2020'));
        System.assertEquals(Date.parse('31/10/2020'),datepick1); 
    }

}