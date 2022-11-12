import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pigen_practice/home/home_provider.dart';

import 'user_comment/user_comment.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pigeon Practice'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _Story(),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(homeProvider.notifier).onPressedRequestPigeon();
                },
                child: const Text('Request Pigeon'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(homeProvider.notifier).onPressedReset();
                },
                child: const Text('Reset'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Story extends ConsumerWidget {
  const _Story({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider);
    return SizedBox(
      height: 300,
      width: 300,
      child: Card(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              _Row(title: 'title', description: home.title),
              _Row(title: 'author', description: home.author),
              _Row(title: 'rates', description: home.rates.toString()),
              _Row(title: 'year', description: home.year.toString()),
              _Row(
                  title: 'Favorite',
                  description: home.isFavorite ? 'Yes' : 'No'),
              const SizedBox(
                height: 20,
              ),
              const Text('Comments'),
              _Comments(comments: home.comments),
            ],
          ),
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$title: '),
        Text(description),
      ],
    );
  }
}

class _Comments extends StatelessWidget {
  const _Comments({
    Key? key,
    required this.comments,
  }) : super(key: key);

  final List<UserComment> comments;

  @override
  Widget build(BuildContext context) {
    final itemCount = min(comments.length, 3);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return _Comment(
          user: comments[index].user,
          body: comments[index].body,
        );
      },
    );
  }
}

class _Comment extends StatelessWidget {
  const _Comment({
    Key? key,
    required this.user,
    required this.body,
  }) : super(key: key);

  final String user;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Row(
          title: 'user',
          description: user,
        ),
        _Row(
          title: 'comment',
          description: body,
        )
      ],
    );
  }
}
