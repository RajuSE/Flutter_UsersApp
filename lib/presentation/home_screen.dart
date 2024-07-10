import 'dart:math';

import 'package:flutter/material.dart';
import 'package:devxraju_flutter_provider/presentation/details_screen.dart';
import 'package:devxraju_flutter_provider/presentation/providers/user_provider.dart';
import 'package:devxraju_flutter_provider/presentation/utils/app_colors.dart';
import 'package:devxraju_flutter_provider/presentation/utils/app_theme.dart';
import 'package:devxraju_flutter_provider/presentation/utils/styles.dart';
import 'package:devxraju_flutter_provider/presentation/utils/ui_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<UserProvider>(context);
    final user = value.users;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        body:
            // If the loading it true then it will show the circular progressbar
             (value.isLoading) ?
               const Center(
                child: CircularProgressIndicator(),
              )
            : (value.isError) ?

               Center(
                  child: ElevatedButton(
                      onPressed: () {
                        value.getAllUsers();
                      },
                      child: Text("Retry")))
            :
             ListView.builder(
              key: const Key("UserListViewKey"),
              itemCount: user.length,
              itemBuilder: (context, index) {
                final curUser = user[index];

                return GestureDetector(
                  onTap: () {
                    value.isUpdateSuccess=false;
                    value.isUpdating=false;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailsScreen(user: curUser);
                    }));
                  },
                  child: ListTile(
                      leading:  CircleAvatar(
                        backgroundColor: UiUtils.isDarkMode(context)? AppColors.darkGreen :AppColors.darkGreen,
                        child: Text(curUser.id.toString(),style: Styles.tsWhiteBold14),
                      ),
                      title: Text(
                        curUser.name,
                        style:
                        UiUtils.isDarkMode(context)? Styles.tsWhiteBold18 :Styles.tsDarkGreenTextBold18,

                      ),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            '${curUser.address!.street}, ${curUser.address!.city}',
                            style: Styles.tsGreyText2Regular18,
                          ),
                        ],
                      )),
                );
              },
            )));




  }
}
