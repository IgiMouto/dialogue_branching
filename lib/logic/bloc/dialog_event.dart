part of 'dialog_bloc.dart';

abstract class DialogEvent extends Equatable {
  const DialogEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends DialogEvent {}
