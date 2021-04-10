import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';

class LoadingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: AppColors.milkyTransparentWhite,
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
}
