void op(){
    int a = 10,
    b=20;

    // ~/
    print("a~/b = ${b~/a}"); // 2
    print("a/b = ${a/b}"); // 0.5

}
void _assignnullsafety(){
    var a = 10, 
    b = 20;
    print("a = $a, b = $b");
    var d ?? = a + b;
    print("d = $d");
    d ??= 100;
    print("d = $d"); //it wont print 100 because d is already initialized with a+b
}

void main(){
    op();
    _assignnullsafety();
}
