enum Operations {
  add,
  subtract,
  multiply,
  divide
}

class HomeController {
  int arg1 = 0;
  int arg2 = 0;
  late Operations selectedOperation;


  num calculate() {
    num result = 0;
    switch (selectedOperation) {
      case Operations.add:
        result = _add();
        break;
      case Operations.subtract:
        result = _subtract();
        break;
      case Operations.multiply:
        result = _multiply();
        break;
      case Operations.divide:
        result = _divide();
        break;
      default:
    }
    return result;
  }

  num _add(){
    return arg1 + arg2;
  }

  num _subtract(){
    return arg1 - arg2;
  }

  num _multiply(){
    return arg1 * arg2;
  }

  num _divide(){
    return arg1 / arg2;
  }
}