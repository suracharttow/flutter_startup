import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_startup/model/country_model.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

//765EFC
class _CountryPageState extends State<CountryPage> {
  bool isLoading = false;
  late List<CountryModel> countryData;

  @override
  void initState() {
    super.initState();
    getCountry();
  }

  void getCountry() async {
    setState(() {
      isLoading = true;
    });

    countryData = [];

    var jsonText = await rootBundle.loadString('assets/json/country.json');
    var res = jsonDecode(jsonText);
    for (var ls in res) {
      countryData.add(CountryModel.fromJson(ls));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Country List'),
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
                  child: ListView(
                    shrinkWrap: true,
                    children: countryData
                        .map(
                          (val) => Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                            alignment: Alignment.centerLeft,
                            color: Colors.white,
                            child: TextButton(
                                onPressed: () {
                                  // ---
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/flags/" +
                                            val.flag +
                                            '.png',
                                        width: 48,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          val.name.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        )
                        .toList(),
                  ),
                ),
        ));
  }
}
