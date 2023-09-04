class RegisterStates{
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegisterStates({this.firstName='', this.lastName='',this.email='',this.password=''});

  RegisterStates copyWith({String? firstName, String? lastName,String? email, String? password}){
    return RegisterStates(
        firstName: firstName??this.firstName,
        lastName: lastName??this.lastName,
        email: email??this.email,
        password: password??this.password
    );
  }
}
