public with sharing class CommonUtils {
	
	public class CommonUtilsException extends Exception{}

	public static Organization getOrganizationInfo(){
		
		try{
			return [SELECT OrganizationType FROM Organization LIMIT 1];
		}
		catch (Exception e){
			return null;
		}
	}

	// Dynamically create a new instance of an sObject record with the given object API name
    public static sObject createSObject(String objectAPIName) {
    	     
        if (String.isBlank(objectAPIName)) {
            throw new CommonUtilsException('You must provide an object API name.');
        }    	
    	
        Schema.SObjectType sObjectType = Schema.getGlobalDescribe().get(objectAPIName);

        return sObjectType.newSObject();
    }	
    	
	public static Id[] getIdArray(sObject[] sobjs){
   		return new List<Id>(getIdSet(sobjs));
   	}
   	 
   	public static Set<Id> getIdSet(sObject[] sobjs){
   		return (new Map<Id,SObject>(sobjs)).keySet();
   	}
    
    public static Integer getTotalPages(ApexPages.StandardSetController stdctrl){
    	
    	if (stdctrl != null){
			return (Math.mod(stdctrl.getResultSize(), stdctrl.getPageSize()) > 0) ? ((stdctrl.getResultSize() / stdctrl.getPageSize()) + 1) : (stdctrl.getResultSize() / stdctrl.getPageSize());
    	}
    	
    	return 0;   	
    }    

	public static SelectOption[] getEventReminderOptions(){
		
    	SelectOption[] options = new SelectOption[]{};
    	    	    	
    	options.add(new SelectOption('0', '0 Minutes'));
    	options.add(new SelectOption('5', '5 Minutes'));
    	options.add(new SelectOption('10', '10 Minutes'));
    	options.add(new SelectOption('15', '15 Minutes'));
    	options.add(new SelectOption('30', '30 Minutes'));
    	options.add(new SelectOption('60', '1 Hour'));
    	options.add(new SelectOption('120', '2 Hours'));
    	options.add(new SelectOption('180', '3 Hours'));
    	options.add(new SelectOption('240', '4 Hours'));
    	options.add(new SelectOption('300', '5 Hours'));
    	options.add(new SelectOption('360', '6 Hours'));
    	options.add(new SelectOption('420', '7 Hours'));
    	options.add(new SelectOption('480', '8 Hours'));
    	options.add(new SelectOption('540', '9 Hours'));
    	options.add(new SelectOption('600', '10 Hours'));
    	options.add(new SelectOption('660', '11 Hours'));
    	options.add(new SelectOption('720', '0.5 Days'));
    	options.add(new SelectOption('1080', '18 Hours'));
    	options.add(new SelectOption('1440', '1 Day'));
    	options.add(new SelectOption('2880', '2 Days'));    	 
    	options.add(new SelectOption('4320', '3 Days'));
    	options.add(new SelectOption('5760', '4 Days'));   
    	options.add(new SelectOption('10080', '1 Week'));
    	options.add(new SelectOption('20160', '2 Weeks'));     	    	   	   	    	    	    	    	    	  	    	    	    	    	    	    	    	    	    	    	
    	 
    	return options;
	}   	

	public static SelectOption[] getTimesOfDayOptions(){
		
    	SelectOption[] options = new SelectOption[]{new SelectOption('', '--None--')};
    	    	    	
    	options.add(new SelectOption('12:00 AM', '12:00 AM'));
    	options.add(new SelectOption('12:30 AM', '12:30 AM'));
    	options.add(new SelectOption('01:00 AM', '01:00 AM'));
    	options.add(new SelectOption('01:30 AM', '01:30 AM'));
    	options.add(new SelectOption('02:00 AM', '02:00 AM'));
    	options.add(new SelectOption('02:30 AM', '02:30 AM'));
    	options.add(new SelectOption('03:00 AM', '03:00 AM'));
    	options.add(new SelectOption('03:30 AM', '03:30 AM'));
    	options.add(new SelectOption('04:00 AM', '04:00 AM'));
    	options.add(new SelectOption('04:30 AM', '04:30 AM'));
    	options.add(new SelectOption('05:00 AM', '05:00 AM'));
    	options.add(new SelectOption('05:30 AM', '05:30 AM'));
    	options.add(new SelectOption('06:00 AM', '06:00 AM'));
    	options.add(new SelectOption('06:30 AM', '06:30 AM'));
    	options.add(new SelectOption('07:00 AM', '07:00 AM'));
    	options.add(new SelectOption('07:30 AM', '07:30 AM'));
    	options.add(new SelectOption('08:00 AM', '08:00 AM'));
    	options.add(new SelectOption('08:30 AM', '08:30 AM'));
    	options.add(new SelectOption('09:00 AM', '09:00 AM'));
    	options.add(new SelectOption('09:30 AM', '09:30 AM'));    	 
    	options.add(new SelectOption('10:00 AM', '10:00 AM'));
    	options.add(new SelectOption('10:30 AM', '10:30 AM'));   
    	options.add(new SelectOption('11:00 AM', '11:00 AM'));
    	options.add(new SelectOption('11:30 AM', '11:30 AM')); 
    	options.add(new SelectOption('12:00 PM', '12:00 PM'));
    	options.add(new SelectOption('12:30 PM', '12:30 PM'));
    	options.add(new SelectOption('01:00 PM', '01:00 PM'));
    	options.add(new SelectOption('01:30 PM', '01:30 PM'));
    	options.add(new SelectOption('02:00 PM', '02:00 PM'));
    	options.add(new SelectOption('02:30 PM', '02:30 PM'));
    	options.add(new SelectOption('03:00 PM', '03:00 PM'));
    	options.add(new SelectOption('03:30 PM', '03:30 PM'));
    	options.add(new SelectOption('04:00 PM', '04:00 PM'));
    	options.add(new SelectOption('04:30 PM', '04:30 PM'));
    	options.add(new SelectOption('05:00 PM', '05:00 PM'));
    	options.add(new SelectOption('05:30 PM', '05:30 PM'));
    	options.add(new SelectOption('06:00 PM', '06:00 PM'));
    	options.add(new SelectOption('06:30 PM', '06:30 PM'));
    	options.add(new SelectOption('07:00 PM', '07:00 PM'));
    	options.add(new SelectOption('07:30 PM', '07:30 PM'));
    	options.add(new SelectOption('08:00 PM', '08:00 PM'));
    	options.add(new SelectOption('08:30 PM', '08:30 PM'));
    	options.add(new SelectOption('09:00 PM', '09:00 PM'));
    	options.add(new SelectOption('09:30 PM', '09:30 PM'));    	 
    	options.add(new SelectOption('10:00 PM', '10:00 PM'));
    	options.add(new SelectOption('10:30 PM', '10:30 PM'));   
    	options.add(new SelectOption('11:00 PM', '11:00 PM'));
    	options.add(new SelectOption('11:30 PM', '11:30 PM')); 	    	    	   	   	    	    	    	    	    	  	    	    	    	    	    	    	    	    	    	    	
    	 
    	return options;
	}   
}
