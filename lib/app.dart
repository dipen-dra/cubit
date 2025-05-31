

import 'package:cubit_state/cubit/arithmetic_cubit.dart';
import 'package:cubit_state/cubit/counter_cubit.dart';
import 'package:cubit_state/cubit/studentCubit.dart';
import 'package:cubit_state/view/arithmetic_view.dart';
import 'package:cubit_state/view/counter_view.dart';
import 'package:cubit_state/view/student_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(home: BlocProvider(create: (context) => StudentCubit() , // dependency injection
    child:  StudentView(),) , debugShowCheckedModeBanner: false ,  
    ) ;
  }
}
   