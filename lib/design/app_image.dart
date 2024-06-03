import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class APPImage extends StatelessWidget {
  const APPImage(this.path,{
    super.key,
    this.height,
    this.width,
    this.color
    , this.fit=BoxFit.scaleDown});
  final String path ;
  final double? height , width;
  final Color? color;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    if(path.contains("com.amit.amit_63_online/cache"))
      {
        return Image.file(
          File(path),
          height:height,
          width:width,
          fit:fit,
          errorBuilder: (context, error, stackTrace) => _errorWidget(),
          color:color,);
      }else
    if(path.startsWith("http"))
      {
        return Image.network(path,
          height: height,
          color: color,
          width: width,
          fit: fit,
          errorBuilder:(context, error, stackTrace) =>  _errorWidget(),
        );
      }else if (path.endsWith("svg"))
        {
          return SvgPicture.asset("assets/svg/$path",
            colorFilter: color!=null
                ?ColorFilter.mode(
                color!,  BlendMode.srcIn
            ):null,
            height: height,
            color: color,
            fit: fit,
            width: width,);
        }else if(path.endsWith("png")||path.endsWith("jpg"))
        {
          return Image.asset(
            "assets/images/$path",
            color: color,
            height: height,
            width: width,
            fit: fit,
            errorBuilder:(context, error, stackTrace) =>  _errorWidget(),
          );
    }
    return _errorWidget();

  }
  Widget _errorWidget(){
    return APPImage(
       "image_failed.png",
      height: height,
      width: width,
    );
  }
}
