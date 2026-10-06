//ok so there are two ways to call a super constructor..
// implicitly and explicitly. Implicitly is when you don't call it at all, and it gets called automatically. Explicitly is when you call it with the super keyword.
//paramaterized constructor is needed for explicitly calling other wise u dont need it implicitly it will be called automatically.

class superconst {
  superconst() {
    print("this is a super constructor");
  }
  //parent
}

class subconst extends superconst {
  subconst() : super() {
    print("this is a sub constructor");
  }
  //child
}

// basically child folows the parent constructor and if you want to call the parent constructor explicitly then you have to use super keyword otherwise it will be called implicitly.
class superconst1 {
  superconst1(String name) {
    print("this is a super constructor with parameter $name");
  }
  //parent
}

class subconst1 extends superconst1 {
  subconst1(String name) : super(name) {
    print("this is a sub constructor with parameter $name");
  }
  //child
}

void main() {
  subconst const1 = new subconst();
  subconst1 const2 = new subconst1("abhishek");
}

// In Dart, a subclass inherits all the properties and methods of its 
// parent class by using the extends keyword. However, it does not inherit 
// the constructors of the parent class. To address this, the superclass constructor 
// is invoked using the super keyword. This can be done implicitly, where the parent's 
// default constructor is automatically called, or explicitly, where parameters are passed 
// to the parent constructor using super(). This process ensures that the parent
// class is properly initialized before the child class constructor is executed.
