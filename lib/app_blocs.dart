import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/app_states.dart';
import 'package:ulearning/app_events.dart';



class AppBlocs extends Bloc<AppEvents, AppStates>{
  AppBlocs():super(InitStates()){


    on<Increment>((event, emit){
      emit(AppStates(counter: state.counter+1));
    });


    on<Decrement>((event, emit){
      emit(AppStates(counter: state.counter-1));
    });
  }
}