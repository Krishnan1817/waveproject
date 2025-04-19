import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waveproject/utils/const/color_const.dart';

class CourtHiringScreen extends StatefulWidget {
  const CourtHiringScreen({super.key});

  @override
  State<CourtHiringScreen> createState() => _CourtHiringScreenState();
}

class _CourtHiringScreenState extends State<CourtHiringScreen> {
  final TextEditingController _ptcaseIdController = TextEditingController();
  final TextEditingController nextHiring = TextEditingController();
  final List<String> reasonForPostponed = ['reason1', 'reason2', 'reason3'];
  DateTime? selectedDate;

  List<Map<String, dynamic>> rows = [
    {
      'nameController': TextEditingController(),
      'selectedReason': '',
      'isTapped': false,
    }
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: ColorConstants.commonbackground,
            colorScheme:
                ColorScheme.light(primary: ColorConstants.commonbackground),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        nextHiring.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _showDropdownBottomSheet(int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 300,
          child: Column(
            children: [
              Text(
                "Select Reason",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: reasonForPostponed.length,
                itemBuilder: (context, idx) {
                  return ListTile(
                    title: Text(reasonForPostponed[idx]),
                    onTap: () {
                      setState(() {
                        rows[index]['selectedReason'] = reasonForPostponed[idx];
                      });
                      Get.back();
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _addRow() {
    setState(() {
      rows.add({
        'nameController': TextEditingController(),
        'selectedReason': '',
        'isTapped': false,
      });
    });
  }

  void _removeRow(int index) {
    setState(() {
      rows.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Case Process Management",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorConstants.commonbackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _ptcaseIdController,
              decoration: InputDecoration(
                labelText: 'PT case Id',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: nextHiring,
              decoration: InputDecoration(
                labelText: "Next Hiring Date",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ),
              readOnly: true,
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: rows.length,
              itemBuilder: (context, index) {
                final row = rows[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: row['nameController'],
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => _showDropdownBottomSheet(index),
                        child: Container(
                          height: 55,
                          width: 130,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  row['selectedReason'].isEmpty
                                      ? 'Postponed for'
                                      : row['selectedReason'],
                                  style: TextStyle(
                                    color: row['selectedReason'].isEmpty
                                        ? Colors.grey
                                        : Colors.black,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            row['isTapped'] = !row['isTapped'];
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: row['isTapped'] ? Colors.red : Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'NBW',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.calendar_month,size: 40,)
                      // Add or Remove button
                      // GestureDetector(
                      //   onTap: () {
                      //     if (index == 0) {
                      //       _addRow();
                      //     } else {
                      //       _removeRow(index);
                      //     }
                      //   },
                      //   child: Container(
                      //     width: 40,
                      //     height: 40,
                      //     decoration: BoxDecoration(
                      //       color: index == 0 ? Colors.green : Colors.red,
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //     child: Icon(
                      //       index == 0 ? Icons.add : Icons.remove,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
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
                      onTap: () {
                        // Get.to(() => Socialnetwork());
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Center(
                        child: Text(
                          "Save and Exit",
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
}
