class TipModel {
  final String text;

  TipModel({
    required this.text,
  });

  factory TipModel.fromJson(Map<String, dynamic> json) {
    return TipModel(
      text: json['response'],
    );
  }
}