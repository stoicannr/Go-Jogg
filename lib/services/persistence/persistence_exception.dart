import 'package:hooks_riverpod/hooks_riverpod.dart';

final persistenceExceptionProvider = StateProvider<PersistenceException?>((ref) => null);

class PersistenceException implements Exception {
  PersistenceException(this.cause);
  String cause;
}