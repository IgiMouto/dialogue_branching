part of 'dialog_bloc.dart';

abstract class DialogState extends Equatable {
  const DialogState();

  @override
  List<Object?> get props => [];

  // DialogState copywith({List<DataModel>? dataModel}) {
  //   return DialogState(dataModel: dataModel ?? this.dataModel);
  // }
}

// class DialogLoadedState extends DialogState {
//   DialogLoadedState({required DialogLoadedState state})
//       : super(dataModel: state.dataModel);
// }
class DialogInitial extends DialogState {}

class DialogLoadingState extends DialogState {}

class DialogLoadedState extends DialogState {
  final List<DataModel>? dataModel;

  const DialogLoadedState(this.dataModel);
}

class DialogFailedState extends DialogState {}
