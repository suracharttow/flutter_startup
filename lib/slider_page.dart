import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_startup/model/slider_model.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

//765EFC
class _SliderPageState extends State<SliderPage> {
  bool isLoading = false;
  late List<SliderModel> sliderData;

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    getSlider();
  }

  void getSlider() async {
    setState(() {
      isLoading = true;
    });

    sliderData = [];

    var jsonText = await rootBundle.loadString('assets/json/slider.json');
    var res = jsonDecode(jsonText);
    for (var ls in res) {
      sliderData.add(SliderModel.fromJson(ls));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slider Page'),
          elevation: 10,
          backgroundColor: const Color(0xFF765EFC),
          leading: Container(
            padding: const EdgeInsets.all(5),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        body: Container(
          alignment: isLoading ? Alignment.center : Alignment.topCenter,
          child: isLoading
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                          backgroundColor: Colors.amberAccent,
                          strokeWidth: 2.0,
                        ),
                        width: 24,
                        height: 24,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text('Loading...')),
                    ],
                  ),
                )
              : Container(
                  color: Colors.black12,
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      CarouselSlider(
                        items: sliderData
                            .map(
                              (item) =>
                                  ClipRRect(child: Image.asset(item.imageUrl)),
                            )
                            .toList(),
                        carouselController: _controller,
                        options: CarouselOptions(
                            enableInfiniteScroll: true,
                            viewportFraction: 1,
                            autoPlay: true,
                            aspectRatio: 2.15,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 5,
                        //right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: sliderData.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : Colors.black)
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}
