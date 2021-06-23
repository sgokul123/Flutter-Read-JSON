class Feedback {
  String text;
  Object media;

  Feedback({this.text, this.media});

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      text: json["text"],
      media: json["media"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "text": this.text,
      "media": this.media,
    };
  }
//

}
