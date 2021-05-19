global class PMO_BirthdayMailBatchClass implements Database.Batchable<sObject>{
    global Database.querylocator start(Database.BatchableContext bc){
        Date tody = system.today();
        System.debug('today'+tody);
        String SOQL1 = 'SELECT Id, Name, Email,Birthdate,Image__c FROM Contact WHERE DAY_IN_MONTH(Birthdate) = ' + 
                      tody.day() +  ' AND CALENDAR_MONTH(Birthdate) = ' + tody.month();
        system.debug('SOQL' +SOQL1);
        return Database.getQueryLocator(SOQL1);
    }
    global void execute(Database.BatchableContext bc, List<contact> scope){
        for(contact iteratorUser : scope){
            date currentDate = date.today();
            integer currentDay = currentDate.day();
            integer currentMonth = currentDate.month();
           //System.debug('iteratorUser.Birthdate' +iteratorUser.Birthdate);
            if(iteratorUser.Birthdate!=null){
                 integer UserBdayDay = iteratorUser.Birthdate.day();
                 integer UserBdayMonth = iteratorUser.Birthdate.month();
                 String ImageURL = iteratorUser.Image__c;
                if(currentDay == UserBdayDay && currentMonth == UserBdayMonth){
                     Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                    //EmailTemplate templateId = [select Id,Name,body from EmailTemplate  where DeveloperName = 'Birthday_Template'];
                    //System.debug('Template body' + iteratorUser.Image__c);
                    List<String> toAddresses = new List<String>();
                    toAddresses.add(iteratorUser.email);
                    //email.setTemplateID(templateId.Id);
                    email.setToAddresses(toAddresses);
                    //email.setSubject(templateId.Subject);
                    email.setSubject('Happy Birthday. Have a blast Birthday Reminder! ' + iteratorUser.Name);
                    //String messageBody = '<html><body background="https://prdsaasqdf--dtambox--c.cs94.content.force.com/servlet/servlet.ImageServer?id=0150R000000Jtxd&oid=00D0R0000008d40 height="30">Happy Birthday ' + iteratorUser.Name + '<br><br>We hope you have a wonderful day and cherish your time with family, friends and dear ones.<br><br>Wish you all the best for the year ahead.<br><br><b>Regards,<br>PPA Team</b></body></html>';
                     String messageBody='<html><head><style>.fix1{background-repeat: no-repeat;background-attachment: fixed;background-position: center;}.fix{position:fixed;bottom:250px;left:45%;}img{border-radius: 50%;}</style></head><body background="https://c.ap5.content.force.com/servlet/servlet.ImageServer?id=0157F000002JuEr&oid=00D7F000005ATwT&lastMod=1569498919000"width="700" height="700" class="fix1"><center><img src="ImageURL" width="100" height="100" class="fix"/></center></body></html>';
                   // System.debug('messageBody'+messageBody);
                    email.setHtmlBody(messageBody);
                  // email.setHtmlBody(templateId.body);
					//email.setHtmlBody('We just wanted to send you a Happy Birthday wish' + iteratorUser.Name); 
    				Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
                }
            }
        }
    }
    global void finish(Database.batchableContext info){}
}