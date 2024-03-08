import 'package:either_dart/either.dart';
import 'package:yourtasks/core/use_case.dart';
import 'package:yourtasks/domain/failures/failures.dart';
import 'package:yourtasks/domain/repositories/task_repository.dart';

class  CreateTaskCollection implements UseCase<bool, TaskCollectionParams>{
  final TaskRepository taskRepository;

  CreateTaskCollection({required this.taskRepository});



  @override
  Future<Either<Failure, bool>> call(params) async{
    try{
      final result = taskRepository.createTaskCollection(params.taskCollection);
      return result.fold(
          (left) => Left(left),
          (right) => Right(right),
      );
    } on Exception catch(e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }

}