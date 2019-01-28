({
	handlesampEvt : function(component, event, helper) {
        console.log('Event fired');
		var getSrcFrom = event.getSource();
        console.log('Source of event: ', getSrcFrom);
        var getSrcName = event.getSource().getName();
        console.log('Source name: ' + getSrcName);
	}
})