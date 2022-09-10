// import 'package:starter_flutter/models/default_entity.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:starter_flutter/services/persistence/firestore_repository.dart';
// import 'package:starter_flutter/services/persistence/persistence_exception.dart';
//
// import 'dart:typed_data';
//
// final repositoryControllerProvider = StateNotifierProvider<RepositoryController, AsyncValue<List<DefaultEntity>>>(
//   (ref) => RepositoryController(ref.read)
// );
//
// class RepositoryController extends StateNotifier<AsyncValue<List<DefaultEntity>>> {
//   RepositoryController(this._reader) : super(const AsyncValue.loading());
//
//   final Reader _reader;
//
//   FirestoreRepository get _repository => _reader(firestoreRepositoryProvider);
//   StateController get _exceptionController => _reader(persistenceExceptionProvider);
//
//
//   Future<DefaultEntity?> readEntity({required String entityId}) async {
//     try {
//       final entity = await _repository.readEntity(entityId: entityId);
//       if (entity != null) {
//         if (mounted) {
//           state = AsyncValue.data([entity]);
//         }
//         return entity;
//       }
//     } on PersistenceException catch (e) {
//       state = AsyncValue.error(e);
//       _exceptionController.state = e;
//     }
//   }
//
//   Future<void> createEntity({required String f1, bool f2 = false, DateTime? f3, Uint8List? f4}) async {
//     try {
//       final entity = DefaultEntity(fieldName1: f1, fieldName2: f2, fieldName3: f3, fieldName4: f4);
//       final entityInsertedId = await _repository.createEntity(entity: entity);
//       state.whenData((entities) => state = AsyncValue.data(
//           entities..add(entity.copyWith(id: entityInsertedId))
//       ));
//     } on PersistenceException catch (e) {
//       _exceptionController.state = e;
//     }
//   }
//
//   Future<void> updateEntity({required DefaultEntity updatedEntity}) async {
//     try {
//       await _repository
//           .updateEntity(entity: updatedEntity);
//       state.whenData((entities) {
//         final newStateList = <DefaultEntity>[];
//         for (final entity in entities) {
//           if (entity.id == updatedEntity.id) {
//             newStateList.add(updatedEntity);
//           } else {
//             newStateList.add(entity);
//           }
//         }
//         state = AsyncValue.data(newStateList);
//       });
//     } on PersistenceException catch (e) {
//       _exceptionController.state = e;
//     }
//   }
//
//   Future<void> deleteEntity({required String entityId}) async {
//     try {
//       await _repository
//           .deleteEntity(entityId: entityId);
//       state.whenData((entities) => state = AsyncValue.data(entities..removeWhere((e) => e.id == entityId)));
//     } on PersistenceException catch (e) {
//       _exceptionController.state = e;
//     }
//   }
// }