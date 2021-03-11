import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() {
    print("increment");
    emit(CounterState(
        counterValue: state.counterValue + 1, wasIncremented: true));
  }

  void decrement() {
    print("decrement");
    emit(CounterState(
        counterValue: state.counterValue - 1, wasIncremented: false));
  }
}
