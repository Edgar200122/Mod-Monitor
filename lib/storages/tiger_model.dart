
import 'package:isar/isar.dart';

part 'tiger_model.g.dart';


@collection
class TriggerModel {
  Id id = Isar.autoIncrement;
  late String name;
}
