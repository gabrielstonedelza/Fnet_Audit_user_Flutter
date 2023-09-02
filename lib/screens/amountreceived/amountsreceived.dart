import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controller/amountreceivedcontroller.dart';
import '../../controller/companiescontroller.dart';

class AmountsReceived extends StatefulWidget {
  const AmountsReceived({super.key});

  @override
  State<AmountsReceived> createState() => _AmountsReceivedState();
}

class _AmountsReceivedState extends State<AmountsReceived> {
  final AmountReceivedController controller = Get.find();
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
        appBar: AppBar(title: const Text("My Amounts Received")),
        body: GetBuilder<AmountReceivedController>(
          builder: (cController) {
            return ListView.builder(
                itemCount: cController.allAmountReceived != null
                    ? cController.allAmountReceived.length
                    : 0,
                itemBuilder: (context, index) {
                  items = cController.allAmountReceived[index];
                  return Card(
                    color: secondaryColor,
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: RowWidget(
                        items: items,
                        title: 'Name: ',
                        itemTitle: 'get_company_name',
                      ),
                      subtitle: Column(
                        children: [
                          RowWidget(
                            items: items,
                            title: 'Amount: ',
                            itemTitle: 'amount_received',
                          ),
                          RowWidget(
                            items: items,
                            title: 'Acc No: ',
                            itemTitle: 'account_number',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                const Text("Date: ",
                                    style: TextStyle(
                                        color: defaultTextColor1,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    items['date_received']
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
                                            items['get_receipt_pic']))),
                              ),
                            ),
                          )
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
            items[itemTitle],
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: defaultTextColor1),
          ),
        ),
      ],
    );
  }
}
