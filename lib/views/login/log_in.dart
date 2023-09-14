import 'package:blog_app/views/home/home_page.dart';
import 'package:blog_app/views/login/bloc/login_bloc.dart';
import 'package:blog_app/views/login/bloc/login_events.dart';
import 'package:blog_app/views/login/bloc/login_states.dart';
import 'package:blog_app/views/signup/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/common/reusable.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<LogInBloc,LogInStates>(
          listener: (context,state){
            if (state.logInSuccess) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          },
        builder: (context,state) {
          bool logInSuccess = state.logInSuccess;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: reusableText(text: 'Sign In ',size: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10,top: 10),
                child: reusableText(text:'Email'),
              ),
              reusableTextField('Email',
                      (value) {
                print(value);
                    context.read<LogInBloc>().add(EmailEvents(email: value));
                  }),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10,top: 10),
                child: reusableText(text: 'Password'),
              ),
              reusableTextField('Password',
                      (value) {
                        print(value);
                        context.read<LogInBloc>().add(
                        PasswordEvents(password: value));
                  }),
              Center(
                child: generalButton(
                    'Log In',
                        () {
                      print('log in pressed');
                      print(state.email);
                      context.read<LogInBloc>().add(LogInButton());
                      if(logInSuccess){
                        print(true);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
                      }
                        }
                ),
              ),
              Center(
                child: generalButton(
                    'Register', () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ));
                }),
              )
            ],
          );
        }
        ),
      ),
    );
  }
}
