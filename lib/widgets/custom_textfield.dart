import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class CustomPhoneTextField extends StatelessWidget {
  final TextEditingController countryCodeController;
  final TextEditingController phoneNumberController;
  final Function(String) onChanged;
  final bool isEnable;

  const CustomPhoneTextField({
    Key? key,
    required this.countryCodeController,
    required this.phoneNumberController,
    required this.onChanged,
    required this.isEnable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.softBlue),
            borderRadius: BorderRadius.circular(10), // ✅ fixed placement
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: 40,
                child: TextField(
                  controller: countryCodeController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '+91',
                    hintStyle: TextStyle( // ✅ fixed incorrect color usage
                      color:AppColors.lightBlueGrey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Text(
                '| ',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Expanded(
                child: TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  cursorColor: AppColors.primary,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onChanged: onChanged,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    fillColor: AppColors.lightBlueGrey,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    border: InputBorder.none,
                    suffixIcon: isEnable
                        ? const Icon(Icons.check, color: AppColors.primary)
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
