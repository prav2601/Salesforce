({
	calculate : function(read, event, helper) {
		var amount=read.get("v.amount");
        var rate=read.get("v.rate");
        var years=read.get("v.years");
        var int=(amount*rate*years)/100;
        var interest=read.set("v.interest",int);
        
	}
})