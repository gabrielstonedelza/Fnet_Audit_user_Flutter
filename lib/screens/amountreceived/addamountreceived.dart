import 'package:audit_user/widgets/loadingui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart' as myGet;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../constants/app_colors.dart';
import '../../controller/companiescontroller.dart';
import '../homepage.dart';
import 'dart:io';

class AddAmountReceived extends StatefulWidget {
  const AddAmountReceived({super.key});

  @override
  State<AddAmountReceived> createState() => _AddAmountReceivedState();
}

class _AddAmountReceivedState extends State<AddAmountReceived> {
  final CompanyController controller = Get.find();
  late String uToken = "";
  final storage = GetStorage();
  bool isLoading = true;
  bool isUploading = false;

  final _formKey = GlobalKey<FormState>();

  bool isPosting = false;
  var _currentSelectedCompany = "Select company";
  late final TextEditingController amountReceivedController;
  late final TextEditingController transactionIdController;
  late final TextEditingController _d200Controller;
  late final TextEditingController _d100Controller;
  late final TextEditingController _d50Controller;
  late final TextEditingController _d20Controller;
  late final TextEditingController _d10Controller;
  late final TextEditingController _d5Controller;
  late final TextEditingController _d2Controller;
  late final TextEditingController _d1Controller;

  FocusNode d200FocusNode = FocusNode();
  FocusNode d100FocusNode = FocusNode();
  FocusNode d50FocusNode = FocusNode();
  FocusNode d20FocusNode = FocusNode();
  FocusNode d10FocusNode = FocusNode();
  FocusNode d5FocusNode = FocusNode();
  FocusNode d2FocusNode = FocusNode();
  FocusNode d1FocusNode = FocusNode();

  late int d200 = 0;
  late int d100 = 0;
  late int d50 = 0;
  late int d20 = 0;
  late int d10 = 0;
  late int d5 = 0;
  late int d2 = 0;
  late int d1 = 0;
  late int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (storage.read("token") != null) {
      setState(() {
        uToken = storage.read("token");
      });
    }
    amountReceivedController = TextEditingController();
    transactionIdController = TextEditingController();
    _d200Controller = TextEditingController();
    _d100Controller = TextEditingController();
    _d50Controller = TextEditingController();
    _d20Controller = TextEditingController();
    _d10Controller = TextEditingController();
    _d5Controller = TextEditingController();
    _d2Controller = TextEditingController();
    _d1Controller = TextEditingController();
    controller.fetchAllMyCompanies();
  }

  File? image;
  Future getFromGallery(String amountReceived) async {
    try {
      final myImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (myImage == null) return;
      final imageTemporary = File(myImage.path);
      setState(() {
        image = imageTemporary;
      });
      if (image != null) {
        // uploadAmountReceivedWithReceipt(image!, amountReceived);
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
  }

  final picker = ImagePicker();
  File? imageFile;
  void showInstalled() {
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
                      _imgFromGallery();
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
                      _imgFromCamera();
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

  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _cropImage(File imgFile) async {
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
        imageFile = File(croppedFile.path);
        // uploadAmountReceivedWithReceipt(imageFile!);
      });
      // reload();
    }
  }

  var dio = Dio();
  bool isUpLoading = false;
  void _startPosting() async {
    setState(() {
      isPosting = true;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isPosting = false;
    });
  }

  void _uploadAndSaveAmountReceived(File file) async {
    try {
      isUpLoading = true;
      //updating user profile details
      String fileName = file.path.split('/').last;
      var formData1 = FormData.fromMap({
        'amount_received': amountReceivedController.text,
        'company': controller.companyId,
        'transaction_id': transactionIdController.text,
        'receipt': await MultipartFile.fromFile(file.path, filename: fileName),
        "d_200": _d200Controller.text.trim(),
        "d_100": _d100Controller.text.trim(),
        "d_50": _d50Controller.text.trim(),
        "d_20": _d20Controller.text.trim(),
        "d_10": _d10Controller.text.trim(),
        "d_5": _d5Controller.text.trim(),
        "d_2": _d2Controller.text.trim(),
        "d_1": _d1Controller.text.trim(),
      });
      var response = await dio.post(
        'https://agencybankingnetwork.com/add_new_company_amount_received/${controller.companyEmail}/',
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
        Get.snackbar("Hurray 😀", "Your data sent successfully.",
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: primaryColor,
            duration: const Duration(seconds: 5));
        setState(() {
          isPosting = false;
        });
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

  @override
  void dispose() {
    // TODO: implement dispose
    amountReceivedController.dispose();
    transactionIdController.dispose();
    _d200Controller.dispose();
    _d100Controller.dispose();
    _d50Controller.dispose();
    _d20Controller.dispose();
    _d10Controller.dispose();
    _d5Controller.dispose();
    _d2Controller.dispose();
    _d1Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Receipt"),
          actions: [
            IconButton(
              onPressed: () {
                controller.fetchAllMyCompanies();
              },
              icon: const Icon(
                Icons.refresh_sharp,
                color: defaultTextColor1,
                size: 30,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: DropdownButton(
                            hint: const Text("Select company"),
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: controller.myCompanies
                                .map((dropDownStringItem) {
                              return DropdownMenuItem(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            onChanged: (newValueSelected) {
                              _onDropDownItemSelectedCompany(newValueSelected);
                              controller.fetchCompanyByName(
                                  newValueSelected.toString());
                            },
                            value: _currentSelectedCompany,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TextFormField(
                        controller: amountReceivedController,
                        cursorColor: primaryColor,
                        cursorRadius: const Radius.elliptical(10, 10),
                        cursorWidth: 10,
                        decoration: InputDecoration(
                            labelText: "Amount Received",
                            labelStyle: const TextStyle(color: secondaryColor),
                            focusColor: primaryColor,
                            fillColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: primaryColor, width: 2),
                                borderRadius: BorderRadius.circular(12)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
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
                        controller: transactionIdController,
                        cursorColor: primaryColor,
                        cursorRadius: const Radius.elliptical(10, 10),
                        cursorWidth: 10,
                        decoration: InputDecoration(
                            labelText: "Receipt Number",
                            labelStyle: const TextStyle(color: secondaryColor),
                            focusColor: primaryColor,
                            fillColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: primaryColor, width: 2),
                                borderRadius: BorderRadius.circular(12)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter amount";
                          }
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  onChanged: (value) {
                                    var dt = 0;
                                    if (value.isEmpty) {
                                      setState(() {
                                        dt = 0;
                                        d200 = 0;
                                      });
                                    } else {
                                      setState(() {
                                        dt = int.parse(value) * 200;
                                        d200 = dt;
                                      });
                                    }
                                  },
                                  focusNode: d200FocusNode,
                                  controller: _d200Controller,
                                  cursorColor: secondaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration:
                                      buildInputDecoration("200 GHC Notes"),
                                  keyboardType: TextInputType.number,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12),
                                  child: Text(
                                    d200.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  onChanged: (value) {
                                    // var dt =
                                    //     int.parse(value) * 100;
                                    // setState(() {
                                    //   d100 = dt;
                                    // });

                                    var dt = 0;
                                    if (value.isEmpty) {
                                      setState(() {
                                        dt = 0;
                                        d100 = 0;
                                      });
                                    } else {
                                      setState(() {
                                        dt = int.parse(value) * 100;
                                        d100 = dt;
                                      });
                                    }
                                  },
                                  controller: _d100Controller,
                                  focusNode: d100FocusNode,
                                  cursorColor: secondaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration:
                                      buildInputDecoration("100 GHC Notes"),
                                  keyboardType: TextInputType.number,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12),
                                  child: Text(
                                    d100.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  onChanged: (value) {
                                    // var dt =
                                    //     int.parse(value) * 50;
                                    // setState(() {
                                    //   d50 = dt;
                                    // });

                                    var dt = 0;
                                    if (value.isEmpty) {
                                      setState(() {
                                        dt = 0;
                                        d50 = 0;
                                      });
                                    } else {
                                      setState(() {
                                        dt = int.parse(value) * 50;
                                        d50 = dt;
                                      });
                                    }
                                  },
                                  focusNode: d50FocusNode,
                                  controller: _d50Controller,
                                  cursorColor: secondaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration:
                                      buildInputDecoration("50 GHC Notes"),
                                  keyboardType: TextInputType.number,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12),
                                  child: Text(
                                    d50.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  onChanged: (value) {
                                    // var dt =
                                    //     int.parse(value) * 20;
                                    // setState(() {
                                    //   d20 = dt;
                                    // });
                                    //
                                    var dt = 0;
                                    if (value.isEmpty) {
                                      setState(() {
                                        dt = 0;
                                        d20 = 0;
                                      });
                                    } else {
                                      setState(() {
                                        dt = int.parse(value) * 20;
                                        d20 = dt;
                                      });
                                    }
                                  },
                                  focusNode: d20FocusNode,
                                  controller: _d20Controller,
                                  cursorColor: secondaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration:
                                      buildInputDecoration("20 GHC Notes"),
                                  keyboardType: TextInputType.number,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12),
                                  child: Text(
                                    d20.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  onChanged: (value) {
                                    // var dt =
                                    //     int.parse(value) * 10;
                                    // setState(() {
                                    //   d10 = dt;
                                    // });
                                    var dt = 0;
                                    if (value.isEmpty) {
                                      setState(() {
                                        dt = 0;
                                        d10 = 0;
                                      });
                                    } else {
                                      setState(() {
                                        dt = int.parse(value) * 10;
                                        d10 = dt;
                                      });
                                    }
                                  },
                                  focusNode: d10FocusNode,
                                  controller: _d10Controller,
                                  cursorColor: secondaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration:
                                      buildInputDecoration("10 GHC Notes"),
                                  keyboardType: TextInputType.number,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12),
                                  child: Text(
                                    d10.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  onChanged: (value) {
                                    // var dt =
                                    //     int.parse(value) * 5;
                                    // setState(() {
                                    //   d5 = dt;
                                    // });

                                    var dt = 0;
                                    if (value.isEmpty) {
                                      setState(() {
                                        dt = 0;
                                        d5 = 0;
                                      });
                                    } else {
                                      setState(() {
                                        dt = int.parse(value) * 5;
                                        d5 = dt;
                                      });
                                    }
                                  },
                                  focusNode: d5FocusNode,
                                  controller: _d5Controller,
                                  cursorColor: secondaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration:
                                      buildInputDecoration("5 GHC Notes"),
                                  keyboardType: TextInputType.number,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12),
                                  child: Text(
                                    d5.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  onChanged: (value) {
                                    // var dt =
                                    //     int.parse(value) * 2;
                                    // setState(() {
                                    //   d2 = dt;
                                    // });
                                    var dt = 0;
                                    if (value.isEmpty) {
                                      setState(() {
                                        dt = 0;
                                        d2 = 0;
                                      });
                                    } else {
                                      setState(() {
                                        dt = int.parse(value) * 2;
                                        d2 = dt;
                                      });
                                    }
                                  },
                                  focusNode: d2FocusNode,
                                  controller: _d2Controller,
                                  cursorColor: secondaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration:
                                      buildInputDecoration("2GHC Notes"),
                                  keyboardType: TextInputType.number,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12),
                                  child: Text(
                                    d2.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  onChanged: (value) {
                                    var dt = 0;
                                    if (value.isEmpty) {
                                      setState(() {
                                        dt = 0;
                                        d1 = 0;
                                      });
                                    } else {
                                      setState(() {
                                        dt = int.parse(value) * 1;
                                        d1 = dt;
                                      });
                                    }
                                  },
                                  focusNode: d1FocusNode,
                                  controller: _d1Controller,
                                  cursorColor: secondaryColor,
                                  cursorRadius: const Radius.elliptical(10, 10),
                                  cursorWidth: 10,
                                  decoration:
                                      buildInputDecoration("1 GHC Notes"),
                                  keyboardType: TextInputType.number,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12),
                                  child: Text(
                                    d1.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        amountReceivedController.text == ""
                            ? Get.snackbar(
                                "Amount Error", "enter amount received first",
                                colorText: defaultTextColor1,
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 5),
                                backgroundColor: warning)
                            : showInstalled();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/upload.png",
                              width: 40, height: 40),
                          const Text("Upload Receipt",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    isPosting
                        ? const LoadingUi()
                        : RawMaterialButton(
                            onPressed: () {
                              _startPosting();
                              if (!_formKey.currentState!.validate()) {
                                return;
                              } else {
                                // uploadDetails();
                                var mainTotal = d200 +
                                    d100 +
                                    d50 +
                                    d20 +
                                    d10 +
                                    d5 +
                                    d2 +
                                    d1;
                                setState(() {
                                  total = mainTotal;
                                });
                                if (int.parse(amountReceivedController.text) !=
                                    mainTotal) {
                                  Get.snackbar("Total Error",
                                      "Your total should be equal to the amount",
                                      colorText: Colors.white,
                                      backgroundColor: Colors.red,
                                      snackPosition: SnackPosition.BOTTOM,
                                      duration: const Duration(seconds: 5));
                                  return;
                                } else {
                                  _uploadAndSaveAmountReceived(imageFile!);
                                }
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
                          ),
                    //   show uploaded image here

                    imageFile != null
                        ? SizedBox(
                            width: 400,
                            height: 160,
                            child: Image.file(imageFile!),
                          )
                        : Container(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  void _onDropDownItemSelectedCompany(newValueSelected) {
    setState(() {
      _currentSelectedCompany = newValueSelected;
    });
  }

  InputDecoration buildInputDecoration(String text) {
    return InputDecoration(
      labelStyle: const TextStyle(color: secondaryColor),
      labelText: text,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondaryColor, width: 2),
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
