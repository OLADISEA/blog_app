class LogInStates{
  final String email;
  final String password;
  LogInStates({this.email='',this.password=''});

  LogInStates copyWith({String? email, String? password}){
      return LogInStates(
          email: email??this.email,
          password: password??this.password
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