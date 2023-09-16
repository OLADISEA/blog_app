class LogOutState{
  final bool logOutSuccess;

  LogOutState({this.logOutSuccess = false});

  LogOutState copyWith({bool? logOutSuccess}){
    return LogOutState(logOutSuccess: logOutSuccess??this.logOutSuccess);
  }
}