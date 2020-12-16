part of 'your_bloc_bloc.dart';

abstract class YourBlocState extends Equatable {
  const YourBlocState();
  
  @override
  List<Object> get props => [];
}

class YourBlocInitial extends YourBlocState {}
