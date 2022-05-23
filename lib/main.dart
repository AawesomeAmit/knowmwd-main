import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';



import 'package:get/get.dart';
import 'package:knowmed_flutter/Pages/ChangePwd/change_pwd_view.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_view.dart';
import 'package:knowmed_flutter/Theme/theme_service.dart';
import 'package:knowmed_flutter/Theme/themes.dart';

import 'package:lottie/lottie.dart';


import 'AppManager/app_color.dart';
import 'AppManager/app_util.dart';
import 'AppManager/my_text_theme.dart';
import 'AppManager/user_data.dart';
// import 'Pages/Dashboard/dashboard_view.dart';
import 'Pages/LoginPage/login_page_view.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await GetStorage.init('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KnowMed',
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData.dark(),
      themeMode: ThemeService().theme,
      theme: Themes.light,
      darkTheme: Themes.dark,
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      // ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  App app= App();
  /*void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();

    // igonore Lit
    print(
        "                  \n"
            "         _______  \n"
            "       /   __   | \n"
            "      /  /   |  | \n"
            "     /  /____|  | \n"
            "    /  /_____|  | \n"
            "   /  /      |  | \n"
            "  /__/       |__| \n"
            "                       \n"
            "   ________    ______  \n"
            "  |   __   |  /  /|  | \n"
            "  |  |  |  | /  / |  | \n"
            "  |  |  |  |/  /  |  | \n"
            "  |  |  |__/__/   |  | \n"
            "  |  |            |  | \n"
            "  |__|            |__| \n"
            "                 \n"
            "         (())  \n"
            "          __   \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |__|  \n"
            "                    \n"
            "   _____________    \n"
            "  |  | _______  |   \n"
            "  |  | ______|__|   \n"
            "  |  | |  |         \n"
            "  |  |   |  |       \n"
            "  |  |     |  |     \n"
            "  |__|       |__|   \n"
    );
    print(
        "                                        (())                    \n"
            "         _______   ________    ______    __    _____________    \n"
            "       /   __   | |   __   |  /  /|  |  |  |  |  | _______  |   \n"
            "      /  /   |  | |  |  |  | /  / |  |  |  |  |  | ______|__|   \n"
            "     /  /____|  | |  |  |  |/  /  |  |  |  |  |  | |  |         \n"
            "    /  /_____|  | |  |  |__/__/   |  |  |  |  |  |   |  |       \n"
            "   /  /      |  | |  |            |  |  |  |  |  |     |  |     \n"
            "  /__/       |__| |__|            |__|  |__|  |__|       |__|   \n"
    );
    get();
  }






  get() async{
    // await getFacts();
    page();
  }





  getFacts() async{
    // final String response = await rootBundle.loadString('assets/facts/facts.json');
    // List data = await json.decode(response)['Facts'];
    // factsC.updateFacts(data);


  }



  page()
  async{
    Timer(
        const Duration(seconds: 5),
            () =>
            pageRoute()
    );
  }





  pageRoute() async{
    // await factsC.updateFactCount();
    // print(UserData().getHeadAssigned.toString());

    if(UserData().getUserData.isNotEmpty)
    {
      // print(UserData().getHeadAssigned.toString());
      // print(UserData().getHeadAssigned[0].headDescription.toString());
      // app.replaceNavigate(context, const DashboardView(),
      //     routeName: '/DashboardView');
      App().replaceNavigate(context, const DashboardView());
    }
    else{
      App().replaceNavigate(context, const LoginPageView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.white,

          body: Container(
            // decoration: BoxDecoration(
            //     color: AppColor.greyLight,
            //     image: const DecorationImage(
            //         image: AssetImage('assets/loginBG.png'),
            //         fit: BoxFit.cover
            //     )
            // ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Expanded(child:  SizedBox()),
                  const SizedBox(
                      height: 100,
                      child: Image(image: AssetImage('assets/logo.png'),)),
                  const Expanded(child:  SizedBox()),
                  SizedBox(
                      height: 400,
                      child: Image.asset('assets/animated_gif.gif')),
                  const SizedBox(height: 20,),
                  Text('We Provide',
                    textAlign: TextAlign.center,
                    style: MyTextTheme().orangeHeading,),
                  Text('Health & Medical\nServices',
                    textAlign: TextAlign.center,
                    style: MyTextTheme().largePCB,),
                  Text('for you.',
                    style: MyTextTheme().orangeHeading,),
                  const SizedBox(height: 40,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
