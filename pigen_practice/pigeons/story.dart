import 'package:pigeon/pigeon.dart';

class Story {
  String? title;
  String? author;
  List<Comment?>? comments;
  double? rates;
  int? year;
  bool? isFavorite;
}

class Comment {
  String? user;
  String? body;
}

@HostApi()
abstract class HostStoryApi {
  Story? respond();
}
