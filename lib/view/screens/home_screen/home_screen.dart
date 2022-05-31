import 'package:cloud_mm_vdo_short/controller/home_controller.dart';
import 'package:cloud_mm_vdo_short/controller/home_controller.dart';
import 'package:cloud_mm_vdo_short/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'build_video_player_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Colors.orange,
      Colors.blue,
      Colors.red,
      Colors.yellow,
      Colors.deepPurpleAccent
    ];
    final homeVm = locator.get<HomeController>();
    homeVm.getVideo();
    return Scaffold(
      body: ChangeNotifierProvider(
          create: (_) => homeVm,
          child: Consumer<HomeController>(builder: (_, vm, __) {
            return vm.isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.blue,
                  ))
                : PageView.builder(
                    itemCount: vm.mVideoList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, position) {
                      return Container(
                        color: color[0],
                        width: double.infinity,
                        height: double.infinity,
                        child: BuildVideoPlayerWidget(
                            homeViewModel: vm, index: position),
                      );
                    });
          })),
    );
  }
}
