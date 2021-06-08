import 'package:equatable/equatable.dart';

class QuoteToDisplay extends Equatable {
  final int id;
  final String label;

  const QuoteToDisplay({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [
        id,
        label,
      ];
}
