void foreac(){
  List<int> a = [1, 2, 3, 4, 5];
  a.forEach((element) {
    print("${a.indexOf(element)}: $element");
  });
}
void op( int a, int b, Function oper){
  print("a = $a, b = $b");
  print("result = ${oper(a, b)}");

}

void main(){
  foreac();
  var multiply = (int a, int b) => a * b;
  print("multiply = ${multiply(10, 20)}");
  op(10, 20, (a,b) => a + b);
}