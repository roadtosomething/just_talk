import 'package:just_talk/repositories/just_talk/models/author_model.dart';

class NewsModel {
  final int id;
  final String title;
  final String description;
  final String author;
  final DateTime date;


  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.date});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      author: AuthorModel.fromJson(json['author']).name,
      date: json['date']
    );


  }
}