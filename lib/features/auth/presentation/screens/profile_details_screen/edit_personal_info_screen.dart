import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12,),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 244, 243, 243),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          'Personal Info',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle edit
            },
            child: const Text(
              'Edit',
              style: TextStyle(
                color: Colors.deepOrange,
                decoration: TextDecoration.underline,
                decorationColor: Colors.deepOrange,
                decorationThickness: 2,

              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // User Info
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: SvgPicture.asset(
                    'assets/svgicons/profile-icon.svg',
                    width: 90,
                    height: 90,
                  ),
                ),
                const SizedBox(width: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deven Parab',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('devenparab@gmail.com'),
                    Text(
                      '+91 9876543210',
                     
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Info Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
          color: const Color.fromARGB(255, 229, 241, 248),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _InfoRow(
                    icon: SvgPicture.asset('assets/svgicons/person.svg'),
                    label: "Full Name",
                    value: "Deven Parab",
                  ),
                  const SizedBox(height: 16),
                  _InfoRow(
                    icon: SvgPicture.asset('assets/svgicons/mail.svg'),
                    label: "Email",
                    value: "devenparab@gmail.com",
                  ),
                  const SizedBox(height: 16),
                  _InfoRow(
                    icon: SvgPicture.asset('assets/svgicons/phone.svg'),
                    label: "Phone Number",
                    value: "+91 9876543210",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final Widget icon;
  final String label;
  final String value;

  const _InfoRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFFFFEFE6),
          child: icon,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}
