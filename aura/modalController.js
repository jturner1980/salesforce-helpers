({
	onCancel : function(cmp, event, helper) {
		
        cmp.set('v.errorMessage', '');
        cmp.getEvent('onModalCancel').fire();
	},
	onSave : function(cmp, event, helper) {
		
        cmp.set('v.errorMessage', '');
        cmp.getEvent('onModalSave').fire();
	},
    handleError : function(cmp, event, helper){
        cmp.set('v.errorMessage', event.getParam('message'));
    }
})
