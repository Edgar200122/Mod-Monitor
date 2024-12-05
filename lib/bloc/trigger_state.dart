import 'package:equatable/equatable.dart';


import '../storages/tiger_model.dart';

class TriggerState extends Equatable {
  final List<TriggerModel> triggers;

  const TriggerState({required this.triggers});

  @override
  List<Object> get props => [triggers];
}
