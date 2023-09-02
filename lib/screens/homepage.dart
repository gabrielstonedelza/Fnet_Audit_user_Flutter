import 'package:audit_user/controller/logincontroller.dart';
import 'package:audit_user/screens/companies/registercompany.dart';
import 'package:audit_user/screens/payments/payments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../constants/app_colors.dart';
import 'amountreceived/addamountreceived.dart';
import 'amountreceived/amountsreceived.dart';

import 'companies/companies.dart';
import 'loginview.dart';
import 'payments/makepayment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = GetStorage();
  late String uToken = "";
  late String username = "";
  logoutUser() async {
    storage.remove("token");
    storage.remove("username");

    Get.offAll(() => const LoginView());
    const logoutUrl = "https://agencybankingnetwork.com/auth/token/logout";
    final myLink = Uri.parse(logoutUrl);
    http.Response response = await http.post(myLink, headers: {
      'Accept': 'application/json',
      "Authorization": "Token $uToken"
    });

    if (response.statusCode == 200) {
      Get.snackbar("Success", "You were logged out",
          colorText: defaultTextColor1,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: snackBackground);
      storage.remove("token");
      storage.remove("username");
      Get.offAll(() => const LoginView());
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
    if (storage.read("username") != null) {
      setState(() {
        username = storage.read("username");
      });
    }
  }

  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username, style: const TextStyle(color: defaultTextColor1)),
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                    buttonColor: primaryColor,
                    title: "Confirm Logout",
                    middleText: "Are you sure you want to logout?",
                    confirm: RawMaterialButton(
                        shape: const StadiumBorder(),
                        fillColor: primaryColor,
                        onPressed: () {
                          logoutUser();
                          Get.back();
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.white),
                        )),
                    cancel: RawMaterialButton(
                        shape: const StadiumBorder(),
                        fillColor: primaryColor,
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        )));
              },
              icon: const Icon(Icons.logout, size: 30))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(
          //   height: 40,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => const RegisterCompany());
                  },
                  child: menuWidget(
                    title: 'Register Company',
                    imagePath: 'assets/images/corporate.png',
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => const Companies());
                  },
                  child: menuWidget(
                    title: 'Companies',
                    imagePath: 'assets/images/corporate.png',
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => const AddAmountReceived());
                  },
                  child: menuWidget(
                    title: 'Add Amount',
                    imagePath: 'assets/images/receive-money.png',
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => const AmountsReceived());
                  },
                  child: menuWidget(
                    title: 'Amount Received',
                    imagePath: 'assets/images/corporate.png',
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => const MakePayment());
                  },
                  child: menuWidget(
                    title: 'Make Payment',
                    imagePath: 'assets/images/add.png',
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => const Payments());
                  },
                  child: menuWidget(
                    title: 'Payments',
                    imagePath: 'assets/images/money.png',
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class menuWidget extends StatelessWidget {
  String title;
  String imagePath;

  menuWidget({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 70,
          height: 70,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
