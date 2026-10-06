void list() {
  List<int>? a = [1, 2, 3, 4, 5];
  print("a = $a");
  List<int>? b = List<int>.filled(5, 0);
  b[0] = 10;
  print("b = $b");
  List<int>? c = List.generate(5, (i) => i * 2);
  c.add(10);
  c.add(20);
  print("c = $c");
}

void set() {
  Set<int>? a = {1, 2, 3, 4, 5};
  print("a = $a");
  Set<int>? b = Set<int>.from([1, 2, 3]);
  b.add(10);
  b.addAll([20, 30, 40, 10, 20, 30]);
  print("b = $b");
  Set<int>? c = Set<int>();
  c.add(15);
  c.add(25);
  print("c = $c");
  print("$c.difference(b)");
  print("$c.intersection(b)");
  print("$c.union(b)");

}

void map() {
  Map? _map1;
  Map<int, int>? _map2;
  var _map3 = Map();
  Map<String, String>? _map4 = {
    "name": "John",
    "age": "30",
    "city": "New York",
  };
  _map1 = {"name": "abhishek", "age": 20, "city": "New York"};
  _map2 = {1: 10, 2: 20, 3: 30};
  _map3 = {"name": "abhishek", "age": 20, "city": "New York"};
  print("Map 1: $_map1");
  print("Map 2: $_map2");
  print("Map 3: $_map3");
  print("Map 4: $_map4");
}

void main() {
  list();
  set();
  map();
}
