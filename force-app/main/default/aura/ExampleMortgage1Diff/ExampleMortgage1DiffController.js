({    	
	doInit : function(component, event) {
		var a = event.getParam("num1");
        var b = event.getParam("num2");
        var c = a - b;
        component.set("v.diffRes",c);
	}
})