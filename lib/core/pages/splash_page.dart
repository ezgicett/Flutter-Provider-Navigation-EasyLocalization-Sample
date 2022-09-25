import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../translations/locale_keys.g.dart';
import '../constants/navigation/navigation_constants.dart';
import '../init/navigation/navigation_service.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String _value = "EN";
  @override
  void initState() {
    createBox();
    super.initState();
  }

  void createBox() async {
    var box = await Hive.openBox('language');
    box.put('langPref', context.locale.toString());
    setState(() {
      _value = box.get('langPref').toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: const Color(0XFF2e3438),
          actions: [
            DropdownButton<String>(
              dropdownColor: const Color(0XFF2e3438),
              iconSize: 30,
              underline: Container(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              value: _value,
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text('EN'),
                  value: 'EN',
                ),
                DropdownMenuItem(child: Text('TR'), value: 'TR'),
              ],
              onChanged: (String? value) {
                _value = value!;
                value == "TR"
                    ? EasyLocalization.of(context)!
                        .setLocale(const Locale("tr"))
                    : EasyLocalization.of(context)!
                        .setLocale(const Locale("en"));
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/CVpic.jpg'),
                radius: 80,
              ),
              const Text(
                "Ezgi Çetinkaya",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                (LocaleKeys.juniorMobileDeveloper).tr(),
                style: const TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 170,
                child: Divider(
                  height: 10,
                  color: Colors.white,
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("+90 545 352 7775"),
                    ),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.mail),
                      title: Text("ezgicetinkaya.dev@gmail.com"),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.SHOPPING_PAGE);
                },
                icon: const Icon(Icons.arrow_circle_right),
                color: const Color(0XFF2e3438),
                iconSize: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
