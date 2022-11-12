import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pigen_practice/home/user_comment/user_comment.dart';
import '../pigeons_output/story.dart';

import 'home.dart';

class HomeViewModel extends StateNotifier<Home> {
  HomeViewModel()
      : super(
          Home(),
        );

  Future<void> onPressedRequestPigeon() async {
    try {
      final storyApi = HostStoryApi();
      final story = await storyApi.respond();
      final comments = _parseComments(story?.comments);
      state = state.copyWith(
        title: story?.title ?? '',
        author: story?.author ?? '',
        comments: comments,
        rates: story?.rates ?? 0,
        year: story?.year ?? 0,
        isFavorite: story?.isFavorite ?? false,
      );
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  List<UserComment> _parseComments(List<Comment?>? comments) {
    if (comments == null) {
      return [];
    }
    List<UserComment> userComments = [];
    for (var comment in comments) {
      final userComment = UserComment(
        user: comment?.user ?? 'Anonymous',
        body: comment?.body ?? '',
      );
      userComments.add(userComment);
    }
    return userComments;
  }

  void onPressedReset() {
    state = state.copyWith(
      title: '',
      author: '',
      comments: [],
      isFavorite: false,
      rates: 0,
      year: 2000,
    );
  }
}
