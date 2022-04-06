import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterLoadedState(count: 0)) {
    on<CounterIncrementEvent>((event, emit) => incremetn(1, emit));
    on<CounterDecrementEvent>((event, emit) => decrement(1, emit));
  }

  void incremetn(int addVal, Emitter<CounterState> emit) {
    if (state is CounterLoadedState) {
      emit(CounterLoadedState(
          count: (state as CounterLoadedState).count + addVal));
    }
  }

  void decrement(int addVal, Emitter<CounterState> emit) {
    if (state is CounterLoadedState) {
      emit(CounterLoadedState(
          count: (state as CounterLoadedState).count - addVal));
    }
  }
}

@immutable
abstract class CounterState {}

class CounterLoadedState extends CounterState {
  int count;
  CounterLoadedState({
    required this.count,
  });
}

@immutable
abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}
