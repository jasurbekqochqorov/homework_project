class GameModel {
  String image1;
  String image2;
  String image3;
  String image4;
  String answer;
  int index;

  GameModel(
      {required this.answer,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.image4,
      required this.index});

  GameModel copyWith(
      {String? image1,
      String? image2,
      String? image3,
      String? image4,
      String? answer,
      int? index}) {
    return GameModel(
      answer: answer ?? this.answer,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      image3: image3 ?? this.image3,
      image4: image4 ?? this.image4,
      index: index ?? this.index,
    );
  }
}

List<GameModel> list = [
  GameModel(
    answer: 'sleep',
    image1: '',
    image2: '',
    image3: '',
    image4: '',
    index: 1,
  ),
  GameModel(
    answer: 'sleep',
    image1: '',
    image2: '',
    image3: '',
    image4: '',
    index: 1,
  ),
  GameModel(
    answer: 'sleep',
    image1: '',
    image2: '',
    image3: '',
    image4: '',
    index: 1,
  ),GameModel(
    answer: 'sleep',
    image1: '',
    image2: '',
    image3: '',
    image4: '',
    index: 1,
  ),
];
