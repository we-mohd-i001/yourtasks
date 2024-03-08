import 'package:either_dart/either.dart';
import 'package:yourtasks/domain/failures/failures.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(Params params);
}