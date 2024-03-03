import 'package:equatable/equatable.dart';

class Forms extends Equatable {
  final int id;
  final String name;


  const Forms({
    this.id = 0,
    this.name = 'Name',
  });

  @override
  List<Object?> get props => [
    id,
    name,
  ];
}
