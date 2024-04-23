import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:work_space_project/widget/constant.dart';

class CarouselSliderScreen extends StatefulWidget {
  const CarouselSliderScreen({Key? key}) : super(key: key);

  @override
  CarouselSliderScreenState createState() => CarouselSliderScreenState();
}

class CarouselSliderScreenState extends State<CarouselSliderScreen> {
  late CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'asset/images/Dress 1 1.png',
    'asset/images/inventoryimage.png',
    'asset/images/Dress 1 1.png',
    'asset/images/inventoryimage.png',
    'asset/images/Dress 1 1.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        carouselSlider = CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 9, // Change the aspectRatio for the page view
            initialPage: 0,
            enlargeCenterPage: true,
            height: 200,
            autoPlay: true,
            reverse: false,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 2000),
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: imgList.map((imgUrl) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.cover, // Use BoxFit.cover for the page view
                    width: double.infinity,
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(imgList, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? primaryColor : Colors.grey,
              ),
            );
          }),
        ),
        const SizedBox(
          height: 20.0,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     TextButton(
        //       onPressed: goToPrevious,
        //       child: Text("<"),
        //     ),
        //     TextButton(
        //       onPressed: goToNext,
        //       child: Text(">"),
        //     ),
        //   ],
        // ),
      ],
    );
  }

// goToPrevious() {
//   carouselSlider.previousPage(
//       duration: Duration(milliseconds: 300), curve: Curves.ease);
// }
//
// goToNext() {
//   carouselSlider.nextPage(
//       duration: Duration(milliseconds: 300), curve: Curves.decelerate);
// }
}
