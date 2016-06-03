@isTest
public class TestData
{
	public class TestDataException extends Exception{}
	
	// Static initlialization block for anything that needs to execute the first time this class is called
    static
    {
 
    }

	/* Custom Objects */ 
	

	/* Standard Objects */ 	  
    public static Account[] createAccounts(Boolean doInsert, Integer numAccounts, Id recordTypeId){
    	
        Account[] accounts = new Account[]{};
    
        for (Integer i = 1; i <= numAccounts; i++){
        	
            Account a = new Account();
            //a.RecordTypeId = recordTypeId;  
            a.Name= 'Test account ' + i;
            a.Industry = 'Education';
            a.BillingStreet = '200 W Washington St';
            a.BillingCity = 'Indianapolis';
            a.BillingState = 'Indiana';
            a.BillingCountry = 'United States';
            a.BillingPostalCode = '46204';                                                
            accounts.add(a);
        }
        
        if (doInsert){
        	insert accounts;
        }
        
        return accounts;    
    }
    
    public static Campaign[] createCampaigns(Boolean doInsert, Set<String> names, Id recordTypeId){

    	Campaign[] campaigns = new Campaign[]{};

		for (String name : names){

    		Campaign campaign = new Campaign();
			//campaign.RecordTypeId = recordTypeId;
			campaign.Name = name;
    		campaigns.add(campaign);
		}

    	if (doInsert){
    		insert campaigns;
    	}

    	return campaigns;
    }

    public static CampaignMember[] createCampaignMembers(Boolean doInsert, Id campaignId, Id recordTypeId, sObject[] entitiesToAdd){

    	CampaignMember[] campaignMembers = new CampaignMember[]{};

		for (sObject entity : entitiesToAdd){

    		CampaignMember campaignMember = new CampaignMember(CampaignId = campaignId, Status = 'Planned');
			
			//campaignMember.RecordTypeId = recordTypeId;
			
			if (entity.Id.getSObjectType() == Contact.getSObjectType()){
				campaignMember.ContactId = entity.Id;
			}
			else if (entity.Id.getSObjectType() == Lead.getSObjectType()){
				campaignMember.LeadId = entity.Id;
			}

    		campaignMembers.add(campaignMember);
		}

    	if (doInsert){
    		insert campaignMembers;
    	}

    	return campaignMembers;
    }    

    public static Case[] createCases(Boolean doInsert, Integer numCases, Id recordTypeId, Id accountId){
    	
        Case[] cases = new Case[]{};
    
        for (Integer i = 1; i <= numCases; i++){
            
            Case c = new Case();
            //c.RecordTypeId = recordTypeId;            
            c.AccountId = accountId;
            c.Subject = 'Test case ' + i;
            cases.add(c);
        }
        
        if (doInsert){
        	insert cases;
        }
        
        return cases;
    }
    
    public static CaseArticle[] createCaseArticles(Boolean doInsert, Map<Id, Id> caseIdArticleIdMap){
    	
        CaseArticle[] caseArticles = new CaseArticle[]{};
    
        for (Id caseId : caseIdArticleIdMap.keySet()){
            
            CaseArticle ca = new CaseArticle();
            ca.CaseId = caseId;
            ca.KnowledgeArticleId = caseIdArticleIdMap.get(caseId);
            caseArticles.add(ca);
        }
        
        if (doInsert){
        	insert caseArticles;
        }
        
        return caseArticles;
    }       
    
    public static CaseComment[] createCaseComments(Boolean doInsert, Map<Id, Set<String>> caseIdCommentsMap, Boolean isPublished){
    	
        CaseComment[] caseComments = new CaseComment[]{};
    
        for (Id caseId : caseIdCommentsMap.keySet()){
            
            for (String comment : caseIdCommentsMap.get(caseId)){
            		            
	            CaseComment cc = new CaseComment();
	            cc.ParentId = caseId;            
	            cc.CommentBody = comment;
	            cc.isPublished = isPublished;
	            caseComments.add(cc);
            }
        }
        
        if (doInsert){
        	insert caseComments;
        }
        
        return caseComments;
    }      
    
    public static Contact[] createContacts(Boolean doInsert, Integer numContacts, Id recordTypeId, Id AccountId){
    	
        Contact[] contacts = new Contact[]{};
    
        for (Integer i = 1; i <= numContacts; i++){
        	
            Contact contact = new Contact();
            //contact.RecordTypeId = recordTypeId;
            contact.AccountId = AccountId;
            contact.FirstName = 'John' + i;
            contact.LastName = 'Doe' + i;
            contact.Email = 'johndoe' + i + '@companytestdata.com';
            contact.Title = 'Sales_Mgr_' + i;            
            contacts.add(contact);
        }
        
        if (doInsert){
        	insert contacts;
        }
        
        return contacts;     
    }        
    
    public static EmailTemplate[] createEmailTemplates(Boolean doInsert, Set<String> names, Id folderId){ 

    	EmailTemplate[] emailTemplates = new EmailTemplate[]{};

    	for (String name : names){
    		
			EmailTemplate template = new EmailTemplate();
			template.Name = name;
			template.DeveloperName = name;
			template.TemplateType = 'Text';
			template.Subject = 'Test Subject';
			template.Body = 'Test Body';
			template.FolderId = folderId;
			emailTemplates.add(template);
    	}

		if (doInsert){
			insert emailTemplates;
		}

    	return emailTemplates;
    }    
    
    public static Event[] createEvents(Boolean doInsert, Integer numEvents, Id recordTypeId, String eventType, Id whatId, Id whoId, DateTime startDateTime, DateTime endDateTime){
    	
        Event[] events = new Event[]{};
    
        for (Integer i = 1; i <= numEvents; i++){
        	
            Event event = new Event();   
            //event.RecordTypeId = recordTypeId;   
            event.Subject = 'Test event ' + i;   
            event.Type = eventType;
            event.StartDateTime = startDateTime;
            event.EndDateTime = endDateTime;
            event.WhatId = whatId;
            event.WhoId = whoId;                                 
            events.add(event);
        }
        
        if (doInsert){
        	insert events;
        }
        
        return events;     
    }     
    
    public static Group[] createGroups(Boolean doInsert, Set<String> groupNames, String groupType){

    	Group[] groups = new Group[]{};

    	for (String groupName : groupNames){

    		Group newGroup = new Group();
    		newGroup.Name = groupName;
    		newGroup.DeveloperName = groupName.replaceAll(' ', '_');
    		newGroup.Type = groupType;

    		groups.add(newGroup);
    	}

    	if (doInsert){
    		insert groups;
    	}

    	return groups;
    }    
    
    public static GroupMember[] createGroupMembers(Boolean doInsert, Map<Id, Set<Id>> groupIdMap){

    	GroupMember[] groupMembers = new GroupMember[]{};

    	for (Id groupId : groupIdMap.keySet()){

    		Set<Id> userOrGroupIds = groupIdMap.get(groupId);

    		for (Id userOrGroupId : userOrGroupIds){

	    		GroupMember groupMember = new GroupMember();
				groupMember.GroupId = groupId;
				groupMember.UserOrGroupId = userOrGroupId;

	    		groupMembers.add(groupMember);
    		}
    	}

    	if (doInsert){
    		insert groupMembers;
    	}

    	return groupMembers;
    }    
    
    public static Lead[] createLeads(Boolean doInsert, Integer numLeads, Id recordTypeId){
    	
        Lead[] leads = new Lead[]{};
    
        for (Integer i = 1; i <= numLeads; i++){
        	
            Lead lead = new Lead();
            //lead.RecordTypeId = recordTypeId;
            lead.Company = 'Test_Account_' + i;
            lead.FirstName = 'John' + i;
            lead.LastName = 'Doe' + i;
            lead.Email = 'johndoe' + i + '@companytestdata.com';
            lead.Title = 'Sales_Mgr_' + i;
            lead.Phone = '(555)-555-5555';
            leads.add(lead);        	
        }
        
        if (doInsert){
        	insert leads;
        }
        
        return leads;     
    }      

    public static Task[] createTasks(Boolean doInsert, Integer numTasks, Id recordTypeId, String taskType, Id whatId, Id whoId, Date dueDate){
    	
        Task[] tasks = new Task[]{};
    
        for (Integer i = 1; i <= numTasks; i++){
        	
            Task task = new Task();   
            //task.RecordTypeId = recordTypeId;   
            task.Subject = 'Test task ' + i;   
            task.Type = taskType;
            task.ActivityDate = dueDate;
            task.WhatId = whatId;
            task.WhoId = whoId;                                 
            tasks.add(task);
        }
        
        if (doInsert){
        	insert tasks;
        }
        
        return tasks;     
    }    
    
    public static Opportunity[] createOpportunities(Boolean doInsert, Integer numOpps, Id recordTypeId, Id accountId, String stage){
    	
        Opportunity[] opportunities = new Opportunity[]{};

        for (Integer i = 1; i <= numOpps; i++){
        	
            Opportunity opp = new Opportunity();
            //opp.RecordTypeId = recordTypeId;
            opp.AccountId = accountId;
            opp.Name = 'Test opportunity ' + i;
            opp.StageName = stage;
            opp.CloseDate = Date.today().addDays(30);
            opportunities.add(opp);
        }

        if (doInsert){
            insert opportunities;
        }

        return opportunities;
    }       
    
    private static User[] createUsers(Boolean doInsert, Integer numUsers, Id profileId, Id roleId, Set<Id> permSetIds, User runAsUser){
    	
        User[] users = new User[]{};
    
        for (Integer i = 1; i <= numUsers; i++)
        {
            User user = new User();
            user.IsActive = true;
            user.FirstName = 'John' + i;
            user.LastName = 'Doe' + i;
            user.Username = 'johndoe' + i + '@companytestdata.com';
            user.Alias = 'johndoe' + i;            
            user.Email = 'johndoe' + i + '@companytestdata.com';
            user.EmailEncodingKey = 'UTF-8';
            user.TimeZoneSidKey = 'America/Indianapolis';  
            user.LocaleSidKey = 'en_US';
            user.LanguageLocaleKey = 'en_US';                   
            user.CommunityNickname = 'johndoe_' + i;
            user.ProfileId = profileId;        
            user.UserRoleId = roleId;    
            users.add(user);
        }
        
        if (doInsert){
        	
            insert users;
            
            // Assign permission sets
            addUsersToPermissionSets(users, permSetIds, runAsUser);
            
        }
        else if (!doInsert && permSetIds != null && !permSetIds.isEmpty()){
        	throw new TestDataException('doInsert must be set to True if permission set Ids have been provided.');
        }
        
        return users;    
    }
    
    // This insert needs to run as a different user to prevent a MIXED_DML_OPERATION error
	public static void addUsersToPermissionSets(User[] users, Set<Id> permissionSetIds, User runAsUser) {

        PermissionSetAssignment[] permissionSetAssignments = new PermissionSetAssignment[]{};

		if (runAsUser == null){
			runAsUser = new User(Id = UserInfo.getUserId());
		}
		
        system.runAs(runAsUser) {

	        if (permissionSetIds != null) {

	        	for (User user : users) {
					
					for (Id permissionSetId : permissionSetIds)
					
		        		if (permissionSetId != null) {
		        			
			            	PermissionSetAssignment psa = new PermissionSetAssignment();
			            	psa.AssigneeId = user.Id;
			            	psa.PermissionSetId = permissionSetId;
			            	permissionSetAssignments.add(psa);
		            	}

	        	}
	        	
				insert permissionSetAssignments;	        	
	        }
        }
	}    
}
