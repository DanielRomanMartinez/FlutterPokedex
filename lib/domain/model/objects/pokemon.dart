import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final bool isCaptured;

  const Pokemon({
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
