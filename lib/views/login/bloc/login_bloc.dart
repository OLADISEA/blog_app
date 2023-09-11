import 'package:blog_app/views/login/bloc/login_events.dart';
import 'package:blog_app/views/login/bloc/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository.dart';
import '../../home/home_page.dart';

class LogInBloc extends Bloc<LogInEvents,LogInStates>{
 // final BuildContext context;
  //final BlogRepository blogRepository;
  LogInBloc():super(LogInStates()){
    on<EmailEvents>(emailEvents);
    on<PasswordEvents>(passwordEvents);


    on<LogInButton>((event, emit) async {
      if (state.email.isNotEmpty && state.password.isNotEmpty) {
        print('entered');
        //emit(LoadingState());
        try {
          bool logInSuccess = await BlogRepository().handleLogIn(state.email, state.password);
          emit(state.copyWith(logInSuccess: true));

          print('awaiting end');
          //emit(LoggedInState());
        } catch (e) {
          emit(ErrorState(errorMessage: e.toString()));
        }
      } else {
        emit(ErrorState(errorMessage: 'Invalid password or Email'));
      }
    });

  }




void emailEvents(EmailEvents event, Emitter<LogInStates> emit) {
  emit(state.copyWith(email: event.email));

}

void passwordEvents(PasswordEvents event, Emitter<LogInStates> emit) {
    emit(state.copyWith(password: event.password));

  }
}