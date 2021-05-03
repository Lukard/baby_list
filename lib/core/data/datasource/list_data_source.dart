import 'package:baby_list/core/domain/model/firebase_field_exception.dart';
import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListDataSource {
  final FirebaseFirestore _firestore;

  ListDataSource(this._firestore);

  Future<bool> doesListExist(String id) {
    return _firestore.collection('list').doc(id).get().then(
          (info) => info.exists,
          onError: (_) => false,
        );
  }

  Stream<BabyList> getList(String id) {
    return _firestore.collection('list').doc(id).snapshots().asyncMap((event) {
      Map<String, dynamic>? data = event.data();
      if (data == null) {
        throw FirebaseFieldException(
          message: 'List with id $id does not contain information',
        );
      } else {
        return BabyList.fromJson(data);
      }
    });
  }

  Future<void> bookItem(String id, Item itemToBook, Booking booking) async {
    Map<String, dynamic>? listData = await _firestore
        .collection('list')
        .doc(id)
        .get()
        .then((snapshot) => snapshot.data());
    if (listData == null) {
      throw FirebaseFieldException(
        message: 'List with id $id does not contain information',
      );
    } else {
      BabyList list = BabyList.fromJson(listData);

      List<Category> categories = list.categories.map((category) {
        List<Item> items = category.items.map((item) {
          if (item == itemToBook) {
            List<Booking> bookings =
                (itemToBook.bookings?..add(booking)) ?? [booking];
            return item.copyWith(bookings: bookings);
          } else {
            return item;
          }
        }).toList();
        return category.copyWith(items: items);
      }).toList();
      BabyList bookedItemList = list.copyWith(categories: categories);

      Map<String, dynamic> json = bookedItemList.toJson();
      await _firestore.collection('list').doc(id).set(json);
    }
  }
}
