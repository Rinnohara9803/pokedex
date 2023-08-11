import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowTitleNotifier extends StateNotifier<bool> {
  ShowTitleNotifier() : super(true);

  void toggleShowTitle(bool showTitle) {
    state = !showTitle;
  }
}

final showTitleProvider = StateNotifierProvider<ShowTitleNotifier, bool>((ref) {
  return ShowTitleNotifier();
});
