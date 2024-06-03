import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../design/app_image.dart';
class ChooseImageSheet extends StatelessWidget {
  const ChooseImageSheet ({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                  onTap: ()async{
                    // todo: open camera to take image
                  XFile? result=await  ImagePicker().pickImage(source:ImageSource.camera);
                  print("result :");
print(result?.path);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        APPImage("camera.svg"),
                        Text(
                          "Camera",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 72,
                ),
                GestureDetector(
                  onTap: (){
                    // todo: open gallery to choose image

                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        APPImage("gallery.svg"),
                        Text(
                          "Gallery",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
