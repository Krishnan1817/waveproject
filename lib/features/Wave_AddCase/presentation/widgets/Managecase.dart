import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:waveproject/features/Wave_AddCase/presentation/widgets/Caseprogressmanagement.dart';
import 'package:waveproject/utils/const/color_const.dart';

class ManagecaseScreen extends StatefulWidget {
  const ManagecaseScreen({super.key});

  @override
  State<ManagecaseScreen> createState() => _ManagecaseScreenState();
}

class _ManagecaseScreenState extends State<ManagecaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: ColorConstants.commonbackground),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: ColorConstants.commonbackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(FontAwesomeIcons.fileCode,
                      size: 30, color: Colors.white),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Case Progress Management',
                  style: TextStyle(
                      color: ColorConstants.commonbackground,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              // controller: heightController,
              decoration: InputDecoration(
                labelText: "Case Id",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.to(() => Caseprogressmanagement());
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffEE8787),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Krishnan',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 230,
                      ),
                      Icon(Icons.keyboard_double_arrow_right_outlined),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
