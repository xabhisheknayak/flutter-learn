enum _enum {
  abhishek,
  nayak,
}
void dis(){
   for (_enum i in _enum.values) {
    print(i);
  }
}
enum _enum1 {
  abhishek,
  wadyant,
}
void checkdata(){
  for (_enum1 i in _enum1.values) {
    if(i == _enum1.abhishek){
      print("abhishek is present");
      continue;
    }
    else{
      print("wadyant is present");
      break;
    }
}
}
void main() {
  dis();
  checkdata();
}