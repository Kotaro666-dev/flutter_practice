import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/constants/constant.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';

mixin GetDeadlineDetailsMixin {
  String getDeadlineAppBarTitle(Deadline deadline) {
    if (deadline == Deadline.today) {
      return 'Today';
    } else if (deadline == Deadline.tomorrow) {
      return 'Tomorrow';
    } else if (deadline == Deadline.next7days) {
      return 'Next 7 Days';
    } else if (deadline == Deadline.duringThisMonth) {
      return 'During This Month';
    } else if (deadline == Deadline.undecided) {
      return 'Undecided';
    } else {
      return '';
    }
  }

  String getDeadlineText(Deadline deadline) {
    if (deadline == Deadline.today) {
      return 'Today';
    } else if (deadline == Deadline.tomorrow) {
      return 'Tomorrow';
    } else if (deadline == Deadline.next7days) {
      return 'Next 7 Days';
    } else if (deadline == Deadline.duringThisMonth) {
      return 'During This Month';
    } else if (deadline == Deadline.undecided) {
      return 'Undecided';
    } else {
      return '';
    }
  }

  Color getDeadlineColor(Deadline deadline) {
    if (deadline == Deadline.today) {
      return kTodayColor;
    } else if (deadline == Deadline.tomorrow) {
      return kTomorrowColor;
    } else if (deadline == Deadline.next7days) {
      return kThisWeekColor;
    } else if (deadline == Deadline.duringThisMonth) {
      return kThisMonthColor;
    } else if (deadline == Deadline.undecided) {
      return Colors.grey.shade800;
    } else {
      return Colors.white;
    }
  }
}
