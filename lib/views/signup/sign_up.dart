import 'package:blog_app/views/signup/bloc/register_bloc.dart';
import 'package:blog_app/views/signup/bloc/register_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/common/reusable.dart';
import 'bloc/register_states.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20,top: 30),
        child: BlocBuilder<RegisterBloc,RegisterStates>(
          builder: (context,state) {
            return Column(
              children: [
                reusableText('First Name'),
                reusableTextField('Enter your first name',
                        (value) {
                      context.read<RegisterBloc>().add(
                          FirstNameEvents(firstName: value));
                    }),
                reusableText('Last Name',),
                reusableTextField('Enter your last name',
                        (value) {
                      context.read<RegisterBloc>().add(
                          LastNameEvents(lastName: value));
                    }),
                reusableText('Email'),
                reusableTextField('Enter a valid email',
                        (value) {
                      context.read<RegisterBloc>().add(
                          EmailEvents(email: value));
                    }),
                const SizedBox(height: 10,),
                reusableText('Password'),
                reusableTextField('Enter a password',
                        (value) {
                      context.read<RegisterBloc>().add(
                          PasswordEvents(password: value));
                    }),
                generalButton('Log In',
                        () {
                      //context.read<RegisterBloc>().add(LogInButton());
                    })

              ],
            );

          }
        ),
      ),
    );
  }
}
