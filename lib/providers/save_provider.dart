import 'package:flutter/material.dart';
import 'package:movies_app/network/firestore.dart';

import '../model/detail/Details.dart';

class SaveMovieProvider extends ChangeNotifier{

  bookmarkButtonPressed(Details model) {
    model.isFavorite = !model.isFavorite;
    (model.isFavorite)
        ? FireStoreUtils.addDataToFireStore(model)
        : FireStoreUtils.deleteDataFromFireStore(model);
    notifyListeners();
  }
}

