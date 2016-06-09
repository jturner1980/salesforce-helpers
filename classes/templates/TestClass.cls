/* Note: this template can be imported directly into Eclipse as an Apex Class template */
@isTest
private with sharing class ${class_name} {

	// Variables
	private static User testUser1;
	
	// Method that creates test data required for all unit tests
	@testSetup
	private static void createData(){
								
	}
	
	// Method that retrieves all generated test data, this can be parameterized to address governor limit challenges
	private static void getCreatedData(){	
			
	}
	
	// Unit test1 description
	private static testMethod void unitTest1() {
		
		getCreatedData();

		Test.startTest();
		{		
			// Run unit tests as a specific user
			System.runAs(testUser1){				
				
				// Perform unit tests
				
				// Verify governor limits are not close to being exceeded
				// TestData.checkGovernorLimits();
			}

			// Pre-asynchronous test assertions
		}
		Test.stopTest();

		// Post-asynchronous test assertions
	}	    
}
