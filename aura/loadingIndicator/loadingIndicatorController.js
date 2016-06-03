({
	handleToggleEvent : function(cmp, event, helper) {

        var isVisible = event.getParam('isVisible');
        cmp.set('v.isVisible', isVisible);
	}
})
