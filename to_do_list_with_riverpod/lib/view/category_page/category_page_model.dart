import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/mixin/get_deadline_details_mixin.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page.dart';

class CategoryPageModel extends ChangeNotifier with GetDeadlineDetailsMixin {
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
