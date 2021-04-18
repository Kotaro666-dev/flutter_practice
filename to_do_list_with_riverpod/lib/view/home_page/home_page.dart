import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_with_riverpod/constants/constant.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/riverpod/providers.dart';
import 'package:to_do_list_with_riverpod/riverpod/to_do_list_notifier.dart';
import 'package:to_do_list_with_riverpod/utilitiy/utilities.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page_model.dart';

import '../../riverpod/providers.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final notifier = watch(toDoListProvider);
    final model = watch(homePageProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: SafeArea(
        child: notifier.toDoList.isEmpty
            ? const ShowToDoListEmpty()
            : AnimatedList(
                key: model.listKey,
                initialItemCount: notifier.toDoList.length,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return _buildAnimatedListView(
                      animation, model, notifier, index);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          await _buildOnTapAddNewToDoButton(
            context,
            model.resetModalBottomSheet,
          );
        },
      ),
    );
  }

  SizeTransition _buildAnimatedListView(
    Animation<double> animation,
    HomePageModel model,
    ToDoListNotifier notifier,
    int index,
  ) {
    final item = notifier.toDoList[index];
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: leftPadding),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: GestureDetector(
                        onTap: () async {
                          notifier.removeNewToDoItem(item.id);
                          final nextIndex = index == notifier.toDoList.length
                              ? index - 1
                              : index;
                          final duration =
                              index == notifier.toDoList.length ? 0 : 300;
                          model.listKey.currentState.removeItem(
                            index,
                            (BuildContext context,
                                Animation<double> animation) {
                              /// Animation Reference: https://medium.com/flutter-community/the-magic-of-animatedlist-18afb2ba564c
                              return removeToDoItemAnimation(
                                  animation, model, notifier, nextIndex);
                            },
                            duration: Duration(milliseconds: duration),
                          );
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '${item.content}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: item.deadline != Deadline.unselected ? 10 : 0),
              if (item.deadline != Deadline.unselected)
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 15,
                        color: model.getDeadlineColor(item.deadline),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        model.getDeadlineText(item.deadline),
                        style: TextStyle(
                          color: model.getDeadlineColor(item.deadline),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              const StraightLineDivider(),
            ],
          ),
        ),
      ),
    );
  }

  FadeTransition removeToDoItemAnimation(Animation<double> animation,
      HomePageModel model, ToDoListNotifier notifier, int nextIndex) {
    return FadeTransition(
      opacity:
          CurvedAnimation(parent: animation, curve: const Interval(0.5, 1)),
      child: SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animation, curve: const Interval(0, 1)),
        axisAlignment: 0,
        child: _buildAnimatedListView(animation, model, notifier, nextIndex),
      ),
    );
  }

  Future<void> _buildOnTapAddNewToDoButton(
    BuildContext context,
    VoidCallback resetModalBottomSheet,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Consumer(
          builder: (BuildContext context, watch, child) {
            final model = watch(homePageProvider);
            final notifier = watch(toDoListProvider);
            return GestureDetector(
              onTap: () => model.resetSelectedDeadlineCard,
              child: SizedBox(
                height: 150,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: model.textEditingController,
                          onChanged: model.onChanged,
                          autofocus: true,
                          cursorColor: Colors.red,
                          cursorHeight: 20,
                          decoration: const InputDecoration(
                            hintText: 'Add a task',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          DeadlineCard(deadlineType: Deadline.today),
                          DeadlineCard(deadlineType: Deadline.tomorrow),
                          DeadlineCard(deadlineType: Deadline.thisWeek),
                          DeadlineCard(deadlineType: Deadline.thisMonth),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  model.isActive ? Colors.red : Colors.grey,
                              radius: 15,
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                splashColor: Colors.transparent,
                                color: Colors.white,
                                icon: const Icon(Icons.arrow_upward_sharp),
                                onPressed: () {
                                  if (model.isActive) {
                                    if (notifier.toDoList.isNotEmpty) {
                                      model.listKey.currentState.insertItem(
                                        notifier.toDoList.length,
                                        duration:
                                            const Duration(milliseconds: 200),
                                      );
                                    }
                                    model.onTapSubmitButton(context, notifier);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      resetModalBottomSheet();
    });
  }
}

class ShowToDoListEmpty extends StatelessWidget {
  const ShowToDoListEmpty({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Your ToDo list is empty',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DeadlineCard extends ConsumerWidget {
  const DeadlineCard({
    this.deadlineType,
    Key key,
  }) : super(key: key);

  final Deadline deadlineType;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final notifier = watch(homePageProvider);
    final color = notifier.getDeadlineColor(deadlineType);
    return GestureDetector(
      onTap: () => notifier.onTapSelectDeadlineCard(deadlineType),
      child: SizedBox(
        height: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              // color: Colors.grey.shade800,
              color: deadlineType == notifier.selectedDeadlineType
                  ? color
                  : Colors.grey.shade800,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${notifier.getDeadlineText(deadlineType)}',
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
