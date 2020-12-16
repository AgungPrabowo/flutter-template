import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'your_bloc_event.dart';
part 'your_bloc_state.dart';

class YourBlocBloc extends Bloc<YourBlocEvent, YourBlocState> {
  YourBlocBloc() : super(YourBlocInitial());

  @override
  Stream<YourBlocState> mapEventToState(
    YourBlocEvent event,
  ) async* {}
}
