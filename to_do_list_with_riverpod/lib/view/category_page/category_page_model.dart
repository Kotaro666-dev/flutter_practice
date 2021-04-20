import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/constants/constant.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page.dart';

class CategoryPageModel extends ChangeNotifier {
  CategoryPageModel() {
    _initialize();
  }

  String _content = '';
  String get content => _content;

  TextEditingController _textEditingController;
  TextEditingController get textEditingController => _textEditingController;

  bool _isActive;
  bool get isActive => _isActive;

  Deadline _selectedDeadlineType;
  Deadline get selectedDeadlineType => _selectedDeadlineType;

  void _initialize() {
    _selectedDeadlineType = Deadline.unselected;
    _textEditingController = TextEditingController();
    _isActive = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void onTapSelectDeadlineCard(Deadline deadline) {
    _selectedDeadlineType = deadline;
    notifyListeners();
  }

  String getDeadlineText(Deadline deadline) {
    if (deadline == Deadline.today) {
      return 'Today';
    } else if (deadline == Deadline.tomorrow) {
      return 'Tomorrow';
    } else if (deadline == Deadline.thisWeek) {
      return 'This Week';
    } else if (deadline == Deadline.thisMonth) {
      return 'This Month';
    } else if (deadline == Deadline.unselected) {
      return 'unSelected';
    } else {
      return '';
    }
  }

  Color getDeadlineColor(Deadline deadline) {
    if (deadline == Deadline.today) {
      return kTodayColor;
    } else if (deadline == Deadline.tomorrow) {
      return kTomorrowColor;
    } else if (deadline == Deadline.thisWeek) {
      return kThisWeekColor;
    } else if (deadline == Deadline.thisMonth) {
      return kThisMonthColor;
    } else if (deadline == Deadline.unselected) {
      return Colors.grey.shade800;
    } else {
      return Colors.white;
    }
  }

  void resetSelectedDeadlineCard() {
    _selectedDeadlineType = Deadline.unselected;
    notifyListeners();
  }

  void onChanged(String content) {
    _content = content;
    if (_content.isNotEmpty) {
      _isActive = true;
    } else {
      _isActive = false;
    }
    notifyListeners();
  }

  void onTapSubmitButton(BuildContext context) {
    _textEditingController.clear();
    _content = '';
    _selectedDeadlineType = Deadline.unselected;
    _isActive = false;
    notifyListeners();
  }

  void resetModalBottomSheet() {
    _textEditingController.clear();
    _content = '';
    _selectedDeadlineType = Deadline.unselected;
    _isActive = false;
    notifyListeners();
  }

  void onTapDeadlineListItem(BuildContext context, Deadline deadlineType) {
    Navigator.pushNamed(
      context,
      HomePage.routeName,
      arguments: HomePageArgument(deadlineType: deadlineType),
    );
  }
}
