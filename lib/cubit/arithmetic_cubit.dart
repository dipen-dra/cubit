import 'package:flutter_bloc/flutter_bloc.dart';

class AirthmeticCubit extends Cubit<int>{
  AirthmeticCubit() : super(0) ;
  
  void add(int firstNumber ,int secondNumber  ){
    emit(firstNumber + secondNumber) ;
  }
  void substract(int firstNumber , int secondNumber){
    emit(firstNumber - secondNumber) ;
  }
  
  void multiply(int firstNumber , int secondNumber){
    emit(firstNumber * secondNumber) ;
  }
  void division(int firstNumber , int secondNumber){
    emit(firstNumber ~/ secondNumber) ;
  }

  void reset(){
    emit(0) ;
  }
}