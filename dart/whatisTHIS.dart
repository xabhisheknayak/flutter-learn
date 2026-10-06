// Uses of this Keyword
// It can be used to refer to the instance variable of the current class.
// It can be used to make or initiate a current class constructor.
// It can be passed as an argument in the method call.
// It can be passed as an argument in the constructor call.
// It can be used to make a current class method.
// It can be used to return the current class Instance.
class thiskeyword {
  String name;
  int age;

  thiskeyword(this.name, this.age) {
    print("this is a constructor with parameters $name and $age");
  }

  void display() {
    print("Name: $name, Age: $age");
  }
}
void main(){
  thiskeyword thisis = new thiskeyword("abhishek", 20);
  thisis.display();
  
}