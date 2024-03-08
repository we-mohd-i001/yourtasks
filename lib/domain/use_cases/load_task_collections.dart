import 'package:either_dart/either.dart';
import 'package:yourtasks/core/use_case.dart';
import 'package:yourtasks/domain/entities/task_collection.dart';
import 'package:yourtasks/domain/failures/failures.dart';
import 'package:yourtasks/domain/repositories/task_repository.dart';

class LoadTaskCollection implements UseCase<List<TaskCollection>, NoParams> {
  final TaskRepository taskRepository;

  LoadTaskCollection({required this.taskRepository});
  @override
  Future<Either<Failure, List<TaskCollection>>> call(NoParams params) async {
    try {
      final loadedCollections = taskRepository.readTaskCollections();
      return Future.delayed(
          const Duration(milliseconds: 300),
          () => loadedCollections.fold(
              (left) => Left(left), (right) => Right(right)));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
