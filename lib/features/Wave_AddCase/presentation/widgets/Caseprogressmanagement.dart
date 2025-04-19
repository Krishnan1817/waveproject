import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waveproject/utils/const/color_const.dart';

class Caseprogressmanagement extends StatefulWidget {
  const Caseprogressmanagement({super.key});

  @override
  State<Caseprogressmanagement> createState() => _CaseprogressmanagementState();
}

class _CaseprogressmanagementState extends State<Caseprogressmanagement> {
  // Dropdown values
  String? selectedStage;
  String? selectedCourt;
  String? selectedPrefix1;
  String? selectedPrefix2;
  String? selectedCommercialCourt;

  // Date values
  DateTime? chargedDate;
  DateTime? fileDate;

  // Text controllers
  final courtNumber1Controller = TextEditingController();
  final courtNumber2Controller = TextEditingController();

  // Sample data
  final List<String> stageOptions = ['Stage 1', 'Stage 2', 'Stage 3'];
  final List<String> courtNames = ['Court A', 'Court B', 'Court C'];
  final List<String> prefixes = ['Prefix A', 'Prefix B'];
  final List<String> commercialCourts = ['Commercial A', 'Commercial B'];

  // Date picker
  Future<void> _selectDate(
      BuildContext context, ValueChanged<DateTime> onDateSelected) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  // Modal bottom sheet dropdown
  Future<void> _showDropdownModal({
    required BuildContext context,
    required String title,
    required List<String> items,
    required ValueChanged<String> onSelected,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        TextEditingController searchController = TextEditingController();
        List<String> filteredItems = List.from(items);

        return StatefulBuilder(builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                16, 16, 16, MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Search $title',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setModalState(() {
                      filteredItems = items
                          .where((item) =>
                              item.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
                SizedBox(height: 10),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredItems[index]),
                        onTap: () {
                          onSelected(filteredItems[index]);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  // Dropdown widget
  Widget _buildDropdownTile(String? value, String label, List<String> items,
      Function(String) onSelected) {
    return InkWell(
      onTap: () {
        _showDropdownModal(
          context: context,
          title: label,
          items: items,
          onSelected: onSelected,
        );
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: Icon(Icons.arrow_drop_down),
          border: OutlineInputBorder(),
        ),
        child: Text(value ?? 'Select $label'),
      ),
    );
  }

  // Date picker widget
  Widget _buildDatePickerTile(
      DateTime? date, String label, ValueChanged<DateTime> onDateSelected) {
    return InkWell(
      onTap: () => _selectDate(context, onDateSelected),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
        ),
        child: Text(
            date != null ? "${date.toLocal()}".split(' ')[0] : 'Select $label'),
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
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _buildDropdownTile(selectedStage, 'First Stage of Case',
                stageOptions, (value) => setState(() => selectedStage = value)),
            SizedBox(height: 16),
            _buildDatePickerTile(chargedDate, 'Charged Date',
                (date) => setState(() => chargedDate = date)),
            SizedBox(height: 16),
            _buildDatePickerTile(fileDate, 'Taken on File Date',
                (date) => setState(() => fileDate = date)),
            SizedBox(height: 16),
            _buildDropdownTile(selectedCourt, 'Court Name', courtNames,
                (value) => setState(() => selectedCourt = value)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDropdownTile(
                      selectedPrefix1,
                      'Court Prefix',
                      prefixes,
                      (value) => setState(() => selectedPrefix1 = value)),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: courtNumber1Controller,
                    decoration: InputDecoration(
                      labelText: 'Court Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildDropdownTile(
                selectedCommercialCourt,
                'Commercial Court Name',
                commercialCourts,
                (value) => setState(() => selectedCommercialCourt = value)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDropdownTile(
                      selectedPrefix2,
                      'Court Prefix',
                      prefixes,
                      (value) => setState(() => selectedPrefix2 = value)),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: courtNumber2Controller,
                    decoration: InputDecoration(
                      labelText: 'Court Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
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
                        navigator!.pop(context);
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
