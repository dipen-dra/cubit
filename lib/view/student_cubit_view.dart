import 'package:cubit_state/cubit/studentCubit.dart';
import 'package:cubit_state/model/studentModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/student_state.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Student Cubit"))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a name' : null,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Age",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter age' : null,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter address' : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final student = StudentModel(
                      name: nameController.text,
                      age: int.parse(ageController.text),
                      address: addressController.text,
                    );
                    context.read<StudentCubit>().addStudent(student);
                    nameController.clear();
                    ageController.clear();
                    addressController.clear();
                  }
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<StudentCubit, StudentState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.lstStudent.isEmpty) {
                      return const Center(child: Text("No students found"));
                    } else {
                      return ListView.separated(
                        itemCount: state.lstStudent.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          final student = state.lstStudent[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: ListTile(
                              title: Text(student.name),
                              subtitle:
                                  Text('${student.age}, ${student.address}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Delete?"),
                                        content: Text(
                                            "Are you sure you want to delete ${student.name}'s info?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              context
                                                  .read<StudentCubit>()
                                                  .deleteStudent(student);
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Yes"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("No"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
