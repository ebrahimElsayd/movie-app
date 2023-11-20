import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/model/detail/Details.dart';
import 'package:movies_app/network/movie_model.dart';

class FireStoreUtils{
  static CollectionReference<MovieModel> getCollection(){
    return FirebaseFirestore.instance.collection("movies").
    withConverter<MovieModel>
      (fromFirestore: (snapshot, _) => MovieModel.fromFireStore(snapshot.data()!),
        toFirestore: (value, _) =>value.toFireStore());
  }
  static Future<void> addDataToFireStore(MovieModel model){
    var colRef = getCollection();
    var docRef = colRef.doc();
    return docRef.set(model);
  }
  static Future<List<MovieModel>> getDataFromFireStore()async{
    var snapshot = await getCollection().get();
     return snapshot.docs.map((e) => e.data()).toList();
  }

}