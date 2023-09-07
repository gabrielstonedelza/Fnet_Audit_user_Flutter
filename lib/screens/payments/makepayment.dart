import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:audit_user/controller/companiescontroller.dart';
import 'package:audit_user/widgets/loadingui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as myGet;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../constants/app_colors.dart';
import '../../controller/amountreceivedcontroller.dart';
import '../homepage.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({super.key});

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  final AmountReceivedController controller = Get.find();
  final CompanyController cController = Get.find();
  late String uToken = "";
  final storage = GetStorage();
  bool isLoading = true;
  bool isUploading = false;

  final _formKey = GlobalKey<FormState>();

  bool isPosting = false;
  var _currentSelectedCompany = "Select amount";
  late final TextEditingController amountController;
  late final TextEditingController amountController1;
  late final TextEditingController amountController2;
  late final TextEditingController amountController3;
  late final TextEditingController amountController4;
  late final TextEditingController amountController5;
  late final TextEditingController amountController6;
  late final TextEditingController amountController7;
  late final TextEditingController amountController8;
  late final TextEditingController amountController9;
  late final TextEditingController amountController10;
  late final TextEditingController amountController11;
  late final TextEditingController amountController12;
  late final TextEditingController amountController13;
  late final TextEditingController amountController14;
  late final TextEditingController amountController15;
  late final TextEditingController amountController16;
  late final TextEditingController amountController17;
  late final TextEditingController amountController18;
  late final TextEditingController amountController19;
  late final TextEditingController amountController20;
  late final TextEditingController transactionIdController;
  late final TextEditingController transactionIdController1;
  late final TextEditingController transactionIdController2;
  late final TextEditingController transactionIdController3;
  late final TextEditingController transactionIdController4;
  late final TextEditingController transactionIdController5;
  late final TextEditingController transactionIdController6;
  late final TextEditingController transactionIdController7;
  late final TextEditingController transactionIdController8;
  late final TextEditingController transactionIdController9;
  late final TextEditingController transactionIdController10;
  late final TextEditingController transactionIdController11;
  late final TextEditingController transactionIdController12;
  late final TextEditingController transactionIdController13;
  late final TextEditingController transactionIdController14;
  late final TextEditingController transactionIdController15;
  late final TextEditingController transactionIdController16;
  late final TextEditingController transactionIdController17;
  late final TextEditingController transactionIdController18;
  late final TextEditingController transactionIdController19;
  late final TextEditingController transactionIdController20;

  late final TextEditingController numOfFormsController;

  void _startPosting() async {
    setState(() {
      isPosting = true;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isPosting = false;
    });
  }

  final picker1 = ImagePicker();
  final picker2 = ImagePicker();
  final picker3 = ImagePicker();
  final picker4 = ImagePicker();
  final picker5 = ImagePicker();
  final picker6 = ImagePicker();
  final picker7 = ImagePicker();
  final picker8 = ImagePicker();
  final picker9 = ImagePicker();
  final picker10 = ImagePicker();
  final picker11 = ImagePicker();
  final picker12 = ImagePicker();
  final picker13 = ImagePicker();
  final picker14 = ImagePicker();
  final picker15 = ImagePicker();
  final picker16 = ImagePicker();
  final picker17 = ImagePicker();
  final picker18 = ImagePicker();
  final picker19 = ImagePicker();
  final picker20 = ImagePicker();
  File? imageFile1;
  File? imageFile2;
  File? imageFile3;
  File? imageFile4;
  File? imageFile5;
  File? imageFile6;
  File? imageFile7;
  File? imageFile8;
  File? imageFile9;
  File? imageFile10;
  File? imageFile11;
  File? imageFile12;
  File? imageFile13;
  File? imageFile14;
  File? imageFile15;
  File? imageFile16;
  File? imageFile17;
  File? imageFile18;
  File? imageFile19;
  File? imageFile20;

  void selectSourceOption1() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery1();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera1();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption2() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery2();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera2();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption3() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery3();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera3();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption4() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery4();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera4();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption5() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery5();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera5();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption6() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery6();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera6();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption7() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery7();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera7();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption8() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery8();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera8();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption9() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery9();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera9();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption10() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery10();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera10();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption11() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery11();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera11();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption12() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery12();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera12();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption13() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery13();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera13();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption14() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery14();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera14();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption15() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery15();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera15();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption16() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery16();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera16();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption17() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery17();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera17();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption18() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery18();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera18();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption19() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery19();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera19();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectSourceOption20() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text("Select Source",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imgFromGallery20();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/gallery.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Gallery",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromCamera20();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/camera.png",
                          width: 50,
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Camera",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool addedForm1 = false;
  bool addedForm2 = false;
  bool addedForm3 = false;
  bool addedForm4 = false;
  bool addedForm5 = false;
  bool addedForm6 = false;
  bool addedForm7 = false;
  bool addedForm8 = false;
  bool addedForm9 = false;
  bool addedForm10 = false;
  bool addedForm11 = false;
  bool addedForm12 = false;
  bool addedForm13 = false;
  bool addedForm14 = false;
  bool addedForm15 = false;
  bool addedForm16 = false;
  bool addedForm17 = false;
  bool addedForm18 = false;
  bool addedForm19 = false;
  bool addedForm20 = false;

  void showAndEnterFormNumber() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        reverse: true,
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                  child: Text(
                      "Enter number of fields needed for the total amount",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 10, left: 10.0, right: 10),
                child: TextFormField(
                  controller: numOfFormsController,
                  cursorColor: primaryColor,
                  cursorRadius: const Radius.elliptical(10, 10),
                  cursorWidth: 10,
                  decoration: InputDecoration(
                      labelText: "Number of forms",
                      labelStyle: const TextStyle(color: secondaryColor),
                      focusColor: primaryColor,
                      fillColor: primaryColor,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(12)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  keyboardType: TextInputType.number,
                ),
              ),
              TextButton(
                onPressed: () {
                  if (numOfFormsController.text != "") {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      numberOfFormsProvided = true;
                      numberOfForms =
                          int.parse(numOfFormsController.text.trim());
                      isAmountSelectedAndNumOfFormsProvided = true;
                    });
                    switch (int.parse(numOfFormsController.text.trim())) {
                      case 1:
                        setState(() {
                          addedForm1 = true;
                        });
                        break;
                      case 2:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                        });
                        break;
                      case 3:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                        });
                        break;
                      case 4:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                        });
                        break;
                      case 5:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                        });
                        break;
                      case 6:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                        });
                        break;
                      case 7:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                        });
                        break;
                      case 8:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                        });
                        break;
                      case 9:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                        });
                        break;
                      case 10:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                        });
                        break;
                      case 11:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                          addedForm11 = true;
                        });
                        break;
                      case 12:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                          addedForm11 = true;
                          addedForm12 = true;
                        });
                        break;
                      case 13:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                          addedForm11 = true;
                          addedForm12 = true;
                          addedForm13 = true;
                        });
                        break;
                      case 14:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                          addedForm11 = true;
                          addedForm12 = true;
                          addedForm13 = true;
                          addedForm14 = true;
                        });
                        break;
                      case 15:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                          addedForm11 = true;
                          addedForm12 = true;
                          addedForm13 = true;
                          addedForm14 = true;
                          addedForm15 = true;
                        });
                        break;
                      case 16:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                          addedForm11 = true;
                          addedForm12 = true;
                          addedForm13 = true;
                          addedForm14 = true;
                          addedForm15 = true;
                          addedForm16 = true;
                        });
                        break;
                      case 17:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                          addedForm11 = true;
                          addedForm12 = true;
                          addedForm13 = true;
                          addedForm14 = true;
                          addedForm15 = true;
                          addedForm16 = true;
                          addedForm17 = true;
                        });
                        break;
                      case 18:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                          addedForm11 = true;
                          addedForm12 = true;
                          addedForm13 = true;
                          addedForm14 = true;
                          addedForm15 = true;
                          addedForm16 = true;
                          addedForm17 = true;
                          addedForm18 = true;
                        });
                        break;
                      case 19:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                          addedForm11 = true;
                          addedForm12 = true;
                          addedForm13 = true;
                          addedForm14 = true;
                          addedForm15 = true;
                          addedForm16 = true;
                          addedForm17 = true;
                          addedForm18 = true;
                          addedForm19 = true;
                        });
                        break;
                      case 20:
                        setState(() {
                          addedForm1 = true;
                          addedForm2 = true;
                          addedForm3 = true;
                          addedForm4 = true;
                          addedForm5 = true;
                          addedForm6 = true;
                          addedForm7 = true;
                          addedForm8 = true;
                          addedForm9 = true;
                          addedForm10 = true;
                          addedForm11 = true;
                          addedForm12 = true;
                          addedForm13 = true;
                          addedForm14 = true;
                          addedForm15 = true;
                          addedForm16 = true;
                          addedForm17 = true;
                          addedForm18 = true;
                          addedForm19 = true;
                          addedForm20 = true;
                        });
                        break;
                    }
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      numberOfFormsProvided = false;
                      isAmountSelectedAndNumOfFormsProvided = false;
                      numberOfForms = 0;
                    });
                    Get.snackbar("Sorry", "Please enter number of forms needed",
                        colorText: Colors.white,
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 5),
                        backgroundColor: Colors.red);
                  }
                },
                child: const Text("Add Forms"),
              )
            ],
          ),
        ),
      ),
    );
  }

  _imgFromCamera1() async {
    await picker1
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera2() async {
    await picker2
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera3() async {
    await picker3
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera4() async {
    await picker4
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera5() async {
    await picker5
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera6() async {
    await picker6
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera7() async {
    await picker7
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera8() async {
    await picker8
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera9() async {
    await picker9
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera10() async {
    await picker10
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera11() async {
    await picker11
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera12() async {
    await picker12
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera13() async {
    await picker13
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera14() async {
    await picker14
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera15() async {
    await picker15
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera16() async {
    await picker16
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera17() async {
    await picker17
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera18() async {
    await picker18
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera19() async {
    await picker19
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromCamera20() async {
    await picker20
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromGallery1() async {
    await picker1
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage1(File(value.path));
      }
    });
  }

  _imgFromGallery2() async {
    await picker2
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage2(File(value.path));
      }
    });
  }

  _imgFromGallery3() async {
    await picker3
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage3(File(value.path));
      }
    });
  }

  _imgFromGallery4() async {
    await picker4
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage4(File(value.path));
      }
    });
  }

  _imgFromGallery5() async {
    await picker5
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage5(File(value.path));
      }
    });
  }

  _imgFromGallery6() async {
    await picker6
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage6(File(value.path));
      }
    });
  }

  _imgFromGallery7() async {
    await picker7
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage7(File(value.path));
      }
    });
  }

  _imgFromGallery8() async {
    await picker8
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage8(File(value.path));
      }
    });
  }

  _imgFromGallery9() async {
    await picker9
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage9(File(value.path));
      }
    });
  }

  _imgFromGallery10() async {
    await picker10
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage10(File(value.path));
      }
    });
  }

  _imgFromGallery11() async {
    await picker11
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage11(File(value.path));
      }
    });
  }

  _imgFromGallery12() async {
    await picker12
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage12(File(value.path));
      }
    });
  }

  _imgFromGallery13() async {
    await picker13
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage13(File(value.path));
      }
    });
  }

  _imgFromGallery14() async {
    await picker14
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage14(File(value.path));
      }
    });
  }

  _imgFromGallery15() async {
    await picker15
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage15(File(value.path));
      }
    });
  }

  _imgFromGallery16() async {
    await picker16
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage16(File(value.path));
      }
    });
  }

  _imgFromGallery17() async {
    await picker17
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage17(File(value.path));
      }
    });
  }

  _imgFromGallery18() async {
    await picker18
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage18(File(value.path));
      }
    });
  }

  _imgFromGallery19() async {
    await picker19
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage19(File(value.path));
      }
    });
  }

  _imgFromGallery20() async {
    await picker20
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage20(File(value.path));
      }
    });
  }

  _cropImage1(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile1 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage2(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile2 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage3(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile3 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage4(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile4 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage5(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile5 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage6(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile6 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage7(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile7 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage8(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile8 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage9(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile9 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage10(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile10 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage11(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile11 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage12(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile12 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage13(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile13 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage14(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile14 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage15(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile15 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage16(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile16 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage17(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile17 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage18(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile18 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage19(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile19 = File(croppedFile.path);
      });
      // reload();
    }
  }

  _cropImage20(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile20 = File(croppedFile.path);
      });
      // reload();
    }
  }

  var dio = Dio();
  bool isUpLoading = false;
  bool isAmountSame = false;
  late String selectedPrice = "";
  late String amountId = "";
  late String selectedCompanyId = "";
  late String agentId = "";
  bool amountIsSelected = false;
  bool numberOfFormsProvided = false;
  bool isAmountSelectedAndNumOfFormsProvided = false;
  int numberOfForms = 20;
  List<bool> addForm = [];

  void initializeBooleans() {
    addForm = List.generate(numberOfForms, (index) => false);
  }

  void changeBooleansToTrue() {
    setState(() {
      addForm = List.generate(numberOfForms, (index) => true);
    });
  }

  void _uploadAndSavePayment() async {
    try {
      isUpLoading = true;
      //updating user profile details
      String fileName1 =
          imageFile1 != null ? imageFile1!.path.split('/').last : "";
      String fileName2 =
          imageFile2 != null ? imageFile2!.path.split('/').last : "";
      String fileName3 =
          imageFile3 != null ? imageFile3!.path.split('/').last : "";
      String fileName4 =
          imageFile4 != null ? imageFile4!.path.split('/').last : "";
      String fileName5 =
          imageFile5 != null ? imageFile5!.path.split('/').last : "";
      String fileName6 =
          imageFile6 != null ? imageFile6!.path.split('/').last : "";
      String fileName7 =
          imageFile7 != null ? imageFile7!.path.split('/').last : "";
      String fileName8 =
          imageFile8 != null ? imageFile8!.path.split('/').last : "";
      String fileName9 =
          imageFile9 != null ? imageFile9!.path.split('/').last : "";
      String fileName10 =
          imageFile10 != null ? imageFile10!.path.split('/').last : "";
      String fileName11 =
          imageFile11 != null ? imageFile11!.path.split('/').last : "";
      String fileName12 =
          imageFile12 != null ? imageFile12!.path.split('/').last : "";
      String fileName13 =
          imageFile13 != null ? imageFile13!.path.split('/').last : "";
      String fileName14 =
          imageFile14 != null ? imageFile14!.path.split('/').last : "";
      String fileName15 =
          imageFile15 != null ? imageFile15!.path.split('/').last : "";
      String fileName16 =
          imageFile16 != null ? imageFile16!.path.split('/').last : "";
      String fileName17 =
          imageFile17 != null ? imageFile17!.path.split('/').last : "";
      String fileName18 =
          imageFile18 != null ? imageFile18!.path.split('/').last : "";
      String fileName19 =
          imageFile19 != null ? imageFile19!.path.split('/').last : "";
      String fileName20 =
          imageFile20 != null ? imageFile20!.path.split('/').last : "";
      var formData1 = FormData.fromMap({
        'company_amount': controller.amountReceivedId,
        'amount': selectedPrice,
        'amount1': amountController1.text,
        'amount2': amountController2.text,
        'amount3': amountController3.text,
        'amount4': amountController4.text,
        'amount5': amountController5.text,
        'amount6': amountController6.text,
        'amount7': amountController7.text,
        'amount8': amountController8.text,
        'amount9': amountController9.text,
        'amount10': amountController10.text,
        'amount11': amountController11.text,
        'amount12': amountController12.text,
        'amount13': amountController13.text,
        'amount14': amountController14.text,
        'amount15': amountController15.text,
        'amount16': amountController16.text,
        'amount17': amountController17.text,
        'amount18': amountController18.text,
        'amount19': amountController19.text,
        'amount20': amountController20.text,
        'transaction_id1': transactionIdController1.text,
        'transaction_id2': transactionIdController2.text,
        'transaction_id3': transactionIdController3.text,
        'transaction_id4': transactionIdController4.text,
        'transaction_id5': transactionIdController5.text,
        'transaction_id6': transactionIdController6.text,
        'transaction_id7': transactionIdController7.text,
        'transaction_id8': transactionIdController8.text,
        'transaction_id9': transactionIdController9.text,
        'transaction_id10': transactionIdController10.text,
        'transaction_id11': transactionIdController11.text,
        'transaction_id12': transactionIdController12.text,
        'transaction_id13': transactionIdController13.text,
        'transaction_id14': transactionIdController14.text,
        'transaction_id15': transactionIdController15.text,
        'transaction_id16': transactionIdController16.text,
        'transaction_id17': transactionIdController17.text,
        'transaction_id18': transactionIdController18.text,
        'transaction_id19': transactionIdController19.text,
        'transaction_id20': transactionIdController20.text,
        'company': controller.company,
        'unique_identifier': controller.companyAmountReceivedUniqueIdentifier,
        'screenshot1':
            await MultipartFile.fromFile(imageFile1!.path, filename: fileName1),
        'screenshot2': addedForm2
            ? await MultipartFile.fromFile(imageFile2!.path,
                filename: fileName2)
            : "",
        'screenshot3': addedForm3
            ? await MultipartFile.fromFile(imageFile3!.path,
                filename: fileName3)
            : "",
        'screenshot4': addedForm4
            ? await MultipartFile.fromFile(imageFile4!.path,
                filename: fileName4)
            : "",
        'screenshot5': addedForm5
            ? await MultipartFile.fromFile(imageFile5!.path,
                filename: fileName5)
            : "",
        'screenshot6': addedForm6
            ? await MultipartFile.fromFile(imageFile6!.path,
                filename: fileName6)
            : "",
        'screenshot7': addedForm7
            ? await MultipartFile.fromFile(imageFile7!.path,
                filename: fileName7)
            : "",
        'screenshot8': addedForm8
            ? await MultipartFile.fromFile(imageFile8!.path,
                filename: fileName8)
            : "",
        'screenshot9': addedForm9
            ? await MultipartFile.fromFile(imageFile9!.path,
                filename: fileName9)
            : "",
        'screenshot10': addedForm10
            ? await MultipartFile.fromFile(imageFile10!.path,
                filename: fileName10)
            : "",
        'screenshot11': addedForm11
            ? await MultipartFile.fromFile(imageFile11!.path,
                filename: fileName11)
            : "",
        'screenshot12': addedForm12
            ? await MultipartFile.fromFile(imageFile12!.path,
                filename: fileName12)
            : "",
        'screenshot13': addedForm13
            ? await MultipartFile.fromFile(imageFile13!.path,
                filename: fileName13)
            : "",
        'screenshot14': addedForm14
            ? await MultipartFile.fromFile(imageFile14!.path,
                filename: fileName14)
            : "",
        'screenshot15': addedForm15
            ? await MultipartFile.fromFile(imageFile15!.path,
                filename: fileName15)
            : "",
        'screenshot16': addedForm16
            ? await MultipartFile.fromFile(imageFile16!.path,
                filename: fileName16)
            : "",
        'screenshot17': addedForm17
            ? await MultipartFile.fromFile(imageFile17!.path,
                filename: fileName17)
            : "",
        'screenshot18': addedForm18
            ? await MultipartFile.fromFile(imageFile18!.path,
                filename: fileName18)
            : "",
        'screenshot19': addedForm19
            ? await MultipartFile.fromFile(imageFile19!.path,
                filename: fileName19)
            : "",
        'screenshot20': addedForm20
            ? await MultipartFile.fromFile(imageFile20!.path,
                filename: fileName20)
            : "",
      });
      var response = await dio.post(
        'https://agencybankingnetwork.com/add_new_company_payment/${controller.companyEmail}/',
        data: formData1,
        options: Options(headers: {
          "Authorization": "Token $uToken",
          "HttpHeaders.acceptHeader": "accept: application/json",
        }, contentType: Headers.formUrlEncodedContentType),
      );
      if (response.statusCode != 201) {
        Get.snackbar("Sorry", response.data.toString(),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red);
      } else {
        setState(() {
          isPosting = false;
        });
        Get.snackbar("Hurray 😀", "Your data sent successfully.",
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: primaryColor,
            duration: const Duration(seconds: 5));
        setState(() {
          isPosting = false;
        });
        updateAmountReceived();
        Get.offAll(() => const HomePage());
      }
    } on DioException catch (e) {
      Get.snackbar("Sorry", e.toString(),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: snackColor);
    } finally {
      isUpLoading = false;
    }
  }

  updateAmountReceived() async {
    final amountReceivedUrl =
        "https://agencybankingnetwork.com/update_company_amount_received/$amountId/";
    final myLink = Uri.parse(amountReceivedUrl);
    final res = await http.put(myLink, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Token $uToken"
    }, body: {
      "company": selectedCompanyId,
      "agent": agentId,
      "amount_received_paid": "Paid",
    });
    if (res.statusCode == 200) {
      Get.snackbar("Congratulations", "Your amount was updated",
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 10),
          backgroundColor: snackBackground);
    } else {
      if (kDebugMode) {
        print(res.body);
      }
      Get.snackbar("Error", res.body.toString(),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red);
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
    initializeBooleans();
    numOfFormsController = TextEditingController();
    amountController = TextEditingController();
    amountController1 = TextEditingController();
    amountController2 = TextEditingController();
    amountController3 = TextEditingController();
    amountController4 = TextEditingController();
    amountController5 = TextEditingController();
    amountController6 = TextEditingController();
    amountController7 = TextEditingController();
    amountController8 = TextEditingController();
    amountController9 = TextEditingController();
    amountController10 = TextEditingController();
    amountController11 = TextEditingController();
    amountController12 = TextEditingController();
    amountController13 = TextEditingController();
    amountController14 = TextEditingController();
    amountController15 = TextEditingController();
    amountController16 = TextEditingController();
    amountController17 = TextEditingController();
    amountController18 = TextEditingController();
    amountController19 = TextEditingController();
    amountController20 = TextEditingController();
    transactionIdController = TextEditingController();
    transactionIdController1 = TextEditingController();
    transactionIdController2 = TextEditingController();
    transactionIdController3 = TextEditingController();
    transactionIdController4 = TextEditingController();
    transactionIdController5 = TextEditingController();
    transactionIdController6 = TextEditingController();
    transactionIdController7 = TextEditingController();
    transactionIdController8 = TextEditingController();
    transactionIdController9 = TextEditingController();
    transactionIdController10 = TextEditingController();
    transactionIdController11 = TextEditingController();
    transactionIdController12 = TextEditingController();
    transactionIdController13 = TextEditingController();
    transactionIdController14 = TextEditingController();
    transactionIdController15 = TextEditingController();
    transactionIdController16 = TextEditingController();
    transactionIdController17 = TextEditingController();
    transactionIdController18 = TextEditingController();
    transactionIdController19 = TextEditingController();
    transactionIdController20 = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    numOfFormsController.dispose();
    amountController.dispose();
    amountController1.dispose();
    amountController2.dispose();
    amountController3.dispose();
    amountController4.dispose();
    amountController5.dispose();
    amountController6.dispose();
    amountController7.dispose();
    amountController8.dispose();
    amountController9.dispose();
    amountController10.dispose();
    amountController11.dispose();
    amountController12.dispose();
    amountController13.dispose();
    amountController14.dispose();
    amountController15.dispose();
    amountController16.dispose();
    amountController17.dispose();
    amountController18.dispose();
    amountController19.dispose();
    amountController20.dispose();
    transactionIdController.dispose();
    transactionIdController1.dispose();
    transactionIdController2.dispose();
    transactionIdController3.dispose();
    transactionIdController4.dispose();
    transactionIdController5.dispose();
    transactionIdController6.dispose();
    transactionIdController7.dispose();
    transactionIdController8.dispose();
    transactionIdController9.dispose();
    transactionIdController10.dispose();
    transactionIdController11.dispose();
    transactionIdController12.dispose();
    transactionIdController13.dispose();
    transactionIdController14.dispose();
    transactionIdController15.dispose();
    transactionIdController16.dispose();
    transactionIdController17.dispose();
    transactionIdController18.dispose();
    transactionIdController19.dispose();
    transactionIdController20.dispose();
    super.dispose();
  }

  // this is the process

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Payment Receipt")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GetBuilder<AmountReceivedController>(
                      builder: (aController) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: DropdownButton(
                              hint: const Text("Select amount"),
                              isExpanded: true,
                              underline: const SizedBox(),
                              items: aController.allAmounts
                                  .map((dropDownStringItem) {
                                return DropdownMenuItem(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                _onDropDownItemSelectedCompany(
                                    newValueSelected);
                                controller.fetchCompanyAmountByName(
                                    newValueSelected
                                        .toString()
                                        .split("| ")
                                        .last
                                        .split(" ")
                                        .first);
                                setState(() {
                                  amountIsSelected = true;
                                  agentId = newValueSelected
                                      .toString()
                                      .split("*")
                                      .last;
                                  selectedCompanyId = newValueSelected
                                      .toString()
                                      .split("%")
                                      .last
                                      .split("*")
                                      .first;
                                  amountId = newValueSelected
                                      .toString()
                                      .split("| ")
                                      .last
                                      .split("")
                                      .first;
                                  selectedPrice = newValueSelected
                                      .toString()
                                      .split("|")
                                      .first
                                      .trim();
                                  // amountController.text = selectedPrice;
                                });
                                if (amountIsSelected) {
                                  showAndEnterFormNumber();
                                }
                              },
                              value: _currentSelectedCompany,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  addedForm1
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm1 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController1,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController1,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController1.text == "" ||
                                          transactionIdController1.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption1();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile1 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile1!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 20),
                  addedForm2
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm2 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController2,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController2,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController2.text == "" ||
                                          transactionIdController2.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption2();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile2 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile2!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm3
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm3 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController3,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController3,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController3.text == "" ||
                                          transactionIdController3.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption3();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile3 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile3!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm4
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm4 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController4,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController4,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController4.text == "" ||
                                          transactionIdController4.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption4();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile4 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile4!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm5
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm5 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController5,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController5,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController5.text == "" ||
                                          transactionIdController5.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption5();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile5 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile5!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm6
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm6 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController6,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController6,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController6.text == "" ||
                                          transactionIdController6.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption6();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile6 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile6!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm7
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm7 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController7,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController7,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController7.text == "" ||
                                          transactionIdController7.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption7();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile7 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile7!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm8
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm8 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController8,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController8,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController8.text == "" ||
                                          transactionIdController8.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption8();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile8 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile8!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm9
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm9 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController9,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController9,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController9.text == "" ||
                                          transactionIdController9.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption9();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile9 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile9!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm10
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm10 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController10,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController10,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController10.text == "" ||
                                          transactionIdController10.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption10();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile10 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile10!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm11
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm11 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController11,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController11,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController11.text == "" ||
                                          transactionIdController11.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption11();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile11 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile11!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm12
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm12 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController12,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController12,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController12.text == "" ||
                                          transactionIdController12.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption12();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile12 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile12!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm13
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm13 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController13,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController13,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController13.text == "" ||
                                          transactionIdController13.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption13();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile13 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile13!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm14
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm14 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController14,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController14,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController14.text == "" ||
                                          transactionIdController14.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption14();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile14 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile14!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm15
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm15 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController15,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController15,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController15.text == "" ||
                                          transactionIdController15.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption15();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile15 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile15!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm16
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm16 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController16,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController16,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController16.text == "" ||
                                          transactionIdController16.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption16();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile16 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile16!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm17
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm17 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController17,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController17,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController17.text == "" ||
                                          transactionIdController17.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption17();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile17 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile17!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm18
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm18 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController18,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController18,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController18.text == "" ||
                                          transactionIdController18.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption18();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile18 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile18!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm19
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm19 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController19,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController19,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController19.text == "" ||
                                          transactionIdController19.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption19();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile19 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile19!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  addedForm20
                      ? SlideInUp(
                          animate: true,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addedForm20 = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete_forever,
                                      color: Colors.red)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: amountController20,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Amount",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  controller: transactionIdController20,
                                  cursorColor: primaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration: InputDecoration(
                                      labelText: "Payment Id",
                                      labelStyle: const TextStyle(
                                          color: secondaryColor),
                                      focusColor: primaryColor,
                                      fillColor: primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: primaryColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter amount";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () async {
                                  amountController20.text == "" ||
                                          transactionIdController20.text == ""
                                      ? Get.snackbar("Field Error",
                                          "all fields are required",
                                          colorText: defaultTextColor1,
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: warning)
                                      : selectSourceOption20();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/upload.png",
                                        width: 40, height: 40),
                                    const Text("Upload Receipt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              imageFile20 != null
                                  ? SizedBox(
                                      width: 400,
                                      height: 160,
                                      child: Image.file(imageFile20!),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container(),
                  // post payment
                  isPosting
                      ? const LoadingUi()
                      : amountIsSelected
                          ? RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  isPosting = true;
                                });
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                } else {
                                  _uploadAndSavePayment();
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 8,
                              fillColor: primaryColor,
                              splashColor: defaultColor,
                              child: const Text(
                                "Save",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            )
                          : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onDropDownItemSelectedCompany(newValueSelected) {
    setState(() {
      _currentSelectedCompany = newValueSelected;
    });
  }
}
