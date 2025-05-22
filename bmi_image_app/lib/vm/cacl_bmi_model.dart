import 'package:flutter/material.dart';

class CaclBmiModel with ChangeNotifier {
  double height = 0;
  double weight = 0;
  double bmi = 0;

  String result = "";
  String resultStr = "";
  String bmiImage = 'images/bmi.png';

  void calcutlateBMI(double heightCm, double weightKg){
    double h = heightCm /100;
    bmi = double.parse((weightKg /(h*h)).toStringAsFixed(1));

    if(bmi<=18.4){
      resultStr ="저체중";
      bmiImage = 'images/underweight.png';
    }else if(bmi <= 22.9){
      resultStr = "정상체중";
      bmiImage = 'images/normal.png';
    }else if(bmi <=24.9){
      resultStr = "과체중";
      bmiImage = 'images/risk.png';
    }else if(bmi <=29.9){
      resultStr = "비만";
      bmiImage = 'images/overweight.png';
    }else{
      resultStr = "고도미만";
      bmiImage = 'images/obese.png';
    }

    result = "귀하의 bmi지수는 $bmi 이고\n$resultStr 입니다.";
    notifyListeners();
  }

}


















































// import 'package:flutter/material.dart';


// class BmiModel with ChangeNotifier{

//   double weight = 0;
//   double height = 0;

//   double resultBMI = 0.0;
//   String image = '';

//   void caldBMI(double w,double h){
//     resultBMI = w / ((h / 100) * (h / 100));
//     image = 'images/bmi.png';
//     if(resultBMI>=30){
//       Image.asset(
//         image ='images/obese.png'
//       );
//     }else if(resultBMI>= 25 && resultBMI<= 29.9){
//       Image.asset(
//         'images/overweight.png'
//       );
//     }else if(resultBMI>= 23 && resultBMI<= 24.9){
//       Image.asset(
//         'images/risk.png'
//       );
//     }else if(resultBMI>= 18.5 && resultBMI<= 22.9){
//       Image.asset(
//         'images/nomal.png'
//       );
//     }else if(resultBMI>= 0 && resultBMI<= 18.4){
//       Image.asset(
//         'images/nomal.png'
//       );
//     }
//     notifyListeners();
//   }

//   void clear(){
//     weight = 0;
//     height = 0;
//     notifyListeners();
//   }


  
// }