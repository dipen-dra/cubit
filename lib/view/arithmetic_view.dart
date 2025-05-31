import 'package:cubit_state/cubit/arithmetic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirthematicView extends StatelessWidget {
  const AirthematicView({super.key});

  @override
  Widget build(BuildContext context) {
    final firstController = TextEditingController();
    final secondController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Operations'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Input fields
              TextFormField(
                controller: firstController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "First Number",
                  border: OutlineInputBorder(),
                  // prefixIcon: Icon(Icons.looks_one),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: secondController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Second Number",
                  border: OutlineInputBorder(),
                  // prefixIcon: Icon(Icons.looks_two),
                ),
              ),

              const SizedBox(height: 30),
              // Result display
              BlocBuilder<AirthmeticCubit, int>(
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // Operation buttons
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text("Add"),
                    onPressed: () {
                      context.read<AirthmeticCubit>().add(
                          int.parse(firstController.text),
                          int.parse(secondController.text));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.remove),
                    label: const Text("Subtract"),
                    onPressed: () {
                      context.read<AirthmeticCubit>().substract(
                          int.parse(firstController.text),
                          int.parse(secondController.text));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.clear),
                    label: const Text("Multiply"),
                    onPressed: () {
                      context.read<AirthmeticCubit>().multiply(
                          int.parse(firstController.text),
                          int.parse(secondController.text));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.percent),
                    label: const Text("Divide"),
                    onPressed: () {
                      context.read<AirthmeticCubit>().division(
                          int.parse(firstController.text),
                          int.parse(secondController.text));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
