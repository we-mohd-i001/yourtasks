import 'package:yourtasks/data/data_sources/interfaces/task_local_data_source_interface.dart';
import 'package:yourtasks/data/exceptions/exceptions.dart';
import 'package:yourtasks/data/models/task_collections/task_collections_model.dart';

class MemoryLocalDataSource implements TaskLocalDataSourceInterface {
  final List<TaskCollectionsModel> taskCollection = [];

  @override
  Future<bool> createTaskCollection(
      {required TaskCollectionsModel collection}) {
    try {
      taskCollection.add(collection);
      return Future.value(true);
    } on Exception catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> getTaskCollectionIds() {
    try {
      final taskCollectionIds =
          taskCollection.map((collection) => collection.id).toList();
      return Future.value(taskCollectionIds);
    } on Exception catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<TaskCollectionsModel> getTaskCollection({required String collectionId}) {
    try{
      final collectionModel = taskCollection.firstWhere((element) => element.id == collectionId,
      orElse: () => throw CollectionNotFoundException(),

      );
      return Future.value(collectionModel);
    } on Exception catch(_){
      throw CacheException();
    }
  }


}
