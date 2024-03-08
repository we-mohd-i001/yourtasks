import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class UniqueId with EquatableMixin{
  const UniqueId._(this.value);

  final String value;

  factory UniqueId(){
    return UniqueId._(const Uuid().v4());
  }

  factory UniqueId.fromUniqueString(String uniqueString){
    return UniqueId._(uniqueString);
  }

  @override
  List<Object?> get props => [value];

}

class CollectionId extends UniqueId{
  const CollectionId._(String value) : super._(value);

  factory CollectionId(){
    return CollectionId._(const Uuid().v4());
  }
}