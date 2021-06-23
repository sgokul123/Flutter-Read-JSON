import 'package:quiz_app/models/feedback.dart';

class Options {
  String label;
  Object media;
  int value;
  int isCorrect;
  List feedback;
  int score;

  Options(
      {this.label,
      this.media,
      this.value,
      this.isCorrect,
      this.feedback,
      this.score});

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      label: json["label"],
      media: json["media"],
      value: json["value"],
      isCorrect: json["isCorrect"],
      score: json["score"],
      feedback: json['feedback'] != null
          ? json['feedback']
              .map((value) => new Feedback.fromJson(value))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "label": this.label,
      "media": this.media,
      "value": this.value,
      "isCorrect": this.isCorrect,
      "feedback": this.feedback,
      "score": this.score,
    };
  }
}
