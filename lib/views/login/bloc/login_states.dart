class LogInStates{
  final String email;
  final String password;
  final bool logInSuccess;
  LogInStates({this.email='',this.password='',this.logInSuccess=false});

  LogInStates copyWith({String? email, String? password,bool? logInSuccess}){
      return LogInStates(
          email: email??this.email,
          password: password??this.password,
        logInSuccess: logInSuccess??this.logInSuccess
      );
    }
  }
class LoadingState extends LogInStates{

}
class LoggedInState extends LogInStates{

}
class ErrorState extends LogInStates {
  final String errorMessage;
  ErrorState({required this.errorMessage});
}