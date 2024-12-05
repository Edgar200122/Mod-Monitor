import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mod_monitor_app/storages/tiger_model.dart';

abstract class AppIsarDatabase {
  static late final Isar _instance;

  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return _instance = await Isar.open(
      [TriggerModelSchema],
      directory: dir.path,
    );
  }

  static Future<List<TriggerModel>> getTriggers() async {
    return await _instance.writeTxn(
      () async => await _instance.triggerModels.where().findAll(),
    );
  }

  static Future<void> addTrigger(TriggerModel trigger) async {
    await _instance
        .writeTxn(() async => await _instance.triggerModels.put(trigger));
  }

  static Future<void> deleteTrigger(int id) async {
    await _instance
        .writeTxn(() async => await _instance.triggerModels.delete(id));
  }
}
