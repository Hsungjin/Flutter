import 'package:meta/meta.dart';

class Parent {
  void sayHello() {
    print("Hello World");
  }

  @protected
  void _privateMethod() {
    print("This is a private method");
  }
}

class Child extends Parent {
  @override
  void sayHello() {
    print("Hello World from Child");
  }

  @override
  void _privateMethod() {
    print("This is a private method from Child");
  }
}

@deprecated
void oldMethod() {
  print("This method is deprecated");
}

@immutable
class ImmutableClass {
  final int value;

  const ImmutableClass(this.value);
}

@factory
class FactoryClass {
  factory FactoryClass() {
    return FactoryClass();
  }

  void sayHello() {
    print("Hello World from FactoryClass");
  }
}


@sealed
class SealedClass {
  void sayHello() {
    print("Hello World from SealedClass");
  }
}

class SubClass extends SealedClass {
  @override
  void sayHello() {
    print("Hello World from SubClass");
  }
}

// void main() {

//   SealedClass sealedClass = SubClass();
//   sealedClass.sayHello();

//   ImmutableClass immutableClass = ImmutableClass(1);

//   oldMethod();

//   Parent parent = Parent();
//   parent.sayHello();
//   parent._privateMethod();

//   Parent parent2 = Parent();
//   parent2._privateMethod();


//   Child child = Child();
//   child.sayHello();

//   child._privateMethod();
// }


class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

@Todo("0001", "Implement the Todo class")
void dosomething() {
  print("Hello World");
}

@Todo("0002", "Implement the Todo class")
void dosomething2() {
  print("Hello World 2");
}

void main() {
  dosomething();
  dosomething2();
}