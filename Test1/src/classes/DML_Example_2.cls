public class DML_Example_2 {
    public List<Lead_Wrapper> leadWrapperlist {set;get;}
    public List<SelectOption> option1 {set;get;}
    public List<SelectOption> option2 {set;get;}
    public String selectedrating {set;get;}
    public String selectetindustry {set;get;}
    
    
    
    public DML_Example_2(){
        option1=new List<SelectOption>();
        option2=new List<SelectOption>();
        List<String> ratings=new List<String>{'None','Hot','Cold','Warm'};
            for(String s:ratings){
                SelectOption op1=new SelectOption(s,s);
                option1.add(op1);
            }
        List<String> industry=new List<String>{'None','Energy','Banking','Pharma'};
            for(String s:industry){
                SelectOption op2=new SelectOption(s,s);
                option2.add(op2);
            }
        
        leadWrapperlist=new List<Lead_Wrapper>();
      List<Lead>  leadlist=[select id,LastName,FirstName,Rating,LeadSource,Industry from Lead limit 10 ];
        for(Lead l:leadlist){
            Lead_Wrapper lw=new Lead_Wrapper();
            lw.newLead=l;
            lw.flag=false;
          	leadWrapperlist.add(lw);

        }
    }
    
    public void updaterating(){
        List<Lead> mylead=new List<Lead>();
        
        for(Lead_Wrapper wrapper:leadWrapperlist){
            if(wrapper.flag==true){
                wrapper.newLead.rating=selectedrating;
                mylead.add(wrapper.newLead);
            }
        }
        update mylead;
    }

    public void updateindustry(){
        List<Lead> mylead=new List<Lead>();
        for(Lead_Wrapper wrapper:leadWrapperlist){
            if(wrapper.flag==true){
                wrapper.newLead.industry=selectetindustry;
                mylead.add(wrapper.newLead);
            }
        }
        update mylead;
    }

}