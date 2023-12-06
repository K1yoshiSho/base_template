// ignore_for_file: unused_local_variable

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:base/src/core/common/exports/main_export.dart';

/// `CustomWebViewScreen` is a widget that displays a web view.
class CustomWebViewScreen extends StatefulWidget {
  // This is a required parameter named url, and it is passed via constructor
  final String url;
  // Constructor that initializes the url property and calls the super class constructor with provided key
  const CustomWebViewScreen({Key? key, required this.url}) : super(key: key);

  static const String name = 'Custom WebView Screen';
  static const String routePath = '/custom_web_view_screen';

  static void show({required BuildContext context, required String url}) {
    context.pushNamed(name, queryParameters: {
      ScreenExtras.url: url,
    });
  }

  // Overriding createState method to create an instance of _TermsDeliveryWidgetState
  @override
  State<CustomWebViewScreen> createState() => _TermsDeliveryWidgetState();
}

// This is a private State class named _TermsDeliveryWidgetState
class _TermsDeliveryWidgetState extends State<CustomWebViewScreen> {
  // Defining a FocusNode which is used to handle focus related events
  final _unfocusNode = FocusNode();
  // Boolean value that determines if the page is loading or not
  bool isLoading = true;

  // A GlobalKey object that provides access to the InAppWebViewController widget from anywhere in the app
  final GlobalKey webViewKey = GlobalKey();

  // An InAppWebViewController instance which is used to interact with the web view
  InAppWebViewController? webViewController;
  // An InAppWebViewGroupOptions instance which is used to configure the web view
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
        preferredContentMode: UserPreferredContentMode.RECOMMENDED,
        allowFileAccessFromFileURLs: true,
        allowUniversalAccessFromFileURLs: true,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: false,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  // Declaring PullToRefreshController instance
  late PullToRefreshController pullToRefreshController;
  // Declaring url variable which stores the current url
  String url = "";
  // Declaring progress variable which is used to track the loading progress of the web page
  double progress = 0;
  // Declaring a TextEditingController for editing urls
  final urlController = TextEditingController();
  // A GlobalKey object that provides access to the ScaffoldState widget from anywhere in the app
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // A boolean value that determines if progress indicator should be displayed or not. (Initially set to false)
  bool isShow = false;

  @override
  void initState() {
    // Setting isShow property to true when this widget is initialized
    isShow = true;
    super.initState();

    // Initializing pullToRefreshController and assigning it an onRefresh function which calls the reload method on the web view controller
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: AppPalette.primaryColor,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    // Setting isShow property to false when this widget is disposed
    isShow = false;
    // Disposing unfocusNode
    _unfocusNode.dispose();
    // Disposing webViewKey.currentState
    webViewKey.currentState?.dispose();
    super.dispose();
  }

  // Overriding the build method to create the widget hierarchy
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Provides access to ScaffoldState object via _scaffoldKey when needed
      key: _scaffoldKey,
      // Sets the background color of the scaffold widget
      backgroundColor: context.theme.scaffoldBackgroundColor,
      // Provides an AppBar widget for this screen
      appBar: const PrimaryAppBar(),
      body: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              // Displaying InAppWebView only if isShow property is true
              if (isShow)
                InAppWebView(
                  key: webViewKey,
                  initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                  initialOptions: options,
                  pullToRefreshController: pullToRefreshController,
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    setState(() {
                      this.url = url.toString();
                      urlController.text = this.url;
                    });
                  },
                  // androidOnPermissionRequest is used to control permission validation done in Android devices
                  androidOnPermissionRequest: (controller, origin, resources) async {
                    return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                  },

                  onLoadStop: (controller, url) async {
                    pullToRefreshController.endRefreshing();
                    setState(() {
                      this.url = url.toString();
                      urlController.text = this.url;
                    });
                  },
                  onLoadError: (controller, url, code, message) {
                    pullToRefreshController.endRefreshing();
                  },
                  onProgressChanged: (controller, progress) {
                    if (progress == 100) {
                      pullToRefreshController.endRefreshing();
                    }
                    setState(() {
                      this.progress = progress / 100;
                      urlController.text = url;
                    });
                  },
                  onUpdateVisitedHistory: (controller, url, androidIsReload) {
                    setState(() {
                      this.url = url.toString();
                      urlController.text = this.url;
                    });
                  },
                  onReceivedServerTrustAuthRequest: (controller, challenge) async {
                    if (kDebugMode) {}
                    return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    if (kDebugMode) {}
                  },
                ),
              // Displaying LinearProgressIndicator until page is completely loaded
              progress < 1.0 ? LinearProgressIndicator(value: progress) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
