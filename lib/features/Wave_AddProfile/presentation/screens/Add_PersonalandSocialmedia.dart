import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/widgets/SocialmediaDialoguebox.dart';
import 'package:waveproject/features/Wave_AddProfile/presentation/widgets/vechicleDialoguebox.dart';
import 'package:waveproject/utils/const/color_const.dart';

import '../widgets/WeaponDialoguebox.dart';

class PersonalandSocialmedia extends StatefulWidget {
  const PersonalandSocialmedia({super.key});

  @override
  State<PersonalandSocialmedia> createState() => _PersonalandSocialmediaState();
}

class _PersonalandSocialmediaState extends State<PersonalandSocialmedia> {
  TextEditingController pancardController = TextEditingController();
  TextEditingController rationIdController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController movableAssetController = TextEditingController();
  TextEditingController immovableAssetController = TextEditingController();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  child:
                      Icon(FontAwesomeIcons.globeAmericas, color: Colors.white),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Personal and Social Media',
                  style: TextStyle(
                      color: ColorConstants.commonbackground,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            _buildTextFormField(pancardController, "Pancard"),
            SizedBox(height: 16),
            _buildTextFormField(rationIdController, "Ration ID"),
            SizedBox(height: 16),
            _buildTextFormField(bankAccountController, "Bank Account"),
            SizedBox(height: 16),
            _buildTextFormField(movableAssetController, "Movable Asset"),
            SizedBox(height: 16),
            _buildTextFormField(immovableAssetController, "Immovable Asset"),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => VechiclemodalScreen());
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorConstants.commonbackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(FontAwesomeIcons.car, color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => SocialmodalScreen());
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorConstants.commonbackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(FontAwesomeIcons.laptop, color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => WeaponmodalScreen());
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorConstants.commonbackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(FontAwesomeIcons.gun, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
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
}
