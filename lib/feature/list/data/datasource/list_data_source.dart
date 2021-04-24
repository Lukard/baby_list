import 'package:baby_list/core/domain/model/firebase_field_exception.dart';
import 'package:baby_list/feature/list/domain/model/baby_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListDataSource {
  final FirebaseFirestore firestore;

  ListDataSource(this.firestore);

  Stream<BabyList> getList(String id) {
    return firestore.collection('list').doc(id).snapshots().asyncMap((event) {
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
}
