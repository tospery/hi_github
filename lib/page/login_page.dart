import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';
import '../extension/hi_host.dart';
import '../widget/login_button.dart';
import '../widget/login_term.dart';
import '../widget/login_password_input.dart';

class LoginPage extends HiPage {
  const LoginPage({super.key, super.parameters = const {}});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends HiPageState<LoginPage> {
  bool isSecure = true;
  bool loginEnable = false;
  bool termChecked = false;
  String? username = 'admin';
  String? password = '11111111';
  TapGestureRecognizer agreementGestureRecognizer = TapGestureRecognizer();
  TapGestureRecognizer privacyGestureRecognizer = TapGestureRecognizer();

  @override
  void init() {
    super.init();
    privacyGestureRecognizer.onTap = () {
      log('privacy tapped');
    };
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _checkInput();
    });
  }

  @override
  void setup() {
    super.setup();
    setState(() {
      title =
          parameters.stringForKey(HiParameter.title) ?? context.string.login;
      hideNavLine = parameters.boolForKey(HiParameter.hideNavLine) ?? true;
    });
  }

  @override
  void dispose() {
    agreementGestureRecognizer.dispose();
    privacyGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget buildBody() {
    return Container(
      color: context.themeData.primaryColor,
      child: Flex(
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
          _buildUsernameInput(),
          hiSpace(height: 5),
          LoginPasswordInput(
            secure: isSecure,
            password: password,
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

  _buildUsernameInput() {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: TextEditingController.fromValue(
            TextEditingValue(text: username ?? ''),
          ),
          cursorColor: context.themeData.colorScheme.onPrimary,
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

  void _checkInput() {
    bool enable = false;
    if ((username?.isNotEmpty ?? false) && (password?.isNotEmpty ?? false)) {
      enable = true;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  void _login() async {
    if (!termChecked) {
      toast(context.string.termTips);
      return;
    }
    String? code = await HiRouter.shared()
        .push(context, hiUriString(host: HiHostEx.oauth));
    log('code = $code');
    if (code?.isNotEmpty ?? false) {
      // ignore: use_build_context_synchronously
      StoreProvider.of<HiAPPState>(context)
          // ignore: use_build_context_synchronously
          .dispatch(LoginAction(context, code!));
    }
  }
}
