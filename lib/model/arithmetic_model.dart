class ArithematicModel {
  final int first ;
  final int second ;

  ArithematicModel({
    required this.first , required this.second
}) ;

  int add (){
    return first + second ;
  }


  int sub () {
    return first - second ;
  }

  int mul (){
    return first * second ;
  }

  double div (){
    return first / second ;
  }



}