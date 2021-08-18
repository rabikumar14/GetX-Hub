import 'package:code_hub/Data/languagesData.dart';
import 'package:code_hub/Exports/export.dart';
import 'package:code_hub/UI/homePage.dart';
import 'package:code_hub/UI/namedRoutes.dart';
import 'package:device_preview/device_preview.dart';

//!Pages List of all Getx Named Routes
List<GetPage> pagesList = [
  GetPage(name: '/', page: () => HomePage()),
  GetPage(
      //!Go to namedRoutes.dart for examples
      name: '/namedRoute',
      page: () => NamedRoutes(),
      transition: Transition.leftToRight,
      transitionDuration: Duration(seconds: 1)),
  GetPage(name: '/page2', page: () => Page2()),
  GetPage(
      //! '/:data' is the variable of a data that is passed to the next screen wherever this route is called
      name: '/page2d/:data',
      page: () => Page2()),
  //! Go to namedRoutes.dart at 'toNamed() to Page 2 with value' for the example
];

void main() {
  runApp(
    // MyApp()
    //!Device Preview package used to show UI on different devices in the emulator
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: '/',
      defaultTransition: Transition.zoom,
      getPages: [...pagesList],
      //! Adds the languages
      translations: Languages(),
      //! Detects the local phone language
      locale: Get.deviceLocale,
      // Locale('en', 'UK'),
      //! Assigns the language when assigned langugae fails
      fallbackLocale: Locale('en', 'UK'),
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: SafeArea(
        child: HomePage(),
      ),
      //! Use home & remove initialRoute & getPages when using unNamed Routes
    );
  }
}
