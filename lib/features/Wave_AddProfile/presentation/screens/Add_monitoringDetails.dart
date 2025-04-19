import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:waveproject/features/Wave_Dashboard/presentation/screens/Dashboard.dart';
import 'package:waveproject/utils/const/color_const.dart';

class AddMonitoringdetailsScreen extends StatefulWidget {
  const AddMonitoringdetailsScreen({super.key});

  @override
  State<AddMonitoringdetailsScreen> createState() =>
      _AddMonitoringdetailsScreenState();
}

class _AddMonitoringdetailsScreenState
    extends State<AddMonitoringdetailsScreen> {
  String identifyingOfficer = '';
  String lastCheckBy = '';
  String monitoringOfficer = '';

  final List<String> officerOptions = [
    'Officer A',
    'Officer B',
    'Officer C',
  ];
  void _showBottomSheet(
    String title,
    List<String> options,
    Function(String) onSelect,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        TextEditingController searchController = TextEditingController();
        List<String> filteredOptions = List.from(options);

        return StatefulBuilder(
          builder: (context, setModalState) {
            void _filterOptions(String query) {
              setModalState(() {
                filteredOptions = options
                    .where((item) =>
                        item.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              });
            }

            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        prefixIcon: Icon(Icons.search),
                        
                      ),
                      onChanged: _filterOptions,
                    ),
                    SizedBox(height: 10),
                    ...filteredOptions.map(
                      (option) => ListTile(
                        title: Text(option),
                        onTap: () {
                          onSelect(option);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
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
                    child: Icon(FontAwesomeIcons.watchmanMonitoring,
                        size: 30, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Monitoring Details',
                    style: TextStyle(
                        color: ColorConstants.commonbackground,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30),
              _buildDropdownField(
                "Identifying Officer",
                identifyingOfficer,
                officerOptions,
                (val) => setState(() => identifyingOfficer = val),
              ),
              _buildDropdownField(
                "Last Check by Whom",
                lastCheckBy,
                officerOptions,
                (val) => setState(() => lastCheckBy = val),
              ),
              _buildDropdownField(
                "Present Monitoring Officer",
                monitoringOfficer,
                officerOptions,
                (val) => setState(() => monitoringOfficer = val),
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
                          Get.to(() => DashboardScreen());
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Center(
                          child: Text(
                            "Save and exit",
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
