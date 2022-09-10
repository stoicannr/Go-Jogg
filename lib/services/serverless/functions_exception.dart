import 'package:hooks_riverpod/hooks_riverpod.dart';

final functionsExceptionProvider = StateProvider<FunctionsException?>((ref) => null);

class FunctionsException implements Exception {
  FunctionsException(this.cause);

  String cause;
}