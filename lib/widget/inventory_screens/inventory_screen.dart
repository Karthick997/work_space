import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_space_project/widget/small_text.dart';
import 'package:work_space_project/widget/inventory_screens/sort_screen.dart';
import 'package:work_space_project/widget/string.dart';
import 'package:work_space_project/widget/inventory_screens/view_inventory_screen.dart';
import '../constant.dart';
import 'add_inventory_screen.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  // List<bool> isFavoriteList = List.generate(8, (index) => false);
  bool isFavorite = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "asset/images/Ellipse 42.png",
                      height: 40,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            SmallText(
                                text: MyStrings.inventory,
                                fontFamily: MyStrings.poppins,
                                fontWeight: FontWeight.w600,
                                size: 16,
                                color: whiteColor),
                            SmallText(
                                text: MyStrings.addTheInventoryItem,
                                fontFamily: MyStrings.poppins,
                                fontWeight: FontWeight.w300,
                                size: 13,
                                color: whiteColor),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        double screenHeight =
                            MediaQuery.of(context).size.height;
                        double bottomSheetHeight = screenHeight * 0.75;
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: bottomSheetHeight,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SmallText(
                                            text: MyStrings.addInventory,
                                            color: primaryColor,
                                            size: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: MyStrings.poppins),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const AddInventoryScreen(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF0F0F0),
                        ),
                        child: const Icon(Icons.add,
                            color: Color(0xffA8A8A8), size: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 48,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: primaryColor, // Set the cursor color here
                  decoration: InputDecoration(
                    hintText: "Search inventory",
                    hintStyle: const TextStyle(
                        fontFamily: MyStrings.poppins,
                        color: Color(0xffC5B8B8)),
                    fillColor: whiteColor,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: blackColor,
                      size: 25,
                    ),
                    suffixIcon: Icon(
                      Icons.keyboard_voice_rounded,
                      color: blackColor,
                      size: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(
                          text: MyStrings.inventoryItem,
                          color: primaryColor,
                          size: 16,
                          fontFamily: MyStrings.poppins,
                          fontWeight: FontWeight.w600,
                        ),
                        InkWell(
                          onTap: () {
                            double screenHeight =
                                MediaQuery.of(context).size.height;
                            double bottomSheetHeight = screenHeight * 0.90;
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    padding: const EdgeInsets.all(20),
                                    height: bottomSheetHeight,
                                    width: MediaQuery.of(context).size.width,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SmallText(
                                            text: MyStrings.filter,
                                            color: primaryColor,
                                            fontFamily: MyStrings.poppins,
                                            fontWeight: FontWeight.w700,
                                            size: 13,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const SmallText(
                                            text: MyStrings.location,
                                            color: Color(0xffACACAC),
                                            fontFamily: MyStrings.poppins,
                                            fontWeight: FontWeight.w500,
                                            size: 13,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                0.2,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              cursorColor:
                                                  const Color(0xff165a72),
                                              // Set the cursor color here
                                              decoration: InputDecoration(
                                                hintText: "Choose the location",
                                                hintStyle: const TextStyle(
                                                    fontFamily:
                                                        MyStrings.poppins,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    color: Color(0xffC0C0C0)),
                                                fillColor: Colors.grey[300],
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 16),
                                                border: InputBorder.none,
                                                suffixIcon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: primaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const SmallText(
                                            text: MyStrings.person,
                                            color: Color(0xffACACAC),
                                            fontFamily: MyStrings.poppins,
                                            fontWeight: FontWeight.w500,
                                            size: 13,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    0.2,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: TextFormField(
                                                  controller: _controller,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  cursorColor:
                                                      const Color(0xff165a72),
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.grey[300],
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 16.0,
                                                            vertical: 16),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      _controller.text =
                                                          'Karthick';
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: primaryColor),
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Text(
                                                            'Karthick',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .close_outlined,
                                                            color: Colors.white,
                                                            size: 15,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      _controller.text =
                                                          'Praveenkumar';
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: primaryColor),
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Praveenkumar',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .close_outlined,
                                                            color: Colors.white,
                                                            size: 15,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const SortScreen(),
                                        ],
                                      ),
                                    ));
                              },
                            );
                          },
                          child: Row(
                            children: [
                              SmallText(
                                text: MyStrings.recently,
                                color: blackColor,
                                size: 14,
                                fontFamily: MyStrings.poppins,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.swap_vert_rounded,
                                size: 20,
                                color: blackColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          List<String> imagePaths = [
                            "asset/images/Dress 1 1.png",
                            "asset/images/dress.png",
                            "asset/images/Dress 1 1.png",
                            "asset/images/dress.png",
                            "asset/images/Dress 1 1.png",
                            "asset/images/dress.png",
                            "asset/images/Dress 1 1.png",
                            "asset/images/dress.png",
                          ];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ViewInventoryScreen(),
                                ),
                              );
                            },
                            child: Card(
                              color: whiteColor,
                              child: Container(
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
                                    borderRadius: BorderRadius.circular(10),
                                    color: whiteColor),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SmallText(
                                                text: MyStrings
                                                    .comboCasualMenswear,
                                                color: primaryColor,
                                                size: 16,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: MyStrings.poppins,
                                              ),
                                              const SmallText(
                                                text: MyStrings
                                                    .jeansareusuallyconsideredbusinesscasual,
                                                color: Color(0xff8C8282),
                                                size: 8,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: MyStrings.poppins,
                                              ),
                                              const SmallText(
                                                text: MyStrings
                                                    .withsomeexceptions,
                                                color: Color(0xff8C8282),
                                                size: 8,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: MyStrings.poppins,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  DottedBorder(
                                                    radius: const Radius.circular(8),
                                                    borderType: BorderType.RRect,
                                                    color: Colors.grey[200]!,
                                                    strokeWidth: 1,
                                                    dashPattern: const [3, 3],
                                                    child: SizedBox(
                                                      width: 80,
                                                      height: 25,
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            SmallText(
                                                              text: MyStrings
                                                                  .quantityno,
                                                              color: primaryColor,
                                                              fontFamily:
                                                              MyStrings
                                                                  .poppins,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              size: 10,
                                                            ),
                                                            const SizedBox(
                                                                width: 5),
                                                            SmallText(
                                                              text: MyStrings.no,
                                                              color: primaryColor,
                                                              fontFamily:
                                                              MyStrings
                                                                  .poppins,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              size: 10,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  DottedBorder(
                                                    radius: const Radius.circular(8),
                                                    borderType: BorderType.RRect,
                                                    color: Colors.grey[200]!,
                                                    strokeWidth: 1,
                                                    dashPattern: const [3, 3],
                                                    child: SizedBox(
                                                      width: 90,
                                                      height: 25,
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            SmallText(
                                                              text: MyStrings
                                                                  .unitamount,
                                                              color: primaryColor,
                                                              fontFamily:
                                                              MyStrings
                                                                  .poppins,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              size: 10,
                                                            ),
                                                            const SizedBox(
                                                                width: 5),
                                                            SmallText(
                                                              text: MyStrings.number,
                                                              color: primaryColor,
                                                              fontFamily:
                                                              MyStrings
                                                                  .poppins,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              size: 10,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: SizedBox(
                                              height: 60,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.asset(
                                                  imagePaths[index %
                                                      imagePaths.length],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 5),
                                              SmallText(
                                                text: MyStrings.chennai,
                                                color: primaryColor,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: MyStrings.poppins,
                                                size: 12,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.person_outline_outlined,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 5),
                                              SmallText(
                                                text: MyStrings.praveenkumar,
                                                color: primaryColor,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: MyStrings.poppins,
                                                size: 12,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.date_range_rounded,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 5),
                                              SmallText(
                                                text: MyStrings.date,
                                                color: primaryColor,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: MyStrings.poppins,
                                                size: 12,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
