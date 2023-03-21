import 'package:skeletonx/core/core.dart';

//TODO: Research Webview
// class AppWebViewArgs {
//   final String url;
//   final NavigationDelegate navigationDelegate;
//
//   AppWebViewArgs({
//     required this.url,
//     required this.navigationDelegate,
//   });
// }
//
// class AppWebView extends AppComponentGroup {
//   const AppWebView._({
//     Key? key,
//     required this.url,
//     required this.navigationDelegate,
//   }) : super(key: key);
//
//   static Widget create({
//     Key? key,
//     required AppWebViewArgs args,
//   }) =>
//       AppWebView._(
//         key: key ?? const Key('WebView'),
//         url: args.url,
//         navigationDelegate: args.navigationDelegate,
//       );
//
//   static void open(
//     BuildContext context, {
//     Key? key,
//     required AppWebViewArgs args,
//   }) =>
//       Navigator.push(
//           context,
//           AppSlidePageTransition(
//             AppWebView.create(
//               key: key ?? const Key('WebView'),
//               args: args,
//             ),
//           ));
//
//   final String url;
//   final NavigationDelegate navigationDelegate;
//
//   @override
//   State<StatefulWidget> createState() => _AppWebViewState();
// }
//
// class _AppWebViewState extends StateX<AppWebView> {
//   String get url => widget.url;
//   NavigationDelegate get navigationDelegate => widget.navigationDelegate;
//
//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();
//
//   @override
//   void initState() {
//     super.initState();
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter WebView example'),
//       ),
//       body: SafeArea(
//         child: WebView(
//           initialUrl: url,
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (WebViewController webViewController) {
//             _controller.complete(webViewController);
//           },
//           onProgress: (int progress) {
//             Log.d("WebView is loading (progress : $progress%)");
//           },
//           onPageStarted: (String url) {
//             Log.d('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             Log.d('Page finished loading: $url');
//           },
//           gestureNavigationEnabled: true,
//           navigationDelegate: navigationDelegate,
//         ),
//       ),
//     );
//   }
// }
