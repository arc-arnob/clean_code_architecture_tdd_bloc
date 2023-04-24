import 'package:equatable/equatable.dart';

abstract class Faliure extends Equatable {
  final List properties = const <dynamic>[];
  Faliure([properties]);
  @override
  List<Object> get props => [properties];
}

// General faliures
class ServerFaliure extends Faliure {}

class CacheFaliure extends Faliure {}
