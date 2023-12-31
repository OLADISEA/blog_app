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
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(left: 20,top: 30),
          child: BlocBuilder<RegisterBloc,RegisterStates>(
            builder: (context,state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: reusableText(text: 'Sign In ',size: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 10,top: 10),
                    child: reusableText(text: 'First Name'),
                  ),
                  reusableTextField('Enter your first name',
                          (value) {
                        context.read<RegisterBloc>().add(
                            FirstNameEvents(firstName: value));
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 10,top: 10),
                    child: reusableText(text: 'Last Name',),
                  ),
                  reusableTextField('Enter your last name',
                          (value) {
                        context.read<RegisterBloc>().add(
                            LastNameEvents(lastName: value));
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 10,top: 10),
                    child: reusableText(text: 'Email'),
                  ),
                  reusableTextField('Enter a valid email',
                          (value) {
                        context.read<RegisterBloc>().add(
                            EmailEvents(email: value));
                      }),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 10,top: 10),
                    child: reusableText(text: 'Password'),
                  ),
                  reusableTextField('Enter a password',
                          (value) {
                        context.read<RegisterBloc>().add(
                            PasswordEvents(password: value));
                      }),
                  Center(
                    child: generalButton('Sign In',
                            () {
                          print('pressed');
                          print('email is: ${state.email}');
                          print(state.password);
                          context.read<RegisterBloc>().add(SignUpEvents());
                        }),
                  )

                ],
              );

            }
          ),
        ),
      ),
    );
  }
}
