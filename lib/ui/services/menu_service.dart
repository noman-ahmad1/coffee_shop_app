import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:stacked/stacked.dart';

class MenuService with ReactiveServiceMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference menuCollection =
      FirebaseFirestore.instance.collection('menu');

  Future<void> addMenuItem(CoffeeFlavor item) async {
    await _firestore.collection('menu').add(item.toJson());
  }

  // Stream<List<CoffeeFlavor>> getMenuStream() {
  //   return _firestore.collection('menu').snapshots().map(
  //     (snapshot) => snapshot.docs.map((doc) => CoffeeFlavor.fromJson(doc.data())).toList(),
  //   );
  // }
  Future<void> uploadMenu(List<CoffeeFlavor> coffeeList) async {
    for (var coffee in coffeeList) {
      await menuCollection.doc(coffee.name).set(coffee.toJson());
    }
  }
  Stream<List<CoffeeFlavor>> getMenuStream() {
  return menuCollection.snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      return CoffeeFlavor.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  });
}

}
