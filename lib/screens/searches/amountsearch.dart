import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../widgets/loadingui.dart';

class FetchAmountByDate extends StatefulWidget {
  const FetchAmountByDate({Key? key}) : super(key: key);

  @override
  State<FetchAmountByDate> createState() => _FetchAmountByDateState();
}

class _FetchAmountByDateState extends State<FetchAmountByDate> {
  bool bankSelected = false;

  var _currentSelectedMonth = "1";
  var _currentSelectedYear = "2023";
  final _formKey = GlobalKey<FormState>();

  late List searchedTransactions = [];
  List months = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
  List years = [
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
  ];

  String bMonth = "";
  String bYear = "";

  late List allAmountReceived = [];
  bool isSearching = false;
  late List amounts = [];
  late List amountResults = [];
  bool hasData = false;
  double sum = 0.0;
  double cashReceived = 0.0;
  var items;
  late String uToken = "";
  final storage = GetStorage();

  Future<void> fetchAmountByMonth() async {
    final url =
        "https://agencybankingnetwork.com/search_my_company_amount_received_by_date/$bMonth/$bYear/";
    var myLink = Uri.parse(url);
    final response = await http.get(myLink, headers: {
      "Authorization": "Token $uToken",
    });

    if (response.statusCode == 200) {
      final codeUnits = response.body.codeUnits;
      var jsonData = const Utf8Decoder().convert(codeUnits);
      allAmountReceived = json.decode(jsonData);
      amounts.assignAll(allAmountReceived);
      print(amounts);
      for (var i in amounts) {
        sum = sum + double.parse(i['amount_received']);
      }
      setState(() {
        hasData = true;
        isSearching = false;
      });
    } else {
      setState(() {
        hasData = false;
        isSearching = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (storage.read("token") != null) {
      setState(() {
        uToken = storage.read("token");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: const Text("My Payments"),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20),
            const Padding(
                padding: EdgeInsets.only(left: 35.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text("Month",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Expanded(
                        child: Text("Year",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: DropdownButton(
                              hint: const Text("Month"),
                              isExpanded: true,
                              underline: const SizedBox(),
                              // style: const TextStyle(
                              //     color: Colors.black, fontSize: 20),
                              items: months.map((dropDownStringItem) {
                                return DropdownMenuItem(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                _onDropDownItemSelectedMonth(newValueSelected);
                              },
                              value: _currentSelectedMonth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: DropdownButton(
                              hint: const Text("Years"),
                              isExpanded: true,
                              underline: const SizedBox(),
                              // style: const TextStyle(
                              //     color: Colors.black, fontSize: 20),
                              items: years.map((dropDownStringItem) {
                                return DropdownMenuItem(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                _onDropDownItemSelectedYear(newValueSelected);
                              },
                              value: _currentSelectedYear,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    isSearching = true;
                    bMonth = _currentSelectedMonth;
                    bYear = _currentSelectedYear;
                  });

                  if (!_formKey.currentState!.validate()) {
                    return;
                  } else {
                    fetchAmountByMonth();
                  }
                },
                // child: const Text("Send"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 8,
                fillColor: secondaryColor,
                splashColor: defaultTextColor1,
                child: const Text(
                  "Search",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: defaultTextColor1),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            isSearching
                ? const LoadingUi()
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Card(
                            color: secondaryColor,
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // shadowColor: Colors.pink,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, bottom: 18),
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "Month: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            _currentSelectedMonth,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Year: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            _currentSelectedYear,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Commission: ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Commission = ${cashReceived - sum}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }

  void _onDropDownItemSelectedMonth(newValueSelected) {
    setState(() {
      _currentSelectedMonth = newValueSelected;
    });
  }

  void _onDropDownItemSelectedYear(newValueSelected) {
    setState(() {
      _currentSelectedYear = newValueSelected;
    });
  }
}
