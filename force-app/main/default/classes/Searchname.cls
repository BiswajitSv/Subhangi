public with sharing class Searchname {

    public Searchname(ApexPages.StandardSetController controller) {

    }

     public String name { get; set;}
    public list<Contact> mycar { get; set; }
    public boolean searched{get;set;}
    public searchname() {
    searched=false;
    string namestr=ApexPages.currentPage().getParameters().get('name');
    if(null!=namestr) {
    name=namestr;
    //executeSearch();
    }
    }
    public PageReference executeSearch() {
      searched=true;
    System.debug('name' +name);
    string searchstr=('%'+name+'%');
    System.debug(searchstr);
   // accounts= new List<Account>();
    mycar=[select id,Name from Contact where name Like:searchstr limit 20];
    System.debug(mycar);
        return null;
    }


   
}