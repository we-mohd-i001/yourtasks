import 'package:yourtasks/data/models/task_collections/task_collections_model.dart';

abstract class TaskLocalDataSourceInterface {
  Future<TaskCollectionsModel> getTaskCollection({required String collectionId});
  Future<List<String>> getTaskCollectionIds();
  Future<bool> createTaskCollection({required TaskCollectionsModel collection});

}
