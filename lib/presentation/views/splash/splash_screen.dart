import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../../../app/settings.dart';
import '../../resources/styles_manager.dart';
import 'splash_screen_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenViewModel _viewModel = SplashScreenViewModel();

  _navigateToPage() {
    Navigator.pushReplacementNamed(context, AppRoutes.mainRoute);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(StatusBarStyle.statusBarStyle);
    _viewModel.init(_navigateToPage);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => _viewModel,
      builder: (context, model, child) => Scaffold(
        body: const Placeholder(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
