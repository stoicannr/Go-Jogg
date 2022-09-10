// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:starter_flutter/services/serverless/functions_caller.dart';
// import 'package:starter_flutter/services/serverless/functions_exception.dart';
//
// class FunctionsController extends StateNotifier<AsyncValue<dynamic>> {
//   FunctionsController(this._reader) : super(const AsyncValue.loading());
//
//   final Reader _reader;
//
//   FunctionsCaller get _caller => _reader(functionsCallerProvider);
//   StateController get _exceptionController => _reader(functionsExceptionProvider);
//
//   Future<dynamic> callFunction({required String functionName, Map<String, dynamic>? data}) async {
//     try {
//       final result = await _caller.callFunction(functionName: functionName, data: data);
//       if (result != null) {
//         if (mounted) {
//           state = AsyncValue.data(result);
//         }
//         return result;
//       }
//     } on FunctionsException catch (e) {
//       state = AsyncValue.error(e);
//       _exceptionController.state = e;
//     }
//   }
// }