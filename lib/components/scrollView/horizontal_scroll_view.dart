import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:jikan_anime/components/cards/vertical_card.dart';
import 'package:jikan_anime/models/anime.dart';
import 'package:http/http.dart' as http;

class HorizontalScrollView extends StatefulWidget {
  const HorizontalScrollView({Key? key, required this.animeUri})
      : super(key: key);

  final String animeUri;

  @override
  State<HorizontalScrollView> createState() => _HorizontalScrollViewState();
}

class _HorizontalScrollViewState extends State<HorizontalScrollView> {
  List<AnimeModel> animeList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchAnimeData();
    }
  }

  Future<void> fetchAnimeData() async {
    final response = await http.get(Uri.parse(
        'https://api.jikan.moe/v4${widget.animeUri}')); // Sending GET request to Jikan API.
    if (response.statusCode == 200) {
      // If request is successful, decode JSON response and update animeList.
      setState(() {
        animeList = List<AnimeModel>.from(jsonDecode(response.body)['data']
            .map((x) => AnimeModel.fromJson(x)));
        isLoading = false;
      });
    } else {
      setState(() {
        animeList = [];
        isLoading = false;
      });
      throw Exception(
          'Failed to load anime data'); // Throw exception if request fails.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (isLoading)
        ScrollShadow(
          color: Colors.black,
          size: 20,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 116, 116, 116)
                          .withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  constraints:
                      const BoxConstraints(maxWidth: 150, maxHeight: 210),
                  child: const SizedBox(
                    height: 210.0,
                    width: 150.0,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 116, 116, 116)
                          .withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  constraints:
                      const BoxConstraints(maxWidth: 150, maxHeight: 210),
                  child: const SizedBox(
                    height: 210.0,
                    width: 150.0,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 116, 116, 116)
                          .withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  constraints:
                      const BoxConstraints(maxWidth: 150, maxHeight: 210),
                  child: const SizedBox(
                    height: 210.0,
                    width: 150.0,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ]),
          ),
        ),
      if (!isLoading)
        ScrollShadow(
          color: Colors.black,
          size: 20,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: animeList
                  .map(
                    (anime) => Padding(
                      key: anime.id,
                      padding: const EdgeInsets.all(8),
                      child: VCard(anime: anime),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
    ]);
  }
}
