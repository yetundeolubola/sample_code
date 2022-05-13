import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:untitled9/_lib.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_svg/flutter_svg.dart';

final homeViewModel =
    ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  final double initFabHeight = 120.0;
  double fabHeight = 10;
  double panelHeightOpen = 80;
  double panelHeightClosed = 95.0;
  bool switchScreen = false;

  final context = Get.context!;

//Result Slider
  Widget resultPanel(ScrollController controller) {
    return MediaQuery.removePadding(
        context: context,
        child: ListView(
          shrinkWrap: true,
          controller: controller,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.searchIcon),
                      SizedBox(width: eqW(24)),
                      text(AppString.search,
                          color: AppColors.textColor,
                          size: 16,
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        switchScreen = false;
                        notifyListeners();
                      },
                      child: SvgPicture.asset(AppAssets.cancelIcon))
                ],
              ),
            ),
            SizedBox(height: eqH(14)),
            const Divider(
              thickness: 2,
              color: AppColors.grey,
            ),
            SizedBox(height: eqH(24)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buttonContainer(buttonText: AppString.traditional),
                  SizedBox(width: eqW(14)),
                  buttonContainer(buttonText: AppString.salads),
                ],
              ),
            ),
            SizedBox(height: eqH(16)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buttonContainer(buttonText: AppString.internation),
                  SizedBox(width: eqW(14)),
                  buttonContainer(buttonText: AppString.salads),
                ],
              ),
            ),
            SizedBox(height: eqH(28)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: text(AppString.result,
                  color: AppColors.textBlack,
                  size: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: eqH(40)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('${data[index].image}',
                                  height: eqH(90), width: eqW(107)),
                              SizedBox(width: eqW(20)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(AppString.amala,
                                      color: AppColors.black,
                                      size: 14,
                                      fontWeight: FontWeight.w600),
                                  SizedBox(height: eqH(8)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      text(AppString.price,
                                          color: AppColors.red,
                                          size: 12,
                                          fontWeight: FontWeight.w500),
                                      SizedBox(width: eqW(8)),
                                      text(AppString.chow,
                                          color: AppColors.textColor,
                                          size: 14,
                                          fontWeight: FontWeight.w500),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.deepPurple,
                              ))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ));
  }

//Home Slider
  Widget panel(ScrollController sc, PanelController? panelController) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 3,
            child: Stack(children: [
              ListView(
                controller: sc,
                children: <Widget>[
                  SizedBox(height: eqH(15)),
                  GestureDetector(
                    onTap: () => panelController!.isPanelOpen
                        ? panelController.isPanelClosed
                        : panelController.isPanelOpen,
                    child: Center(
                      child: Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0))),
                      ),
                    ),
                  ),
                  SizedBox(height: eqH(16)),
                  text(AppString.allFood,
                      color: AppColors.black,
                      size: 22,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: eqH(24)),
                  GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.3,
                        crossAxisSpacing: 17,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: AppColors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              children: [
                                SizedBox(height: eqH(16)),
                                Image.asset('${data[index].image}',
                                    height: eqH(90), width: eqW(107)),
                                SizedBox(height: eqH(16)),
                                text(AppString.amala,
                                    color: AppColors.black,
                                    size: 14,
                                    fontWeight: FontWeight.w500),
                                SizedBox(height: eqH(8)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    text(AppString.price,
                                        color: AppColors.red,
                                        size: 12,
                                        fontWeight: FontWeight.w500),
                                    SizedBox(width: eqW(8)),
                                    text(AppString.chow,
                                        color: AppColors.textColor,
                                        size: 14,
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                                SizedBox(height: eqH(18)),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
              GestureDetector(
                onTap: () {
                  switchScreen = true;
                  notifyListeners();
                },
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        left: 10,
                        right: 10,
                        child: SvgPicture.asset(
                          AppAssets.shape,
                        )),
                    Positioned(
                      bottom: 35,
                      left: 10,
                      right: 10,
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.0, color: Colors.white),
                        ),
                      ),
                    ),
                    const Positioned(
                        bottom: 45,
                        left: 10,
                        right: 10,
                        child: Icon(
                          Icons.search,
                          size: 35,
                          color: AppColors.white,
                        )),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
