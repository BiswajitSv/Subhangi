trigger OpptyClosdateprior on Opportunity (before Update) {
     //List<User> ulist =[Select id,Name,Bypassworkflow__c from User where Bypassworkflow__c=:false];
     //if(Trigger.isBefore){
        for(Opportunity Op:Trigger.new){
            //Date oldVal = trigger.oldMap.get(Op.id).CloseDate;
            System.debug('Stage Name@@@@@@'+Op.StageName);
            System.debug('Opportunity closedatevalue@@@@@@'+Op.CloseDate);
            
             if(Op.StageName=='Closed Won' && Op.CloseDate==System.today()){
             
             System.debug('Inside if condition@@@@@@');
                 Op.CloseDate=trigger.oldMap.get(Op.Id).CloseDate;
            }
        //}
}}