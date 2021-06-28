import 'package:get/get.dart';
import 'package:quiz_app/models/options.dart';

class OverAllResultController extends GetxController {
  List<Options> selectedOptionList = List<Options>.empty(growable: true);
  final _totalScore = 0.obs;

  get totalScore => this._totalScore.value;

  set totalScore(value) => this._totalScore.value = value;

  getTotalScore() {
    int score = this.totalScore;
    print("score $score");
    for (Options options in selectedOptionList) {
      score = score + options.score;
      print("score $score options.score ${options.score}");
    }
    print("score $score");
    this.totalScore = score;
  }

  void addSelectedOption(Options option) {
    selectedOptionList.add(option);
  }
}
