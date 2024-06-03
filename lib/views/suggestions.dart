import 'package:flutter/material.dart';
import 'package:project/core/helper_methods.dart';
import 'package:project/core/logic/input_validator.dart';
import 'package:project/design/app_button.dart';
import 'package:project/design/app_image.dart';
import 'package:project/design/app_input.dart';
import 'package:url_launcher/url_launcher.dart';
class SuggestionsView extends StatefulWidget {
  const SuggestionsView({Key? key}) : super(key: key);
  @override
  State<SuggestionsView> createState() => _SuggestionsViewState();
}
class _SuggestionsViewState extends State<SuggestionsView> {
  final subjectController = TextEditingController();
  final bodyController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suggestions"),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              openUrl(
                  "mailto:ahmmedsobhe2022@gmail?subject=${subjectController.text}&body=${bodyController.text}");
            },
            child: const APPImage(
              "gmail.png",
              height: 60,
              width: 60,
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              openUrl("sms:01094597034");
            },
            child: const APPImage(
              "whats_app.png",
              height: 60,
              width: 60,
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const APPImage(
                "Suggest.png",
                height: 170,
                width: 170,
              ),
              const SizedBox(height: 16),
              const Text(
                "Tell Us How We Can Help",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
              AppInput(
                  label: "Subject",
                  validator: (value) =>
                      InputValidator.normalInput("Subject", value),
                  controller: subjectController),
              AppInput(
                label: "Body",
                controller: bodyController,
                isMultiLine: true,
                validator: (value) =>
                    InputValidator.normalInput("Body", value,length: 10),
              ),
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print("Valid Data");
                    formKey.currentState!.reset();
                  } else {
                    print("Invalid Date");
                  }
                },
                text: "Send Message",
              ),
              const SizedBox(height: 36),
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Our Social Media Pages",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            openUrl("https://www.facebook.com/AMIT.Learning/");
                          },
                          child: const APPImage(
                            "facebook.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                        const SizedBox(width: 32),
                        GestureDetector(
                          onTap: () {
                            openUrl(
                                "https://www.instagram.com/amit_learning/?hl=ar");
                          },
                          child: const APPImage(
                            "instagram.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                        const SizedBox(width: 32),
                        GestureDetector(
                          onTap: () {
                            openUrl(
                                "https://eg.linkedin.com/company/amit-learning");
                          },
                          child: const APPImage(
                            "linkedin.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    const Text(
                      "Or visit our website",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 23),
                    GestureDetector(
                      onTap: () {
                        openUrl("https://amit-learning.com/");
                      },
                      child: const APPImage(
                        "website.png",
                        height: 32,
                        width: 32,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void openUrl(String url) async {
    await launch(url).catchError((ex) {
      showMessage("Can't open the URL", messageType: MessageType.error);
    });
  }
}
