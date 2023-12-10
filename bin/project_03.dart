//assignment, module 5,
//with private values, getters, setters, named parameters in constructor
abstract class Role{
  void displayRole();
}

class Person implements Role{
  late String _name;
  late int _age;
  late String _address;
  Person(this._name, this._age, this._address);
  //setter
  set name(String name)=> _name=name;
  set age(int age)=> _age=age;
  set address(String address)=> _address=address;
  //getter
  String get name => _name;
  int get age => _age;
  String get address => _address;
  @override
  void displayRole(){
    //implemented in child classes.
  }
  //getter for attributes
  void get personInfo{
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
  }
}

class Student extends Person {
  late String? studentID;
  late String? grade;
  late List<int> courseScores;
  Student({
    required String name,
    required int age,
    required String address,
    this.studentID='student_id',
    this.grade='grade',
    required this.courseScores
  })
      : super(name,age,address);
  @override
  void displayRole() {
    print('Role: Student');
  }
  void averageScore() {
    int length = courseScores.length;
    int sum = 0;
    for (int i = 0; i < length; i++) {
      sum += courseScores[i];
    }
    double avg = sum / length;
    print('Average Score: ${avg.toStringAsFixed(2)}');
  }
  void studentInfo() {
    displayRole();
    personInfo; //getter call, no () used
    print('studentID: $studentID');
    print('grade: $grade');
    averageScore();
  }
}

class Teacher extends Person{
  late String? teacherID;
  late List<String> coursesTaught;
  Teacher({
    required String name,
    required int age,
    required String address,
    this.teacherID='teacher_id',
    required this.coursesTaught})
      : super(name,age,address);
  @override
  void displayRole(){
    print('Role: Teacher');
  }
  void displayCoursesTaught(){
    print('Courses Taught:');
    for(int i=0; i<coursesTaught.length; i++){
      print('- ${coursesTaught[i]}');
    }
  }
  void teacherInfo(){
    displayRole();
    personInfo;
    print('teacherID: $teacherID');
    displayCoursesTaught();
  }
}

void main(){
  Student student1 = Student(
    name:'John Doe',
    age:20,
    address:'123 Main Street',
    studentID:'id-s45',
    grade:'A+',
    courseScores:[90,85,82],
  );
  print("Student Information:");
  student1.studentInfo();
  print(''); //new line
  Teacher teacher1 =Teacher(
      name: 'Mrs.Smith',
      age: 35,
      address: '456 Oak St',
      teacherID:'id-t50',
      coursesTaught: ['Math','English','Bangla']
  );
  print("Teacher Information:");
  teacher1.teacherInfo();
}