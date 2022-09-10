import 'package:flutter/material.dart';
import 'package:starter_flutter/models/default_entity.dart';
import 'package:starter_flutter/resources.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_flutter/services/authentication/base_authenticator.dart';
import 'package:starter_flutter/services/controllers/auth_controller.dart';
import 'package:starter_flutter/services/persistence/firestore_repository.dart';
import 'package:starter_flutter/utils/app_localizations.dart';

class DefaultScreen extends HookWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorPalette.backgroundColor)),
              child: const Text("Testing purpose"),
              onPressed: () async {
                //Try anything here
              },
            ),
          ],
        )),
      ),
    );
  }
}
