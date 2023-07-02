import 'package:flutter/material.dart';
import 'package:unsplash_lite/presentation/controller/bloc/customization_bloc.dart';
import 'package:unsplash_lite/presentation/controller/bloc/search_screen_bloc.dart';
import 'package:unsplash_lite/domen/picture/picture_model.dart';
import 'package:unsplash_lite/presentation/screens/photo_info.dart';
import 'package:unsplash_lite/utils/app_consts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchTextController = TextEditingController();
  final searchScreenBloC = SearchScreenBloC();
  final orientationBloC = OrientationForBloC();
  final colorForBloc = ColorForBloC();
  final sortByForBloC = SortByForBloC();
  final qualityForBloC = QualityForBloC();

  Color color1 = const Color(0xFFEDEDED);
  Color color2 = const Color(0xFF7300FF);
  int indexOrientationBloc = 0;
  int indexColorBloc = 0;
  int indexSortByBloc = 0;
  int indexQualityBloc = 0;
  bool isFrist = true;
  List<bool> onTapped = [];

  @override
  void initState() {
    searchScreenBloC.eventSink.add(SearchScreenEvent.random);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                      onTap: () {
                        searchScreenBloC.setQuery(searchTextController.text);
                        searchScreenBloC.setOrientation(indexOrientationBloc);
                        searchScreenBloC.setColor(indexColorBloc);
                        searchScreenBloC.setSortby(indexSortByBloc);
                        searchScreenBloC.setQuality(indexQualityBloc);
                        searchScreenBloC.eventSink
                            .add(SearchScreenEvent.search);
                      },
                      child: const Icon(Icons.search)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text("Orientation"),
            ),
            SizedBox(
              height: 22,
              child: StreamBuilder<int>(
                stream: orientationBloC.dataStream,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: orientationList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          indexOrientationBloc = index;
                          searchScreenBloC.setOrientation(index);
                          orientationBloC.dataSink.add(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: snapshot.data == index ? color2 : color1,
                          ),
                          child: Text(
                            orientationList[index],
                            style: TextStyle(
                              color: snapshot.data == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text("Colors"),
            ),
            SizedBox(
              height: 22,
              child: StreamBuilder<int>(
                  stream: colorForBloc.dataStream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: colorList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            indexColorBloc = index;
                            searchScreenBloC.setColor(index);
                            colorForBloc.dataSink.add(index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: snapshot.data == index ? color2 : color1,
                            ),
                            child: Text(
                              colorList[index],
                              style: TextStyle(
                                color: snapshot.data == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text("Sort By"),
            ),
            SizedBox(
              height: 22,
              child: StreamBuilder<int>(
                  stream: sortByForBloC.dataStream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: sortByList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            indexSortByBloc = index;
                            searchScreenBloC.setSortby(index);
                            sortByForBloC.dataSink.add(index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: snapshot.data == index ? color2 : color1,
                            ),
                            child: Text(
                              sortByList[index],
                              style: TextStyle(
                                color: snapshot.data == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text("Quality"),
            ),
            SizedBox(
              height: 22,
              child: StreamBuilder<int>(
                  stream: qualityForBloC.dataStream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: qualityList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            indexQualityBloc = index;
                            searchScreenBloC.setQuality(index);
                            qualityForBloC.dataSink.add(index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: snapshot.data == index ? color2 : color1,
                            ),
                            child: Text(
                              qualityList[index],
                              style: TextStyle(
                                color: snapshot.data == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: StreamBuilder<List<PictureModel>>(
              stream: searchScreenBloC.dataStream,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhotoInfo(
                                  id: snapshot.data![index].id,
                                ),
                              ),
                            ),
                            child: AspectRatio(
                              aspectRatio: snapshot.data![index].width /
                                  snapshot.data![index].height,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        snapshot
                                            .data![index].pictureUrls.regular,
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ))
          ],
        ),
      ),
    );
  }
}
