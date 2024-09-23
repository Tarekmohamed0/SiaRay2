import '../../view/notes_model.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  final List<NotesModel> notes;
  NoteLoaded(this.notes);
}

class NoteError extends NoteState {
  final String message;
  NoteError(this.message);
}

class NoteSuccess extends NoteState {
  final String message;
  NoteSuccess(this.message);
}

class NoteDelete extends NoteState {
  final String message;
  NoteDelete(this.message);
}

class NoteUpdate extends NoteState {
  final String message;
  NoteUpdate(this.message);
}

class NoteCreate extends NoteState {
  final String message;
  NoteCreate(this.message);
}
// class NoteGet extends NoteState {
//   final NotesModel note;
//   NoteGet(this.note);
// }
// class NoteGetAll extends NoteState {
//   final List<NotesModel> notes;
//   NoteGetAll(this.notes);
// }
// class NoteGetAllByColor extends NoteState {
//   final List<NotesModel> notes;
//   NoteGetAllByColor(this.notes);
// }
// class NoteGetAllBySearch extends NoteState {
//   final List<NotesModel> notes;
//   NoteGetAllBySearch(this.notes);
// }
// class NoteGetAllByDate extends NoteState {
//   final List<NotesModel> notes;
//   NoteGetAllByDate(this.notes);
// }
// class NoteGetAllByColorAndDate extends NoteState {
//   final List<NotesModel> notes;
//   NoteGetAllByColorAndDate(this.notes);
// }
// class NoteGetAllByColorAndSearch extends NoteState {
//   final List<NotesModel> notes;
//   NoteGetAllByColorAndSearch(this.notes);
// }
// class NoteGetAllBySearchAndDate extends NoteState {
//   final List<NotesModel> notes;
//   NoteGetAllBySearchAndDate(this.notes);
// }
// class NoteGetAllBySearchAndColorAndDate extends NoteState {
//   final List<NotesModel> notes;
//   NoteGetAllBySearchAndColorAndDate(this.notes);
// }

