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
  String policestationinjail = '';
  String dateofarrest = '';
  String jailname = '';
  final List<String> activityTypeOptions = [
    'Surveillance',
    'Extortion',
    'Trafficking'
  ];
  final List<String> expertiseOptions = ['Weapons', 'Cyber Crime', 'Forgery'];
  final List<String> prevStatusOptions = ['In Custody', 'Absconding'];
  final List<String> presentStatusOptions = [
    'On Bail',
    'Under Watch',
    'In Jail'
  ];
  final List<String> historyOptions = ['Sheeted', 'Repeat Offender'];

  void _showBottomSheet(
      String title, List<String> options, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        TextEditingController searchController = TextEditingController();
        List<String> filteredOptions = List.from(options);

        return StatefulBuilder(
          builder: (context, setModalState) {
            void filterSearch(String query) {
              final results = options
                  .where((item) =>
                      item.toLowerCase().contains(query.toLowerCase()))
                  .toList();
              setModalState(() => filteredOptions = results);
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                    ),
                    onChanged: filterSearch,
                  ),
                  SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 300),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredOptions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredOptions[index]),
                          onTap: () {
                            onSelect(filteredOptions[index]);
                            print(filteredOptions[index]);
                            Navigator.pop(context);
                            if (filteredOptions[index] == 'In Jail') {
                              _showFormDialog(filteredOptions[index]);
                            } else if (filteredOptions[index] ==
                                "Repeat Offender") {
                              _showHistoryDialog(filteredOptions[index]);
                            }
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

  void _showFormDialog(String selectedOption) {
    final TextEditingController jailNameController = TextEditingController();
    final TextEditingController Crimenumber = TextEditingController();
    final TextEditingController Year = TextEditingController();
    DateTime? selectedDate;

    String selectedJailType = '';
    String selectedState = '';
    String selectedDistrict = '';
    String selectedPoliceStation = '';

    final List<String> jailTypes = [
      'Central Jail',
      'District Jail',
      'Sub Jail'
    ];
    final List<String> states = ['Maharashtra', 'Gujarat', 'Karnataka'];
    final List<String> districts = ['Pune', 'Mumbai', 'Nagpur'];
    final List<String> policeStations = ['PS1', 'PS2', 'PS3'];

    void _pickDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    void _showDropdown(
        String title, List<String> options, Function(String) onSelect) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return ListView(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            children: options
                .map((option) => ListTile(
                      title: Text(option),
                      onTap: () {
                        Navigator.pop(context);
                        onSelect(option);
                      },
                    ))
                .toList(),
          );
        },
      );
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.symmetric(
                  horizontal: 16), // Adjust margin from screen edges
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.9, // 90% width of screen
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // TITLE ROW
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Details for $selectedOption',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // Date Picker
                      GestureDetector(
                        onTap: _pickDate,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedDate == null
                                    ? 'Date of Arrest'
                                    : 'Arrested on: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.date_range)
                            ],
                          ),
                        ),
                      ),

                      // Jail Type Dropdown + Jail Name
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _showDropdown('Jail Type', jailTypes, (val) {
                                  setState(() => selectedJailType = val);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedJailType.isEmpty
                                          ? 'Jail Type'
                                          : selectedJailType,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Icon(Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: jailNameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Jail Name',
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      // State Dropdown
                      GestureDetector(
                        onTap: () {
                          _showDropdown('Select State', states, (val) {
                            setState(() => selectedState = val);
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedState.isEmpty ? 'State' : selectedState,
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),

                      // District Dropdown
                      GestureDetector(
                        onTap: () {
                          _showDropdown('Select District', districts, (val) {
                            setState(() => selectedDistrict = val);
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedDistrict.isEmpty
                                    ? 'District'
                                    : selectedDistrict,
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),

                      // Police Station Dropdown
                      GestureDetector(
                        onTap: () {
                          _showDropdown('Select Police Station', policeStations,
                              (val) {
                            setState(() => selectedPoliceStation = val);
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedPoliceStation.isEmpty
                                    ? 'Police Station'
                                    : selectedPoliceStation,
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: Crimenumber,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Crime No',
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: Year,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Year',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              dateofarrest = selectedDate.toString();
                              jailname = jailNameController.text;
                              policestationinjail = selectedPoliceStation;
                            });
                            print('Date: $selectedDate');
                            print('Jail Type: $selectedJailType');
                            print('Jail Name: ${jailNameController.text}');
                            print('State: $selectedState');
                            print('District: $selectedDistrict');
                            print('Police Station: $policestationinjail');

                            Future.delayed(Duration(milliseconds: 50), () {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text('save'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showHistoryDialog(String selectedOption) {
    final TextEditingController jailNameController = TextEditingController();

    DateTime? historysheetopendate;

    String selectedJailType = '';
    String selectedState = '';
    String selectedDistrict = '';
    String selectedPoliceStation = '';

    final List<String> jailTypes = [
      'Central Jail',
      'District Jail',
      'Sub Jail'
    ];
    final List<String> states = ['Maharashtra', 'Gujarat', 'Karnataka'];
    final List<String> districts = ['Pune', 'Mumbai', 'Nagpur'];
    final List<String> policeStations = ['PS1', 'PS2', 'PS3'];

    void _pickDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        setState(() {
          historysheetopendate = picked;
        });
      }
    }

    void _showDropdown(
        String title, List<String> options, Function(String) onSelect) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return ListView(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            children: options
                .map((option) => ListTile(
                      title: Text(option),
                      onTap: () {
                        Navigator.pop(context);
                        onSelect(option);
                      },
                    ))
                .toList(),
          );
        },
      );
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.symmetric(
                  horizontal: 16), // Adjust margin from screen edges
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.9, // 90% width of screen
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // TITLE ROW
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Details for $selectedOption',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // Date Picker
                      GestureDetector(
                        onTap: _pickDate,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                historysheetopendate == null
                                    ? 'Date of History sheet opened'
                                    : 'Arrested on: ${historysheetopendate!.day}/${historysheetopendate!.month}/${historysheetopendate!.year}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.date_range)
                            ],
                          ),
                        ),
                      ),

                      // Jail Type Dropdown + Jail Name
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _showDropdown('Type', jailTypes, (val) {
                                  setState(() => selectedJailType = val);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedJailType.isEmpty
                                          ? 'Jail Type'
                                          : selectedJailType,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Icon(Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: jailNameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'HS Number',
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      // State Dropdown
                      GestureDetector(
                        onTap: () {
                          _showDropdown('Select State', states, (val) {
                            setState(() => selectedState = val);
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedState.isEmpty ? 'State' : selectedState,
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),

                      // District Dropdown
                      GestureDetector(
                        onTap: () {
                          _showDropdown('Select District', districts, (val) {
                            setState(() => selectedDistrict = val);
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedDistrict.isEmpty
                                    ? 'District'
                                    : selectedDistrict,
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),

                      // Police Station Dropdown
                      GestureDetector(
                        onTap: () {
                          _showDropdown('Select Police Station', policeStations,
                              (val) {
                            setState(() => selectedPoliceStation = val);
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedPoliceStation.isEmpty
                                    ? 'Police Station'
                                    : selectedPoliceStation,
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            print('Date: $historysheetopendate');
                            print('Jail Type: $selectedJailType');
                            print('Jail Name: ${jailNameController.text}');
                            print('State: $selectedState');
                            print('District: $selectedDistrict');
                            print('Police Station: $policestationinjail');

                            Future.delayed(Duration(milliseconds: 50), () {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text('save'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
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
              Visibility(
                visible: policestationinjail != '',
                child: Column(
                  children: [
                    Row(
                      children: [Text('Police Station: $policestationinjail')],
                    ),
                    Row(
                      children: [Text("Date of arrest: $dateofarrest")],
                    ),
                    Row(
                      children: [Text("jail name : $jailname")],
                    )
                  ],
                ),
              ),
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
                        onTap: () {
                          print(policestationinjail);
                        },
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
