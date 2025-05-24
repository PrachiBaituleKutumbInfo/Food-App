import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class CustomPhoneTextField extends StatelessWidget {
  final TextEditingController countryCodeController;
  final TextEditingController phoneNumberController;
  final Function(String) onChanged;
  final bool isEnable;

  const CustomPhoneTextField({
    super.key,
    required this.countryCodeController,
    required this.phoneNumberController,
    required this.onChanged,
    required this.isEnable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.lightBlueGrey, // 🌟 Apply full background here
            border: Border.all(width: 1, color: AppColors.softBlue),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: 60,
                child: TextField(
                  controller: countryCodeController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '+91',
                    hintStyle: TextStyle(
                      color: AppColors.softBlue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Text(
                '| ',
                style: TextStyle(fontSize: 26, color: AppColors.softBlue),
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
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (isEnable)
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.check, color: AppColors.primary),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
