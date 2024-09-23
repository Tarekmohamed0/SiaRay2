import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../view/notes_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  List<NotesModel>? notes;
  fetchAllNotes() async {
    emit(NotesCubitLoading());
    try {
      var box = Hive.box('notes');
      notes = box.get('notes');

      emit(NotesCubitCreate());
    } catch (e) {
      emit(NotesCubitError(e.toString()));
    }
  }
}
