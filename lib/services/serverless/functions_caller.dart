import 'package:cloud_functions/cloud_functions.dart';
import 'package:starter_flutter/providers/service_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_flutter/services/serverless/functions_exception.dart';
import 'package:starter_flutter/services/serverless/operation_status.dart';

final functionsCallerProvider = Provider<FunctionsCaller>((ref) => FunctionsCaller(ref.read));

class FunctionsCaller {
  FunctionsCaller(this._reader);

  final Reader _reader;

  FirebaseFunctions get _instance => _reader(cloudFunctionsProvider);


  Future<dynamic> callFunction({required String functionName, Map<String, dynamic>? data}) async {
    try {
      final callable = _instance.httpsCallable(functionName,
        options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
      );
      final result = await callable.call(data);
      if (result.data["STATUS"] == const OperationStatus.completed().toInt) {
        final dataResults = result.data["DATA"];
        return dataResults;
      } else {
        final errorMsg = result.data["STATUS"]["DATA"] as String;
        throw FunctionsException(errorMsg);
      }
    } on FirebaseFunctionsException catch (e) {
      throw FunctionsException(e.code);
    }
  }
}