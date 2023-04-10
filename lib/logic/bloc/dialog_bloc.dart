import 'dart:async';

import 'package:dialogue_player/data/models/data_model.dart';
import 'package:dialogue_player/data/repositories/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dialog_event.dart';
part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  DialogBloc(this.dataRepository) : super(DialogInitial()) {
    on<FetchData>(_onFetchData);
  }
  final DataRepository dataRepository;
  FutureOr<void> _onFetchData(
      FetchData event, Emitter<DialogState> emit) async {
    emit(DialogLoadingState());

    final dataResponse = await dataRepository.getDatas();
    if (dataResponse.isNotEmpty) {
      emit(DialogLoadedState(dataResponse));
    } else {
      emit(DialogFailedState());
    }
    // emit(state.copywith(dataModel: dataResponse));
  }
}
