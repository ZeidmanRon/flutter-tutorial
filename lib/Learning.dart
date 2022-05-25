// function:
void variable_types() {
  String name = 'ron';
  bool isLearning = true;

  // dynamic can be any type of variable
  dynamic my_dynamic = 'name';
  my_dynamic = 30;
  print(my_dynamic);
}

//example for function: when you call hello() > 'hello' is returned
String hello() => 'hello';
//another example
int getAge() => 23;

//list:
void lists() {
  // no type list
  List list = ['ron', 'max'];
  list.add(13);
  list.remove('max');
  print(list);

  //list of types
  List<String> names = ['ron', 'max'];
  names.add('ofek');
  names.remove('max');
  print(names);
}

class Student {
  String username;
  int age;

  Student(this.username, this.age);

  void login() {
    print('${this.username} logged in. age:${this.age}');
  }
}

//inheritance
class SuperStudent extends Student {
  SuperStudent(String name, int age) : super(name, age);

  void getGrade() {
    print(this.age * 3 / 2);
  }
}

void main() {
  Student One = Student('One', 29);
  Student Two = Student('Two', 37);
  SuperStudent Three = SuperStudent('Three', 56);
  Three.getGrade();
  print(Three is Student); //true
  print(Three is SuperStudent); //true
}
