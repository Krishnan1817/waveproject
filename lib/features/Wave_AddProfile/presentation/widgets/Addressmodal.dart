import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waveproject/utils/const/color_const.dart';

class AddressDialogscreen extends StatefulWidget {
  const AddressDialogscreen({super.key});

  @override
  State<AddressDialogscreen> createState() => _AddressDialogscreenState();
}

class _AddressDialogscreenState extends State<AddressDialogscreen> {
  TextEditingController doorNoController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController villageController = TextEditingController();

  // Selected dropdown values
  String? selectedState;
  String? selectedDistrict;
  String? selectedPoliceStation;

  // Options for dropdowns
  List<String> states = ['TamilNadu', 'Kerala', 'Andhra', 'Karnataka', 'Delhi'];
  List<String> districts = [
    'Tirunelveli',
    'Tenkasi',
    'Tuticorin',
    'Virudhunagar',
    'Trichy',
    'Madurai'
  ];
  List<String> policeStations = ['Station 1', 'Station 2', 'Station 3'];

  // Show bottom sheet to select value for dropdown
  void _showDropdownBottomSheet(
      String type, List<String> options, Function(String) onSelected) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: options.map((option) {
            return ListTile(
              title: Text(option),
              onTap: () {
                onSelected(option);
                Get.back(); // Close bottom sheet after selection
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Address Dialog Modal',
                  style: TextStyle(
                      color: ColorConstants.commonbackground,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              _buildTextFormField(doorNoController, "Door No"),
              SizedBox(height: 16),

              _buildTextFormField(streetController, "Street"),
              SizedBox(height: 16),
              _buildTextFormField(landmarkController, "Landmark"),
              SizedBox(height: 16),
              _buildTextFormField(villageController, "Village"),
              SizedBox(height: 16),

              // State Dropdown
              _buildDropdownField('State', selectedState, states, (value) {
                setState(() {
                  selectedState = value;
                });
              }),
              SizedBox(height: 16),

              // District Dropdown
              _buildDropdownField('District', selectedDistrict, districts,
                  (value) {
                setState(() {
                  selectedDistrict = value;
                });
              }),
              SizedBox(height: 16),

              // Police Station Dropdown
              _buildDropdownField(
                  'Police Station', selectedPoliceStation, policeStations,
                  (value) {
                setState(() {
                  selectedPoliceStation = value;
                });
              }),
              SizedBox(height: 16),

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
                            "Save",
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
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  // Method to create Dropdown fields
  Widget _buildDropdownField(String label, String? selectedValue,
      List<String> options, Function(String) onSelected) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _showDropdownBottomSheet(label, options, onSelected),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedValue ?? 'Select $label',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
