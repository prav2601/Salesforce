public class HTTP_request {
    public String body {set;get;}
    
    public void callService(){
        HttpRequest request=new HttpRequest();
        request.setEndpoint('https://www.satishmyla.in');
        request.setMethod('GET');
     //   Http p=new Http();
     //   HttpResponse response=p.send(request);
     //   String body =response.getBody();
      //  String status=response.getStatus();
    }
    
    
    
}