import 'package:hadrmouthamza/src/app_export.dart';

class HomeDataSource {
  final _firebaseDatabase = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getSections() async {
    return await _firebaseDatabase.collection('sections').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getSpecies() async {
    return await _firebaseDatabase.collection('species').get();
  }
}
