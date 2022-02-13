import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_playground/provider/counter_notifier.dart';

final counterProvider =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());
