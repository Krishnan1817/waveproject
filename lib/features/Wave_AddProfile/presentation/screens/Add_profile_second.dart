import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/screens/Add_socialnetwork.dart';
import 'package:waveproject/utils/const/color_const.dart';

class AddProfile2 extends StatefulWidget {
  const AddProfile2({super.key});

  @override
  State<AddProfile2> createState() => _AddProfile2State();
}

class _AddProfile2State extends State<AddProfile2> {
  String? nationality;
  String? religion;
  String? casteCommunity;
  String? maritalStatus;
  String? educationQualification;
  String? profession;

  void _showBottomSheet(
      BuildContext context, List<String> items, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                onTap: () {
                  onSelect(items[index]);
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget buildDropdown(String label, String? value, List<String> options,
      Function(String) onSelect) {
    return InkWell(
      onTap: () => _showBottomSheet(context, options, onSelect),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        child: Text(value ?? "Select $label"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.commonbackground,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: ColorConstants.commonbackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.people, color: Colors.white),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Social Status',
                  style: TextStyle(
                      color: ColorConstants.commonbackground,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            buildDropdown(
              "Nationality",
              nationality,
              ["Indian", "American", "British", "Other"],
              (val) => setState(() => nationality = val),
            ),
            SizedBox(height: 20),
            buildDropdown(
              "Religion",
              religion,
              ["Hindu", "Muslim", "Christian", "Other"],
              (val) => setState(() => religion = val),
            ),
            SizedBox(height: 20),
            buildDropdown(
              "Caste and Community",
              casteCommunity,
              ["General", "OBC", "SC", "ST"],
              (val) => setState(() => casteCommunity = val),
            ),
            SizedBox(height: 20),
            buildDropdown(
              "Marital Status",
              maritalStatus,
              ["Single", "Married", "Divorced", "Widowed"],
              (val) => setState(() => maritalStatus = val),
            ),
            SizedBox(height: 20),
            buildDropdown(
              "Education Qualification",
              educationQualification,
              ["High School", "Graduate", "Postgraduate", "PhD"],
              (val) => setState(() => educationQualification = val),
            ),
            SizedBox(height: 20),
            buildDropdown(
              "Profession",
              profession,
              ["Doctor", "Engineer", "Teacher", "Other"],
              (val) => setState(() => profession = val),
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
                        Get.to(() => Socialnetwork());
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
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
