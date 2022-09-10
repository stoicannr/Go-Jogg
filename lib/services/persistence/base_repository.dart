import 'package:starter_flutter/models/default_entity.dart';

abstract class BaseRepository {
  Future<DefaultEntity?> readEntity({required String entityId});
  Future<String> createEntity({required DefaultEntity entity});
  Future<void> updateEntity({required DefaultEntity entity});
  Future<void> deleteEntity({required String entityId});
}