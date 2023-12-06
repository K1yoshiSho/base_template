import 'package:base/src/core/common/exports/main_export.dart';

class CollectionsNotifier extends ChangeNotifier {
  final List<CardModel> _selectedCardsForCreateCollections = [];

  List<CardModel> get getSelectedCards => _selectedCardsForCreateCollections;

  void addSelectedItem(CardModel item) {
    _selectedCardsForCreateCollections.add(item);
    notifyListeners();
  }

  void addSelectedItems(List<CardModel> items) {
    _selectedCardsForCreateCollections.addAll(items);
    notifyListeners();
  }

  void removeSelectedItemAtId(int id) {
    _selectedCardsForCreateCollections.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void clearSelectedItems() {
    _selectedCardsForCreateCollections.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
