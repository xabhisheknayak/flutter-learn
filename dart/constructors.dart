class _constructors {
  _constructors() {
    print("this is a constructor");
  }
  String? name = "";

  void obj() {
    print("hello $name");
    
  }
  _constructors.namedConstructor(String name) {
    this.name = name;
    print("this is a named constructor");
  }
}

void main() {
  _constructors obj = new _constructors();
  obj.name = "abhishek";
   obj.obj();
  _constructors obj1 = new _constructors.namedConstructor("abhishek nayak");
  obj1.obj();
}
