import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waveproject/utils/const/color_const.dart';

class Identification extends StatefulWidget {
  const Identification({super.key});

  @override
  State<Identification> createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  // List of rows, each with its own dropdown value and text editing controller
  List<Map<String, dynamic>> rows = [
    {
      'dropdownValue': 'Birthmark on right hand',
      'controller': TextEditingController(),
    },
  ];

  // List of identification marks for the dropdown options
  List<String> identificationMarks = [
    'Birthmark on right hand',
    'Scar on left leg',
    'Mole on back',
    'Tattoo on arm',
    'Freckles on face',
    'Other'
  ];

  // Add a new row with a new controller
  void _addRow() {
    setState(() {
      rows.add({
        'dropdownValue': 'Birthmark on right hand',
        'controller': TextEditingController(),
      });
    });
  }

  // Remove a row based on index
  void _removeRow(int index) {
    setState(() {
      rows.removeAt(index);
    });
  }

  // Show dropdown options in a bottom sheet
  void _showDropdownBottomSheet(int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: identificationMarks.map((mark) {
            return ListTile(
              title: Text(mark),
              onTap: () {
                setState(() {
                  rows[index]['dropdownValue'] = mark;
                });
                Get.back(); // Close the bottom sheet after selection
              },
            );
          }).toList(),
        );
      },
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
        backgroundColor: ColorConstants.commonbackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
               Center(
              child: Text(
                'Identification marks',
                style: TextStyle(
                    color: ColorConstants.commonbackground,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15,),
            for (int i = 0; i < rows.length; i++) _buildRow(i),
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
                      onTap: () {
                        // Get.to(() => Socialnetwork());
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Center(
                        child: Text(
                          "Save and Back",
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
            )
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
          // Container(
          //   width: 100,
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.grey),
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   child: GestureDetector(
          //     onTap: () => _showDropdownBottomSheet(index),
          //     child: Padding(
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Expanded(
          //             child: Text(
          //               rows[index]['dropdownValue'] ??
          //                   'Select Identification Mark',
          //               style: TextStyle(
          //                 color: rows[index]['dropdownValue'] == null
          //                     ? Colors.grey
          //                     : Colors.black,
          //                 fontSize: 16,
          //               ),
          //               overflow: TextOverflow.ellipsis,
          //               maxLines: 1,
          //             ),
          //           ),
          //           Icon(Icons.keyboard_arrow_down, color: Colors.black),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(width: 20),
          Expanded(
            child: TextFormField(
              controller: rows[index]['controller'],
              decoration: InputDecoration(
                labelText: "Enter Identification Details",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(width: 10),
          if (rows.length >= 1 && index == 0)
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
