({
	submit : function(component, event, helper) {
        var amount =component.get("v.amount");
        var year=component.get("v.year");
        var rate=component.get("v.rate");
        var int=(amount*year*rate)/100;
        component.set("v.interest",int);
   },
    reset :function(abc,event,helper){
        abc.set("v.amount",'');
        abc.set("v.year",'');
        abc.set("v.rate",'');
    }
    
})