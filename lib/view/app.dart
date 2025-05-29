

import 'package:cubit_state/cubit/arithmetic_cubit.dart';
import 'package:cubit_state/view/arithmetic_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(home: BlocProvider(create: (context) => AirthmeticCubit() , // dependency injection
    child:  AirthematicView(),) , debugShowCheckedModeBanner: false ,  
    ) ;
  }
}
   