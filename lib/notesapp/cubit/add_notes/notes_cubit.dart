import 'package:first_project/notesapp/cubit/add_notes/note_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AddNoteCubit extends Cubit<NoteState> {
  AddNoteCubit() : super(NoteInitial());

  AddNote(NotesModel) async {
    emit(NoteLoading());
    try {
      var notesbox = Hive.box('notes');
      await notesbox.put('notes', NotesModel);
      emit(NoteCreate('Note Added Successfully'));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }
}
