import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_flutter/models/default_entity.dart';
import 'package:starter_flutter/providers/service_providers.dart';
import 'package:starter_flutter/services/persistence/base_repository.dart';
import 'package:starter_flutter/services/persistence/persistence_exception.dart';



final firestoreRepositoryProvider = Provider<FirestoreRepository>((ref) => FirestoreRepository(ref.read));

class FirestoreRepository implements BaseRepository {
  FirestoreRepository(this._reader);

  final Reader _reader;

  FirebaseFirestore get _instance => _reader(firebaseFirestoreProvider);

  @override
  Future<String> createEntity({required DefaultEntity entity}) async {
    try {
      final docRef = await _instance
          .collection('entities')
          .add(entity.toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw PersistenceException(e.code);
    }
  }

  @override
  Future<void> deleteEntity({required String entityId}) async {
    try {
      await _instance
          .doc(entityId)
          .delete();
    } on FirebaseException catch (e) {
      throw PersistenceException(e.code);
    }
  }

  @override
  Future<DefaultEntity?> readEntity({required String entityId}) async {
    try {
      final snapshot = await _instance
          .collection('entities')
          .doc(entityId)
          .get();
      if (snapshot.exists) {
        return DefaultEntity.fromDocument(snapshot);
      }
    } on FirebaseException catch (e) {
      throw PersistenceException(e.code);
    }
  }

  @override
  Future<void> updateEntity({required DefaultEntity entity}) async {
    try {
      await _instance
          .collection('entities')
          .doc(entity.id)
          .update(entity.toDocument());
    } on FirebaseException catch (e) {
      throw PersistenceException(e.code);
    }
  }

}