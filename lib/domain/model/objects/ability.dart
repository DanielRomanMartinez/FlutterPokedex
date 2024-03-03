import 'package:equatable/equatable.dart';

class Ability extends Equatable {
  final int id;
  final String name;
  final bool isCaptured;

  const Ability({
    this.id = 0,
    this.name = 'Name',
    this.isCaptured = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isCaptured,
      ];
}
