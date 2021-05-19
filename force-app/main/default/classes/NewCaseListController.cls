public with sharing class NewCaseListController {

public List<case> getNewCases() {

//list<case> caselist = Database.query(
      //  'SELECT Id, casenumber FROM case limit 10' );
      
      list<case> caselist =[SELECT Id, casenumber,status,Account.name FROM case where status='New' ];
      
        return caselist ;
 
   
                 
    }

}