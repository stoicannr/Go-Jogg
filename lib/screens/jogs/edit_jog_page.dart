import 'package:flutter/material.dart';

import '../../db/jogs_database.dart';
import '../../models/jog_model.dart';
import '../shared_elements/jog_form_widget.dart';

class AddEditJogPage extends StatefulWidget {
  final Jog? jog;

  const AddEditJogPage({
    Key? key,
    this.jog,
  }) : super(key: key);
  @override
  _AddEditJogPageState createState() => _AddEditJogPageState();
}

class _AddEditJogPageState extends State<AddEditJogPage> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.jog?.title ?? '';
    description = widget.jog?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: JogFormWidget(
            title: title,
            description: description,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateJog,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateJog() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.jog != null;

      if (isUpdating) {
        await updateJog();
      } else {
        await addJog();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateJog() async {
    final jog = widget.jog!.copy(
      title: title,
      description: description,
    );

    await JogsDatabaseHelper.instanceJogHelper.update(jog);
  }

  Future addJog() async {
    final jog = Jog(
      title: title,
      description: description,
      createdTime: DateTime.now(),
    );

    await JogsDatabaseHelper.instanceJogHelper.createJog(jog);
  }
}
