import 'package:blog_app/views/home/bloc/log_out_bloc/log_out_bloc.dart';
import 'package:blog_app/views/home/bloc/log_out_bloc/log_out_event.dart';
import 'package:blog_app/views/home/bloc/log_out_bloc/log_out_state.dart';
import 'package:blog_app/views/login/log_in.dart';
import 'package:blog_app/widgets/common/reusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<LogOutBloc,LogOutState>(
          listener: (context,state){
            if(state.logOutSuccess){
              //Display a snackBAR
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LogIn()));

            }
          },
          builder: (context,state){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                generalButton('log out', () {
                  context.read<LogOutBloc>().add(LogOutButton());
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LogIn()));
                }),

                generalButton('Change password', () {
                  //context.read<LogOutBloc>().add(LogOutButton());
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LogIn()));
                }),

                IconButton(
                    onPressed: (){
                      // show a dialog to change user first name. last name, email address and password
                    },
                    icon: const Icon(Icons.settings))
              ],
            );
          },

        ),
      ),
    );
  }
}
