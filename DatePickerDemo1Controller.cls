public with sharing class DatePickerDemo1Controller {

    // the soql query 
    private String soql {get;set;}

    // query string that will be accessed by the vf page
    public String soqlQuery {
        get { return soql + ' order by name asc'; }
        set;
    }
    
    // init the controller with the default query string
    public DatePickerDemo1Controller() {
        soql = 'select Id, Name, Start_Date__c, End_Date__c, Location__c, Description__c from Special_Event__c where IsActive__c = true';
    }

    // build the query using parameters passed from the vf page
    public PageReference buildQueryString() {
 
        String name = Apexpages.currentPage().getParameters().get('name');
        String event_start_date = Apexpages.currentPage().getParameters().get('event_start_date_alternate');
        
        soql = 'select Id, Name, Start_Date__c, End_Date__c, Location__c, Description__c from Special_Event__c where IsActive__c = true';
        
        if (!name.equals(''))
            soql += ' and name LIKE \'%'+String.escapeSingleQuotes(name)+'%\'';
        if (!event_start_date.equals(''))
            soql += ' and start_date__c >= ' +String.escapeSingleQuotes(event_start_date)+ ' ';     
             
        return null;
    }
    
}
