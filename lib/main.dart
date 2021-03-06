//TODO 1: Comment the whole code
//TODO 2: Stop repeating the same code multiple times (appbar repetition, and others), add parameters instead!
//TODO 3: Find a way to stop using global variables
//TODO 4: Change 2fa code generation to "Switch case" statement, instead of else if.
//TODO 5: Stop using nested trycatch, use int.tryParse to help.
//TODO 6: Only use package: imports, dont use the hardcoded importing.
//TODO 5: Get rid of the useless menu's and figure out something better

//Import the files needed for the application
import 'package:first_app/bloc/passwords_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'cards_store.dart';
import 'components/variables.dart';
import 'routes.dart';

//Create main function which will run when the application starts
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CardInfoAdapter());
  await Hive.openBox('cards_data');
  init = 1;

  //Run AppLoop
  runApp(MultiBlocProvider(
    //Assign the state-event managers
    providers: [
      BlocProvider(
        create: (context) => PasswordsBloc(),
      ),
      BlocProvider(
        create: (context) => SpeedDialBloc(),
      ),
    ],
    child: const MyApp(), //Run the Main widget (application) class
  ));
}

//Create the first class to create the widgets
//
//StatelessWidget - Static widget, doesnt change midway/doesnt need to be updated
//
//StatefulWidget - Flexible widget, can be changed midway through events (event manager - bloc)
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override //Override the widget so it uses what we programmed
  Widget build(BuildContext context) {
    return MaterialApp(
      //Return MaterialApp widget
      debugShowCheckedModeBanner:
          false, //Disable the debug banner in the top right corner of the app

      //Set application Title
      title: 'PAP Unnamed Project',

      //Set application Themes
      //Light Theme
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          //Override Color Schemne
          primary: const Color(0xFF1d6fb4), //Change Primary Color (AppBar)
          secondary: const Color(
              0xFF1d6fb4), //Change Secondary Color (Buttons, active button, snackbar)
        ),
      ),

      //Dark Theme
      darkTheme: ThemeData.dark().copyWith(
        //colorScheme: ColorScheme.fromSwatch().copyWith(
        //Override Color Schemne
        //primary: const Color(0xFF424242), //Change Primary Color (AppBar)
        //secondary: const Color(0xFF1d6fb4), //Change Secondary Color (Buttons, active button, snackbar)
        //),
        elevatedButtonTheme: ElevatedButtonThemeData(
            //Override Text Button Theme
            style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.tealAccent), //Change Text Color
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFF424242)),
          overlayColor: MaterialStateProperty.all<Color>(
              Colors.tealAccent.withOpacity(0.3)), //Change splash color
        )),

        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.tealAccent),

        textButtonTheme: TextButtonThemeData(
            //Override Text Button Theme
            style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.tealAccent), //Change Text Color
          overlayColor: MaterialStateProperty.all<Color>(
              Colors.tealAccent.withOpacity(0.3)), //Change splash color
        )),
      ),

      //Set routes of the application (pages)
      routes: routes,
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
