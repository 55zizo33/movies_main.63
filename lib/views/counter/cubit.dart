
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/views/counter/states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit():super(CounterStates());
  int count = 1 ;

  void minus(){
    count--;
    emit(CounterUpdateState());
    //setState(() {});
  }


  void plus(){
    count++;
    emit(CounterUpdateState());
   // setState(() {});
  }


  bool isOn=false;

  void toggleSwitch(){
    isOn=!isOn;
    emit(CounterToggleSwitchState());
  }

}