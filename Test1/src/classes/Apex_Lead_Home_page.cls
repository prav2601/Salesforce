public class Apex_Lead_Home_page {
    public List<Lead> leadsList {set;get;}
    
    public Apex_Lead_Home_page(){
        leadsList=[select Name,Company,Phone from Lead order by Name desc limit 3];
    }
    public PageReference ListView(){
        PageReference p= Page.Lead_listView_page;
        
        return p;
    }
}