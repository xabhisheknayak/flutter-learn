class student {
  String? name;
  int? age;

  student(this.name, this.age);
  String? get studentName => name;
 void set studentName(String? name) => this.name = name;
  int? get studentAge => age;
  void set studentAge(int? age) => this.age = age;

  void set stud1(String? name) => this.name = name;

  void display() {
    print("name = $name");
    print("age = $age");
  }
}
void main() {
  student s1 = student(null, null);
  s1.display();
  s1.studentName = "abhishek";
  s1.studentAge = 20;
  s1.display();
}