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
        body: BlocBuilder<LogInBloc,LogInStates>(
        builder: (context,state) {
          return Column(
            children: [
              reusableText('Email'),
              reusableTextField('Email',
                      (value) {
                print(value);
                    context.read<LogInBloc>().add(EmailEvents(email: value));
                  }),
              const SizedBox(height: 10,),
              reusableText('Password'),
              reusableTextField('Password',
                      (value) {
                        print(value);
                        context.read<LogInBloc>().add(
                        PasswordEvents(password: value));
                  }),
              generalButton(
                  'Log In',
                      () {
                    print('log in pressed');
                    print(state.email);
                    context.read<LogInBloc>().add(LogInButton());
                  }
              ),
              generalButton(
                  'Register', () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SignUp(),
                ));
              })
            ],
          );
        }
        ),
      ),
    );
  }
}
