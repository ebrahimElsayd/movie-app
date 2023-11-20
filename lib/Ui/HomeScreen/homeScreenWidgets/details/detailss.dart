import 'package:flutter/material.dart';

import 'package:movies_app/Ui/HomeScreen/homeScreenWidgets/recomendScreen.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/model/constant.dart';
import 'package:movies_app/model/detail/Details.dart';
import 'package:movies_app/network/firestore.dart';
import 'package:movies_app/network/movie_model.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails(

      // this.results
      {super.key});
  static const String routName = 'details';

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  String isSave = "assets/images/bookmark.png";

  late Future<List<Details>> likeThis;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //likeThis = Api.MoreLike();
  }

  Widget build(BuildContext context) {
    var result = ModalRoute.of(context)?.settings.arguments as Details;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          // backgroundColor: Color(0xEF282A28),
          backgroundColor: Colors.black12,
          //elevation: 10,
          title: Text(
            "${result.title}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        "${Constant.imagePathe}${result.posterPath}",
                        width: double.infinity,
                        height: 230,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      ),
                      Positioned(
                          bottom: 110,
                          right: 190,
                          child: Icon(
                            Icons.play_circle,
                            color: Colors.white,
                            size: 60,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${result.title}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  Text("${result.releaseDate!.toString()}",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 220,
                    //color:Colors.yellow ,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //  mainAxisAlignment: MainAxisAlignment.spaceE,
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              // alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),

                                // border: Border.all(color: )
                              ),
                              margin: EdgeInsets.all(5),
                              width: 150,
                              height: 200,
                              child: Image.network(
                                // "${Constant.imagePathe}${rec.posterPath}",
                                "${Constant.imagePathe}${result.posterPath}",

                                alignment: Alignment.bottomLeft,
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            Positioned(
                              //top: ,
                              right: 119,
                              bottom: 158,
                              child: FloatingActionButton(
                                  backgroundColor: Colors.transparent,
                                  onPressed: () async{
                                    isSave = ("assets/images/bookmarkright.png");

                                    //
                                    // var model = Details(
                                    //     title: "${result.title}", releaseDate: "${result.releaseDate}", posterPath: "${result.posterPath}");
                                    // await FireStoreUtils.addDataToFireStore(model);

                                    setState(() {});
                                  },
                                  child: Image.asset(
                                    "${isSave}",
                                  )),
                            )
                          ],
                        ),
                        Expanded(
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF514F4F)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    //alignment: Alignment.,
                                    height: 30,
                                    width: 60,
                                    //  color: Colors.transparent,
                                    child: Text(
                                      "Action",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF514F4F)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    //alignment: Alignment.,
                                    height: 30,
                                    width: 60,
                                    //  color: Colors.transparent,
                                    child: Text(
                                      "Action",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF514F4F)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    //alignment: Alignment.,
                                    height: 30,
                                    width: 60,
                                    //  color: Colors.transparent,
                                    child: Text(
                                      "Action",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: SingleChildScrollView(
                                  child: Text(
                                    "${result.overview}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                               crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 25,
                                  ),
                                  Text(
                                    "${result.voteAverage!.toStringAsFixed(1)}/10",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    color: Color(0xEF282A28),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "More Like This",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          FutureBuilder(
                            future: Api.MoreLike(result.id!),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                print(snapshot.error.toString());
                                return Center(
                                  child: Column(
                                    children: [
                                      Text(snapshot.error.toString()),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: Text("try again"))
                                    ],
                                  ),
                                );
                              }
                              //  int index = 0;
                              return RecomendScreen(
                                snapshot: snapshot,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

String getMovieType(Details details) {
  // Check if genres list is not empty
  if (details.genres != null && details.genres!.isNotEmpty) {
    // Assuming the first genre represents the primary genre
    return details.genres![0].name ?? "Unknown";
  } else {
    return "Unknown";
  }
}
