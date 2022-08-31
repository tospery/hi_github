import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';
import '../redux/login_epic.dart';
import '../router/path.dart';
import '../widget/login_button.dart';
import '../widget/login_term.dart';
import '../widget/password_input.dart';

class LoginPage extends HiPage {
  const LoginPage({Key? key, required super.parameters}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends HiPageState<LoginPage> {
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
    privacyGestureRecognizer.onTap = () {
      log('privacy tapped');
    };
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    var title = widget.parameters.stringForKey(HiParameter.title);
    return AppBar(
      elevation: 0,
      title: title != null ? Text(title) : null,
    );
  }

  @override
  Widget buildBodyView() {
    return Container(
      color: Colors.white,
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

  @override
  void dispose() {
    agreementGestureRecognizer.dispose();
    privacyGestureRecognizer.dispose();
    super.dispose();
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
    String? code =
        await HiRouter.shared().forward(context, HiRouterPathEx.oauth);
    log('code = $code');
    if (code?.isNotEmpty ?? false) {
      // ignore: use_build_context_synchronously
      StoreProvider.of<HiAPPState>(context)
          // ignore: use_build_context_synchronously
          .dispatch(LoginAction(context, code!));
    }
  }
}
