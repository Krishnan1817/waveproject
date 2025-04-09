import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/screens/Add_profile.dart';

import '../../../../utils/const/color_const.dart';

class Assign_Associates_screen extends StatefulWidget {
  const Assign_Associates_screen({super.key});

  @override
  State<Assign_Associates_screen> createState() =>
      _Assign_Associates_screenState();
}

class _Assign_Associates_screenState extends State<Assign_Associates_screen> {
  List<Widget> _dynamicContainers = [];
  final TextEditingController _generateIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dynamicContainers.add(_buildDynamicContainer(isFirstRow: true));
  }

  Widget _buildDynamicContainer({required bool isFirstRow}) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.to(() => AddProfilePage());
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name', style: TextStyle(fontSize: 16)),
                  Icon(Icons.group, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        isFirstRow
            ? IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _dynamicContainers
                        .add(_buildDynamicContainer(isFirstRow: false));
                  });
                },
              )
            : IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    _dynamicContainers.removeAt(_dynamicContainers.length - 1);
                  });
                },
              ),
      ],
    );
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
        title: Text(
          "Assign Associates & Rivals",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorConstants.commonbackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _generateIdController,
              decoration: InputDecoration(
                labelText: 'Generate ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: _dynamicContainers
                  .map((container) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: container,
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF722020),
                          Color(0xFFC63333),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF722020),
                          Color(0xFFC63333),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12),
                      child: Center(
                        child: Text(
                          "Save and Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
