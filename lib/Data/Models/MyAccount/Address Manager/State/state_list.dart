import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'state_list.g.dart';

@JsonSerializable()
class StateList extends Equatable{
  @JsonKey(name: "data")
  final List<StateData> state;

  factory StateList.fromJson(Map<String, dynamic> stateList) =>
      _$StateListFromJson(stateList);
  Map<String, dynamic> toJson() => _$StateListToJson(this);

  const StateList(this.state);

  
    @override
  List<Object> get props => [state];

  @override
  String toString() => 'StateList(state: $state)';
}
