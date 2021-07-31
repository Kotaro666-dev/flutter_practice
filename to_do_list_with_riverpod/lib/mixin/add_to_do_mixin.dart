import 'package:flutter/cupertino.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';

mixin AddToDoMixin on ChangeNotifier {
  String _content = '';
  String get content => _content;

  TextEditingController _textEditingController;
  TextEditingController get textEditingController => _textEditingController;

  bool _isActive;
  bool get isActive => _isActive;

  Deadline _selectedDeadlineType;
  Deadline get selectedDeadlineType => _selectedDeadlineType;

  Deadline _currentPage;

  void initialize(Deadline deadline) {
    _selectedDeadlineType = deadline;
    _currentPage = deadline;
    _textEditingController = TextEditingController();
    _isActive = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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
    _selectedDeadlineType = _currentPage;
    _isActive = false;
    notifyListeners();
  }

  void onTapSelectDeadlineCard(Deadline deadline) {
    _selectedDeadlineType = deadline;
    notifyListeners();
  }

  void resetSelectedDeadlineCard() {
    _selectedDeadlineType = _currentPage;
    notifyListeners();
  }

  void resetModalBottomSheet() {
    _textEditingController.clear();
    _content = '';
    _selectedDeadlineType = _currentPage;
    _isActive = false;
    notifyListeners();
  }
}
