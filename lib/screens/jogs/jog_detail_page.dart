import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:starter_flutter/db/jogs_database.dart';
import 'package:starter_flutter/models/jog_model.dart';
import 'package:starter_flutter/screens/jogs/edit_jog_page.dart';

class JogDetailPage extends StatefulWidget {
  final int jogId;

  const JogDetailPage({
    Key? key,
    required this.jogId,
  }) : super(key: key);

  @override
  _JogDetailPageState createState() => _JogDetailPageState();
}

class _JogDetailPageState extends State<JogDetailPage> {
  late Jog jog;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshJog();
  }

  Future refreshJog() async {
    setState(() => isLoading = true);
    jog = await JogsDatabaseHelper.instanceJogHelper.readJog(widget.jogId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      jog.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat.yMMMd().format(jog.createdTime),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      jog.description,
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditJogPage(jog: jog),
        ));

        refreshJog();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await JogsDatabaseHelper.instanceJogHelper.delete(widget.jogId);
          Navigator.of(context).pop();
        },
      );
}
