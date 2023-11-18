import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/WatchList/SavedMovieWidget.dart';
import 'package:movies_app/model/detail/Details.dart';
import 'package:movies_app/network/firestore.dart';
import 'package:movies_app/network/movie_model.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: [
          const Text("WatchList",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 22,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: Colors.white,
              )),
          FutureBuilder<List<MovieModel>>(
              future: FireStoreUtils.getDataFromFireStore(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  const Center(child:
                  CircularProgressIndicator(color: Colors.white,));
                }
                if(snapshot.hasError){
                  Column(
                    children: [
                      Text(snapshot.error.toString()),
                      IconButton(onPressed: (){

                      }, icon: const Icon(Icons.refresh))
                    ],
                  );
                }
                var watchList = snapshot.data??[];
                return  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            SavedMoviesWidget(model: watchList[index]),
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                        itemCount: watchList.length));

              }),


        ],
      ),
    );
  }

}
