import '../../utils/images/app_images.dart';
import '../models/question_model.dart';

class GameRepository {
  GameRepository();

  List<QuestionModel> questions = [
    QuestionModel(
        answer: "study",
        images: [AppImages.boy,AppImages.study,AppImages.study2,AppImages.study3]),
    QuestionModel(
        answer: "sleep",
        images: [AppImages.sleep,AppImages.sleep2,AppImages.sleep4,AppImages.sleep3]),
    QuestionModel(
        answer: "lesson",
        images: [AppImages.boy,AppImages.boy,AppImages.boy,AppImages.boy]),
    QuestionModel(
        answer: "toshkent",
        images: [AppImages.boy,AppImages.boy,AppImages.boy,AppImages.boy]),
  ];
  GameRepository.createEmpty() {
    questions = [];
  }
}
