import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';

import '../../controller/screens_controller/address_controller.dart';
import '../widgets/card_tile_profile_custom.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});
  final AddressController _addressController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF9DE),
      appBar: AppBar(title: AppText.title("address screen")),
      body: Obx(() {
        if (_addressController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_addressController.addresses.isEmpty) {
          return const Center(child: Text("No addresses found"));
        }

        return ListView.builder(
          itemCount: _addressController.addresses.length,
          itemBuilder: (context, index) {
            final item = _addressController.addresses[index];

            return ProfileTile(
              icon: Icons.location_off_rounded,iconColor: Colors.amber,
              title: item.title,
              subtitle: item.street,);
          },
        );
      }),
    );
  }
}
