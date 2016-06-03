public with sharing class SObjectAccessService {

	public static Map<String, Schema.SObjectType> globalDesc = Schema.getGlobalDescribe();
	
	public static DescribeSObjectResult getObjectDescribeResult(String objectName){
		return globalDesc.get(objectName).getDescribe();
	}
	
	public static Map<String, SObjectField> getSObjectFieldMap(String objectName){
		return getObjectDescribeResult(objectName).fields.getMap();
	}	
	
	public static Boolean canAccessSObject(String objectName){
		return getObjectDescribeResult(objectName).isAccessible();
	}			
	
	public static Boolean canUpdateSObject(String objectName){
		return getObjectDescribeResult(objectName).isUpdateable();
	}
	
	public static Boolean canInsertSObject(String objectName){
		return getObjectDescribeResult(objectName).isCreateable();
	}
	
	public static Boolean canDeleteSObject(String objectName){
		return getObjectDescribeResult(objectName).isDeletable();
	}	
	
	public static Boolean canAccessField(String objectName, String fieldName){
		 return getSObjectFieldMap(objectName).get(fieldName).getDescribe().isAccessible();
	}			
	
	public static Boolean canUpdateField(String objectName, String fieldName){	
		return getSObjectFieldMap(objectName).get(fieldName).getDescribe().isUpdateable();
	}		
}
