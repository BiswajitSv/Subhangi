public class EmailManager {

    public  void sendMail(String [] addresses, String [] subjects, String [] messages){
        
        Messaging.SingleEmailMessage[] emails = new Messaging.SingleEmailMessage[] {};
        
        integer totalmails= addresses.size();
        for(integer i=0; i<totalmails;i++){
            
          Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

			email.setSubject(subjects[i]);
			email.setToAddresses(new List<String> { addresses[i] });
            email.setPlainTextBody(messages[i]);
            emails.add(email);
            
        }
            Messaging.sendEmail(emails);

        
    }
    
    
    
}