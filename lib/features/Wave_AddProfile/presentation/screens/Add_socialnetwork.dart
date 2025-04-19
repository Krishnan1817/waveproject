import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/screens/Add_physical_status.dart';
import 'package:waveproject/utils/const/color_const.dart';

class Socialnetwork extends StatefulWidget {
  const Socialnetwork({super.key});

  @override
  State<Socialnetwork> createState() => _SocialnetworkState();
}

class _SocialnetworkState extends State<Socialnetwork> {
  final List<String> familyList = [
    "Father",
    "Mother",
    "Wife",
    "Brother",
    "Son",
    "Daughter",
    "Advocate",
    "Concubine"
  ];

  List<Map<String, dynamic>> dynamicRows = [
    {"relation": null, "controller": TextEditingController()},
  ];

  void _showFamilySelection(int index) async {
    String? selected = await showModalBottomSheet<String>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return ListView(
          padding: EdgeInsets.all(15),
          shrinkWrap: true,
          children: familyList.map((family) {
            return ListTile(
              title: Text(family),
              onTap: () {
                Navigator.pop(context, family);
              },
            );
          }).toList(),
        );
      },
    );

    if (selected != null) {
      setState(() {
        dynamicRows[index]["relation"] = selected;
      });
    }
  }

  void _addRow() {
    setState(() {
      dynamicRows
          .add({"relation": null, "controller": TextEditingController()});
    });
  }

  void _removeRow(int index) {
    setState(() {
      dynamicRows.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.commonbackground,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text('Social Network', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            _buildIconTitleRow(),
            SizedBox(height: 20),
            ...dynamicRows.asMap().entries.map((entry) {
              int index = entry.key;
              var row = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: () => _showFamilySelection(index),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                row["relation"] ?? "Select",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: row["controller"],
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: index == 0 ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: index == 0 ? _addRow : () => _removeRow(index),
                        child: Icon(
                          index == 0 ? Icons.add : Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
            Spacer(),
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
                      onTap: () {
                        Get.to(() => Physicaldetails());
                      },
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
          ],
        ),
      ),
    );
  }

  Widget _buildIconTitleRow() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: ColorConstants.commonbackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.people_outline, color: Colors.white),
        ),
        SizedBox(width: 20),
        Text(
          'Social Network',
          style: TextStyle(
            color: ColorConstants.commonbackground,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
