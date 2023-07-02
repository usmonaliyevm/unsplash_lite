import 'dart:async';

import 'package:dio/dio.dart';
import 'package:unsplash_lite/data/api_service.dart';
import 'package:unsplash_lite/domen/picture/picture_model.dart';
import 'package:unsplash_lite/domen/searche_picture/search_picture.dart';

import '../../../utils/app_consts.dart';

enum SearchScreenEvent { random, search }

class SearchScreenBloC {
  String _searchQuery = "";
  int orientationIndex = 0;
  int colorIndex = 0;
  int sortByIndex = 0;
  int qualityIndex = 0;

  final eventController = StreamController<SearchScreenEvent>();
  Stream<SearchScreenEvent> get eventStream => eventController.stream;
  Sink<SearchScreenEvent> get eventSink => eventController.sink;

  final dataController = StreamController<List<PictureModel>>();
  Stream<List<PictureModel>> get dataStream => dataController.stream;
  Sink<List<PictureModel>> get dataSink => dataController.sink;

  setQuery(String query) {
    _searchQuery = query;
  }

  String getQuery() {
    return _searchQuery;
  }

  setOrientation(int index) {
    orientationIndex = index;
  }

  int getOrientation() {
    return orientationIndex;
  }

  setColor(int index) {
    colorIndex = index;
  }

  int getColor() {
    return colorIndex;
  }

  setSortby(int index) {
    sortByIndex = index;
  }

  int getSortBy() {
    return sortByIndex;
  }

  setQuality(int index) {
    qualityIndex = index;
  }

  int getQuality() {
    return qualityIndex;
  }

  SearchScreenBloC() {
    final apiService = ApiService(Dio());
    eventStream.listen((event) async {
      if (event == SearchScreenEvent.random) {
        List<PictureModel> randomData =
            await apiService.getRandomPictures(access, 20);
        dataSink.add(randomData);
      } else if (event == SearchScreenEvent.search) {
        SearchPicture searchdata = await apiService.getSearchPhotosCutsom(
          access,
          getQuery(),
          orientationList[getOrientation()].toLowerCase(),
          colorList[getColor()].toLowerCase(),
          sortByList[getSortBy()].toLowerCase(),
          qualityList[getQuality()].toLowerCase(),
        );
        dataSink.add(searchdata.results);
      }
    });
  }
}
