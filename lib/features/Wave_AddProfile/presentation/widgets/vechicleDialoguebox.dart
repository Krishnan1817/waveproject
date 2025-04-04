import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waveproject/utils/const/color_const.dart';

class VechiclemodalScreen extends StatefulWidget {
  const VechiclemodalScreen({super.key});

  @override
  State<VechiclemodalScreen> createState() => _VechiclemodalScreenState();
}

class _VechiclemodalScreenState extends State<VechiclemodalScreen> {
  List<Map<String, dynamic>> _vehicleRows = [];
  final List<String> _vehicleTypes = ['Car', 'Bike', 'Truck', 'Bus'];

  @override
  void initState() {
    super.initState();
    _vehicleRows.add({
      'selectedVehicleType': null,
      'vehicleNumberController': TextEditingController(),
    });
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
                "Select Vehicle Type",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _vehicleTypes.length,
                itemBuilder: (context, vehicleIndex) {
                  return ListTile(
                    title: Text(_vehicleTypes[vehicleIndex]),
                    onTap: () {
                      setState(() {
                        _vehicleRows[index]['selectedVehicleType'] =
                            _vehicleTypes[vehicleIndex];
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
      _vehicleRows.add({
        'selectedVehicleType': null,
        'vehicleNumberController': TextEditingController(),
      });
    });
  }

  void _removeRow(int index) {
    setState(() {
      _vehicleRows.removeAt(index);
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
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorConstants.commonbackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'Vehicle Modal',
                style: TextStyle(
                    color: ColorConstants.commonbackground,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _vehicleRows.length,
                itemBuilder: (context, index) {
                  bool isFirstRow = index == 0;
                  return Column(
                    children: [
                      if (index > 0) SizedBox(height: 20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => _showDropdownBottomSheet(index),
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    _vehicleRows[index]
                                            ['selectedVehicleType'] ??
                                        'Select Vehicle',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Icon(Icons.keyboard_arrow_down,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: TextFormField(
                              controller: _vehicleRows[index]
                                  ['vehicleNumberController'],
                              decoration: InputDecoration(
                                labelText: 'Vehicle Number',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 12.0),
                                isDense: true,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          InkWell(
                            onTap: () {
                              if (isFirstRow) {
                                _addRow();
                              } else {
                                _removeRow(index);
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Center(
                                  child: Icon(
                                      isFirstRow ? Icons.add : Icons.remove)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
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
}
