import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:yourtasks/domain/entities/task_collection.dart';
import 'package:yourtasks/domain/entities/unique_id.dart';
import 'package:yourtasks/domain/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class CollectionIdParam extends Params {
  final CollectionId collectionId;

  CollectionIdParam({required this.collectionId}) : super();

  @override
  List<Object?> get props => [collectionId];
}

class TaskCollectionParams extends Params {
  final TaskCollection taskCollection;

  TaskCollectionParams({required this.taskCollection}) : super();

  @override
  List<Object?> get props => [taskCollection];
}
