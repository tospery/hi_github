import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hi_flutter/hi_flutter.dart';

class OAuthPage extends StatefulWidget {
  final String url;
  final String title;

  const OAuthPage({super.key, required this.url, required this.title});

  @override
  State<OAuthPage> createState() => _OAuthPageState();
}

class _OAuthPageState extends State<OAuthPage> {
  bool _isLoading = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(),
      ),
      body: Stack(
        children: [
          TextField(
            focusNode: _focusNode,
          ),
          _buildWebView(),
          if (_isLoading) _buildLoadingView(),
        ],
      ),
    );
  }

  _buildTitle() {
    if (widget.url.isEmpty) {
      return Text(widget.title);
    }
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  _buildWebView() {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      navigationDelegate: (NavigationRequest navigation) {
        return navigationDecision(navigation);
      },
      onPageFinished: (_) {
        setState(() {
          _isLoading = false;
        });
      },
    );
  }

  _buildLoadingView() {
    if (_isLoading) {
      return Center(
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(4),
          child: const SpinKitDoubleBounce(
            color: Colors.orange,
          ),
        ),
      );
    }
  }

  navigationDecision(NavigationRequest navigation) {
    if (navigation.url.startsWith('gsygithubapp://authed')) {
      var code = Uri.parse(navigation.url).queryParameters['code'];
      HiRouter.shared().back(context, code);
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }
}
