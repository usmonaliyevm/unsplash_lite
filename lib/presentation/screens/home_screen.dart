import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsplash_lite/data/api_service.dart';
import 'package:unsplash_lite/domen/picture/picture_model.dart';
import 'package:unsplash_lite/domen/searche_picture/search_picture.dart';
import 'package:unsplash_lite/presentation/screens/photo_info.dart';
import 'package:unsplash_lite/utils/app_consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<PictureModel>> pictures;
  late Future<SearchPicture> latest;
  late Future<SearchPicture> fruits;
  late Future<SearchPicture> cakes;
  late Future<SearchPicture> cars;

  @override
  void initState() {
    final apiservice = ApiService(Dio());
    pictures = apiservice.getRandomPictures(access, 30, "");
    latest = apiservice.getSearchPictures(access, "latest");
    fruits = apiservice.getSearchPictures(access, "fruits");
    cakes = apiservice.getSearchPictures(access, "cakes");
    cars = apiservice.getSearchPictures(access, "cars");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Random",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                FutureBuilder<List<PictureModel>>(
                  future: pictures,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => Row(children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PhotoInfo(id: snapshot.data![index].id),
                                ),
                              ),
                              child: Image.network(
                                  snapshot.data![index].pictureUrls.regular),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ]),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Latest",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                FutureBuilder<SearchPicture>(
                  future: latest,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.results.length,
                          itemBuilder: (context, index) => Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PhotoInfo(
                                        id: snapshot.data!.results[index].id),
                                  ),
                                ),
                                child: Image.network(
                                  snapshot
                                      .data!.results[index].pictureUrls.regular,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Fruits",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                FutureBuilder<SearchPicture>(
                  future: fruits,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.results.length,
                          itemBuilder: (context, index) => Row(children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoInfo(
                                      id: snapshot.data!.results[index].id),
                                ),
                              ),
                              child: Image.network(snapshot
                                  .data!.results[index].pictureUrls.regular),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ]),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Cakes",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                FutureBuilder<SearchPicture>(
                  future: cakes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.results.length,
                          itemBuilder: (context, index) => Row(children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoInfo(
                                      id: snapshot.data!.results[index].id),
                                ),
                              ),
                              child: Image.network(snapshot
                                  .data!.results[index].pictureUrls.regular),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ]),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Cars",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                FutureBuilder<SearchPicture>(
                  future: cars,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.results.length,
                          itemBuilder: (context, index) => Row(children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoInfo(
                                      id: snapshot.data!.results[index].id),
                                ),
                              ),
                              child: Image.network(snapshot
                                  .data!.results[index].pictureUrls.regular),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ]),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
