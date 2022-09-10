// import 'package:firebase_database/firebase_database.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:starter_flutter/services/persistence/database_repository.dart';
//
// import 'dart:async';
//
//
// /* Instantiate here all your key-value database listeners using the following scheme
//
//   final databaseControllerProvider = StateNotifierProvider<DatabaseController, Event?>((ref) => DatabaseController(ref.read, ""));
//
// */
//
//
// class DatabaseController extends StateNotifier<Event?> {
//   DatabaseController(this._reader, this._keyNode) : super(null) {
//     _databaseChangedSubscription?.cancel();
//     _databaseChangedSubscription = _repository
//         .getStream(key: _keyNode)!
//         .listen((user) => state = user);
//   }
//
//   final Reader _reader;
//   final String _keyNode;
//
//   DatabaseRepository get _repository => _reader(databaseRepositoryProvider);
//   StreamSubscription<Event>? _databaseChangedSubscription;
//
//   @override
//   void dispose() {
//     super.dispose();
//     _databaseChangedSubscription?.cancel();
//   }
// }