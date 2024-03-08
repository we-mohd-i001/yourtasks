import 'package:either_dart/either.dart';
import 'package:yourtasks/data/data_sources/interfaces/task_local_data_source_interface.dart';
import 'package:yourtasks/data/exceptions/exceptions.dart';
import 'package:yourtasks/data/models/task_collections/task_collections_model.dart';
import 'package:yourtasks/domain/entities/task_collection.dart';
import 'package:yourtasks/domain/entities/unique_id.dart';
import 'package:yourtasks/domain/failures/failures.dart';
import 'package:yourtasks/domain/repositories/task_repository.dart';

class TaskRepositoryLocal extends TaskRepository {
  final TaskLocalDataSourceInterface localDataSource;

  TaskRepositoryLocal({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> createTaskCollection(
      TaskCollection collection) async {
    try {
      final result = await localDataSource.createTaskCollection(
          collection: taskCollectionToModel(collection));
      return Right(result);
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<TaskCollection>>> readTaskCollections() async {
    try {
      final collectionIds = await localDataSource.getTaskCollectionIds();
      final List<TaskCollection> collections = [];
      for (String collectionId in collectionIds) {
        final collection =
            await localDataSource.getTaskCollection(collectionId: collectionId);
        collections.add(taskCollectionsModelToEntity(collection));
      }
      return Right(collections);
    } on Exception catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    }
  }

  TaskCollection taskCollectionsModelToEntity(
      TaskCollectionsModel taskCollectionsModel) {
    final entity = TaskCollection(
        id: CollectionId.fromUniqueString(taskCollectionsModel.id),
        title: taskCollectionsModel.title);
    return entity;
  }

  TaskCollectionsModel taskCollectionToModel(TaskCollection collection) {
    final model =
        TaskCollectionsModel(id: collection.id.value, title: collection.title);
    return model;
  }
}
