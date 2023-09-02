import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AmountReceivedController extends GetxController {
  bool isLoading = true;
  late List allAmountReceived = [];
  late List allAmounts = ["Select amount"];
  late List companyDetails = [];
  late String uToken = "";
  final storage = GetStorage();
  late String companyWhatsappPhone = "";
  late String companyName = "";
  late String companyPhone = "";
  late String companyEmail = "";
  late String companiesAccountNumber = "";
  late String amountReceivedId = "";
  late String company = "";
  late String companyAmountReceivedDate = "";
  late String companyAmountReceivedReceipt = "";
  late String companyPaymentMadeSnapShot = "";
  late String companyPaymentMade = "";
  late String companyPaymentDate = "";
  late String companiesAmountReceived = "";
  late String companyAmountReceivedUniqueIdentifier = "";
  late Timer _timer;

  @override
  void onInit() {
    if (storage.read("token") != null) {
      uToken = storage.read("token");
    }
    fetchAmountReceived();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      fetchAmountReceived();
    });
    super.onInit();
  }

  Future<void> fetchAmountReceived() async {
    try {
      isLoading = true;
      const url =
          "https://agencybankingnetwork.com/get_my_companies_amount_received/";
      var myLink = Uri.parse(url);
      final response = await http.get(myLink, headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Token $uToken"
      });

      if (response.statusCode == 200) {
        final codeUnits = response.body.codeUnits;
        var jsonData = const Utf8Decoder().convert(codeUnits);
        allAmountReceived = json.decode(jsonData);
        for (var i in allAmountReceived) {
          if (!allAmounts.contains(
              i['amount_received'] + " " + "| " + i['id'].toString())) {
            allAmounts
                .add(i['amount_received'] + " " + "| " + i['id'].toString());
          }
        }
        update();
      } else {
        if (kDebugMode) {
          print(response.body);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isLoading = false;
    }
  }

  Future<void> fetchCompanyAmountByName(String id) async {
    try {
      isLoading = true;
      final url = "https://agencybankingnetwork.com/get_company_by_id/$id/";
      var myLink = Uri.parse(url);
      final response = await http.get(myLink);

      if (response.statusCode == 200) {
        final codeUnits = response.body.codeUnits;
        var jsonData = const Utf8Decoder().convert(codeUnits);
        var data = json.decode(jsonData);

        companyName = data['get_company_name'];
        companyAmountReceivedUniqueIdentifier = data['unique_identifier'];
        companyEmail = data['get_company_email'];
        companiesAccountNumber = data['account_number'];
        companiesAmountReceived = data['amount_received'];
        companyAmountReceivedDate = data['date_received'];
        companyAmountReceivedReceipt = data['get_receipt_pic'];
        amountReceivedId = data['id'].toString();
        company = data['company'].toString();

        update();
      } else {
        if (kDebugMode) {
          print(response.body);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isLoading = false;
    }
  }
}
