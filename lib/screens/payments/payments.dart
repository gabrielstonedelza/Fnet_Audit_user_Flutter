import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controller/amountreceivedcontroller.dart';
import '../../controller/companiescontroller.dart';
import '../../controller/paymentcontroller.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final PaymentController controller = Get.find();
  late String uToken = "";
  final storage = GetStorage();
  var items;

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
    return Scaffold(
        appBar: AppBar(title: const Text("My Payments")),
        body: GetBuilder<PaymentController>(
          builder: (cController) {
            return ListView.builder(
                itemCount: cController.allPayments != null
                    ? cController.allPayments.length
                    : 0,
                itemBuilder: (context, index) {
                  items = cController.allPayments[index];
                  return Card(
                    color: secondaryColor,
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: RowWidget(
                        items: items,
                        title: 'Company: ',
                        itemTitle: 'get_company_name',
                      ),
                      subtitle: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Center(
                              child: Text("Amount Received",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: defaultTextColor2)),
                            ),
                          ),
                          RowWidget(
                            items: items,
                            title: 'Amount Received: ',
                            itemTitle: 'get_company_amount_received'.toString(),
                          ),
                          RowWidget(
                            items: items,
                            title: 'Acc No: ',
                            itemTitle: 'get_account_number',
                          ),
                          RowWidget(
                            items: items,
                            title: 'Transaction Id: ',
                            itemTitle: 'get_transaction_id',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                const Text("Date Received: ",
                                    style: TextStyle(
                                        color: defaultTextColor1,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    items['get_amount_received_date']
                                        .toString()
                                        .split('T')
                                        .first,
                                    style: const TextStyle(
                                        color: defaultTextColor1,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            height: 200,
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(items[
                                            'get_amount_received_receipt']))),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Center(
                              child: Text("Amount Paid",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: defaultTextColor2)),
                            ),
                          ),
                          RowWidget(
                            items: items,
                            title: 'Amount Paid: ',
                            itemTitle: 'amount'.toString(),
                          ),
                          RowWidget(
                            items: items,
                            title: 'Transaction Id: ',
                            itemTitle: 'transaction_id',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                const Text("Date Paid: ",
                                    style: TextStyle(
                                        color: defaultTextColor1,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    items['date_paid']
                                        .toString()
                                        .split('T')
                                        .first,
                                    style: const TextStyle(
                                        color: defaultTextColor1,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            height: 200,
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            items['get_screenshot_pic']))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ));
  }
}

class RowWidget extends StatelessWidget {
  String title;
  String itemTitle;
  RowWidget(
      {super.key,
      required this.items,
      required this.title,
      required this.itemTitle});

  final items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: defaultTextColor1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, bottom: 8),
          child: Text(
            items[itemTitle].toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: defaultTextColor1),
          ),
        ),
      ],
    );
  }
}
