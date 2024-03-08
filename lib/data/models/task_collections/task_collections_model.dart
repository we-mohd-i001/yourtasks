import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_collections_model.g.dart';

@JsonSerializable()
class TaskCollectionsModel extends Equatable{
  final String id;
  final String title;

  const TaskCollectionsModel({required this.id, required this.title});

  factory TaskCollectionsModel.fromJson(Map<String, dynamic> json) =>
      _$TaskCollectionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskCollectionsModelToJson(this);

  @override
  List<Object?> get props =>[id, title];
}