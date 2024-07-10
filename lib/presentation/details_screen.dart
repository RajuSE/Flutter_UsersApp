import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:hdfc_test/data/data_user.dart';
import 'package:hdfc_test/presentation/providers/user_provider.dart';
import 'package:hdfc_test/presentation/utils/app_colors.dart';
import 'package:hdfc_test/presentation/utils/filled_button.dart';
import 'package:hdfc_test/presentation/utils/styles.dart';
import 'package:hdfc_test/presentation/utils/text_field.dart';
import 'package:hdfc_test/presentation/utils/ui_utils.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final User user;

  const DetailsScreen({super.key, required this.user});

  static final _formKey = GlobalKey<FormState>();

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var showAnimation = true;

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    emailController.text = user.email;
    nameController.text = user.name;
    phoneController.text = user.phone;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final value = Provider.of<UserProvider>(context, listen: false);

    if (value.isUpdateError) {
      print("isUpdateError true");
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Something went wrong! Please try again.")));
      });
    } else if (value.isUpdateSuccess) {
      print("isUpdateSuccess true");
      if (mounted == true) {
        Future.delayed(Duration.zero, () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("User updated Successfully")));
        });
      }
    }

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: isDarkMode ? Colors.white : Colors.black),
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .isUpdateSuccess = false;
                  Provider.of<UserProvider>(context, listen: false).isUpdating =
                      false;
                  Navigator.of(context).pop();
                }),
            title: const Text('')),
        body:
            // If the loading it true then it will show the circular progressbar

            Stack(children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                ),
                DelayedDisplay(
                  fadeIn: showAnimation,
                  delay: const Duration(milliseconds: 1500),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(22, 94, 22, 0),
                    alignment: Alignment.topCenter,
                    child: const Icon(Icons.person),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: DelayedDisplay(
                    fadeIn: showAnimation,
                    delay: const Duration(milliseconds: 400),
                    fadingDuration: const Duration(milliseconds: 400),
                    child: Container(
                      width: size.width,
                      height: size.height,
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: size.height / 45),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20))),
                      child: Form(
                        key: DetailsScreen._formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Name",
                                style: Styles.tsDefaultSemiBold18),
                            // const SizedBox(height: 24),
                            const SizedBox(height: 8),
                            AppTextField(
                              controller: nameController,
                              inputType: TextInputType.emailAddress,
                              hintText: "Enter name",
                              onChanged: (name) {},
                            ),
                            const SizedBox(height: 10),

                            const Text("Email",
                                style: Styles.tsDefaultSemiBold18),
                            // const SizedBox(height: 24),
                            const SizedBox(height: 8),
                            AppTextField(
                              controller: emailController,
                              inputType: TextInputType.emailAddress,
                              hintText: "Enter email ID",
                              onChanged: (email) {},
                            ),

                            const SizedBox(height: 10),
                            const Text("Phone",
                                style: Styles.tsDefaultSemiBold18),
                            // const SizedBox(height: 24),
                            const SizedBox(height: 8),
                            AppTextField(
                              controller: phoneController,
                              inputType: TextInputType.phone,
                              hintText: "Enter phone",
                              onChanged: (name) {},
                            ),
                            const SizedBox(height: 15),

                            Row(children: [
                              const Icon(Icons.person,
                                  size: 24, color: Colors.blue),
                              const SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                child: Text("@${widget.user.username!}",
                                    style: UiUtils.isDarkMode(context)
                                        ? Styles.tsDefaultRegular18
                                        : Styles.tsGreyTextBold16h18),
                              ),
                            ]),

                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.local_post_office,
                                      size: 24, color: Colors.blue),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text("${widget.user.company!.name!}",
                                      style: UiUtils.isDarkMode(context)
                                          ? Styles.tsDefaultRegular18
                                          : Styles.tsGreyTextBold16h18),
                                ]),

                            const SizedBox(
                              height: 12,
                            ),
                            Row(children: [
                              const Icon(Icons.location_on,
                                  size: 24, color: Colors.blue),
                              const SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                child: Text(
                                    '${widget.user.address!.street}, ${widget.user.address!.zipcode}, ${widget.user.address!.suite}, ${widget.user.address!.city}',
                                    overflow: TextOverflow.clip,
                                    style: UiUtils.isDarkMode(context)
                                        ? Styles.tsDefaultRegular18
                                        : Styles.tsGreyTextBold16h18),
                              ),
                            ]),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),

                        // const SizedBox(height: 24),
                        // SizedBox(height: size.height / 40),
                        // const TrackOrderWidgets(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
              child: CustomFilledButton(
                  isActive: true,
                  color: AppColors.darkGreen,
                  text: "Save",
                  textStyle: Styles.tsWhiteTextSemiBold18,
                  onTap: () {
                    print("${phoneController.text.toString()}");
                    print("${emailController.text.toString()}");
                    print("${nameController.text.toString()}");
                    UiUtils.dismissKeyboard(context);
                    if (emailController.text.toString().isEmpty) {
                      UiUtils.showSnackBar(context, "Please enter email id");
                    } else if (phoneController.text.toString().trim().isEmpty) {
                      UiUtils.showSnackBar(
                          context, "Please enter phone number");
                    } else if (phoneController.text
                            .toString()
                            .trim()
                            .endsWith("-") ||
                        phoneController.text
                            .toString()
                            .trim()
                            .startsWith("-")) {
                      UiUtils.showSnackBar(
                          context, "Please enter valid phone number");
                    } else if (nameController.text.toString().isEmpty) {
                      UiUtils.showSnackBar(context, "Please enter name");
                    } else {
                      Provider.of<UserProvider>(context, listen: false)
                          .updateUser(user.id, nameController.text,
                              emailController.text, phoneController.text);
                    }
                    //tapped save btn
                  }),
            ),
          ),
          if (value.isUpdating) const Center(child: CircularProgressIndicator())
        ]));
  }
}
