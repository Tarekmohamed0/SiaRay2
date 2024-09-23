part of 'notes_cubit_cubit.dart';

abstract class NotesCubitState extends Equatable {
  const NotesCubitState();

  @override
  List<Object> get props => [];
}

class NotesCubitInitial extends NotesCubitState {}

class NotesCubitLoading extends NotesCubitState {}

class NotesCubitError extends NotesCubitState {
  final String message;
  NotesCubitError(this.message);
}

class NotesCubitCreate extends NotesCubitState {}

// class NotesCubitUpdate extends NotesCubitState {
//   final NotesModel note;
//   NotesCubitUpdate(this.note);
// }

// class NotesCubitDelete extends NotesCubitState {
//   final NotesModel note;
//   NotesCubitDelete(this.note);
// }

class NotesCubitGet extends NotesCubitState {
  final List<NotesModel> notes;
  NotesCubitGet(this.notes);
}

// class NotesCubitGetById extends NotesCubitState {
//   final NotesModel note;
//   NotesCubitGetById(this.note);
// }
