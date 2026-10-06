void _labels(){
  label1:
  for(int i = 0; i<5; i++){
    label2:
    for(int j = 0; j<5; j++){
      if(i == 2 && j == 2){
        break label1;
      }
      print("i = $i, j = $j");
    }
  }
}
void main(){
  _labels();
}