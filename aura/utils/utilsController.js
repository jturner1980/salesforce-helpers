({
	callAction : function(cmp, event, helper) {
		
        var params = event.getParam('arguments');       
        var startTime;
        
        params.action.setCallback(this, function(response) {
           
            var endTime = new Date().getTime();          
            var state = response.getState();
            
            if (state === 'SUCCESS') {
                             
                //FIXME: take this out in the production version
				//console.log(params.action.$def$.name + ' response time:  ' + (endTime - startTime));
                
                if (params.successHandler) {
                	params.successHandler(response.getReturnValue());    
                }                
            } 
            else if (state === 'ERROR') {
                
                var errors = response.getError();
                
                if (errors) {
                    
                    if (console.error) {
                    	console.error(errors);    
                    }
                    
                    if (errors[0] && errors[0].message) {
                        $A.error("Error message: " + errors[0].message);
                    }
                } 
                else {                   
                    $A.error("Unknown error");                    
                }   
                
                if (params.errorHandler) {
                	params.errorHandler(response);    
                }                     
            }            
        }); 
        
        startTime = new Date().getTime();
        $A.enqueueAction(params.action);        
	},

    getHashQueryParam : function(queryParamName) {
		
        var reg = new RegExp('[?&]' + queryParamName + '=([^&]*)', 'i');
    	var result = reg.exec(window.location.hash);
        return result ? result[1] : '';       
	},
    toggleSpinner : function(cmp, event, helper){
        
        var params = event.getParam('arguments'); 
        
        var toggleSpinner = $A.get("e.c:toggleScreenLoading");
        
        toggleSpinner.setParams({
			isVisible : params.isVisible
        });
        
        toggleSpinner.fire();  
    },
    populateDateInput : function(cmp, event, helper){   
        
        var params = event.getParam('arguments'); 
        params.cmp.find(params.inputAuraId).set('v.value', params.dateValue.getFullYear() + "-" + (params.dateValue.getMonth() + 1) + "-" + params.dateValue.getDate()); 
    }, 
    getEntityType : function(cmp, event, helper){
        
        var params = event.getParam('arguments');
        var entityId = params['entityId'];
        var resultHandler = params['resultHandler'];
        var entityType;
        
        if (entityId.substring(0, 3) == '00Q'){
            entityType = 'Lead';
        }
        else if (entityId.substring(0, 3) == '003'){
            entityType = 'Contact';
        }
        else if (entityId.substring(0, 3) == '001'){
            entityType = 'Account';
        }
        else if (entityId.substring(0, 3) == '006'){
            entityType = 'Opportunity';
        }        
        
        resultHandler(entityType);        
    },
    isLead: function(cmp, event, helper) {
        var params = event.getParam('arguments');
        params['resultHandler'](params['entityId'].substring(0, 3) == '00Q');
    },
    isContact: function(cmp, event, helper) {
        var params = event.getParam('arguments'); 
        params['resultHandler'](params['entityId'].substring(0, 3) == '003');
    },
    isAcount: function(cmp, event, helper) {
        var params = event.getParam('arguments'); 
        params['resultHandler'](params['entityId'].substring(0, 3) == '001');
    },
    isOpportunity: function(cmp, event, helper) {
        var params = event.getParam('arguments'); 
        params['resultHandler'](params['entityId'].substring(0, 3) == '006');
    },
    initInfiniteScroll: function (cmp, event, helper){
    	
    	var params = event.getParam('arguments'); 
    	var element = params['element'];	
    
        // scroll optimizer as defined by MDN
        // https://developer.mozilla.org/en-US/docs/Web/Events/scroll
        (function() {
            var throttle = function(type, name, obj) {
                var running = false;
                var func = function() {
                    if (running) { return; }
                    running = true;
                    requestAnimationFrame(function() {
                        // The event needed to be initialized this way to support IE.
                        var evt = document.createEvent('CustomEvent');
                        evt.initEvent(name, true, true);
                        obj.dispatchEvent(evt);
                        running = false;
                    });
                };
                obj.addEventListener(type, func);
            };
        	
            throttle('scroll', 'optimizedScroll', element);
        })();    
	},
    findElementWithClass: function(cmp, event, helper){
        
    	var params = event.getParam('arguments'); 
    	var triggeredEvent = params['triggeredEvent'];
        var className = params['className'];
        var elementToCheck = triggeredEvent.target.viewportElement != null ? triggeredEvent.target.viewportElement : triggeredEvent.target;
        var elementWithClass;

		while (elementWithClass === undefined){

            if (elementToCheck.classList != undefined){

                for (var i = 0; i < elementToCheck.classList.length; i++){
                    
                    var c = elementToCheck.classList[i];

                    if (c === className){
                        elementWithClass = elementToCheck;
                        break;
                    }
                }              
            }
            
            if (elementWithClass === undefined){
                elementToCheck = elementToCheck.parentElement;
            }   
        }  

        params['resultHandler'](elementWithClass);
    }
})
