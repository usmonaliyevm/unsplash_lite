import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unsplash_lite/data/api_service.dart';
import 'package:unsplash_lite/domen/picture_exif/picture_exif_model.dart';
import 'package:unsplash_lite/widgets/custom_exif_model.dart';

import '../../utils/app_consts.dart';

class PhotoInfo extends StatelessWidget {
  final String id;
  const PhotoInfo({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PictureExifModel>(
        future: ApiService(Dio()).getPhotoInfo(access, id),
        builder: (context, snapshot) {
          log(snapshot.hasData.toString());
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        snapshot.data!.pictureUrls.regular,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child: const SizedBox(
                      width: double.infinity,
                      height: 220,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CustomExifModel(
                        text1: "Camera",
                        text2: snapshot.data!.exifModel.name.toString(),
                        onWhere: OnWhere.start,
                      ),
                      const Spacer(),
                      CustomExifModel(
                        text1: "Apperture",
                        text2: snapshot.data!.exifModel.aperture.toString(),
                        onWhere: OnWhere.end,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CustomExifModel(
                        text1: "Focal Length",
                        text2: snapshot.data!.exifModel.focalLength.toString(),
                        onWhere: OnWhere.start,
                      ),
                      const Spacer(),
                      CustomExifModel(
                        text1: "Shutter speed",
                        text2: snapshot.data!.exifModel.exposureTime.toString(),
                        onWhere: OnWhere.end,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CustomExifModel(
                        text1: "ISO",
                        text2: snapshot.data!.exifModel.iso.toString(),
                        onWhere: OnWhere.start,
                      ),
                      const Spacer(),
                      CustomExifModel(
                        text1: "Dimentions",
                        text2:
                            "${snapshot.data!.height}/${snapshot.data!.width}",
                        onWhere: OnWhere.end,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              snapshot.data!.user.profileImage.medium,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        snapshot.data!.user.name,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF979797),
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "View profile",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF24A2E9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: const Color(0xFF979797),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 13.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CustomExifModel(
                          text1: "View",
                          text2: "null",
                          onWhere: OnWhere.center),
                      const CustomExifModel(
                          text1: "Downland",
                          text2: "null",
                          onWhere: OnWhere.center),
                      CustomExifModel(
                          text1: "Likes",
                          text2: snapshot.data!.likes.toString(),
                          onWhere: OnWhere.center),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: const Color(0xFF979797),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 44, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        photoInfoList[0],
                        width: 18,
                        height: 18,
                      ),
                      Image.asset(
                        photoInfoList[1],
                        width: 18,
                        height: 18,
                      ),
                      Image.asset(
                        photoInfoList[2],
                        width: 18,
                        height: 18,
                      ),
                      Image.asset(
                        photoInfoList[3],
                        width: 18,
                        height: 18,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
