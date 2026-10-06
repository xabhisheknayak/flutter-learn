class parent {
 void printparent(String name){ {
    print("parent constructor $name");
  }
}
}

class child extends parent {
  void printchild(){
 super.printparent("\nabhishek");
  }
 
}
main(){
  child c = new child();
  c.printchild();
}