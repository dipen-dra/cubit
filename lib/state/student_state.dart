

import 'package:cubit_state/model/studentModel.dart';

class StudentState {
  final List<StudentModel> lstStudent;
  final bool isLoading;

  const StudentState({
    required this.lstStudent,
    required this.isLoading,
  });

  factory StudentState.initial() {
    return const StudentState(lstStudent: [], isLoading: false);
  }

  StudentState copyWith({
    List<StudentModel>? lstStudents,
    bool? isLoading,
  }) {
    return StudentState(
      lstStudent: lstStudents ?? this.lstStudent,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
