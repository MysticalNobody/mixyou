import 'package:flutter/material.dart';
import 'package:mexyou/screens/auth/pages/register/index.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthProvider authProvider;

  PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    authProvider = AuthProvider(pageController: pageController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: authProvider,
        child: Consumer<AuthProvider>(
          builder: (context, provider, _) {
            return Stack(
              children: <Widget>[
                Positioned.fill(
                  child: AnimatedOpacity(
                    child: Image.asset(
                      'assets/images/bg.png',
                      fit: BoxFit.fill,
                    ),
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    opacity: provider.page.index < 2 ? 1 : 0,
                  ),
                ),
                PageView(
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (page) {
                    provider.setPage(AuthScreenPage.values[page]);
                  },
                  children: [RegisterPage(authProvider), Container(), Container(), Container()],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
