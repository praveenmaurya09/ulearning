class SignInSates {
  final String email;
  final String password;

  const SignInSates({
    this.email = "",
    this.password = "",
  });

  SignInSates copyWith({String? email, String? password}) {
    return SignInSates(email: email??this.email, password: password??this.password);
  }
}
