abstract class RegisterEvents{

}
class FirstNameEvents extends RegisterEvents{
  final String firstName;
  FirstNameEvents({required this.firstName});
}

class LastNameEvents extends RegisterEvents{
  final String lastName;
  LastNameEvents({required this.lastName});
}

class EmailEvents extends RegisterEvents{
  final String email;
  EmailEvents({required this.email});
}

class PasswordEvents extends RegisterEvents{
  final String password;
  PasswordEvents({required this.password});
}

