import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

import 'package:http/http.dart' as http;

import 'package:jikan_anime/components/cards/vertical_card.dart';
import 'package:jikan_anime/models/anime.dart';
import 'package:jikan_anime/utils/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AnimeModel> animeList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchAnimeData();
    }
  }

  // Function to fetch anime data using Jikan API.
  Future<void> fetchAnimeData() async {
    final response = await http.get(Uri.parse(
        'https://api.jikan.moe/v4/top/anime')); // Sending GET request to Jikan API.
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            // top: MediaQuery.of(context).padding.top + 60,
            bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: SizedBox(
                      height: 300,
                      child: Image.asset(
                        'assets/images/wp.png',
                        height: 300,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 20),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.density_medium,
                          ),
                          iconSize: 20,
                          color: Colors.white,
                          splashColor: Colors.purple,
                          onPressed: () => {launchURL('https://jikan.moe')},
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.search_sharp,
                          ),
                          iconSize: 20,
                          color: Colors.green,
                          splashColor: Colors.purple,
                          onPressed: () => {launchURL('https://jikan.moe')},
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    //<-- SEE HERE
                    left: 10,
                    top: 50,
                    child: SizedBox(
                      width: 230,
                      height: 230,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              "JIKAN V4",
                              style: TextStyle(
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: const Offset(3.0, 2.0),
                                      blurRadius: 8.0,
                                      color: Colors.black.withOpacity(0.9),
                                    ),
                                  ],
                                  fontSize: 28,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 10),
                              child: Text(
                                "Thank you for your support. I want to try different styles. If you like this template, I will continue to do it.",
                                style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: const Offset(3.0, 2.0),
                                        blurRadius: 8.0,
                                        color: Colors.green.withOpacity(0.5),
                                      ),
                                    ],
                                    fontSize: 14,
                                    fontFamily: "Inter",
                                    color: Colors.green[50]),
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton.icon(
                              onPressed: () => {launchURL('https://jikan.moe')},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .green, // Set the button color to green
                              ),
                              icon: const Icon(
                                Icons.link,
                                color: Colors.white,
                              ), // Icon displayed before the text
                              label: const Text(
                                'Visit Api',
                                style: TextStyle(color: Colors.white),
                              ), // Text displayed on the button
                            ),
                            const Spacer()
                          ]),
                    ),
                  ),
                ],
              ),
            ),

            // const Spacer(),

            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    "Top Anime",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    "See all ",
                    style: TextStyle(
                        fontSize: 16, fontFamily: "Inter", color: Colors.green),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.green,
                    size: 16.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ],
              ),
            ),

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

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Up Coming",
                style: TextStyle(
                    fontSize: 24, fontFamily: "Poppins", color: Colors.white),
              ),
            ),
            SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }
}
