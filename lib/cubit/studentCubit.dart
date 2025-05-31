import 'package:cubit_state/model/studentModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.initial());

  void addStudent(StudentModel student) {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(
        lstStudents: [...state.lstStudent, student],
        isLoading: false,
      ));
    }); 
  }
  void deleteStudent(StudentModel student) {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 1), () {
      final updatedList = state.lstStudent.toList()..remove(student);
      emit(state.copyWith(lstStudents: updatedList, isLoading: false));
    });
  }
  void reset() {
    emit(StudentState.initial());
  }
}
