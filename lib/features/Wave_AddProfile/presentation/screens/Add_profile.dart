import 'package:flutter/material.dart';

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
            primaryColor: Colors.greenAccent, // Header & Active Date Color
            colorScheme: ColorScheme.light(primary: Colors.greenAccent),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Profile"),
        backgroundColor: Colors.greenAccent,
      ),
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
                    Text("Assign as Gang Leader"),
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: udaiController,
                  decoration: InputDecoration(
                    labelText: "UDAI No",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: criminalCategory,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  items: ["Category A", "Category B", "Category C"]
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      criminalCategory = value;
                    });
                  },
                  hint: Text("Select Criminal Category"),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: subCategory,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  items: ["Subcategory 1", "Subcategory 2", "Subcategory 3"]
                      .map((sub) => DropdownMenuItem(
                            value: sub,
                            child: Text(sub),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      subCategory = value;
                    });
                  },
                  hint: Text("Select Sub Category"),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: criminalType,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  items: ["Type 1", "Type 2", "Type 3"]
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      criminalType = value;
                    });
                  },
                  hint: Text("Select Type of Criminal"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: aliasController,
                  decoration: InputDecoration(
                    labelText: "Alias Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: reasonController,
                  decoration: InputDecoration(
                    labelText: "Reason",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: parentageController,
                  decoration: InputDecoration(
                    labelText: "Parentage Name",
                    border: OutlineInputBorder(),
                  ),
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
                DropdownButtonFormField<String>(
                  value: gender,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  items: ["Male", "Female", "Other"]
                      .map((gen) => DropdownMenuItem(
                            value: gen,
                            child: Text(gen),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  hint: Text("Select Gender"),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 50, 
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150, 
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Save and Next",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5), 
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
