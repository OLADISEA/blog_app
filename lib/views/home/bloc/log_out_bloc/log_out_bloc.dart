import 'package:blog_app/views/home/bloc/log_out_bloc/log_out_event.dart';
import 'package:blog_app/views/home/bloc/log_out_bloc/log_out_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repository.dart';

class LogOutBloc extends Bloc<LogOutEvent,LogOutState>{
  LogOutBloc():super(LogOutState()){
    on<LogOutButton>((event, emit) async{
      try{
        bool logOutSuccess = await BlogRepository().logout();
        emit(state.copyWith(logOutSuccess: logOutSuccess));

      }catch(e){

      }});
  }
}