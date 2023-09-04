import 'package:blog_app/views/signup/bloc/register_events.dart';
import 'package:blog_app/views/signup/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvents,RegisterStates>{
  RegisterBloc():super(RegisterStates()){
    on<FirstNameEvents>(firstNameEvents);
    on<LastNameEvents>(lastNameEvents);
    on<EmailEvents>(emailEvents);
    on<PasswordEvents>(passwordEvents);

  }


  void firstNameEvents(FirstNameEvents event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.firstName));
  }
  void lastNameEvents(LastNameEvents event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.lastName));
  }
  void emailEvents(EmailEvents event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.email));
  }
  void passwordEvents(PasswordEvents event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.password));
  }
}