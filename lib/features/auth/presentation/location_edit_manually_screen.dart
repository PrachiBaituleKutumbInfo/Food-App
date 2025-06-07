// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:konkan_bite_food/core/config/routes.dart';
// import 'package:konkan_bite_food/features/address/presnetation/address_details_screen.dart';
// import 'package:konkan_bite_food/features/address/presnetation/bloc/add_bloc.dart';
// import 'package:konkan_bite_food/features/address/presnetation/bloc/add_event.dart';
// import 'package:konkan_bite_food/features/address/presnetation/bloc/add_state.dart';
// import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
// import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
// import 'package:konkan_bite_food/widgets/Info_warning_widget.dart';
// import 'package:konkan_bite_food/widgets/custom_button.dart';

// class LocationEditManuallyScreen extends StatefulWidget {
//   const LocationEditManuallyScreen({super.key});

//   @override
//   State<LocationEditManuallyScreen> createState() =>
//       _LocationEditManuallyScreenState();
// }

// class _LocationEditManuallyScreenState
//     extends State<LocationEditManuallyScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<AddressBloc>().add(const FetchAddressesEvent());
//   }

//   bool isEnable = true;

//   void showAddressDetailsBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return BlocProvider.value(
//           value: BlocProvider.of<AddressBloc>(context),
//           child: const AddressDetailsBottomSheet(),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // 🗺️ Full-screen Map Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/map.png',
//               fit: BoxFit.cover,
//             ),
//           ),

//           // 📍 Center Pin with Label
//           Positioned.fill(
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 const Icon(
//                   Icons.location_on,
//                   size: 40,
//                   color: Colors.deepOrange,
//                 ),
//                 Positioned(
//                   top: 40,
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.black87,
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: const Text(
//                       "Move to edit location",
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // 📦 Bottom Address Card
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16),
//                   topRight: Radius.circular(16),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 10,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: SafeArea(
//                 top: false,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "What's your address?",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),

//                       Row(
//                         children: [
//                           Expanded(
//                             child: BlocBuilder<AddressBloc, AddressState>(
//                               builder: (context, state) {
//                                 if (state is AddressLoading) {
//                                   return const Text("Loading address...");
//                                 } else if (state is AddressLoaded &&
//                                     state.addresses.isNotEmpty) {
//                                   final address = state.addresses.first;
//                                   return Text(
//                                     address
//                                         .fullAddress, // adjust based on your AddressEntity fields
//                                     style: AppTextStyle.caption2
//                                         .copyWith(color: AppColors.oliveGreen),
//                                   );
//                                 } else if (state is AddressError) {
//                                   return Text("Error: ${state.message}");
//                                 } else {
//                                   return const Text("No address available");
//                                 }
//                               },
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () async {
//                               await showModalBottomSheet(
//                                 context: context,
//                                 isScrollControlled: true,
//                                 builder: (context) {
//                                   return BlocProvider.value(
//                                     value:
//                                         BlocProvider.of<AddressBloc>(context),
//                                     child: const AddressDetailsBottomSheet(),
//                                   );
//                                 },
//                               );

//                               // Refresh address after closing the bottom sheet
//                               context
//                                   .read<AddressBloc>()
//                                   .add(const FetchAddressesEvent(address));
//                             },
//                             icon: SvgPicture.asset(
//                               'assets/svgicons/edit.svg',
//                               width: 24,
//                               height: 24,
//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ],
//                       ),

//                       // Row(
//                       //   children: [
//                       //     Expanded(
//                       //       child: Text(

//                       //         // "A-205, Nakshatra Apartment, Police Line,\nOros, Sindhudurg, Maharashtra 416534",
//                       //         style: AppTextStyle.caption2
//                       //             .copyWith(color: AppColors.oliveGreen),
//                       //       ),
//                       //     ),
//                       //     IconButton(
//                       //       onPressed: () {
//                       //         showModalBottomSheet(
//                       //           context: context,
//                       //           isScrollControlled: true,
//                       //           builder: (context) {
//                       //             return BlocProvider.value(
//                       //               value: BlocProvider.of<AddressBloc>(
//                       //                   context), // re-use existing bloc
//                       //               child: const AddressDetailsBottomSheet(),
//                       //             );
//                       //           },
//                       //         );
//                       //       },
//                       //       icon: SvgPicture.asset('assets/svgicons/edit.svg',
//                       //           width: 24,
//                       //           height: 24,
//                       //           color: AppColors.primary),
//                       //     ),

//                       //   ],
//                       // ),
//                       const SizedBox(height: 10),
//                       const AppInfoBox(
//                         message: "We are sorry! We don't serve this area yet.",
//                         icon: Icons.error_outline,
//                       ),
//                       const SizedBox(height: 16),
//                       CustomActionButton.orangeFilled(
//                         text: "USE CURRENT LOCATION",
//                         isEnable: isEnable,
//                         onPressed: () {
//                           Navigator.pushNamed(
//                               context, Routes.dashboardhomeRoute);
//                           print('USE CURRENT LOCATION');
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/features/address/presnetation/address_details_screen.dart';
import 'package:konkan_bite_food/features/address/presnetation/bloc/add_bloc.dart';
import 'package:konkan_bite_food/features/address/presnetation/bloc/add_event.dart';
import 'package:konkan_bite_food/features/address/presnetation/bloc/add_state.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/widgets/Info_warning_widget.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

class LocationEditManuallyScreen extends StatefulWidget {
  const LocationEditManuallyScreen({super.key});

  @override
  State<LocationEditManuallyScreen> createState() =>
      _LocationEditManuallyScreenState();
}

class _LocationEditManuallyScreenState
    extends State<LocationEditManuallyScreen> {
  bool isEnable = true;

  @override
  void initState() {
    super.initState();
    // context.read<AddressBloc>().add(FetchAddresses());
  }

  void showAddressDetailsBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BlocProvider.value(
          value: BlocProvider.of<AddressBloc>(context),
          child: const AddressDetailsBottomSheet(),
        );
      },
    );
    // Re-fetch after closing bottom sheet
    // context.read<AddressBloc>().add(FetchAddresses());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map Image
          Positioned.fill(
            child: Image.asset(
              'assets/map.png',
              fit: BoxFit.cover,
            ),
          ),

          // Center Pin
          Positioned.fill(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.location_on,
                    size: 40, color: Colors.deepOrange),
                Positioned(
                  top: 40,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Move to edit location",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Address Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "What's your address?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // BLoC Address Display
                      Row(
                        children: [
                          Expanded(child:
                                  // BlocBuilder<AddressBloc, AddressState>(
                                  //   builder: (context, state) {
                                  //     if (state is AddressLoading) {
                                  //       return const Center(
                                  //           child: CircularProgressIndicator());
                                  //     } else if (state is AddressLoaded) {
                                  //       final addresses = state.addresses.length;
                                  //        final addr = state.addresses[index];

                                  //       // if (addresses.isEmpty) {
                                  //       //   return const Text("No addresses found.");
                                  //       // }

                                  //       // final address = addresses.first; // show only one for now

                                  //       return Row(
                                  //         children: [
                                  //           Expanded(
                                  //             child: Column(
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               children: [
                                  //                 Text(addresses.houseNumber ?? '',
                                  //                     style: const TextStyle(
                                  //                         fontSize: 16,
                                  //                         fontWeight:
                                  //                             FontWeight.w500)),
                                  //                 const SizedBox(height: 4),
                                  //                 Text(addresses.city ?? '',
                                  //                     style: const TextStyle(
                                  //                         color: Colors.grey)),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //           IconButton(
                                  //             onPressed: () =>
                                  //                 showAddressDetailsBottomSheet(
                                  //                     context),
                                  //             icon: SvgPicture.asset(
                                  //               'assets/svgicons/edit.svg',
                                  //               width: 24,
                                  //               height: 24,
                                  //               color: AppColors.primary,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       );
                                  //     } else if (state is AddressError) {
                                  //       return Center(
                                  //           child: Text("Error: ${state.message}"));
                                  //     }
                                  //     return const SizedBox(); // Default state
                                  //   },
                                  // ),

                                  BlocBuilder<AddressBloc, AddressState>(
                            builder: (context, state) {
                              if (state is AddressLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is AddressLoaded) {
                                return ListView.builder(
                                  itemCount: state.addresses.length,
                                  itemBuilder: (context, index) {
                                    final addr = state.addresses[index];
                                    return ListTile(
                                      title: Text(
                                          "${addr.urName} - ${addr.addressType}"),
                                      subtitle: Text(
                                          "${addr.houseNumber}, ${addr.buildingName}, ${addr.city}"),
                                      trailing: addr.isPrimary
                                          ? const Icon(Icons.star,
                                              color: Colors.orange)
                                          : null,
                                    );
                                  },
                                );
                              } else if (state is AddressError) {
                                return Center(
                                    child: Text("Error: ${state.message}"));
                              }
                              return Container();
                              // if (state is AddressLoading) {
                              //   return const Center(
                              //       child: CircularProgressIndicator());
                              // } else if (state is AddressLoaded) {
                              //   final addresses = state.addresses;
                              //   return ListView.builder(
                              //     itemCount: addresses.length,
                              //     itemBuilder: (context, index) {
                              //       final address = addresses[index];
                              //       return ListTile(
                              //         title: Text(address.houseNumber ?? ''),
                              //         subtitle: Text(address.city ?? ''),
                              //       );
                              //     },
                              //   );
                              // } else if (state is AddressError) {
                              //   return Center(
                              //       child: Text("Error: ${state.message}"));
                              // }
                              // return const SizedBox();
                            },
                          )

                              //     //     BlocBuilder<AddressBloc, AddressState>(
                              //     //   builder: (context, state) {
                              //     //     if (state is AddressLoading) {
                              //     //       return const Text("Loading address...");
                              //     //     } else if (state is AddressLoaded &&
                              //     //         state.addresses.isNotEmpty) {
                              //     //       final address = state.addresses.first;
                              //     //       return Text(
                              //     //         "${address.houseNumber}, ${address.buildingName}, ${address.addressLineOne},\n"
                              //     //         "${address.nearbyLandmark}, ${address.city}, ${address.state}, ${address.zipCode}",
                              //     //         style: AppTextStyle.caption2
                              //     //             .copyWith(color: AppColors.oliveGreen),
                              //     //       );
                              //     //     } else if (state is AddressError) {
                              //     //       return Text(
                              //     //         "Failed to load address: ${state.message}",
                              //     //         style: TextStyle(color: Colors.red),
                              //     //       );
                              //     //     } else {
                              //     //       return const Text("No address available");
                              //     //     }
                              //     //   },
                              //     // ),
                              //     BlocBuilder<AddressBloc, AddressState>(
                              //   builder: (context, state) {
                              //     if (state is AddressLoading) {
                              //       return const Text("Loading address...");
                              //     } else if (state is AddressLoaded &&
                              //         state.addresses.isNotEmpty) {
                              //       // Get the primary address or fallback to first
                              //       // final address = state.addresses.firstWhere(
                              //       //   (addr) => addr.primary == true,
                              //       //   orElse: () => state.addresses.first,
                              //       // );
                              //       final address = state.addresses.first;
                              //       return Text(
                              //         "${address.houseNumber}, ${address.buildingName}, ${address.addressLineOne},\n"
                              //         "${address.nearbyLandmark}, ${address.city}, ${address.state}, ${address.zipCode}\n"
                              //         "Mobile: ${address.mobNum}, Alt: ${address.primarymob}\n"
                              //         "Email: ${address.emailAdd}, Type: ${address.addressType}",
                              //         style: AppTextStyle.caption2
                              //             .copyWith(color: AppColors.oliveGreen),
                              //       );
                              //     } else if (state is AddressError) {
                              //       return Text(
                              //         "Failed to load address: ${state.message}",
                              //         style: const TextStyle(color: Colors.red),
                              //       );
                              //     } else {
                              //       return const Text("No address available");
                              //     }
                              //   },
                              // ),
                              ),
                          IconButton(
                            onPressed: () =>
                                showAddressDetailsBottomSheet(context),
                            icon: SvgPicture.asset('assets/svgicons/edit.svg',
                                width: 24,
                                height: 24,
                                // ignore: deprecated_member_use
                                color: AppColors.primary),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      const AppInfoBox(
                        message: "We are sorry! We don't serve this area yet.",
                        icon: Icons.error_outline,
                      ),
                      const SizedBox(height: 16),
                      CustomActionButton.orangeFilled(
                        text: "USE CURRENT LOCATION",
                        isEnable: isEnable,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.dashboardhomeRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
