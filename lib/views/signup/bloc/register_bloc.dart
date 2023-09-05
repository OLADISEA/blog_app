import 'package:blog_app/views/signup/bloc/register_events.dart';
import 'package:blog_app/views/signup/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository.dart';

class RegisterBloc extends Bloc<RegisterEvents,RegisterStates>{
  RegisterBloc():super(RegisterStates()){
    on<FirstNameEvents>(firstNameEvents);
    on<LastNameEvents>(lastNameEvents);
    on<EmailEvents>(emailEvents);
    on<PasswordEvents>(passwordEvents);
    on<SignUpEvents>((event,emit) async{
      if (state.email.isNotEmpty && state.password.isNotEmpty) {
        print('entered');
        //emit(LoadingState());
        try {
          await BlogRepository().handleSignUp(state.firstName,state.lastName,state.email, state.password);
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


  void firstNameEvents(FirstNameEvents event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }
  void lastNameEvents(LastNameEvents event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }
  void emailEvents(EmailEvents event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.email));
  }
  void passwordEvents(PasswordEvents event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(password: event.password));
  }
}