import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/history_usecases/add_to_history_use_case.dart';
import '../../../domain/use_cases/history_usecases/clear_history_use_case.dart';
import '../../../domain/use_cases/history_usecases/get_history_use_case.dart';
import '../../../domain/use_cases/history_usecases/remove_from_history_use_case.dart';
import 'history_event.dart';
import 'history_state.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState>{
  final GetHistoryUseCase getHistoryUseCase;
  final AddToHistoryUseCase addToHistoryUseCase;
  final RemoveFromHistoryUseCase removeFromHistoryUseCase;
  final ClearHistoryUseCase clearHistoryUseCase;
  HistoryBloc({required this.getHistoryUseCase, required this.addToHistoryUseCase, required this.removeFromHistoryUseCase, required this.clearHistoryUseCase}) : super(HistoryInitial()) {
    on<LoadHistory>(_loadHistory);
    on<AddToHistoryRequest>(_addToHistory);
    on<RemoveFromHistoryRequest>(_removeFromHistory);
    on<ClearHistoryRequest>(_clearHistory);
  }
  Future<void> _loadHistory(LoadHistory event, Emitter<HistoryState> emit) async {
    emit(HistoryLoading());
    try{
      final movies = await getHistoryUseCase();
      emit(HistoryLoaded(movies));
    }catch(e){
      emit(HistoryError('Failed to load history'));
    }
  }
  Future<void> _addToHistory(
      AddToHistoryRequest event, Emitter<HistoryState> emit) async {
    try {
      await addToHistoryUseCase(event.movie);
      emit(HistoryLoaded(await getHistoryUseCase()));
    } catch (e) {
      debugPrint('addToHistory failed: $e');
    }
  }
  Future<void> _removeFromHistory(RemoveFromHistoryRequest event, Emitter<HistoryState> emit) async {
    try{
      await removeFromHistoryUseCase(event.movie);
      emit(HistoryLoaded(await getHistoryUseCase()));
      }catch(e){
      emit(HistoryError('Failed to remove from history'));
      add(LoadHistory());
    }
  }
  Future<void> _clearHistory(ClearHistoryRequest event, Emitter<HistoryState> emit) async {
    try{
      await clearHistoryUseCase();
      emit(HistoryLoaded(await getHistoryUseCase()));
      }catch(e){
      emit(HistoryError('Failed to clear history'));
      add(LoadHistory());
    }
  }
  }



