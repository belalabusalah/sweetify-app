import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sweetify_app/%20services/terms_conditions_services.dart';
import 'package:sweetify_app/model/terms_conditions_model.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() =>
      _TermsConditionsScreenState();
}

class _TermsConditionsScreenState
    extends State<TermsConditionsScreen> {

  late Future<TermsConditionsModel> termsFuture;

  @override
  void initState() {
    super.initState();
    termsFuture = TermsConditionsServices().getTermsConditions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
      ),

      body: FutureBuilder<TermsConditionsModel>(
        future: termsFuture,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text("No Data Found"),
            );
          }

          final data = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Html(
              data: data.data,
            ),
          );
        },
      ),
    );
  }
}