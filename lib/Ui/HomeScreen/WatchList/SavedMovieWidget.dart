import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/network/movie_model.dart';

class SavedMoviesWidget extends StatelessWidget {
  final MovieModel model;
  const SavedMoviesWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: 150,
            width: 120,
            imageUrl: "https://image.tmdb.org/t/p/w500${model.photo}",
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              Text(
                "${model.date}",
                style: const TextStyle(color: Color(0xFFFBAF22), fontSize: 15),
                textAlign: TextAlign.end,
              ),
              // Text(
              //   "",
              //   style: TextStyle(color: Colors.white, fontSize: 17),
              // ),
            ],
          )
        ],
      ),
    ]);
  }
}