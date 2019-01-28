({
	handleClick : function(component, event, helper) {
		var attributeVal = component.get("v.text");
        
        var target = event.getSource();
        component.set("v.text", target.get("v.label"));
        console.log('before fire');
        
        var firEvt = $A.get("e.c:sampleToDeleteEvt");
        //firEvt.setParams({"sampString" : "sample1"});
        firEvt.fire();
        
        console.log('after fire');
	}
})