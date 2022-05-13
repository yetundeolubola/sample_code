import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled9/utils/size.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../_lib.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PanelController? panelController;
  PanelController? panelControl;

  @override
  Widget build(BuildContext context) {
    double panelHeightOpen = MediaQuery.of(context).size.height * .80;
    double panelHeightClosed = MediaQuery.of(context).size.height * .45;

    return Consumer(builder: (BuildContext context, watch, Widget? child) {
      final vm = watch(homeViewModel);
      return Scaffold(
        body: AnimatedCrossFade(
          firstCurve: Curves.easeOutQuart,
          secondCurve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(seconds: 2),
          crossFadeState: vm.switchScreen
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Stack(
            children: [
              SlidingUpPanel(
                controller: panelController,
                maxHeight: panelHeightOpen,
                minHeight: panelHeightClosed,
                parallaxOffset: .5,
                body: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(AppAssets.background),
                    fit: BoxFit.cover,
                  )),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 100, left: 24),
                      child: text(vm.switchScreen ? '' : AppString.findYourChow,
                          color: AppColors.black,
                          size: 40,
                          fontWeight: FontWeight.bold)),
                ),
                panelBuilder: (sc) => vm.panel(sc, panelController),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0)),
                onPanelSlide: (double pos) => setState(() {
                  vm.homeIconHeight =
                      pos * (MediaQuery.of(context).size.width * -0.3);
                }),
              ),
              Positioned(
                top: eqH(60),
                left: vm.homeIconHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: eqH(60),
                    width: eqW(60),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.white),
                    child: SvgPicture.asset(AppAssets.homeIcon),
                  ),
                ),
              ),
            ],
          ),
          secondChild: Stack(
            children: [
              SlidingUpPanel(
                controller: panelController,
                maxHeight: panelHeightOpen,
                minHeight: panelHeightClosed,
                parallaxOffset: .5,
                body: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(AppAssets.background),
                    fit: BoxFit.cover,
                  )),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 100, left: 24),
                      child: text(vm.switchScreen ? '' : AppString.findYourChow,
                          color: AppColors.black,
                          size: 40,
                          fontWeight: FontWeight.bold)),
                ),
                panelBuilder: (sc) => vm.resultPanel(sc),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
