import 'package:quiz_app/models/question_data.dart';

class Question {
  String instructions;
  Object metadata;
  String questionID;
  QuestionData data;
  Object solution;
  String attachment;
  String solutionStrategies;
  Object style;

  Question({this.instructions, this.metadata, this.questionID, this.data,
    this.solution, this.attachment, this.solutionStrategies, this.style});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      instructions: json["instructions"],
      metadata:json["metadata"],
      questionID: json["questionID"],
      data: QuestionData.fromJson(json["data"]),
      solution:json["solution"],
      attachment: json["attachment"],
      solutionStrategies: json["solutionStrategies"],
      style:json["style"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "instructions": this.instructions,
      "metadata": this.metadata,
      "questionID": this.questionID,
      "data": this.data,
      "solution": this.solution,
      "attachment": this.attachment,
      "solutionStrategies": this.solutionStrategies,
      "style": this.style,
    };
  }
//


}
