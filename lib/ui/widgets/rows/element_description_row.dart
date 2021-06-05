import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class ElementDescriptionRow extends StatelessWidget {
  final String label;
  final String content;

  const ElementDescriptionRow({
    required this.label,
    required this.content,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: Paddings.iosNormalPadding,
          left: Paddings.iosNormalPadding,
          right: Paddings.iosNormalPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildLabelText(),
            ),
            Expanded(
              child: _buildContentText(),
            ),
          ],
        ),
      );

  Text _buildLabelText() => Text(
        label,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );

  Text _buildContentText() => Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
        ),
      );
}
