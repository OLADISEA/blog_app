abstract class LogInEvents{

}

class EmailEvents extends LogInEvents{
  final String email;
  EmailEvents({required this.email});
}

class PasswordEvents extends LogInEvents{
  final String password;
  PasswordEvents({required this.password});
}

class LogInButton extends LogInEvents{

}