import 'package:flutter/material.dart';

class AddressDetailsScreen extends StatefulWidget {
  @override
  _AddressDetailsScreenState createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  String selectedPerson = "Myself";
  String selectedAddressType = "Home";
  
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();
  final TextEditingController addressLineController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  void _saveAddress() {
    // Handle saving address logic
    print("Saving address:");
    print("House No: ${houseNumberController.text}");
    print("Building: ${buildingNameController.text}");
    print("Address: ${addressLineController.text}");
    print("Landmark: ${landmarkController.text}");
    print("Name: ${nameController.text}");
    print("Mobile: ${mobileController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add more address details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            SizedBox(height: 10),
            Text("Who are you ordering for?"),
            Row(
              children: [
                _buildRadioButton("Myself"),
                _buildRadioButton("For someone else"),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("A detailed address will help our delivery person reach your address easily"),
            ),
            SizedBox(height: 10),
            Text("Save address as"),
            Row(
              children: [
                _buildAddressTypeButton("Home", Icons.home_outlined),
                _buildAddressTypeButton("Work", Icons.work_outline),
                _buildAddressTypeButton("Other", Icons.location_on_outlined),
              ],
            ),
            SizedBox(height: 10),
            _buildTextField(houseNumberController, "House Number"),
            _buildTextField(buildingNameController, "Building Name"),
            _buildTextField(addressLineController, "Address Line 1"),
            _buildTextField(landmarkController, "Nearby Landmark (optional)"),
            _buildTextField(nameController, "Your Name"),
            _buildTextField(mobileController, "Mobile Number"),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _saveAddress,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("SAVE ADDRESS", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(String title) {
    return Row(
      children: [
        Radio(
          value: title,
          groupValue: selectedPerson,
          onChanged: (value) {
            setState(() {
              selectedPerson = value.toString();
            });
          },
          activeColor: Colors.deepOrange,
        ),
        Text(title),
      ],
    );
  }

  Widget _buildAddressTypeButton(String type, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            selectedAddressType = type;
          });
        },
        icon: Icon(icon, color: selectedAddressType == type ? Colors.deepOrange : Colors.grey),
        label: Text(type, style: TextStyle(color: selectedAddressType == type ? Colors.deepOrange : Colors.grey)),
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedAddressType == type ? Colors.grey[150] : Colors.white,
          disabledBackgroundColor: selectedAddressType == type ? Colors.deepOrange : Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
