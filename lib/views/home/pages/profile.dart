import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/design/app_button.dart';
import 'package:project/design/app_image.dart';
import 'package:project/design/app_input.dart';
const profileImage="https://engineering.unl.edu/images/staff/Kayla-Person.jpg";
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  XFile? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Center(
            child: Container(
              // color: Colors.yellow,
              height: 160,
              width: 160,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ClipOval(
                    child: APPImage(
              selectedImage!=null ? selectedImage!.path:  profileImage,
                      height: 160,
                      width: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if(selectedImage!=null)
                    Image.file(File(selectedImage!.path)),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          builder: (context) => Container(
                              padding: EdgeInsets.all(24).copyWith(top: 50),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pick Image From...",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 29,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap:()=>chooseImage(ImageSource.camera) ,
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Column(
                                            children: [
                                              APPImage("camera.svg"),
                                              Text(
                                                "Camera",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 72,
                                      ),
                                      GestureDetector(
                                         onTap:()=>chooseImage(ImageSource.gallery),
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Column(
                                            children: [
                                              APPImage("gallery.svg"),
                                              Text(
                                                "Gallery",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )),
                        );
                      },
                      child: CircleAvatar(
                        child: APPImage("edit.svg"),
                        radius: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: 34,
          ),
          AppInput(label: "Name"),
          AppInput(label: "Phone"),
          Row(
            children: [
              Expanded(child: AppInput(label: "Age")),
              SizedBox(
                width: 12,
              ),
              Expanded(child: AppInput(label: "Gender")),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          AppButton(
            onPressed: () {},
            text: "Save",
          ),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(fontSize: 16),
                  ),
                  APPImage(
                    "edit.svg",
                    color: Colors.black,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

  }
  void chooseImage(ImageSource source) async {
  // todo: open camera to take image
  XFile? result = await ImagePicker().pickImage(source: source);
  print("result :");
  print(result?.path);
  Navigator.pop(context);
  if (result != null) {
  selectedImage = result;
  setState(() {});
  }
}
}
