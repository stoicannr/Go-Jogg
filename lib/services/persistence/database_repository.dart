// import 'package:firebase_database/firebase_database.dart';
// import 'package:starter_flutter/models/default_entity.dart';
// import 'package:starter_flutter/providers/service_providers.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:starter_flutter/services/persistence/persistence_exception.dart';
//
// final databaseRepositoryProvider = Provider<DatabaseRepository>((ref) => DatabaseRepository(ref.read));
//
// class DatabaseRepository {
//   DatabaseRepository(this._reader) {
//     _dbReference = _instance.reference();
//   }
//
//   final Reader _reader;
//
//   FirebaseDatabase get _instance => _reader(firebaseDatabaseProvider);
//
//   DatabaseReference? _dbReference;
//
//   Stream<Event>? getStream({required String key}) => _dbReference?.child(key).onChildAdded;
//
//   Future<DefaultEntity> getEntity({required String entityKey}) async {
//     try {
//       final userProfileSnapshot = await _dbReference!.child(entityKey).once();
//       return DefaultEntity.fromJson(userProfileSnapshot.value as Map<String, dynamic>);
//     } on DatabaseError catch (e) {
//       throw PersistenceException(e.message);
//     }
//   }
//
//   Future<void> updateEntity({required String entityKey, required Map<String, dynamic> updatedData}) async {
//     try {
//       await _dbReference!.child(entityKey).update(updatedData);
//     } on DatabaseError catch (e) {
//       throw PersistenceException(e.message);
//     }
//   }
// }