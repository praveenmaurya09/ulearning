

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_states.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_events.dart';

class SignInBlocs extends Bloc<SignInEvents, SignInSates>{
  SignInBlocs():super(const SignInSates()){

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }


  void _emailEvent(EmailEvent event, Emitter<SignInSates> emit){
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInSates> emit){
    emit(state.copyWith(password: event.password));
  }


}