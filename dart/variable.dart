void _final (){
        final name = 'abhishek';
        // final name = 'abhishek nayak'; //error: The final variable 'name' can only be set once.
    print(name);
}
void _const(){
    const name = 'abhishek';
    // const name = 'abhishek nayak'; //error: The const variable 'name' can only be set once.
    // const name = null; //error: The const variable 'name' must be initialized.
    print(name);
}
void main(){
    _final();
    _const();
}