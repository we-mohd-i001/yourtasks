import 'package:either_dart/either.dart';
import 'package:yourtasks/domain/entities/task_collection.dart';
import 'package:yourtasks/domain/failures/failures.dart';
import 'package:yourtasks/domain/repositories/task_repository.dart';

class TaskRepositoryLocal extends TaskRepository{
  @override
  Future<Either<Failure, bool>> createTodoCollection(TaskCollection collection) async {
    try{
      final result = await locaDataSource.createTaskCollection();
    }
  }

  @override
  Future<Either<Failure, List<TaskCollection>>> readTaskCollections() {
    // TODO: implement readTaskCollections
    throw UnimplementedError();
  }
  
}