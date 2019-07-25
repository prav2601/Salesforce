public class Student_Map_Concept {
    List<Student_Wrapper> studentList;
    Map<String,List<Student_Wrapper>> wrapper;
    
    
    public Student_Map_Concept(){
        addStudent();
        wrapper=new Map<String,List<Student_Wrapper>>();
        
        for(Student_Wrapper s:studentList){
            Boolean flag=wrapper.containsKey(s.branch);
            if(flag==false){
                List<Student_Wrapper> swrapper=new List<Student_Wrapper>();
                swrapper.add(s);
                wrapper.put(s.name, swrapper);
                
            }
            else{
                List<Student_Wrapper> swrapper=wrapper.get(s.branch);
                swrapper.add(s);
                wrapper.put(s.name, swrapper);
               
                
            }
                
            }
       
                system.debug(wrapper);
        }
        
        
    
    
    public void addStudent(){
        studentList=new List<Student_Wrapper>();
        Student_Wrapper std1=new Student_Wrapper();
        std1.name='Praveen';
        std1.branch='ECE';
        studentList.add(std1);
        Student_Wrapper std2=new Student_Wrapper();
        std2.name='Deepak';
        std2.branch='CSE';
        studentList.add(std2);
        Student_Wrapper std3=new Student_Wrapper();
        std3.name='Debdeep';
        std3.branch='CSE';
        studentList.add(std3);
        Student_Wrapper std4=new Student_Wrapper();
        std4.name='Pavan';
        std4.branch='ECE';
        studentList.add(std4);
        system.debug(studentList);
        
    }
}