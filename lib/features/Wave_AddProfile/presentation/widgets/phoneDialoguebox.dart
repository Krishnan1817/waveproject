import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waveproject/utils/const/color_const.dart';

class PhoneDialoguemodel extends StatefulWidget {
  const PhoneDialoguemodel({super.key});

  @override
  State<PhoneDialoguemodel> createState() => _PhoneDialoguemodelState();
}

class _PhoneDialoguemodelState extends State<PhoneDialoguemodel> {
  List<TextEditingController> phoneList = <TextEditingController>[
    TextEditingController(),
  ];

  void _addRow() {
    setState(() {
      phoneList.add(TextEditingController());
    });
  }

  void _removeRow(int index) {
    if (phoneList.length > 1) {
      setState(() {
        phoneList.removeAt(index);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
        backgroundColor: ColorConstants.commonbackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Phone Dialog Box',
                style: TextStyle(
                    color: ColorConstants.commonbackground,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            for (int i = 0; i < phoneList.length; i++) _buildRow(i),
          ],
        ),
      ),
    );
  }

  _buildRow(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              
              cursorColor: ColorConstants.commonbackground,
              controller: phoneList[index],
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                focusColor:  ColorConstants.commonbackground,
                labelText: "Phone number",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(0xff722020).withOpacity(0.6)),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(width: 10),
          if (phoneList.length >= 1 && index == 0)
            InkWell(
              onTap: () {
                setState(() {
                  _addRow();
                });
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          else
            InkWell(
              onTap: () {
                _removeRow(index);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
