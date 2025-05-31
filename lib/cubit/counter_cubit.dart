import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit() : super(101) ;

  void increment(){
    emit(state + 1) ; // return new state
    if (state == 105){
      return ;
    } else {
      emit(state + 1) ;
    }
  }
  void decrement(){
    emit(state - 1) ;
  }
  void reset(){
    emit(0) ;
  }
}