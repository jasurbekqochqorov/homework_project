class NumberSquareModel {
  final int index;
  final bool isFilled;
  final String number;

  NumberSquareModel({
    required this.index,
    required this.number,
    required this.isFilled,
  });

  NumberSquareModel copyWith({
    int? index,
    bool? isFilled,
    String? number,
  }) {
    return NumberSquareModel(
      index: index ?? this.index,
      number: number ?? this.number,
      isFilled: isFilled ?? this.isFilled,
    );
  }
}
