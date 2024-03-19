import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jikan_anime/models/anime.dart';
import 'package:jikan_anime/routes/detail_screen.dart';

class VCard extends StatefulWidget {
  const VCard({Key? key, required this.anime}) : super(key: key);

  final AnimeModel anime;

  @override
  State<VCard> createState() => _VCardState();
}

class _VCardState extends State<VCard> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailScreen.routeName,
          arguments: AnimeModel(
              malId: widget.anime.malId,
              title: widget.anime.title,
              images: widget.anime.images,
              titleJapanese: widget.anime.titleJapanese,
              type: widget.anime.type,
              episodes: widget.anime.episodes,
              status: widget.anime.status,
              rating: widget.anime.rating,
              airing: widget.anime.airing,
              score: widget.anime.score,
              scoredBy: widget.anime.scoredBy,
              rank: widget.anime.rank,
              popularity: widget.anime.popularity,
              members: widget.anime.members,
              synopsis: widget.anime.synopsis,
              background: widget.anime.background,
              season: widget.anime.season,
              year: widget.anime.year,
              genres: widget.anime.genres,
              producers: widget.anime.producers,
              studios: widget.anime.studios),
        );
      },
      onLongPress: () {
        setState(() {
          showInfo = true;
        });
      },
      onLongPressEnd: (_) {
        setState(() {
          showInfo = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 116, 116, 116).withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: const BoxConstraints(maxWidth: 150, maxHeight: 210),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: widget.anime.images.jpg.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 200,
                  height: 310,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      //image size fill
                      image: imageProvider,
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
            if (showInfo)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.black.withOpacity(0.5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 170),
                        child: Text(
                          widget.anime.title,
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.anime.synopsis!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7), fontSize: 15),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.anime.season != null
                            ? widget.anime.season!.toUpperCase()
                            : "",
                        style: const TextStyle(
                            fontSize: 13,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            if (!showInfo)
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                          Colors.black,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 20, top: 20, right: 10),
                        child: Text(
                          widget.anime.title.length > 18
                              ? '${widget.anime.title.substring(0, 15)}...'
                              : widget.anime.title,
                          style: const TextStyle(color: Colors.white),
                          maxLines: 5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
          ],
        ),
      ),
    );
  }
}
