import 'dart:developer';

import 'package:first_project/notesapp/cubit/add_notes/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_text_filed.dart';
import 'notes_model.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteForm();
}

class _AddNoteForm extends State<AddNoteForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _key = GlobalKey<FormState>();
  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          customTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
            fillColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          customTextField(
            onSaved: (value) {
              description = value;
            },
            hintText: 'Description',
            fillColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(),
            ),
            maxlines: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                fixedSize: WidgetStateProperty.all(const Size(200, 50)),
              ),
              onPressed: () {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  var notmodel = NotesModel(
                      title: title!,
                      description: description!,
                      date: DateTime.now().toString(),
                      color: Colors.blue.value);

                  BlocProvider.of<AddNoteCubit>(context).AddNote(notmodel);
                  Navigator.pop(context);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: const Text('Add Notes'))
        ],
      ),
    );
  }
}
