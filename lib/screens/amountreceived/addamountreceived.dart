import 'package:audit_user/widgets/loadingui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Amount"),
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
                            labelText: "Transaction Id",
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
                                _uploadAndSaveAmountReceived(imageFile!);
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
                        : Container()
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
}
