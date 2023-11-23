import 'package:flutter/material.dart';
import 'package:movies_app/model/constant.dart';
import 'package:movies_app/model/detail/Details.dart';
import 'package:provider/provider.dart';
import '../../../providers/save_provider.dart';

class Small extends StatefulWidget {
  const Small({super.key, required this.results, required this.snapshot});
      //required this.rec,

  final AsyncSnapshot snapshot;
  // Results results;
  final Details results;

  @override
  State<Small> createState() => _SmallState();
}

class _SmallState extends State<Small> {
//Rec rec;
  @override
  Widget build(BuildContext context) {
    SaveMovieProvider saveMovie = Provider.of<SaveMovieProvider>(context);
    return Stack(
      children: [
        Container(
          // alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(5),
          width: 140,
          height: 210,
          child: Image.network(
            // "${Constant.imagePathe}${rec.posterPath}",
            "${Constant.imagePathe}${widget.results.posterPath}",

            alignment: Alignment.bottomLeft,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
        Positioned(
          //top: ,
          right: 104,
          bottom: 170,
          child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () async {
                saveMovie.bookmarkButtonPressed(widget.results);
              },
              child: Image.asset(
                (widget.results.isFavorite)
                    ? "assets/images/bookmarkright.png"
                    : "assets/images/bookmark.png",
              )),
        )
      ],
    );
  }
}
