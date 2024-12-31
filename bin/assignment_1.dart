abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;
  Person(this.name, this.age, this.address);

  @override
  void displayRole() {}
}

class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student(String name, int age, String address, this.studentID, this.grade,
      this.courseScores)
      : super(name, age, address);

  double calculateAverageScore() {
    double sum = courseScores.fold(0, (a, b) => a + b);
    return sum / courseScores.length;
  }

  @override
  void displayRole() {
    print("Role: Student");
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(
      String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address);

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }

  @override
  void displayRole() {
    print("Role: Teacher");
  }
}

void main(List<String> args) {
  var jhonScores = [90.0, 85.0, 82.0];
  var jhon = Student("Jhon Doe", 20, "123 Main St", "S123", "A", jhonScores);
  var smithCourses = ['Math', "English", "Bangla"];
  var mrsSmith = Teacher("Mrs. Smith", 35, "456 Oak St", "T456", smithCourses);

  print("Student Information:");
  jhon.displayRole();
  print("Name: ${jhon.name}");
  print("Age: ${jhon.age}");
  print("Address: ${jhon.address}");
  print("Average Score: ${jhon.calculateAverageScore().toStringAsFixed(1)}");

  print("\n");

  print("Teacher Information");
  mrsSmith.displayRole();
  print("Name: ${mrsSmith.name}");
  print("Name: ${mrsSmith.age}");
  print("Name: ${mrsSmith.address}");
  mrsSmith.displayCoursesTaught();
}
