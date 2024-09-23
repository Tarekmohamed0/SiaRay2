import 'dart:developer';

import 'package:first_project/notesapp/cubit/add_notes/note_state.dart';
import 'package:first_project/notesapp/cubit/add_notes/notes_cubit.dart';
import 'package:first_project/notesapp/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:first_project/notesapp/view/add_note_form.dart';
import 'package:first_project/notesapp/view/edit_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:hive/hive.dart';

import 'notes_model.dart';

class HomeNotes extends StatefulWidget {
  const HomeNotes({super.key});

  @override
  State<HomeNotes> createState() => _HomeNotesState();
}

class _HomeNotesState extends State<HomeNotes> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;

  String? description;

  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'notesapp',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: BlocBuilder<NotesCubitCubit, NotesCubitState>(
        builder: (context, state) {
          List<NotesModel> notes =
              BlocProvider.of<NotesCubitCubit>(context).notes ?? [];
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const EditNote();
                      }));
                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'faadf',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('gdsfg',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    )),
                                Icon(Icons.delete),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    '${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
          var box = Hive.box('notes');
          var nott = box.get('notes');
          log(nott.toString());
          // Navigator.pushNamed(context, '/add_product');
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: BlocListener<AddNoteCubit, NoteState>(
                      listener: (context, state) {
                        if (state is NoteError) {
                          var snackBar = SnackBar(
                            /// need to set following properties for best effect of awesome_snackbar_content
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Error',
                              message:
                                  'An error occurred while adding the note',

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        } else if (state is NoteCreate) {
                          const snackBar = SnackBar(
                            /// need to set following properties for best effect of awesome_snackbar_content
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Success',
                              message: 'Note added successfully',

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                              contentType: ContentType.success,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        }
                      },
                      child: AddNoteForm(),
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
