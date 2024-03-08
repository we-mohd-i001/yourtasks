import 'package:yourtasks/domain/entities/unique_id.dart';

class TaskCollection {
  final CollectionId id;
  final String title;

  TaskCollection({required this.id, required this.title});

  TaskCollection copyWith({String? title,}){
    return TaskCollection(id: id, title: title ?? this.title);
  }

  factory TaskCollection.empty() {
    return TaskCollection(id:  CollectionId(), title: '');
  }
}