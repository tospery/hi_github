import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';
import 'package:hi_github/redux/app_state.dart';
import 'package:hi_github/redux/login_redux.dart';
import 'package:hi_github/router/path.dart';
import 'package:hi_github/widget/login_button.dart';
import 'package:hi_github/widget/login_term.dart';
import 'package:hi_github/widget/password_input.dart';

class LoginPage extends StatefulWidget {
  final Map<String, dynamic> parameters;

  const LoginPage({super.key, required this.parameters});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? title;
  bool isSecure = true;
  bool loginEnable = false;
  bool termChecked = false;
  String? username;
  String? password;
  TapGestureRecognizer agreementGestureRecognizer = TapGestureRecognizer();
  TapGestureRecognizer privacyGestureRecognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    title = widget.parameters.stringFoKey(HiParameter.title);
    // agreementGestureRecognizer.onTap = () {
    //   log('agreement tapped');
    // };
    privacyGestureRecognizer.onTap = () {
      log('privacy tapped');
    };
  }

  @override
  void dispose() {
    agreementGestureRecognizer.dispose();
    privacyGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: title?.isEmpty ?? true
            ? null
            : Text(
                title!,
                style: const TextStyle(
                  fontSize: HiConstant.fontLargeSize,
                ),
              ),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 70,
            child: _buildInputView(),
          ),
          Expanded(
            flex: 30,
            child: Container(),
          ),
        ],
      ),
    );
  }

  _buildInputView() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildUsernameInputView(),
          hiSpace(height: 5),
          PasswordInput(
            secure: isSecure,
            onSecured: () {
              setState(() {
                isSecure = !isSecure;
              });
            },
            onChanged: (text) {
              password = text;
              _checkInput();
            },
          ),
          hiSpace(height: 40),
          LoginButton(
            context.string.login,
            enable: loginEnable,
            onPressed: _login,
          ),
          hiSpace(height: 20),
          _buildTermView(),
        ],
      ),
    );
  }

  _buildUsernameInputView() {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: SizedBox(
        height: 50,
        child: TextField(
          cursorColor: Colors.blue,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black12,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black12,
              ),
            ),
            hintText: context.string.username,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          onChanged: (text) {
            username = text;
            _checkInput();
          },
        ),
      ),
    );
  }

  void _checkInput() {
    bool enable = false;
    if ((username?.isNotEmpty ?? false) && (password?.isNotEmpty ?? false)) {
      enable = true;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  _buildTermView() {
    return LoginTerm(
      checked: termChecked,
      onPressed: () {
        setState(() {
          termChecked = !termChecked;
        });
      },
      agreementRecognizer: agreementGestureRecognizer,
      privacyRecognizer: privacyGestureRecognizer,
    );
  }

  void _login() async {
    if (!termChecked) {
      toast(context.string.termTips);
      return;
    }
    String? code =
        await HiRouter.shared().forward(context, HiRouterPathEx.oauth);
    log('code = $code');
    if (code?.isNotEmpty ?? false) {
      // ignore: use_build_context_synchronously
      StoreProvider.of<APPState>(context)
          // ignore: use_build_context_synchronously
          .dispatch(LoginAction(context, code!));
    }
  }
}
