import 'package:bmi_image_app/vm/cacl_bmi_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CaclBmiModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI 계산기'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: heightController,
              decoration: InputDecoration(
                labelText: "신장을 입력하세요(cm)"
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: weightController,
              decoration: InputDecoration(
                labelText: "몸무게를 입력하세요(kg)"
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate(context), 
                  child: Text('BMI 계산')
                ),
            // ElevatedButton(
            //   onPressed: () => removeAction(context), 
            //   child: Text('지우기')
            // ),
              ],
            ),
            Text(
              state.result
            ),
            Image.asset(
              state.bmiImage
            ),
          ],
        ),
      ),
    );
  }//builc
  //--function--

  void _calculate(BuildContext context){
    final heightText = heightController.text.trim();
    final weightText = weightController.text.trim();

    if(heightText.isEmpty || weightText.isEmpty){
      _errSnackBar();
      return;
    }else{
      final height = double.tryParse(heightText) ?? 0;
      final weight = double.tryParse(weightText) ?? 0;

      context.read<CaclBmiModel>().calcutlateBMI(height, weight);
    }
  }

  // removeAction(BuildContext context){

  // }


  void _errSnackBar(){
    Get.snackbar(
      'Error',
      '숫자를 입력하세요',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
      colorText: Colors.white
    );
  }
}//class