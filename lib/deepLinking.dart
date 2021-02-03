import 'package:autolease/main.dart';
// import 'package:autolease/screens/share.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

Uri url;

class DeepLinking extends StatefulWidget {
  @override
  _DeepLinkingState createState() => _DeepLinkingState();
}

// final DynamicLinkParameters parameters = DynamicLinkParameters(
//   uriPrefix: 'https://abc123.app.goo.gl',
//   link: Uri.parse('https://example.com/'),
//   androidParameters: AndroidParameters(
//     packageName: 'com.example.android',
//     minimumVersion: 125,
//   ),
//   iosParameters: IosParameters(
//     bundleId: 'com.example.ios',
//     minimumVersion: '1.0.1',
//     appStoreId: '123456789',
//   ),
//   googleAnalyticsParameters: GoogleAnalyticsParameters(
//     campaign: 'example-promo',
//     medium: 'social',
//     source: 'orkut',
//   ),
//   itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
//     providerToken: '123456',
//     campaignToken: 'example-promo',
//   ),
//   socialMetaTagParameters: SocialMetaTagParameters(
//     title: 'Example of a Dynamic Link',
//     description: 'This link works whether app is installed or not!',
//   ),
// );

Future<void> _createDynamicLink() async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://autoleasetest.page.link',
    link: Uri.parse('https://autoleasetest.page.link/val'),
    androidParameters: AndroidParameters(
      packageName: 'com.autoleaseuae.AutoLease',
      minimumVersion: 0,
    ),
    iosParameters: IosParameters(
      bundleId: 'com.autoleaseuaeios.AutoLease',
      minimumVersion: '1.0.1',
      appStoreId: '962194608',
    ),
    dynamicLinkParametersOptions: DynamicLinkParametersOptions(
      shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
    ),
  );

  if (true) {
    final ShortDynamicLink shortLink = await parameters.buildShortLink();
    url = shortLink.shortUrl;
    print(url);
  }
}

class _DeepLinkingState extends State<DeepLinking> {
  @override
  void initState() {
    _createDynamicLink();
    super.initState();
  }

  Uri url;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RaisedButton(
            child: Text('Share'),
            onPressed: () {
              _onShare(context);
            }),
        Container(
            child: Center(
          child: Text(
            dataPath.toString(),
            style: TextStyle(color: Colors.black),
          ),
        )),
        Builder(
          builder: (BuildContext context) {
            return RaisedButton(
              child: const Text('Share'),
              onPressed: () => _onShareWithEmptyOrigin(context),
            );
          },
        ),
      ],
    )));
  }
}

_onShare(BuildContext context) async {
  final RenderBox box = context.findRenderObject();
  await Share.share('text',
      subject: 'subject',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}

_onShareWithEmptyOrigin(BuildContext context) async {
  await Share.share("text");
}
