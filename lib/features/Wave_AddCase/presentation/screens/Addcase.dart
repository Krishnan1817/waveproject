import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:waveproject/utils/const/color_const.dart';

import '../widgets/Managecase.dart';

class AddcaseScreen extends StatefulWidget {
  const AddcaseScreen({super.key});

  @override
  State<AddcaseScreen> createState() => _AddcaseScreenState();
}

class _AddcaseScreenState extends State<AddcaseScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController caseId = TextEditingController();
  final TextEditingController crimeNumber = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController sectionOfLaw = TextEditingController();
  final TextEditingController dateOfOccurrence = TextEditingController();
  final TextEditingController dateOfReport = TextEditingController();
  final TextEditingController sceneOfCrime = TextEditingController();
  final TextEditingController demiseName = TextEditingController();
  final TextEditingController propertyLoss = TextEditingController();
  final TextEditingController propertyRecovery = TextEditingController();
  final TextEditingController courtName = TextEditingController();
  final TextEditingController totalAccused = TextEditingController();
  final TextEditingController gistOfCase = TextEditingController();
  final TextEditingController overallStage = TextEditingController();
  String state = '';
  String zone = '';
  String range = '';
  String subDivision = '';
  String policeStation = '';
  String cctnsHead = '';
  String ociuCategory = '';
  final List<String> stateOptions = ['State 1', 'State 2', 'State 3'];
  final List<String> zoneOptions = ['Zone A', 'Zone B'];
  final List<String> rangeOptions = ['Range X', 'Range Y'];
  final List<String> subDivisionOptions = ['SubDiv 1', 'SubDiv 2'];
  final List<String> policeStationOptions = ['PS 1', 'PS 2', 'PS 3'];
  final List<String> cctnsHeadOptions = ['Head 1', 'Head 2'];
  final List<String> ociuCategoryOptions = ['Category A', 'Category B'];

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _showBottomSheet(
      String title, List<String> options, Function(String) onSelected) {
    TextEditingController searchController = TextEditingController();
    List<String> filteredOptions = List.from(options);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            void filterList(String query) {
              setModalState(() {
                filteredOptions = options
                    .where((option) =>
                        option.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              });
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  TextField(
                    controller: searchController,
                    onChanged: filterList,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      itemCount: filteredOptions.length,
                      itemBuilder: (_, index) => ListTile(
                        title: Text(filteredOptions[index]),
                        onTap: () {
                          onSelected(filteredOptions[index]);
                          Navigator.pop(context);
                        },
                      ),
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

  Widget _buildDropdownField(String label, String value, List<String> options,
      Function(String) onSelected) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _showBottomSheet(label, options, onSelected),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(value.isEmpty ? label : value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ),
      ],
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
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Add Case",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorConstants.commonbackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
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
                      child: Icon(FontAwesomeIcons.file,
                          size: 30, color: Colors.white),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Case Details',
                      style: TextStyle(
                          color: ColorConstants.commonbackground,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                    controller: crimeNumber,
                    decoration: const InputDecoration(
                      labelText: "Case Id",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 10,
                ),
                _buildDropdownField("State", state, stateOptions,
                    (val) => setState(() => state = val)),
                _buildDropdownField("Zone", zone, zoneOptions,
                    (val) => setState(() => zone = val)),
                _buildDropdownField("Range", range, rangeOptions,
                    (val) => setState(() => range = val)),
                _buildDropdownField(
                    "Sub Division",
                    subDivision,
                    subDivisionOptions,
                    (val) => setState(() => subDivision = val)),
                _buildDropdownField(
                    "Police Station",
                    policeStation,
                    policeStationOptions,
                    (val) => setState(() => policeStation = val)),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                    controller: crimeNumber,
                    decoration: const InputDecoration(
                      labelText: "Crime Number",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: year,
                    decoration: const InputDecoration(
                      labelText: "Year",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: sectionOfLaw,
                    decoration: const InputDecoration(
                      labelText: "Section of Law",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 15,
                ),
                _buildDropdownField("CCTNS Head", cctnsHead, cctnsHeadOptions,
                    (val) => setState(() => cctnsHead = val)),
                _buildDropdownField(
                    "OCIU Category",
                    ociuCategory,
                    ociuCategoryOptions,
                    (val) => setState(() => ociuCategory = val)),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: dateOfOccurrence,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Date of Occurrence",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context, dateOfOccurrence),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: dateOfReport,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Date of Report",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context, dateOfReport),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: sceneOfCrime,
                    decoration: const InputDecoration(
                      labelText: "Scene of Crime",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: demiseName,
                    decoration: const InputDecoration(
                      labelText: "Demise Name",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: propertyLoss,
                    decoration: const InputDecoration(
                      labelText: "Property Loss",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: propertyRecovery,
                    decoration: const InputDecoration(
                      labelText: "Property Recovery",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: courtName,
                    decoration: const InputDecoration(
                      labelText: "Court Name - FIR Sent",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: totalAccused,
                    decoration: const InputDecoration(
                      labelText: "Total No of Accused",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: gistOfCase,
                    decoration: const InputDecoration(
                      labelText: "Gist of Case",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: overallStage,
                    decoration: const InputDecoration(
                      labelText: "Overall Stage of Case",
                      border: OutlineInputBorder(),
                    )),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.to(() => ManagecaseScreen());
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.person,
                        size: 80,
                        color: ColorConstants.commonbackground,
                      ),
                      Icon(
                        FontAwesomeIcons.add,
                        size: 60,
                        color: ColorConstants.commonbackground,
                      ),
                    ],
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
        ),
      ),
    );
  }
}
