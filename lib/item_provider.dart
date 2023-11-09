import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemNotifier extends StateNotifier<List<String>> {
  ItemNotifier() : super(['Item 1', 'Item 2', 'Item 3']);

  void addItem(String item) {
    state = [...state, item];
  }
}

final itemProvider = StateNotifierProvider<ItemNotifier, List<String>>((ref) {
  return ItemNotifier();
});
