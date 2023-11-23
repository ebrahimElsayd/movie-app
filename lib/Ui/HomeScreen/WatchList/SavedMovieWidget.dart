import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/detail/Details.dart';
import 'package:provider/provider.dart';
import '../../../providers/save_provider.dart';

class SavedMoviesWidget extends StatelessWidget {
  final Details model;
  const SavedMoviesWidget({super.key, required this.model});
  // String isSave = "assets/images/bookmark.png";
  @override
  Widget build(BuildContext context) {
    SaveMovieProvider saveMovie = Provider.of<SaveMovieProvider>(context);
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            CachedNetworkImage(
              height: 130,
              width: 100,
              imageUrl: "https://image.tmdb.org/t/p/w500${model.posterPath}",
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned(
              right: 60,
              bottom: 85,
              child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  onPressed: () async {
                    saveMovie.bookmarkButtonPressed(model);

                  },
                  child: Image.asset(
                    (model.isFavorite)
                        ? "assets/images/bookmarkright.png"
                        : "assets/images/bookmark.png",
                  //   await FireStoreUtils.deleteDataFromFireStore(model);
                  // },
                  // child: Image.asset('assets/images/bookmarkright.png')),
            )))]),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " ${model.title}",
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "${model.voteAverage!.toStringAsFixed(1)}/10",
                  style: const TextStyle(color: Color(0xFFFBAF22), fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
