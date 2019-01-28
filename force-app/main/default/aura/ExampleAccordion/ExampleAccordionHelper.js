({
     getAccountAndContactsRelation : function(cmp) {
        var action = cmp.get("c.getAcc");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('response.getReturnValue()',response.getReturnValue());
                cmp.set("v.accounts", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})