import 'package:base/src/core/common/exports/main_export.dart';

/// `NotFoundScreen` is a widget that is shown when the user tries to navigate to a non-existent route.
class NotFoundScreen extends StatefulWidget {
  // Constructor that calls the superclass constructor with some optional arguments.
  const NotFoundScreen({Key? key}) : super(key: key);

  // Defining some constant fields for this class.
  static const String routeName = 'not_found';
  static const String name = "Not found";
  static const String routePath = "/not_found";

  @override
  State<NotFoundScreen> createState() => _NotFoundScreenState();
}

// Define a state for the previous widget class.
class _NotFoundScreenState extends State<NotFoundScreen> {
  // Create GlobalKey to uniquely identify the scaffold of this class.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Build method creates and returns the Scaffold widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.90,
          child: Container(),
        ),
      ),
    );
  }

  // Method used to create and return an AppBar widget.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: AppPalette.abyss),
        onPressed: () {
          context.pop();
        },
      ),
      title: const Text(
        '',
        style: TextStyle(
          color: AppPalette.abyss,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0,
    );
  }
}
