import 'package:freezed_annotation/freezed_annotation.dart';

//name of the file.freezed.dart
part 'operation_status.freezed.dart';

//this is a union

@freezed
@immutable
abstract class OperationStatus with _$OperationStatus {
  const factory OperationStatus.completed() = _Completed;
  const factory OperationStatus.error() = _Error;
}

extension OpExt on OperationStatus {
  int get toInt => when(
      completed: () => 1,
      error: () => 2
  );
}