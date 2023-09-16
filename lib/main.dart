import 'package:blog_app/views/home/bloc/log_out_bloc/log_out_bloc.dart';
import 'package:blog_app/views/login/bloc/login_bloc.dart';
import 'package:blog_app/views/login/log_in.dart';
import 'package:blog_app/views/signup/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return
      //RepositoryProvider(
      //create: (context)=> BlocRepository(),
      //child:
      MultiBlocProvider(
          providers:[
            BlocProvider(create: (context)=> RegisterBloc()),
            BlocProvider(create: (context)=> LogInBloc()),
            BlocProvider(create: (context)=> LogOutBloc())

          ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LogIn()
        ),
      //),
    );
  }
}

