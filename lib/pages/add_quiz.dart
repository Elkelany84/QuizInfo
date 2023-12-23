import 'dart:io';
// import 'dart:html';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:quiz_info/database/database.dart';
import 'package:random_string/random_string.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  ImagePicker _picker = ImagePicker();
  File? selectedImage;

  //Get Image from gallery
  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.camera);
    selectedImage = File(image!.path);
    setState(() {});
  }

//Upload Image to Firebasestorage
  uploadImage() async {
    if (selectedImage != null &&
        firstOption.text != "" &&
        secondOption.text != "" &&
        thirdOption.text != "" &&
        fourthOption.text != "") {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImage").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadImageUrl = await (await task).ref.getDownloadURL();
      Map<String, dynamic> addQuiz = {
        "image": downloadImageUrl,
        "option1": firstOption.text,
        "option2": secondOption.text,
        "option3": thirdOption.text,
        "option4": fourthOption.text,
        "correct answer": correctOption.text
      };
      await DatabaseMethods().addQuizCategory(addQuiz, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Quiz has been added Successfully!",
              style: TextStyle(fontSize: 18),
            )));
      });
    }
  }

  String? value;
  final List<String> categoriesItems = [
    "Animals",
    "Sports",
    "Random",
    "Fruits",
    "Objects",
    "Places"
  ];
  TextEditingController firstOption = TextEditingController();
  TextEditingController secondOption = TextEditingController();
  TextEditingController thirdOption = TextEditingController();
  TextEditingController fourthOption = TextEditingController();
  TextEditingController correctOption = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Quiz',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Quiz Picture",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              selectedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   "Option1",
              //   style: TextStyle(
              //       color: Colors.black54,
              //       fontSize: 30,
              //       fontWeight: FontWeight.w500),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: firstOption,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Option 1",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: secondOption,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Option 2",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: thirdOption,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Option 3",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: fourthOption,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Option 4",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Correct Answer",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: correctOption,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Correct Answer",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  items: categoriesItems
                      .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          )))
                      .toList(),
                  onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                  dropdownColor: Colors.white,
                  hint: Text("Select Category"),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  iconSize: 36,
                  value: value,
                )),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  uploadImage();
                },
                child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
