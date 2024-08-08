import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:test_project/controller/splash/splash_controller.dart';
import 'package:test_project/utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final SplashController _splashController = Get.find();

  @override
  void initState() {
    super.initState();
    _splashController.next_activity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// gambar
          Positioned(
            child: CachedNetworkImage(
                imageUrl:
                    'https://marketplace.canva.com/EAFCO6pfthY/1/0/1600w/canva-blue-green-watercolor-linktree-background-F2CyNS5sQdM.jpg',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                cacheManager: CacheManager(Config(
                  "imageCache",
                  stalePeriod: const Duration(days: 3),
                ))),
          ),

          /// text
          Positioned(
            bottom: 10,
            right: 20,
            child: Text(
              'Version 1.0.0',
              style: styleTitle,
            ),
          ),
        ],
      ),
    );
  }
}
