import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:AURA/%20services/privacy_policy_services.dart';
import 'package:AURA/model/privacy_policy_model.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() =>
      _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState
    extends State<PrivacyPolicyScreen> {

  late Future<PrivacyPolicyModel> privacyPolicyFuture;

  @override
  void initState() {
    super.initState();

    privacyPolicyFuture =
        PrivacyPolicyServices().getPrivacyPolicy();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("more.privacy_policy".tr),
      ),

      body: FutureBuilder<PrivacyPolicyModel>(

        future: privacyPolicyFuture,

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {

            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          if (!snapshot.hasData) {

            return Center(
              child: Text("common.no_data".tr),
            );
          }

          final privacyPolicy = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Html(
              data: privacyPolicy.data,
            ),
          );
        },
      ),
    );
  }
}