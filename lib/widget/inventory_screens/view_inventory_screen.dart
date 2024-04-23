import 'package:flutter/material.dart';
import 'package:work_space_project/widget/inventory_screens/readmore_screen.dart';
import 'package:work_space_project/widget/small_text.dart';
import 'package:work_space_project/widget/string.dart';

import '../constant.dart';
import '../dashboard_screen.dart';
import 'CarouselSlider_screen.dart';

class ViewInventoryScreen extends StatefulWidget {
  const ViewInventoryScreen({Key? key}) : super(key: key);

  @override
  State<ViewInventoryScreen> createState() => _ViewInventoryScreenState();
}

class _ViewInventoryScreenState extends State<ViewInventoryScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SmallText(
            text: MyStrings.comboCasualMenswear,
            color: blackColor,
            size: 16,
            fontWeight: FontWeight.w700,
            fontFamily: MyStrings.poppins,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Center(
                //   child: Stack(
                //     children: [
                //       ClipRRect(
                //           borderRadius: BorderRadius.circular(8),
                //           child: Image.asset(
                //             "asset/images/Dress 1 1.png",
                //           )),
                //       Positioned(
                //         top: 0,
                //         right: 0,
                //         left: 0,
                //         child: Padding(
                //           padding: const EdgeInsets.all(12),
                //           child: Column(
                //             children: [
                //               Row(
                //                 children: [
                //                   GestureDetector(
                //                     onTap: () {
                //                       Navigator.pop(context);
                //                     },
                //                     child: Container(
                //                       height: 30,
                //                       width: 30,
                //                       decoration: const BoxDecoration(
                //                         shape: BoxShape.circle,
                //                         color: Colors.black54,
                //                       ),
                //                       child: const Center(
                //                           child: Icon(
                //                             Icons.arrow_back_outlined,
                //                             color: Colors.white,
                //                             size: 20,
                //                           )),
                //                     ),
                //                   ),
                //                   const Spacer(),
                //                   const SizedBox(
                //                     width: 8,
                //                   ),
                //                   const SizedBox(
                //                     width: 8,
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //         bottom: 0,
                //         left: 0,
                //         right: 0,
                //         child: Container(
                //           margin: const EdgeInsets.all(10),
                //           decoration: BoxDecoration(
                //               color: Colors.black54,
                //               borderRadius: BorderRadius.circular(12)),
                //           child: Padding(
                //             padding: const EdgeInsets.symmetric(
                //                 horizontal: 8, vertical: 8),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               mainAxisAlignment: MainAxisAlignment.end,
                //               children: [
                //                 SmallText(
                //                   text: MyStrings.comboCasualMenswear,
                //                   color: whiteColor,
                //                   size: 16,
                //                   fontWeight: FontWeight.w700,
                //                   fontFamily: MyStrings.poppins,
                //                 ),
                //                 const SizedBox(
                //                   height: 10,
                //                 ),
                //                 Row(
                //                   mainAxisAlignment:
                //                   MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Row(
                //                       children: [
                //                         const Icon(
                //                           Icons.location_on,
                //                           color: Color(0xffFFFCA8),
                //                           size: 20,
                //                         ),
                //                         const SizedBox(
                //                           width: 5,
                //                         ),
                //                         SmallText(
                //                           text: MyStrings.chennai,
                //                           color: whiteColor,
                //                           fontWeight: FontWeight.w500,
                //                           fontFamily: MyStrings.poppins,
                //                           size: 13,
                //                         )
                //                       ],
                //                     ),
                //                     Row(
                //                       children: [
                //                         const Icon(
                //                           Icons.date_range_rounded,
                //                           color: Color(0xffFFFCA8),
                //                           size: 20,
                //                         ),
                //                         const SizedBox(
                //                           width: 5,
                //                         ),
                //                         SmallText(
                //                           text: MyStrings.date,
                //                           color: whiteColor,
                //                           fontWeight: FontWeight.w500,
                //                           fontFamily: MyStrings.poppins,
                //                           size: 13,
                //                         )
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                CarouselSliderScreen(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      child: Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor,
                                blurRadius: 1.5, // soften the shadow
                                spreadRadius: 0.5, //extend the shadow
                                offset: const Offset(
                                  0.5, // Move to right 5  horizontally
                                  0.5, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            color: whiteColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallText(
                              text: MyStrings.number,
                              color: primaryColor,
                              size: 16,
                              fontFamily: MyStrings.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                            const SmallText(
                              text: MyStrings.unitPrice,
                              color: Color(0xffACACAC),
                              size: 10,
                              fontFamily: MyStrings.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor,
                                blurRadius: 1.5, // soften the shadow
                                spreadRadius: 0.5, //extend the shadow
                                offset: const Offset(
                                  0.5, // Move to right 5  horizontally
                                  0.5, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            color: whiteColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallText(
                              text: MyStrings.no,
                              color: primaryColor,
                              size: 16,
                              fontFamily: MyStrings.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                            const SmallText(
                              text: MyStrings.quantity,
                              color: Color(0xffACACAC),
                              size: 10,
                              fontFamily: MyStrings.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor,
                                blurRadius: 1.5, // soften the shadow
                                spreadRadius: 0.5, //extend the shadow
                                offset: const Offset(
                                  0.5, // Move to right 5  horizontally
                                  0.5, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            color: whiteColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallText(
                              text: MyStrings.medium,
                              color: primaryColor,
                              size: 16,
                              fontFamily: MyStrings.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                            const SmallText(
                              text: MyStrings.size,
                              color: Color(0xffACACAC),
                              size: 10,
                              fontFamily: MyStrings.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ReadMoreScreen(),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor,
                            blurRadius: 1.5, // soften the shadow
                            spreadRadius: 0.5, //extend the shadow
                            offset: const Offset(
                              0.5, // Move to right 5  horizontally
                              0.5, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: whiteColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SmallText(
                              text: MyStrings.men,
                              color: primaryColor,
                              size: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: MyStrings.poppins,
                            ),
                            const SmallText(
                              text: MyStrings.category,
                              color: Color(0xffACACAC),
                              size: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: MyStrings.poppins,
                            ),
                          ],
                        ),
                        Container(
                          height: 35,
                          width: 1,
                          decoration: const BoxDecoration(
                            color: Color(0xffACACAC),
                          ),
                        ),
                        Column(
                          children: [
                            SmallText(
                              text: MyStrings.tShirts,
                              color: primaryColor,
                              size: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: MyStrings.poppins,
                            ),
                            const SmallText(
                              text: MyStrings.subCategory,
                              color: Color(0xffACACAC),
                              size: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: MyStrings.poppins,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor,
                            blurRadius: 1.5, // soften the shadow
                            spreadRadius: 0.5, //extend the shadow
                            offset: const Offset(
                              0.5, // Move to right 5  horizontally
                              0.5, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: whiteColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SmallText(
                              text: MyStrings.praveenkumar,
                              color: primaryColor,
                              size: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: MyStrings.poppins,
                            ),
                            const SmallText(
                              text: MyStrings.supplier,
                              color: Color(0xffACACAC),
                              size: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: MyStrings.poppins,
                            ),
                          ],
                        ),
                        Container(
                          height: 35,
                          width: 1,
                          decoration: const BoxDecoration(
                            color: Color(0xffACACAC),
                          ),
                        ),
                        Column(
                          children: [
                            SmallText(
                              text: MyStrings.karthick,
                              color: primaryColor,
                              size: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: MyStrings.poppins,
                            ),
                            const SmallText(
                              text: MyStrings.currentResponsible,
                              color: Color(0xffACACAC),
                              size: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: MyStrings.poppins,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}