import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:mod_monitor_app/storages/tiger_model.dart';
import 'trigger_state.dart';

class TriggerCubit extends Cubit<TriggerState> {
  final isar = GetIt.I<Isar>(); 

  TriggerCubit() : super(const TriggerState(triggers: []));

  Future<void> loadTriggers() async {
    final triggers = await isar.triggerModels.where().findAll();
    emit(TriggerState(triggers: triggers));
  }

  Future<void> addTrigger(String name) async {
    final trigger = TriggerModel()..name = name;
    await isar.writeTxn(() async {
      await isar.triggerModels.put(trigger);
    });
    await loadTriggers();
  }

  Future<void> deleteTrigger(int id) async {
    await isar.writeTxn(() async {
      await isar.triggerModels.delete(id);
    });
    await loadTriggers();
  }
}
