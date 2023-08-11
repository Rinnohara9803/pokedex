import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Themes { dark, light }

class ThemeNotifier extends StateNotifier<Themes> {
  ThemeNotifier() : super(Themes.dark);

  void toggleTheme() {
    if (state == Themes.dark) {
      state = Themes.light;
    } else {
      state = Themes.dark;
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, Themes>((ref) {
  return ThemeNotifier();
});
