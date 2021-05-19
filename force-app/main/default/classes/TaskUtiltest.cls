@istest public class TaskUtiltest {
    @istest static void testmethod1(){
       String taskPriority=TaskUtil.getTaskPriority('CA');
        System.assertEquals('High',taskPriority);  
    }
     @istest static void testmethod2(){
       String taskPriority=TaskUtil.getTaskPriority('CAA');
        System.assertEquals('Normal',taskPriority);  
    }
     @istest static void testmethod3(){
       String taskPriority=TaskUtil.getTaskPriority('NA');
        System.assertEquals('Normal',taskPriority);  
    }
}