import 'options.dart';

class QuestionData {
  Object metadata;
  Object solution;
  String stimulus;
  List options;
  int marks;
  String type;

  QuestionData(
      {this.metadata,
      this.solution,
      this.stimulus,
      this.options,
      this.marks,
      this.type});

  factory QuestionData.fromJson(Map<String, dynamic> json) {
    return QuestionData(
      metadata: json["metadata"],
      solution: json["solution"],
      stimulus: json["stimulus"],
      marks: json["marks"],
      type: json["type"],
      options: json['options'] != null
          ? json['options'].map((value) => new Options.fromJson(value)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "metadata": this.metadata,
      "solution": this.solution,
      "stimulus": this.stimulus,
      "options": this.options,
      "marks": this.marks,
      "type": this.type,
    };
  }
//

}
