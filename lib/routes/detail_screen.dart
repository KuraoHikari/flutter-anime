import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jikan_anime/components/nestedNavbar/nested_navbar.dart';
import 'package:jikan_anime/models/anime.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as AnimeModel;

    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   iconTheme: IconThemeData(color: Colors.white),
        //   backgroundColor: Colors.black,
        // ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: CachedNetworkImage(
                          imageUrl: args.images.jpg.imageUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            height: 310,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                //image size fill
                                image: imageProvider,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Container(
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 0, right: 0, top: 20),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                            iconSize: 20,
                            color: Colors.green,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: args.images.jpg.imageUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 200,
                            height: 280,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                //image size fill
                                image: imageProvider,
                                fit: BoxFit.fitWidth,
                              ),
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 300),
                    //   child: Center(
                    //       child: InputChip(
                    //     color: MaterialStateProperty.all<Color>(Colors.blue),
                    //     label: Text(args.type),
                    //   )),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      args.titleJapanese ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w100,
                          fontFamily: "Inter-Regular",
                          color: Colors.green),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      args.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      '${args.year ?? ""} ${args.season ?? ""}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          fontFamily: "Inter-Regular",
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                    color: Colors.grey[800]?.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15),
                      child: Row(
                        children: [
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                '${args.score}',
                                style: const TextStyle(color: Colors.green),
                              ),
                              const Text(
                                "Score",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                '${args.episodes ?? "on going"}',
                                style: const TextStyle(color: Colors.green),
                              ),
                              const Text(
                                "Episodes",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                '${args.rank ?? ""}',
                                style: const TextStyle(color: Colors.green),
                              ),
                              const Text(
                                "Rank",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    )),
              ),
              // NestedTabBar(),
            ],
          ),
        ));
  }
}
