import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/screens/Add_PersonalandSocialmedia.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/widgets/Identification_marks.dart';
import 'package:waveproject/utils/const/color_const.dart';

class Physicaldetails extends StatefulWidget {
  const Physicaldetails({super.key});

  @override
  State<Physicaldetails> createState() => _PhysicaldetailsState();
}

class _PhysicaldetailsState extends State<Physicaldetails> {
  final TextEditingController heightController = TextEditingController();

  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticate() async {
    bool isAuthenticated = false;

    try {
      isAuthenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        // biometricOnly: true,
        // stickyAuth: true,
      );
    } catch (e) {
      print("Error during fingerprint authentication: $e");
    }

    if (isAuthenticated) {
      print("Authenticated successfully!");
    } else {
      print("Authentication failed!");
    }
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FontAwesomeIcons.fingerprint,
                size: 50,
                color: ColorConstants.commonbackground,
              ),
              SizedBox(height: 20),
              Text(
                'Place your finger on the sensor',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context); // Close the bottom sheet
                  await _authenticate(); // Perform fingerprint authentication
                },
                child: Text('Authenticate'),
              ),
            ],
          ),
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
          backgroundColor: ColorConstants.commonbackground),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Icon(FontAwesomeIcons.dumbbell,
                        size: 30, color: Colors.white),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Physical Details',
                    style: TextStyle(
                        color: ColorConstants.commonbackground,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: heightController,
                decoration: InputDecoration(
                  labelText: "Height in CM",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Built',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Complexion',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Facial Feature',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hair color',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    Get.to(() => Identification());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upper body',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    Get.to(() => Identification());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lower body',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Habits',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dress Habits',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  )),
              SizedBox(
                height: 15,
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
                          Get.to(() => PersonalandSocialmedia());
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
