import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/brandDrugs.dart';

class DrugInfo extends StatelessWidget {
  const DrugInfo({
    Key? key,
    required this.brandDrug,
  }) : super(key: key);
  final BrandDrugs brandDrug;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          brandDrug.name,
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            Text(
              "Generic: ${brandDrug.generic}",
              style: Styles.headlineText1,
            ),
            Text(
              "Company: ${brandDrug.company}",
              style: Styles.bodyText2,
            ),
            Text(
              "Dosage Form: ${brandDrug.dosageForm}",
              style: Styles.bodyText2,
            ),
            SingleChildScrollView(
              child: MarkdownBody(
                data: brandDrug.note,
                selectable: false,
                styleSheet: MarkdownStyleSheet(
                  h1: Styles.headlineText1,
                  h2: Styles.headlineText2,
                  p: Styles.bodyText2!.copyWith(fontSize: 14),
                  h3: Styles.bodyText1!.copyWith(fontSize: 13),
                  h4: Styles.bodyText1!.copyWith(fontSize: 11.5),
                  // listBullet: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
