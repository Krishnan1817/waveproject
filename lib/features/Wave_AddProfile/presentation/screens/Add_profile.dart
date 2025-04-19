import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/screens/Add_profile_second.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/widgets/Addressmodal.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/widgets/phoneDialoguebox.dart';
import 'package:waveproject/utils/const/color_const.dart';

class AddProfilePage extends StatefulWidget {
  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  String? criminalCategory;
  String? subCategory;
  String? criminalType;
  String? gender;
  DateTime? selectedDate;
  String? nationality;
  String? religion;
  String? casteCommunity;
  String? maritalStatus;
  String? educationQualification;
  String? profession;
  bool convertToprofile = false;
  final ImagePicker _picker = ImagePicker();
  File? _pickedImage;

  int profiletab = 1;
  final TextEditingController searchID = TextEditingController();
  final TextEditingController udaiController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aliasController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController parentageController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.greenAccent,
            colorScheme: ColorScheme.light(primary: Colors.greenAccent),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _showBottomSheet(List<String> options, Function(String) onSelect) {
    TextEditingController searchController = TextEditingController();
    List<String> filteredOptions = List.from(options);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            void _filterOptions(String query) {
              setModalState(() {
                filteredOptions = options
                    .where((option) =>
                        option.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              });
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: searchController,
                    onChanged: _filterOptions,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.5,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredOptions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredOptions[index]),
                          onTap: () {
                            onSelect(filteredOptions[index]);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDropdown(String title, String? selectedValue,
      List<String> options, Function(String) onSelect) {
    return GestureDetector(
      onTap: () => _showBottomSheet(options, onSelect),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedValue ?? "Select $title",
              style: TextStyle(
                color: selectedValue == null ? Colors.black : Colors.black,
                fontSize: 16,
              ),
            ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
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
            "Add Profile",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ColorConstants.commonbackground),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Center(
                      child: Text(
                        'Convert to Profile',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(width: 20),
                    Switch(
                      activeColor: ColorConstants.commonbackground,
                      value: convertToprofile,
                      onChanged: (value) {
                        setState(() {
                          convertToprofile = value;
                        });
                      },
                    ),
                  ],
                ),
                Visibility(
                  visible: convertToprofile,
                  child: Row(
                    children: [
                      _pickedImage != null
                          ? Image.file(
                              _pickedImage!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : Container(),
                      _pickedImage != null ? SizedBox(width: 20) : SizedBox(),
                      InkWell(
                        onTap: () async {
                          final XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            setState(() {
                              _pickedImage = File(image.path);
                            });
                          }
                        },
                        child: Icon(FontAwesomeIcons.camera, size: 35),
                      ),
                      SizedBox(width: 15),
                      Text("Assign as Gang Leader"),
                      Checkbox(
                        activeColor: ColorConstants.commonbackground,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Visibility(
                  visible: !convertToprofile,
                  child: TextFormField(
                    controller: searchID,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 140),
                        labelText: "SEARCH ID",
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: !convertToprofile ? 10 : 0),
                TextFormField(
                  controller: udaiController,
                  decoration: InputDecoration(
                      labelText: "UDAI No", border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: convertToprofile ? 10 : 0),
                Visibility(
                  visible: convertToprofile,
                  child: _buildDropdown(
                      "Criminal Category",
                      criminalCategory,
                      ["Category A", "Category B", "Category C"],
                      (value) => setState(() => criminalCategory = value)),
                ),
                SizedBox(height: convertToprofile ? 10 : 0),
                Visibility(
                  visible: convertToprofile,
                  child: _buildDropdown(
                      "Sub Category",
                      subCategory,
                      ["Subcategory 1", "Subcategory 2", "Subcategory 3"],
                      (value) => setState(() => subCategory = value)),
                ),
                SizedBox(height: convertToprofile ? 10 : 0),
                Visibility(
                  visible: convertToprofile,
                  child: _buildDropdown(
                      "Type of Criminal",
                      criminalType,
                      ["Type 1", "Type 2", "Type 3"],
                      (value) => setState(() => criminalType = value)),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Name", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: aliasController,
                  decoration: InputDecoration(
                      labelText: "Alias Name", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: reasonController,
                  decoration: InputDecoration(
                      labelText: "Reason", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: parentageController,
                  decoration: InputDecoration(
                      labelText: "Parentage Name",
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: dobController,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  readOnly: true,
                ),
                SizedBox(height: 10),
                _buildDropdown("Gender", gender, ["Male", "Female", "Other"],
                    (value) => setState(() => gender = value)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF722020),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.to(() => PhoneDialoguemodel());
                        },
                        icon: Icon(Icons.phone, color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF722020),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.to(() => AddressDialogscreen());
                        },
                        icon: Icon(Icons.home, color: Colors.white),
                      ),
                    ),
                  ],
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
                            Get.to(() => AddProfile2());
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
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}