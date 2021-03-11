import 'package:bloc_counter_app/domain/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counter Cubit Test", () {
    CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test("Counter Cubit Initial Test", () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
      "Counter Cubit Increment Test",
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.increment(),
      expect: [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      "Counter Cubit Decrement Test",
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.decrement(),
      expect: [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
