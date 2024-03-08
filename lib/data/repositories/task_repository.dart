import 'package:either_dart/either.dart';
import 'package:yourtasks/domain/entities/task_collection.dart';
import 'package:yourtasks/domain/entities/unique_id.dart';
import 'package:yourtasks/domain/failures/failures.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskCollection>>> readTaskCollections();

  Future<Either<Failure, bool>> createTodoCollection(TaskCollection collection);

  // Future<Either<Failure, CollectionId>> deleteTaskCollection();
}
