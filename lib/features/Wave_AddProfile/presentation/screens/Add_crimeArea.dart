import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/screens/Add_monitoringDetails.dart';
import 'package:waveproject/utils/const/color_const.dart';

class AddcrimeareaScreen extends StatefulWidget {
  const AddcrimeareaScreen({super.key});

  @override
  State<AddcrimeareaScreen> createState() => _AddcrimeareaScreenState();
}

class _AddcrimeareaScreenState extends State<AddcrimeareaScreen> {
  String activityType = '';
  String expertise = '';
  String prevStatus = '';
  String presentStatus = '';
  String historySheet = '';

  final List<String> activityTypeOptions = [
    'Surveillance',
    'Extortion',
    'Trafficking'
  ];
  final List<String> expertiseOptions = ['Weapons', 'Cyber Crime', 'Forgery'];
  final List<String> prevStatusOptions = ['In Custody', 'Absconding'];
  final List<String> presentStatusOptions = ['On Bail', 'Under Watch'];
  final List<String> historyOptions = ['Sheeted', 'Repeat Offender'];

  void _showBottomSheet(
      String title, List<String> options, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...options.map((option) => ListTile(
                  title: Text(option),
                  onTap: () {
                    onSelect(option);
                    Navigator.pop(context);
                  },
                ))
          ],
        ),
      ),
    );
  }

  Future<void> _openMapPicker() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    final lat = _locationData.latitude;
    final lng = _locationData.longitude;

    final Uri mapUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lng");

    if (!await canLaunchUrl(mapUrl)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open the map')),
      );
      return;
    }
    await launchUrl(mapUrl);
  }

  Widget _buildMapPicker(String label) {
    return GestureDetector(
      onTap: _openMapPicker,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            Icon(FontAwesomeIcons.mapPin,
                color: ColorConstants.commonbackground),
            SizedBox(width: 10),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, String value, List<String> options,
      Function(String) onSelect) {
    return GestureDetector(
      onTap: () => _showBottomSheet(label, options, onSelect),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value.isEmpty ? label : value, style: TextStyle(fontSize: 16)),
            Icon(Icons.arrow_drop_down)
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
          backgroundColor: ColorConstants.commonbackground),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorConstants.commonbackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(FontAwesomeIcons.mapLocation,
                        size: 30, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Crime Area',
                    style: TextStyle(
                        color: ColorConstants.commonbackground,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30),
              _buildMapPicker("Hide outs"),
              _buildMapPicker("Areas of operation"),
              _buildMapPicker("Current location"),
              _buildDropdownField(
                  "Types of Activities",
                  activityType,
                  activityTypeOptions,
                  (val) => setState(() => activityType = val)),
              _buildDropdownField("Expertise", expertise, expertiseOptions,
                  (val) => setState(() => expertise = val)),
              _buildDropdownField("Previous status", prevStatus,
                  prevStatusOptions, (val) => setState(() => prevStatus = val)),
              _buildDropdownField(
                  "Present status",
                  presentStatus,
                  presentStatusOptions,
                  (val) => setState(() => presentStatus = val)),
              _buildDropdownField("History sheet details", historySheet,
                  historyOptions, (val) => setState(() => historySheet = val)),
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
                          Get.to(() => AddMonitoringdetailsScreen());
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
