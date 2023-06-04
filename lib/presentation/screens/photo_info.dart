import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_lite/data/api_service.dart';
import 'package:unsplash_lite/domen/picture_exif/picture_exif_model.dart';

import '../../utils/app_consts.dart';

class PhotoInfo extends StatelessWidget {
  final String id;
  const PhotoInfo({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      body: FutureBuilder<PictureExifModel>(
          future: ApiService(Dio()).getPhotoInfo(access, id),
          builder: (context, snapshot) {
            log(snapshot.hasData.toString());
            return snapshot.hasData
                ? Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(
                          snapshot.data!.pictureUrls.smallS3,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
