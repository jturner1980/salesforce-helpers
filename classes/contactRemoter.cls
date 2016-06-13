public with sharing class contactRemoter {
    
    public class ContactsWrapper{
    	public Contact[] contacts {get;set;}
    	public Integer recordCount {get;set;}
    }
    
    @RemoteAction
    public static ContactsWrapper getContactsInit(String searchTxt, Integer pageSize, Integer offSet, String sortBy, String sortDir){
    	
    	ContactsWrapper wrapper = new ContactsWrapper();
    	wrapper.contacts = getContacts(searchTxt, pageSize, offSet, sortBy, sortDir);
    	
    	if (String.isNotBlank(searchTxt)){
    		wrapper.recordCount = Database.countQuery('Select Count() From Contact Where Name Like \'%' + String.escapeSingleQuotes(searchTxt) + '%\'');
    	}
    	else{
    		wrapper.recordCount = Database.countQuery('Select Count() From Contact');
    	}    	
    	
    	return wrapper;
    }
    
    private static Contact[] getContacts(String searchTxt, Integer pageSize, Integer offSet, String sortBy, String sortDir){
    	
    	String selectClause = 'Select Id, Name, Account.Name, Account.Geolocation__latitude__s, Account.Geolocation__longitude__s, Phone, Birthdate From Contact ';
    	
    	if (String.isNotBlank(searchTxt)){
    		return Database.query(selectClause + 'Where Name Like \'%' + String.escapeSingleQuotes(searchTxt) + '%\' Order By ' + String.escapeSingleQuotes(sortBy) + ' ' + String.escapeSingleQuotes(sortDir) + ' LIMIT :pageSize');    		
    	}
    	else{
    		return Database.query(selectClause + ' Order By ' + String.escapeSingleQuotes(sortBy) + ' ' + String.escapeSingleQuotes(sortDir) + ' LIMIT :pageSize OFFSET :offSet');
    	}
    }
}
